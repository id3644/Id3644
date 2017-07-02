// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

Shader "Id3644/Fx/Dissolve" {
	Properties{
		_Diffuse("Diffuse", 2D) = "white" {}
	_Normal("Normal", 2D) = "black" {}
	_Ramp("Ramp", 2D) = "black" {}
	_Noise("Noise", 2D) = "white" {}
	_DissolveAmount("Dissolve Amount", Range(0, 1)) = 0.5
		[HideInInspector]_Cutoff("Alpha cutoff", Range(0,1)) = 0.5
	}
		SubShader{
		Tags{
		"Queue" = "AlphaTest"
		"RenderType" = "TransparentCutout"
	}
		Pass{
		Name "FORWARD"
		Tags{
		"LightMode" = "ForwardBase"
	}
		Cull Off


		CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#define UNITY_PASS_FORWARDBASE
#include "UnityCG.cginc"
#include "AutoLight.cginc"
#include "UnityPBSLighting.cginc"
#include "UnityStandardBRDF.cginc"
#pragma multi_compile_fwdbase_fullshadows
#pragma multi_compile_fog
#pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
#pragma target 3.0
		uniform sampler2D _Noise; uniform float4 _Noise_ST;
	uniform float _DissolveAmount;
	uniform sampler2D _Ramp; uniform float4 _Ramp_ST;
	uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
	uniform sampler2D _Normal; uniform float4 _Normal_ST;
	struct VertexInput {
		float4 vertex : POSITION;
		float3 normal : NORMAL;
		float4 tangent : TANGENT;
		float2 texcoord0 : TEXCOORD0;
	};
	struct VertexOutput {
		float4 pos : SV_POSITION;
		float2 uv0 : TEXCOORD0;
		float4 posWorld : TEXCOORD1;
		float3 normalDir : TEXCOORD2;
		float3 tangentDir : TEXCOORD3;
		float3 bitangentDir : TEXCOORD4;
		LIGHTING_COORDS(5,6)
			UNITY_FOG_COORDS(7)
	};
	VertexOutput vert(VertexInput v) {
		VertexOutput o = (VertexOutput)0;
		o.uv0 = v.texcoord0;
		o.normalDir = UnityObjectToWorldNormal(v.normal);
		o.tangentDir = normalize(mul(unity_ObjectToWorld, float4(v.tangent.xyz, 0.0)).xyz);
		o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
		o.posWorld = mul(unity_ObjectToWorld, v.vertex);
		float3 lightColor = _LightColor0.rgb;
		o.pos = UnityObjectToClipPos(v.vertex);
		UNITY_TRANSFER_FOG(o,o.pos);
		TRANSFER_VERTEX_TO_FRAGMENT(o)
			return o;
	}
	float4 frag(VertexOutput i, float facing : VFACE) : COLOR{
		float isFrontFace = (facing >= 0 ? 1 : 0);
	float faceSign = (facing >= 0 ? 1 : -1);
	i.normalDir = normalize(i.normalDir);
	i.normalDir *= faceSign;
	float3x3 tangentTransform = float3x3(i.tangentDir, i.bitangentDir, i.normalDir);
	float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
	float4 _Normal_var = tex2D(_Normal,TRANSFORM_TEX(i.uv0, _Normal));
	float3 normalLocal = _Normal_var.rgb;
	float3 normalDirection = normalize(mul(normalLocal, tangentTransform)); // Perturbed normals
	float3 viewReflectDirection = reflect(-viewDirection, normalDirection);
	float4 _Noise_var = tex2D(_Noise,TRANSFORM_TEX(i.uv0, _Noise));
	float node_3995 = (((1.0 - _DissolveAmount)*1.2 + -0.6) + _Noise_var.r);
	clip(node_3995 - 0.5);
	float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
	float3 lightColor = _LightColor0.rgb;
	float3 halfDirection = normalize(viewDirection + lightDirection);
	////// Lighting:
	float attenuation = LIGHT_ATTENUATION(i);
	float3 attenColor = attenuation * _LightColor0.xyz;
	float Pi = 3.141592654;
	float InvPi = 0.31830988618;
	///////// Gloss:
	float gloss = 0.5;
	float specPow = exp2(gloss * 10.0 + 1.0);
	/////// GI Data:
	UnityLight light;
#ifdef LIGHTMAP_OFF
	light.color = lightColor;
	light.dir = lightDirection;
	light.ndotl = LambertTerm(normalDirection, light.dir);
#else
	light.color = half3(0.f, 0.f, 0.f);
	light.ndotl = 0.0f;
	light.dir = half3(0.f, 0.f, 0.f);
#endif
	UnityGIInput d;
	d.light = light;
	d.worldPos = i.posWorld.xyz;
	d.worldViewDir = viewDirection;
	d.atten = attenuation;
	Unity_GlossyEnvironmentData ugls_en_data;
	ugls_en_data.roughness = 1.0 - gloss;
	ugls_en_data.reflUVW = viewReflectDirection;
	UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data);
	lightDirection = gi.light.dir;
	lightColor = gi.light.color;
	////// Specular:
	float NdotL = max(0, dot(normalDirection, lightDirection));
	float LdotH = max(0.0,dot(lightDirection, halfDirection));
	float4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(i.uv0, _Diffuse));
	float3 diffuseColor = _Diffuse_var.rgb; // Need this for specular when using metallic
	float specularMonochrome;
	float3 specularColor;
	diffuseColor = DiffuseAndSpecularFromMetallic(diffuseColor, 0.0, specularColor, specularMonochrome);
	specularMonochrome = 1 - specularMonochrome;
	float NdotV = max(0.0,dot(normalDirection, viewDirection));
	float NdotH = max(0.0,dot(normalDirection, halfDirection));
	float VdotH = max(0.0,dot(viewDirection, halfDirection));
	float visTerm = SmithBeckmannVisibilityTerm(NdotL, NdotV, 1.0 - gloss);
	float normTerm = max(0.0, NDFBlinnPhongNormalizedTerm(NdotH, RoughnessToSpecPower(1.0 - gloss)));
	float specularPBL = max(0, (NdotL*visTerm*normTerm) * unity_LightGammaCorrectionConsts_PIDiv4);
	float3 directSpecular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularPBL*lightColor*FresnelTerm(specularColor, LdotH);
	float3 specular = directSpecular;
	/////// Diffuse:
	NdotL = max(0.0,dot(normalDirection, lightDirection));
	half fd90 = 0.5 + 2 * LdotH * LdotH * (1 - gloss);
	float3 directDiffuse = ((1 + (fd90 - 1)*pow((1.00001 - NdotL), 5)) * (1 + (fd90 - 1)*pow((1.00001 - NdotV), 5)) * NdotL) * attenColor;
	float3 indirectDiffuse = float3(0,0,0);
	indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
	float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
	////// Emissive:
	float2 node_6875 = float2((1.0 - saturate((node_3995*8.0 + -4.0))),0.0);
	float4 node_5779 = tex2D(_Ramp,node_6875);
	float3 emissive = node_5779.rgb;
	/// Final Color:
	float3 finalColor = diffuse + specular + emissive;
	fixed4 finalRGBA = fixed4(finalColor,1);
	UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
	return finalRGBA;
	}
		ENDCG
	}
		Pass{
		Name "FORWARD_DELTA"
		Tags{
		"LightMode" = "ForwardAdd"
	}
		Blend One One
		Cull Off


		CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#define UNITY_PASS_FORWARDADD
#include "UnityCG.cginc"
#include "AutoLight.cginc"
#include "UnityPBSLighting.cginc"
#include "UnityStandardBRDF.cginc"
#pragma multi_compile_fwdadd_fullshadows
#pragma multi_compile_fog
#pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
#pragma target 3.0
		uniform sampler2D _Noise; uniform float4 _Noise_ST;
	uniform float _DissolveAmount;
	uniform sampler2D _Ramp; uniform float4 _Ramp_ST;
	uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
	uniform sampler2D _Normal; uniform float4 _Normal_ST;
	struct VertexInput {
		float4 vertex : POSITION;
		float3 normal : NORMAL;
		float4 tangent : TANGENT;
		float2 texcoord0 : TEXCOORD0;
	};
	struct VertexOutput {
		float4 pos : SV_POSITION;
		float2 uv0 : TEXCOORD0;
		float4 posWorld : TEXCOORD1;
		float3 normalDir : TEXCOORD2;
		float3 tangentDir : TEXCOORD3;
		float3 bitangentDir : TEXCOORD4;
		LIGHTING_COORDS(5,6)
			UNITY_FOG_COORDS(7)
	};
	VertexOutput vert(VertexInput v) {
		VertexOutput o = (VertexOutput)0;
		o.uv0 = v.texcoord0;
		o.normalDir = UnityObjectToWorldNormal(v.normal);
		o.tangentDir = normalize(mul(unity_ObjectToWorld, float4(v.tangent.xyz, 0.0)).xyz);
		o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
		o.posWorld = mul(unity_ObjectToWorld, v.vertex);
		float3 lightColor = _LightColor0.rgb;
		o.pos = UnityObjectToClipPos(v.vertex);
		UNITY_TRANSFER_FOG(o,o.pos);
		TRANSFER_VERTEX_TO_FRAGMENT(o)
			return o;
	}
	float4 frag(VertexOutput i, float facing : VFACE) : COLOR{
		float isFrontFace = (facing >= 0 ? 1 : 0);
	float faceSign = (facing >= 0 ? 1 : -1);
	i.normalDir = normalize(i.normalDir);
	i.normalDir *= faceSign;
	float3x3 tangentTransform = float3x3(i.tangentDir, i.bitangentDir, i.normalDir);
	float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
	float4 _Normal_var = tex2D(_Normal,TRANSFORM_TEX(i.uv0, _Normal));
	float3 normalLocal = _Normal_var.rgb;
	float3 normalDirection = normalize(mul(normalLocal, tangentTransform)); // Perturbed normals
	float4 _Noise_var = tex2D(_Noise,TRANSFORM_TEX(i.uv0, _Noise));
	float node_3995 = (((1.0 - _DissolveAmount)*1.2 + -0.6) + _Noise_var.r);
	clip(node_3995 - 0.5);
	float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
	float3 lightColor = _LightColor0.rgb;
	float3 halfDirection = normalize(viewDirection + lightDirection);
	////// Lighting:
	float attenuation = LIGHT_ATTENUATION(i);
	float3 attenColor = attenuation * _LightColor0.xyz;
	float Pi = 3.141592654;
	float InvPi = 0.31830988618;
	///////// Gloss:
	float gloss = 0.5;
	float specPow = exp2(gloss * 10.0 + 1.0);
	////// Specular:
	float NdotL = max(0, dot(normalDirection, lightDirection));
	float LdotH = max(0.0,dot(lightDirection, halfDirection));
	float4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(i.uv0, _Diffuse));
	float3 diffuseColor = _Diffuse_var.rgb; // Need this for specular when using metallic
	float specularMonochrome;
	float3 specularColor;
	diffuseColor = DiffuseAndSpecularFromMetallic(diffuseColor, 0.0, specularColor, specularMonochrome);
	specularMonochrome = 1 - specularMonochrome;
	float NdotV = max(0.0,dot(normalDirection, viewDirection));
	float NdotH = max(0.0,dot(normalDirection, halfDirection));
	float VdotH = max(0.0,dot(viewDirection, halfDirection));
	float visTerm = SmithBeckmannVisibilityTerm(NdotL, NdotV, 1.0 - gloss);
	float normTerm = max(0.0, NDFBlinnPhongNormalizedTerm(NdotH, RoughnessToSpecPower(1.0 - gloss)));
	float specularPBL = max(0, (NdotL*visTerm*normTerm) * unity_LightGammaCorrectionConsts_PIDiv4);
	float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularPBL*lightColor*FresnelTerm(specularColor, LdotH);
	float3 specular = directSpecular;
	/////// Diffuse:
	NdotL = max(0.0,dot(normalDirection, lightDirection));
	half fd90 = 0.5 + 2 * LdotH * LdotH * (1 - gloss);
	float3 directDiffuse = ((1 + (fd90 - 1)*pow((1.00001 - NdotL), 5)) * (1 + (fd90 - 1)*pow((1.00001 - NdotV), 5)) * NdotL) * attenColor;
	float3 diffuse = directDiffuse * diffuseColor;
	/// Final Color:
	float3 finalColor = diffuse + specular;
	fixed4 finalRGBA = fixed4(finalColor * 1,0);
	UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
	return finalRGBA;
	}
		ENDCG
	}
		Pass{
		Name "ShadowCaster"
		Tags{
		"LightMode" = "ShadowCaster"
	}
		Offset 1, 1

		CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#define UNITY_PASS_SHADOWCASTER
#include "UnityCG.cginc"
#include "Lighting.cginc"
#include "UnityPBSLighting.cginc"
#include "UnityStandardBRDF.cginc"
#pragma fragmentoption ARB_precision_hint_fastest
#pragma multi_compile_shadowcaster
#pragma multi_compile_fog
#pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
#pragma target 3.0
		uniform sampler2D _Noise; uniform float4 _Noise_ST;
	uniform float _DissolveAmount;
	struct VertexInput {
		float4 vertex : POSITION;
		float2 texcoord0 : TEXCOORD0;
	};
	struct VertexOutput {
		V2F_SHADOW_CASTER;
		float2 uv0 : TEXCOORD1;
	};
	VertexOutput vert(VertexInput v) {
		VertexOutput o = (VertexOutput)0;
		o.uv0 = v.texcoord0;
		o.pos = UnityObjectToClipPos(v.vertex);
		TRANSFER_SHADOW_CASTER(o)
			return o;
	}
	float4 frag(VertexOutput i, float facing : VFACE) : COLOR{
		float isFrontFace = (facing >= 0 ? 1 : 0);
	float faceSign = (facing >= 0 ? 1 : -1);
	float4 _Noise_var = tex2D(_Noise,TRANSFORM_TEX(i.uv0, _Noise));
	float node_3995 = (((1.0 - _DissolveAmount)*1.2 + -0.6) + _Noise_var.r);
	clip(node_3995 - 0.5);
	SHADOW_CASTER_FRAGMENT(i)
	}
		ENDCG
	}
	}
		FallBack "Standard"
		CustomEditor "ShaderForgeMaterialInspector"
}
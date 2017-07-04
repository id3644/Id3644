// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:33408,y:32672,varname:node_3138,prsc:2|normal-1751-OUT,emission-8542-OUT,alpha-7113-A;n:type:ShaderForge.SFN_Cubemap,id:4178,x:32856,y:32660,ptovrint:False,ptlb:CubeMap,ptin:_CubeMap,varname:node_247,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,pvfc:0;n:type:ShaderForge.SFN_Tex2d,id:7113,x:31346,y:32800,ptovrint:False,ptlb:Texture(ARGB),ptin:_TextureARGB,varname:node_4579,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:3608,x:31928,y:33338,ptovrint:False,ptlb:reflection,ptin:_reflection,varname:node_3608,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Clamp01,id:2705,x:32564,y:33237,varname:node_2705,prsc:2|IN-611-OUT;n:type:ShaderForge.SFN_Lerp,id:8542,x:33071,y:32798,varname:node_8542,prsc:2|A-4178-RGB,B-7113-RGB,T-4387-OUT;n:type:ShaderForge.SFN_Tex2d,id:2362,x:32796,y:31895,varname:node_2362,prsc:2,ntxv:2,isnm:False|UVIN-4514-UVOUT,TEX-6910-TEX;n:type:ShaderForge.SFN_Panner,id:4514,x:32578,y:31930,varname:node_4514,prsc:2,spu:0,spv:0.1|UVIN-2201-UVOUT,DIST-5247-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8736,x:32088,y:32093,ptovrint:False,ptlb:ScrollSpeed,ptin:_ScrollSpeed,varname:node_8736,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:10;n:type:ShaderForge.SFN_TexCoord,id:2201,x:32311,y:31823,varname:node_2201,prsc:2,uv:0;n:type:ShaderForge.SFN_Time,id:5182,x:32088,y:31939,varname:node_5182,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5247,x:32311,y:31999,varname:node_5247,prsc:2|A-5182-TSL,B-8736-OUT;n:type:ShaderForge.SFN_Lerp,id:1751,x:33154,y:32372,varname:node_1751,prsc:2|A-8813-OUT,B-8783-OUT,T-9075-OUT;n:type:ShaderForge.SFN_OneMinus,id:4387,x:32739,y:33237,varname:node_4387,prsc:2|IN-2705-OUT;n:type:ShaderForge.SFN_Multiply,id:611,x:32347,y:33237,varname:node_611,prsc:2|A-40-OUT,B-3608-OUT;n:type:ShaderForge.SFN_Tex2d,id:7333,x:31927,y:32461,varname:node_7333,prsc:2,ntxv:0,isnm:False|UVIN-6972-OUT,TEX-3622-TEX;n:type:ShaderForge.SFN_Vector3,id:8813,x:32884,y:32358,varname:node_8813,prsc:2,v1:0,v2:0,v3:1;n:type:ShaderForge.SFN_Tex2dAsset,id:3622,x:31700,y:32571,ptovrint:False,ptlb:RampMap,ptin:_RampMap,varname:node_3622,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Append,id:6972,x:31718,y:32413,varname:node_6972,prsc:2|A-7113-A,B-6499-OUT;n:type:ShaderForge.SFN_Vector1,id:6499,x:31509,y:32393,varname:node_6499,prsc:2,v1:0;n:type:ShaderForge.SFN_Power,id:9075,x:32285,y:32599,varname:node_9075,prsc:2|VAL-7333-R,EXP-13-OUT;n:type:ShaderForge.SFN_Clamp01,id:40,x:32465,y:32599,varname:node_40,prsc:2|IN-9075-OUT;n:type:ShaderForge.SFN_ValueProperty,id:13,x:32071,y:32644,ptovrint:False,ptlb:WaterEdge(0to50),ptin:_WaterEdge0to50,varname:node_13,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:8783,x:33078,y:32094,varname:node_8783,prsc:2|A-2362-RGB,B-8671-RGB;n:type:ShaderForge.SFN_Tex2d,id:8671,x:32796,y:32119,varname:node_8671,prsc:2,ntxv:0,isnm:False|TEX-6910-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:6910,x:32372,y:32218,ptovrint:False,ptlb:Normal,ptin:_Normal,varname:node_6910,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;proporder:8736-13-3608-4178-7113-6910-3622;pass:END;sub:END;*/

Shader "Id3644/Fx/CubemapNormal" {
    Properties {
        _ScrollSpeed ("ScrollSpeed", Float ) = 10
        _WaterEdge0to50 ("WaterEdge(0to50)", Float ) = 1
        _reflection ("reflection", Range(0, 1)) = 0.5
        _CubeMap ("CubeMap", Cube) = "_Skybox" {}
        _TextureARGB ("Texture(ARGB)", 2D) = "white" {}
        _Normal ("Normal", 2D) = "white" {}
        _RampMap ("RampMap", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 2.0
            uniform float4 _TimeEditor;
            uniform samplerCUBE _CubeMap;
            uniform sampler2D _TextureARGB; uniform float4 _TextureARGB_ST;
            uniform float _reflection;
            uniform float _ScrollSpeed;
            uniform sampler2D _RampMap; uniform float4 _RampMap_ST;
            uniform float _WaterEdge0to50;
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
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 node_5182 = _Time + _TimeEditor;
                float2 node_4514 = (i.uv0+(node_5182.r*_ScrollSpeed)*float2(0,0.1));
                float4 node_2362 = tex2D(_Normal,TRANSFORM_TEX(node_4514, _Normal));
                float4 node_8671 = tex2D(_Normal,TRANSFORM_TEX(i.uv0, _Normal));
                float4 _TextureARGB_var = tex2D(_TextureARGB,TRANSFORM_TEX(i.uv0, _TextureARGB));
                float2 node_6972 = float2(_TextureARGB_var.a,0.0);
                float4 node_7333 = tex2D(_RampMap,TRANSFORM_TEX(node_6972, _RampMap));
                float node_9075 = pow(node_7333.r,_WaterEdge0to50);
                float3 normalLocal = lerp(float3(0,0,1),(node_2362.rgb*node_8671.rgb),node_9075);
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
////// Lighting:
////// Emissive:
                float3 emissive = lerp(texCUBE(_CubeMap,viewReflectDirection).rgb,_TextureARGB_var.rgb,(1.0 - saturate((saturate(node_9075)*_reflection))));
                float3 finalColor = emissive;
                return fixed4(finalColor,_TextureARGB_var.a);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

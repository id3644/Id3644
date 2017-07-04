// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-2144-OUT,alpha-7113-A;n:type:ShaderForge.SFN_Cubemap,id:4178,x:31632,y:32428,ptovrint:False,ptlb:Cubemap,ptin:_Cubemap,varname:node_247,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,pvfc:0;n:type:ShaderForge.SFN_Tex2d,id:7113,x:31632,y:32603,ptovrint:False,ptlb:Texture(ARGB),ptin:_TextureARGB,varname:node_4579,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:38be9af2f767cac4cb6fb6e480b5b31e,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:2794,x:32041,y:33142,varname:node_2794,prsc:2|A-7113-R,B-7113-G,C-7113-B;n:type:ShaderForge.SFN_Slider,id:3608,x:31920,y:33358,ptovrint:False,ptlb:reflection,ptin:_reflection,varname:node_3608,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Clamp01,id:2705,x:32358,y:33035,varname:node_2705,prsc:2|IN-4956-OUT;n:type:ShaderForge.SFN_OneMinus,id:30,x:32077,y:33438,varname:node_30,prsc:2|IN-3608-OUT;n:type:ShaderForge.SFN_Lerp,id:8542,x:32091,y:32531,varname:node_8542,prsc:2|A-4178-RGB,B-7113-RGB,T-2705-OUT;n:type:ShaderForge.SFN_Add,id:4956,x:32358,y:33200,varname:node_4956,prsc:2|A-2794-OUT,B-30-OUT;n:type:ShaderForge.SFN_Add,id:2144,x:32416,y:32520,varname:node_2144,prsc:2|A-8542-OUT,B-3455-OUT;n:type:ShaderForge.SFN_Slider,id:3455,x:32160,y:32715,ptovrint:False,ptlb:brightness,ptin:_brightness,varname:node_3455,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:0,max:1;proporder:7113-4178-3608-3455;pass:END;sub:END;*/

Shader "Id3644/Fx/Cubemap" {
    Properties {
        _TextureARGB ("Texture(ARGB)", 2D) = "white" {}
        _Cubemap ("Cubemap", Cube) = "_Skybox" {}
        _reflection ("reflection", Range(0, 1)) = 0.5
        _brightness ("brightness", Range(-1, 1)) = 0
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
            #pragma only_renderers d3d9 d3d11 glcore gles n3ds wiiu 
            #pragma target 3.0
            uniform samplerCUBE _Cubemap;
            uniform sampler2D _TextureARGB; uniform float4 _TextureARGB_ST;
            uniform float _reflection;
            uniform float _brightness;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
////// Lighting:
////// Emissive:
                float4 _TextureARGB_var = tex2D(_TextureARGB,TRANSFORM_TEX(i.uv0, _TextureARGB));
                float3 emissive = (lerp(texCUBE(_Cubemap,viewReflectDirection).rgb,_TextureARGB_var.rgb,saturate(((_TextureARGB_var.r*_TextureARGB_var.g*_TextureARGB_var.b)+(1.0 - _reflection))))+_brightness);
                float3 finalColor = emissive;
                return fixed4(finalColor,_TextureARGB_var.a);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

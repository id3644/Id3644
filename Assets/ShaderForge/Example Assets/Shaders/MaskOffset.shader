// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-8014-OUT,clip-2412-OUT;n:type:ShaderForge.SFN_Tex2d,id:7013,x:31845,y:32863,ptovrint:False,ptlb:node_7013,ptin:_node_7013,varname:node_7013,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:2412,x:32089,y:32755,varname:node_2412,prsc:2|A-3324-OUT,B-6863-OUT;n:type:ShaderForge.SFN_Slider,id:9721,x:31507,y:32662,ptovrint:False,ptlb:node_9721,ptin:_node_9721,varname:node_9721,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5337592,max:1;n:type:ShaderForge.SFN_RemapRange,id:3324,x:31845,y:32660,varname:node_3324,prsc:2,frmn:0,frmx:1,tomn:-0.5,tomx:0.5|IN-9721-OUT;n:type:ShaderForge.SFN_RemapRange,id:8014,x:32356,y:32553,varname:node_8014,prsc:2,frmn:0,frmx:1,tomn:-4,tomx:4|IN-2412-OUT;n:type:ShaderForge.SFN_OneMinus,id:6863,x:32041,y:32947,varname:node_6863,prsc:2|IN-7013-R;proporder:7013-9721;pass:END;sub:END;*/

Shader "Shader Forge/MaskOffset" {
    Properties {
        _node_7013 ("node_7013", 2D) = "white" {}
        _node_9721 ("node_9721", Range(0, 1)) = 0.5337592
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _node_7013; uniform float4 _node_7013_ST;
            uniform float _node_9721;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos(v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 _node_7013_var = tex2D(_node_7013,TRANSFORM_TEX(i.uv0, _node_7013));
                float node_2412 = ((_node_9721*1.0+-0.5)+(1.0 - _node_7013_var.r));
                clip(node_2412 - 0.5);
////// Lighting:
////// Emissive:
                float node_8014 = (node_2412*8.0+-4.0);
                float3 emissive = float3(node_8014,node_8014,node_8014);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _node_7013; uniform float4 _node_7013_ST;
            uniform float _node_9721;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos(v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 _node_7013_var = tex2D(_node_7013,TRANSFORM_TEX(i.uv0, _node_7013));
                float node_2412 = ((_node_9721*1.0+-0.5)+(1.0 - _node_7013_var.r));
                clip(node_2412 - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

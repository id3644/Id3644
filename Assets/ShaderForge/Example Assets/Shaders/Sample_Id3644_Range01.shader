// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-6464-OUT;n:type:ShaderForge.SFN_TexCoord,id:3113,x:31082,y:33327,varname:node_3113,prsc:2,uv:0;n:type:ShaderForge.SFN_Smoothstep,id:1482,x:31750,y:32498,varname:node_1482,prsc:2|A-9037-OUT,B-3099-OUT,V-3113-U;n:type:ShaderForge.SFN_Vector1,id:9037,x:31015,y:32520,varname:node_9037,prsc:2,v1:0;n:type:ShaderForge.SFN_Slider,id:3099,x:30871,y:32608,ptovrint:False,ptlb:node_6770,ptin:_node_6770,varname:node_6770,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3674794,max:1;n:type:ShaderForge.SFN_Smoothstep,id:1759,x:31757,y:32972,varname:node_1759,prsc:2|A-9037-OUT,B-3099-OUT,V-3113-V;n:type:ShaderForge.SFN_Smoothstep,id:6069,x:31763,y:32636,varname:node_6069,prsc:2|A-9037-OUT,B-3099-OUT,V-8372-OUT;n:type:ShaderForge.SFN_Smoothstep,id:4364,x:31757,y:33151,varname:node_4364,prsc:2|A-9037-OUT,B-3099-OUT,V-2706-OUT;n:type:ShaderForge.SFN_Multiply,id:6910,x:32013,y:32549,varname:node_6910,prsc:2|A-1482-OUT,B-6069-OUT;n:type:ShaderForge.SFN_Multiply,id:18,x:32035,y:33067,varname:node_18,prsc:2|A-1759-OUT,B-4364-OUT;n:type:ShaderForge.SFN_Multiply,id:6464,x:32303,y:32824,varname:node_6464,prsc:2|A-6910-OUT,B-18-OUT;n:type:ShaderForge.SFN_OneMinus,id:8372,x:31597,y:32726,varname:node_8372,prsc:2|IN-3113-U;n:type:ShaderForge.SFN_OneMinus,id:2706,x:31590,y:33224,varname:node_2706,prsc:2|IN-3113-V;proporder:3099;pass:END;sub:END;*/

Shader "Sample/Range01" {
    Properties {
        _node_6770 ("node_6770", Range(0, 1)) = 0.3674794
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
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
            uniform float _node_6770;
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
////// Lighting:
////// Emissive:
                float node_9037 = 0.0;
                float node_6464 = ((smoothstep( node_9037, _node_6770, i.uv0.r )*smoothstep( node_9037, _node_6770, (1.0 - i.uv0.r) ))*(smoothstep( node_9037, _node_6770, i.uv0.g )*smoothstep( node_9037, _node_6770, (1.0 - i.uv0.g) )));
                float3 emissive = float3(node_6464,node_6464,node_6464);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

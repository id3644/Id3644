// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-840-RGB;n:type:ShaderForge.SFN_ViewVector,id:7968,x:31926,y:32520,varname:node_7968,prsc:2;n:type:ShaderForge.SFN_Negate,id:7089,x:32129,y:32477,varname:node_7089,prsc:2|IN-7968-OUT;n:type:ShaderForge.SFN_Reflect,id:43,x:32306,y:32632,varname:node_43,prsc:2|A-7089-OUT,B-747-OUT;n:type:ShaderForge.SFN_NormalVector,id:747,x:31966,y:32752,prsc:2,pt:False;n:type:ShaderForge.SFN_Slider,id:1429,x:31966,y:32998,ptovrint:False,ptlb:node_1429,ptin:_node_1429,varname:node_1429,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:10;n:type:ShaderForge.SFN_Cubemap,id:840,x:32402,y:32796,ptovrint:False,ptlb:node_840,ptin:_node_840,varname:node_840,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,cube:6fae50958d818a54a88cbc9c6551f9b5,pvfc:0|DIR-43-OUT,MIP-1429-OUT;n:type:ShaderForge.SFN_Multiply,id:5309,x:32496,y:33078,varname:node_5309,prsc:2|A-840-RGB,B-1518-OUT;n:type:ShaderForge.SFN_RemapRange,id:1518,x:32209,y:33151,varname:node_1518,prsc:2,frmn:0,frmx:1,tomn:0,tomx:5|IN-840-A;proporder:1429-840;pass:END;sub:END;*/

Shader "Shader Forge/NewShader" {
    Properties {
        _node_1429 ("node_1429", Range(0, 10)) = 0
        _node_840 ("node_840", Cube) = "_Skybox" {}
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
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            #pragma glsl
            uniform float _node_1429;
            uniform samplerCUBE _node_840;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float4 _node_840_var = texCUBElod(_node_840,float4(reflect((-1*viewDirection),i.normalDir),_node_1429));
                float3 emissive = _node_840_var.rgb;
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

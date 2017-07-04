// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:33742,y:32691,varname:node_3138,prsc:2|emission-8542-OUT,alpha-8889-OUT;n:type:ShaderForge.SFN_Cubemap,id:4178,x:32470,y:32666,ptovrint:False,ptlb:Cubemap,ptin:_Cubemap,varname:node_247,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,cube:ccd317fd5e48f544db1a6fa8b3f7dd07,pvfc:0;n:type:ShaderForge.SFN_Tex2d,id:7113,x:30489,y:32628,ptovrint:False,ptlb:Texture(ARGB),ptin:_TextureARGB,varname:node_4579,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9253f90afee25f74fa4da789d140e004,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:3608,x:32427,y:33743,ptovrint:False,ptlb:reflection,ptin:_reflection,varname:node_3608,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Clamp01,id:2705,x:32397,y:33023,varname:node_2705,prsc:2|IN-4956-OUT;n:type:ShaderForge.SFN_OneMinus,id:30,x:32403,y:33554,varname:node_30,prsc:2|IN-3608-OUT;n:type:ShaderForge.SFN_Lerp,id:8542,x:32759,y:32784,varname:node_8542,prsc:2|A-4178-RGB,B-7113-RGB,T-8308-OUT;n:type:ShaderForge.SFN_Add,id:4956,x:32584,y:33482,varname:node_4956,prsc:2|A-4387-OUT,B-30-OUT;n:type:ShaderForge.SFN_Tex2d,id:2362,x:32819,y:32222,ptovrint:False,ptlb:node_2362,ptin:_node_2362,varname:node_2362,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c02d638b329a9c84bb50d5d726e45418,ntxv:3,isnm:True|UVIN-4514-UVOUT;n:type:ShaderForge.SFN_Panner,id:4514,x:32619,y:32222,varname:node_4514,prsc:2,spu:0,spv:0.1|UVIN-5339-UVOUT;n:type:ShaderForge.SFN_Lerp,id:1751,x:33161,y:32398,varname:node_1751,prsc:2|A-2456-OUT,B-2362-RGB,T-3045-OUT;n:type:ShaderForge.SFN_OneMinus,id:4387,x:31899,y:33427,varname:node_4387,prsc:2|IN-7113-A;n:type:ShaderForge.SFN_Round,id:4665,x:31440,y:33101,varname:node_4665,prsc:2|IN-1693-OUT;n:type:ShaderForge.SFN_Floor,id:3045,x:31586,y:32964,varname:node_3045,prsc:2|IN-7113-A;n:type:ShaderForge.SFN_Ceil,id:5612,x:31427,y:32827,varname:node_5612,prsc:2|IN-1693-OUT;n:type:ShaderForge.SFN_Trunc,id:1383,x:31480,y:33368,varname:node_1383,prsc:2|IN-1693-OUT;n:type:ShaderForge.SFN_Add,id:1693,x:31008,y:33021,varname:node_1693,prsc:2|A-7113-A,B-1218-OUT;n:type:ShaderForge.SFN_Slider,id:1218,x:30637,y:33123,ptovrint:False,ptlb:Offset,ptin:_Offset,varname:node_1218,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_RemapRange,id:8049,x:31089,y:33340,varname:node_8049,prsc:2,frmn:0,frmx:1,tomn:-0.5,tomx:0.5|IN-4529-OUT;n:type:ShaderForge.SFN_OneMinus,id:141,x:30846,y:32412,varname:node_141,prsc:2;n:type:ShaderForge.SFN_Color,id:6960,x:31708,y:31601,ptovrint:False,ptlb:node_6960,ptin:_node_6960,varname:node_6960,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Color,id:7079,x:31689,y:31758,ptovrint:False,ptlb:node_7079,ptin:_node_7079,varname:node_7079,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.3241382,c2:0,c3:1,c4:1;n:type:ShaderForge.SFN_Lerp,id:5257,x:31969,y:31827,varname:node_5257,prsc:2|A-6960-RGB,B-7079-RGB;n:type:ShaderForge.SFN_TexCoord,id:5339,x:32403,y:32222,varname:node_5339,prsc:2,uv:0;n:type:ShaderForge.SFN_Vector3,id:2456,x:32836,y:32517,varname:node_2456,prsc:2,v1:0,v2:0,v3:1;n:type:ShaderForge.SFN_Round,id:8206,x:32773,y:33082,varname:node_8206,prsc:2|IN-4956-OUT;n:type:ShaderForge.SFN_Length,id:7620,x:32925,y:33486,varname:node_7620,prsc:2|IN-8206-OUT;n:type:ShaderForge.SFN_Multiply,id:8765,x:33081,y:33320,varname:node_8765,prsc:2|A-8206-OUT,B-7620-OUT;n:type:ShaderForge.SFN_RemapRange,id:4438,x:32508,y:31920,varname:node_4438,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-5339-UVOUT;n:type:ShaderForge.SFN_ComponentMask,id:4771,x:32693,y:31920,varname:node_4771,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-4438-OUT;n:type:ShaderForge.SFN_ArcTan2,id:6106,x:32933,y:31933,varname:node_6106,prsc:2,attp:2|A-4771-G,B-4771-R;n:type:ShaderForge.SFN_Tex2d,id:5002,x:33381,y:32056,varname:node_5002,prsc:2,tex:877bc628b69844ba081a63095156a6f1,ntxv:0,isnm:False|UVIN-8596-OUT,TEX-3317-TEX;n:type:ShaderForge.SFN_Append,id:8596,x:33114,y:31985,varname:node_8596,prsc:2|A-6106-OUT,B-8021-OUT;n:type:ShaderForge.SFN_Vector1,id:8021,x:32938,y:32098,varname:node_8021,prsc:2,v1:0;n:type:ShaderForge.SFN_Tex2dAsset,id:3317,x:33133,y:32128,ptovrint:False,ptlb:node_3317,ptin:_node_3317,varname:node_3317,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:877bc628b69844ba081a63095156a6f1,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Add,id:5366,x:31089,y:33514,varname:node_5366,prsc:2|A-8049-OUT,B-7113-A;n:type:ShaderForge.SFN_Slider,id:4529,x:30619,y:33403,ptovrint:False,ptlb:node_4529,ptin:_node_4529,varname:node_4529,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_RemapRange,id:2260,x:32054,y:32548,varname:node_2260,prsc:2,frmn:0,frmx:1,tomn:0,tomx:4|IN-7113-A;n:type:ShaderForge.SFN_Clamp01,id:9837,x:32241,y:32603,varname:node_9837,prsc:2|IN-2260-OUT;n:type:ShaderForge.SFN_OneMinus,id:7708,x:32435,y:32905,varname:node_7708,prsc:2|IN-5366-OUT;n:type:ShaderForge.SFN_Clamp01,id:8308,x:32651,y:32968,varname:node_8308,prsc:2|IN-7708-OUT;n:type:ShaderForge.SFN_Vector1,id:8889,x:33357,y:33005,varname:node_8889,prsc:2,v1:1;proporder:7113-4178-3608-2362-1218-6960-7079-3317-4529;pass:END;sub:END;*/

Shader "Id3644/Fx/CubemapMask" {
    Properties {
        _TextureARGB ("Texture(ARGB)", 2D) = "white" {}
        _Cubemap ("Cubemap", Cube) = "_Skybox" {}
        _reflection ("reflection", Range(0, 1)) = 0.5
        _node_2362 ("node_2362", 2D) = "bump" {}
        _Offset ("Offset", Range(0, 1)) = 0.5
        _node_6960 ("node_6960", Color) = (1,0,0,1)
        _node_7079 ("node_7079", Color) = (0.3241382,0,1,1)
        _node_3317 ("node_3317", 2D) = "black" {}
        _node_4529 ("node_4529", Range(0, 1)) = 0.5
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
            uniform float _node_4529;
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
                float3 emissive = lerp(texCUBE(_Cubemap,viewReflectDirection).rgb,_TextureARGB_var.rgb,saturate((1.0 - ((_node_4529*1.0+-0.5)+_TextureARGB_var.a))));
                float3 finalColor = emissive;
                return fixed4(finalColor,1.0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

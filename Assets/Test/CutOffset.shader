// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-5477-R,alpha-9885-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32249,y:32554,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Lerp,id:4593,x:32461,y:32774,varname:node_4593,prsc:2|A-7241-RGB,B-100-RGB,T-9743-OUT;n:type:ShaderForge.SFN_Add,id:6867,x:31774,y:33070,varname:node_6867,prsc:2|A-1946-OUT,B-6048-OUT;n:type:ShaderForge.SFN_ComponentMask,id:6048,x:31416,y:33186,varname:node_6048,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-6889-U;n:type:ShaderForge.SFN_TexCoord,id:6889,x:31234,y:33186,varname:node_6889,prsc:2,uv:0;n:type:ShaderForge.SFN_Slider,id:1946,x:31259,y:33090,ptovrint:False,ptlb:node_1946,ptin:_node_1946,varname:node_1946,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:-0.06506659,max:1;n:type:ShaderForge.SFN_Color,id:100,x:32249,y:32728,ptovrint:False,ptlb:node_100,ptin:_node_100,varname:node_100,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:1,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:6008,x:31774,y:33234,varname:node_6008,prsc:2|A-1946-OUT,B-6048-OUT;n:type:ShaderForge.SFN_RemapRange,id:9304,x:31774,y:33443,varname:node_9304,prsc:2,frmn:0,frmx:1,tomn:0,tomx:1.5|IN-1946-OUT;n:type:ShaderForge.SFN_Clamp01,id:1981,x:31995,y:33342,varname:node_1981,prsc:2|IN-9304-OUT;n:type:ShaderForge.SFN_Floor,id:9743,x:32249,y:32941,varname:node_9743,prsc:2|IN-9997-OUT;n:type:ShaderForge.SFN_Tex2d,id:5477,x:31314,y:32530,ptovrint:False,ptlb:node_5477,ptin:_node_5477,varname:node_5477,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:6900,x:31684,y:32678,varname:node_6900,prsc:2|A-5477-R,B-1946-OUT;n:type:ShaderForge.SFN_RemapRange,id:9997,x:31973,y:32556,varname:node_9997,prsc:2,frmn:0,frmx:1,tomn:0,tomx:10|IN-5477-R;n:type:ShaderForge.SFN_Step,id:3307,x:31693,y:32420,varname:node_3307,prsc:2|A-2906-OUT,B-5477-R;n:type:ShaderForge.SFN_Vector1,id:2906,x:31445,y:32339,varname:node_2906,prsc:2,v1:0.4;n:type:ShaderForge.SFN_Ceil,id:3765,x:31625,y:31811,varname:node_3765,prsc:2|IN-6900-OUT;n:type:ShaderForge.SFN_Round,id:9885,x:31625,y:31951,varname:node_9885,prsc:2|IN-6900-OUT;n:type:ShaderForge.SFN_Floor,id:5845,x:31625,y:32088,varname:node_5845,prsc:2|IN-6900-OUT;n:type:ShaderForge.SFN_Trunc,id:8991,x:31625,y:32224,varname:node_8991,prsc:2|IN-6900-OUT;proporder:7241-1946-100-5477;pass:END;sub:END;*/

Shader "Id3644/CutOffset" {
    Properties {
        _Color ("Color", Color) = (1,0,0,1)
        _node_1946 ("node_1946", Range(-1, 1)) = -0.06506659
        _node_100 ("node_100", Color) = (0,1,0,1)
        _node_5477 ("node_5477", 2D) = "white" {}
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
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float _node_1946;
            uniform sampler2D _node_5477; uniform float4 _node_5477_ST;
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
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 _node_5477_var = tex2D(_node_5477,TRANSFORM_TEX(i.uv0, _node_5477));
                float3 emissive = float3(_node_5477_var.r,_node_5477_var.r,_node_5477_var.r);
                float3 finalColor = emissive;
                float node_6900 = (_node_5477_var.r+_node_1946);
                return fixed4(finalColor,round(node_6900));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

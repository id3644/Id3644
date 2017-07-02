// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-3218-OUT;n:type:ShaderForge.SFN_Lerp,id:2605,x:31581,y:32422,varname:node_2605,prsc:2|A-7024-RGB,B-449-RGB,T-864-OUT;n:type:ShaderForge.SFN_Tex2d,id:7024,x:31128,y:32230,ptovrint:False,ptlb:DetailR,ptin:_DetailR,varname:node_7024,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:449,x:31128,y:32444,ptovrint:False,ptlb:DetailG,ptin:_DetailG,varname:_node_7024_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:6443,x:31581,y:32645,ptovrint:False,ptlb:DetailB,ptin:_DetailB,varname:_node_7024_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:5337,x:31875,y:32995,ptovrint:False,ptlb:DetailA,ptin:_DetailA,varname:_node_7024_copy_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:3700,x:30882,y:33252,ptovrint:False,ptlb:Mask,ptin:_Mask,varname:_node_7024_copy_copy_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:3329,x:31890,y:32784,varname:node_3329,prsc:2|A-2605-OUT,B-6443-RGB,T-8779-OUT;n:type:ShaderForge.SFN_Lerp,id:8929,x:32146,y:32970,varname:node_8929,prsc:2|A-3329-OUT,B-5337-RGB,T-1704-OUT;n:type:ShaderForge.SFN_ComponentMask,id:4067,x:31145,y:33290,varname:node_4067,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-3700-RGB;n:type:ShaderForge.SFN_ComponentMask,id:864,x:31145,y:33447,varname:node_864,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-3700-RGB;n:type:ShaderForge.SFN_ComponentMask,id:8779,x:31145,y:33601,varname:node_8779,prsc:2,cc1:2,cc2:-1,cc3:-1,cc4:-1|IN-3700-RGB;n:type:ShaderForge.SFN_OneMinus,id:1704,x:31145,y:33759,varname:node_1704,prsc:2|IN-3700-A;n:type:ShaderForge.SFN_Add,id:9163,x:31598,y:33439,varname:node_9163,prsc:2|A-4067-OUT,B-864-OUT,C-8779-OUT;n:type:ShaderForge.SFN_OneMinus,id:1597,x:31927,y:33439,varname:node_1597,prsc:2|IN-2663-OUT;n:type:ShaderForge.SFN_Tex2d,id:4734,x:32027,y:33212,ptovrint:False,ptlb:DetailBk,ptin:_DetailBk,varname:node_4734,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:7826,x:32363,y:33162,varname:node_7826,prsc:2|A-8929-OUT,B-4734-RGB,T-1597-OUT;n:type:ShaderForge.SFN_Clamp01,id:2663,x:31765,y:33439,varname:node_2663,prsc:2|IN-9163-OUT;n:type:ShaderForge.SFN_Power,id:3218,x:32602,y:33299,varname:node_3218,prsc:2|VAL-7826-OUT,EXP-2679-OUT;n:type:ShaderForge.SFN_Slider,id:831,x:32144,y:33613,ptovrint:False,ptlb:Exp,ptin:_Exp,varname:node_831,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:0,max:1;n:type:ShaderForge.SFN_OneMinus,id:2679,x:32493,y:33559,varname:node_2679,prsc:2|IN-831-OUT;proporder:3700-7024-449-6443-5337-4734-831;pass:END;sub:END;*/

Shader "Shader Forge/Splatting01" {
    Properties {
        _Mask ("Mask", 2D) = "white" {}
        _DetailR ("DetailR", 2D) = "white" {}
        _DetailG ("DetailG", 2D) = "white" {}
        _DetailB ("DetailB", 2D) = "white" {}
        _DetailA ("DetailA", 2D) = "white" {}
        _DetailBk ("DetailBk", 2D) = "white" {}
        _Exp ("Exp", Range(-1, 1)) = 0
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
            uniform sampler2D _DetailR; uniform float4 _DetailR_ST;
            uniform sampler2D _DetailG; uniform float4 _DetailG_ST;
            uniform sampler2D _DetailB; uniform float4 _DetailB_ST;
            uniform sampler2D _DetailA; uniform float4 _DetailA_ST;
            uniform sampler2D _Mask; uniform float4 _Mask_ST;
            uniform sampler2D _DetailBk; uniform float4 _DetailBk_ST;
            uniform float _Exp;
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
                float4 _DetailR_var = tex2D(_DetailR,TRANSFORM_TEX(i.uv0, _DetailR));
                float4 _DetailG_var = tex2D(_DetailG,TRANSFORM_TEX(i.uv0, _DetailG));
                float4 _Mask_var = tex2D(_Mask,TRANSFORM_TEX(i.uv0, _Mask));
                float node_864 = _Mask_var.rgb.g;
                float4 _DetailB_var = tex2D(_DetailB,TRANSFORM_TEX(i.uv0, _DetailB));
                float node_8779 = _Mask_var.rgb.b;
                float4 _DetailA_var = tex2D(_DetailA,TRANSFORM_TEX(i.uv0, _DetailA));
                float4 _DetailBk_var = tex2D(_DetailBk,TRANSFORM_TEX(i.uv0, _DetailBk));
                float3 emissive = pow(lerp(lerp(lerp(lerp(_DetailR_var.rgb,_DetailG_var.rgb,node_864),_DetailB_var.rgb,node_8779),_DetailA_var.rgb,(1.0 - _Mask_var.a)),_DetailBk_var.rgb,(1.0 - saturate((_Mask_var.rgb.r+node_864+node_8779)))),(1.0 - _Exp));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

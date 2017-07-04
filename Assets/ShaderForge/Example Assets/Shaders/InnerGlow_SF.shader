// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:33278,y:32570,varname:node_3138,prsc:2|emission-1411-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32539,y:32355,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.07843138,c2:0.3921569,c3:0.7843137,c4:1;n:type:ShaderForge.SFN_Smoothstep,id:7330,x:32079,y:32917,varname:node_7330,prsc:2|A-4895-R,B-5805-OUT,V-3843-OUT;n:type:ShaderForge.SFN_Vector1,id:5805,x:31665,y:32938,varname:node_5805,prsc:2,v1:1;n:type:ShaderForge.SFN_Slider,id:3245,x:31504,y:33023,ptovrint:False,ptlb:GlowWidth,ptin:_GlowWidth,varname:node_3245,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_OneMinus,id:4631,x:32079,y:33056,varname:node_4631,prsc:2|IN-7330-OUT;n:type:ShaderForge.SFN_VertexColor,id:4895,x:31665,y:32690,varname:node_4895,prsc:2;n:type:ShaderForge.SFN_Multiply,id:3835,x:32887,y:32852,varname:node_3835,prsc:2|A-7241-A,B-6070-OUT;n:type:ShaderForge.SFN_OneMinus,id:3843,x:31661,y:33115,varname:node_3843,prsc:2|IN-3245-OUT;n:type:ShaderForge.SFN_Add,id:912,x:31993,y:32305,varname:node_912,prsc:2|A-8847-OUT,B-4895-R;n:type:ShaderForge.SFN_Slider,id:8847,x:31561,y:32305,ptovrint:False,ptlb:LineWidth,ptin:_LineWidth,varname:node_8847,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Floor,id:4736,x:32166,y:32305,varname:node_4736,prsc:2|IN-912-OUT;n:type:ShaderForge.SFN_Floor,id:6294,x:31993,y:32453,varname:node_6294,prsc:2|IN-4895-R;n:type:ShaderForge.SFN_Subtract,id:8236,x:32166,y:32453,varname:node_8236,prsc:2|A-4736-OUT,B-6294-OUT;n:type:ShaderForge.SFN_Add,id:8879,x:32444,y:32886,varname:node_8879,prsc:2|A-4631-OUT,B-8236-OUT;n:type:ShaderForge.SFN_Color,id:478,x:32539,y:32539,ptovrint:False,ptlb:ColorL,ptin:_ColorL,varname:node_478,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Lerp,id:9915,x:32887,y:32520,varname:node_9915,prsc:2|A-7241-RGB,B-478-RGB,T-8236-OUT;n:type:ShaderForge.SFN_Vector1,id:9506,x:33071,y:32838,varname:node_9506,prsc:2,v1:1;n:type:ShaderForge.SFN_Lerp,id:1411,x:33071,y:32668,varname:node_1411,prsc:2|A-9915-OUT,B-4498-OUT,T-6070-OUT;n:type:ShaderForge.SFN_Vector1,id:4498,x:32887,y:32689,varname:node_4498,prsc:2,v1:0;n:type:ShaderForge.SFN_OneMinus,id:6070,x:32633,y:32886,varname:node_6070,prsc:2|IN-8879-OUT;n:type:ShaderForge.SFN_Add,id:5015,x:32887,y:32984,varname:node_5015,prsc:2|A-7241-A,B-6070-OUT;n:type:ShaderForge.SFN_OneMinus,id:6425,x:32887,y:33125,varname:node_6425,prsc:2|IN-5015-OUT;proporder:7241-478-3245-8847;pass:END;sub:END;*/

Shader "Shader Forge/InnerGlow_SF" {
    Properties {
        _Color ("Color", Color) = (0.07843138,0.3921569,0.7843137,1)
        _ColorL ("ColorL", Color) = (1,0,0,1)
        _GlowWidth ("GlowWidth", Range(0, 1)) = 0.5
        _LineWidth ("LineWidth", Range(0, 1)) = 0.5
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
            Blend One One
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles n3ds wiiu 
            #pragma target 3.0
            uniform float4 _Color;
            uniform float _GlowWidth;
            uniform float _LineWidth;
            uniform float4 _ColorL;
            struct VertexInput {
                float4 vertex : POSITION;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos(v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float node_8236 = (floor((_LineWidth+i.vertexColor.r))-floor(i.vertexColor.r));
                float node_4498 = 0.0;
                float node_6070 = (1.0 - ((1.0 - smoothstep( i.vertexColor.r, 1.0, (1.0 - _GlowWidth) ))+node_8236));
                float3 emissive = lerp(lerp(_Color.rgb,_ColorL.rgb,node_8236),float3(node_4498,node_4498,node_4498),node_6070);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

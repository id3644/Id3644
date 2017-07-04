// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:Standard,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-4826-OUT;n:type:ShaderForge.SFN_Color,id:3621,x:31639,y:32526,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.07843138,c2:0.3921569,c3:0.7843137,c4:1;n:type:ShaderForge.SFN_Smoothstep,id:3244,x:31492,y:33069,varname:node_3244,prsc:2|A-251-R,B-2834-OUT,V-984-OUT;n:type:ShaderForge.SFN_Vector1,id:2834,x:31078,y:33090,varname:node_2834,prsc:2,v1:1;n:type:ShaderForge.SFN_Slider,id:6123,x:30917,y:33175,ptovrint:False,ptlb:GlowWidth,ptin:_GlowWidth,varname:node_3245,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1,max:1;n:type:ShaderForge.SFN_OneMinus,id:6391,x:31684,y:33069,varname:node_6391,prsc:2|IN-3244-OUT;n:type:ShaderForge.SFN_VertexColor,id:251,x:31078,y:32842,varname:node_251,prsc:2;n:type:ShaderForge.SFN_OneMinus,id:984,x:31074,y:33267,varname:node_984,prsc:2|IN-6123-OUT;n:type:ShaderForge.SFN_Lerp,id:4826,x:32523,y:32811,varname:node_4826,prsc:2|A-9785-OUT,B-3621-RGB,T-9603-OUT;n:type:ShaderForge.SFN_Multiply,id:9603,x:32227,y:32848,varname:node_9603,prsc:2|A-3621-A,B-6391-OUT;n:type:ShaderForge.SFN_Vector1,id:9785,x:31639,y:32442,varname:node_9785,prsc:2,v1:0;proporder:3621-6123;pass:END;sub:END;*/

Shader "Id3644/Fx/VertexLineGlow" {
    Properties {
        _Color ("Color", Color) = (0.07843138,0.3921569,0.7843137,1)
        _GlowWidth ("GlowWidth", Range(0, 1)) = 0.1
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
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _Color;
            uniform float _GlowWidth;
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
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float node_9785 = 0.0;
                float3 emissive = lerp(float3(node_9785,node_9785,node_9785),_Color.rgb,(_Color.a*(1.0 - smoothstep( i.vertexColor.r, 1.0, (1.0 - _GlowWidth) ))));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Standard"
    CustomEditor "ShaderForgeMaterialInspector"
}

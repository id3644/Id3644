// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|custl-8781-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32489,y:32433,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.07843138,c2:0.3921569,c3:0.7843137,c4:1;n:type:ShaderForge.SFN_ScreenPos,id:3623,x:32332,y:32141,varname:node_3623,prsc:2,sctp:2;n:type:ShaderForge.SFN_SceneColor,id:2320,x:31936,y:33124,varname:node_2320,prsc:2|UVIN-3070-OUT;n:type:ShaderForge.SFN_Slider,id:1961,x:31698,y:32192,ptovrint:False,ptlb:Offset,ptin:_Offset,varname:node_1961,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Set,id:4237,x:32047,y:32192,varname:__offset,prsc:2|IN-1961-OUT;n:type:ShaderForge.SFN_Add,id:7792,x:32005,y:32413,varname:node_7792,prsc:2|A-8067-OUT,B-4497-OUT;n:type:ShaderForge.SFN_Set,id:1088,x:32616,y:32131,varname:_screenPos,prsc:2|IN-3623-UVOUT;n:type:ShaderForge.SFN_Get,id:8067,x:31737,y:32389,varname:node_8067,prsc:2|IN-1088-OUT;n:type:ShaderForge.SFN_Get,id:4497,x:31723,y:32464,varname:node_4497,prsc:2|IN-4237-OUT;n:type:ShaderForge.SFN_Set,id:7287,x:32616,y:32172,varname:_screenPosU,prsc:2|IN-3623-U;n:type:ShaderForge.SFN_Set,id:1373,x:32616,y:32215,varname:_screenPosV,prsc:2|IN-3623-V;n:type:ShaderForge.SFN_Append,id:5154,x:31721,y:32874,varname:node_5154,prsc:2|A-9639-OUT,B-4550-OUT;n:type:ShaderForge.SFN_Add,id:9639,x:31475,y:32874,varname:node_9639,prsc:2|A-2121-OUT,B-2005-OUT;n:type:ShaderForge.SFN_Get,id:4550,x:31454,y:32801,varname:node_4550,prsc:2|IN-1373-OUT;n:type:ShaderForge.SFN_Get,id:2121,x:31253,y:32842,varname:node_2121,prsc:2|IN-7287-OUT;n:type:ShaderForge.SFN_Get,id:2005,x:31253,y:32925,varname:node_2005,prsc:2|IN-4237-OUT;n:type:ShaderForge.SFN_Append,id:3070,x:31709,y:33124,varname:node_3070,prsc:2|A-9016-OUT,B-7706-OUT;n:type:ShaderForge.SFN_Add,id:7706,x:31463,y:33124,varname:node_7706,prsc:2|A-1441-OUT,B-1251-OUT;n:type:ShaderForge.SFN_Get,id:9016,x:31442,y:33051,varname:node_9016,prsc:2|IN-7287-OUT;n:type:ShaderForge.SFN_Get,id:1441,x:31241,y:33092,varname:node_1441,prsc:2|IN-1373-OUT;n:type:ShaderForge.SFN_Get,id:1251,x:31241,y:33175,varname:node_1251,prsc:2|IN-4237-OUT;n:type:ShaderForge.SFN_Add,id:602,x:32225,y:33078,varname:node_602,prsc:2|A-968-RGB,B-7164-RGB,C-2320-RGB,D-5225-RGB,E-4561-RGB;n:type:ShaderForge.SFN_SceneColor,id:7164,x:31936,y:32874,varname:node_7164,prsc:2|UVIN-5154-OUT;n:type:ShaderForge.SFN_Divide,id:8781,x:32475,y:33068,varname:node_8781,prsc:2|A-602-OUT,B-7149-OUT;n:type:ShaderForge.SFN_Vector1,id:7149,x:32283,y:33237,varname:node_7149,prsc:2,v1:5;n:type:ShaderForge.SFN_SceneColor,id:968,x:31936,y:32683,varname:node_968,prsc:2|UVIN-7937-OUT;n:type:ShaderForge.SFN_Get,id:7937,x:31700,y:32683,varname:node_7937,prsc:2|IN-1088-OUT;n:type:ShaderForge.SFN_SceneColor,id:4561,x:31924,y:33627,varname:node_4561,prsc:2;n:type:ShaderForge.SFN_Append,id:3071,x:31709,y:33377,varname:node_3071,prsc:2|A-9803-OUT,B-2973-OUT;n:type:ShaderForge.SFN_Get,id:9803,x:31442,y:33304,varname:node_9803,prsc:2|IN-7287-OUT;n:type:ShaderForge.SFN_Get,id:3477,x:31241,y:33345,varname:node_3477,prsc:2|IN-1373-OUT;n:type:ShaderForge.SFN_Get,id:5953,x:31241,y:33428,varname:node_5953,prsc:2|IN-4237-OUT;n:type:ShaderForge.SFN_Append,id:7896,x:31697,y:33627,varname:node_7896,prsc:2|A-1710-OUT,B-2894-OUT;n:type:ShaderForge.SFN_Get,id:1710,x:31430,y:33554,varname:node_1710,prsc:2|IN-1373-OUT;n:type:ShaderForge.SFN_Get,id:4070,x:31229,y:33595,varname:node_4070,prsc:2|IN-7287-OUT;n:type:ShaderForge.SFN_Get,id:8709,x:31229,y:33678,varname:node_8709,prsc:2|IN-4237-OUT;n:type:ShaderForge.SFN_SceneColor,id:5225,x:31924,y:33377,varname:node_5225,prsc:2|UVIN-3071-OUT;n:type:ShaderForge.SFN_Subtract,id:2973,x:31485,y:33377,varname:node_2973,prsc:2|A-3477-OUT,B-5953-OUT;n:type:ShaderForge.SFN_Subtract,id:2894,x:31451,y:33627,varname:node_2894,prsc:2|A-4070-OUT,B-8709-OUT;proporder:7241-1961;pass:END;sub:END;*/

Shader "Shader Forge/Blur002" {
    Properties {
        _Color ("Color", Color) = (0.07843138,0.3921569,0.7843137,1)
        _Offset ("Offset", Range(0, 1)) = 0
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        GrabPass{ }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles n3ds wiiu 
            #pragma target 3.0
            uniform sampler2D _GrabTexture;
            uniform float _Offset;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 screenPos : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos(v.vertex );
                o.screenPos = o.pos;
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5;
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
                float2 _screenPos = sceneUVs.rg;
                float _screenPosU = sceneUVs.r;
                float __offset = _Offset;
                float _screenPosV = sceneUVs.g;
                float3 finalColor = ((tex2D( _GrabTexture, _screenPos).rgb+tex2D( _GrabTexture, float2((_screenPosU+__offset),_screenPosV)).rgb+tex2D( _GrabTexture, float2(_screenPosU,(_screenPosV+__offset))).rgb+tex2D( _GrabTexture, float2(_screenPosU,(_screenPosV-__offset))).rgb+sceneColor.rgb)/5.0);
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-7241-RGB,alpha-6357-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32005,y:32539,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:0.5;n:type:ShaderForge.SFN_Subtract,id:7960,x:30988,y:32629,varname:node_7960,prsc:2|A-3946-OUT,B-1385-OUT;n:type:ShaderForge.SFN_Vector1,id:1385,x:30809,y:32711,varname:node_1385,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Abs,id:4470,x:31160,y:32629,varname:node_4470,prsc:2|IN-7960-OUT;n:type:ShaderForge.SFN_Frac,id:3946,x:30809,y:32577,varname:node_3946,prsc:2|IN-9909-OUT;n:type:ShaderForge.SFN_ComponentMask,id:9909,x:30638,y:32577,varname:node_9909,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-8555-UVOUT;n:type:ShaderForge.SFN_Multiply,id:8659,x:31335,y:32679,cmnt:Triangle Wave,varname:node_8659,prsc:2|A-4470-OUT,B-4950-OUT;n:type:ShaderForge.SFN_Vector1,id:4950,x:31160,y:32765,varname:node_4950,prsc:2,v1:2;n:type:ShaderForge.SFN_ValueProperty,id:8127,x:31335,y:32826,ptovrint:False,ptlb:Bulge Shape,ptin:_BulgeShape,varname:_BulgeShape,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_TexCoord,id:8555,x:30318,y:32718,varname:node_8555,prsc:2,uv:0;n:type:ShaderForge.SFN_Power,id:112,x:31539,y:32742,cmnt:Panning gradient,varname:node_112,prsc:2|VAL-8659-OUT,EXP-8127-OUT;n:type:ShaderForge.SFN_OneMinus,id:4788,x:31724,y:32742,varname:node_4788,prsc:2|IN-112-OUT;n:type:ShaderForge.SFN_Tex2d,id:9202,x:31340,y:32988,ptovrint:False,ptlb:Diffuase,ptin:_Diffuase,varname:node_9942,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b66bceaf0cc0ace4e9bdc92f14bba709,ntxv:0,isnm:False|UVIN-2347-UVOUT;n:type:ShaderForge.SFN_Multiply,id:4177,x:32055,y:32813,varname:node_4177,prsc:2|A-4788-OUT,B-9202-A;n:type:ShaderForge.SFN_Multiply,id:6357,x:32249,y:32765,varname:node_6357,prsc:2|A-4177-OUT,B-7241-A;n:type:ShaderForge.SFN_Panner,id:2347,x:31048,y:33046,varname:node_2347,prsc:2,spu:1,spv:0|UVIN-8555-UVOUT,DIST-2530-OUT;n:type:ShaderForge.SFN_Sin,id:8615,x:30386,y:33255,varname:node_8615,prsc:2|IN-688-T;n:type:ShaderForge.SFN_Multiply,id:1053,x:30002,y:33391,varname:node_1053,prsc:2|A-688-T,B-6504-OUT;n:type:ShaderForge.SFN_Slider,id:1144,x:29903,y:33690,ptovrint:False,ptlb:Frequency Num,ptin:_FrequencyNum,varname:node_2731,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Add,id:9411,x:30587,y:33255,varname:node_9411,prsc:2|A-8615-OUT,B-593-OUT;n:type:ShaderForge.SFN_Sin,id:9066,x:30201,y:33417,varname:node_9066,prsc:2|IN-1053-OUT;n:type:ShaderForge.SFN_Multiply,id:593,x:30386,y:33492,varname:node_593,prsc:2|A-9066-OUT,B-1144-OUT;n:type:ShaderForge.SFN_Slider,id:6504,x:29598,y:33562,ptovrint:False,ptlb:Frequency Speed,ptin:_FrequencySpeed,varname:node_4136,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Time,id:688,x:29774,y:33249,varname:node_688,prsc:2;n:type:ShaderForge.SFN_SwitchProperty,id:2530,x:30778,y:33085,ptovrint:False,ptlb:Use Frequency,ptin:_UseFrequency,varname:node_2530,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-6371-OUT,B-9411-OUT;n:type:ShaderForge.SFN_Multiply,id:6371,x:30000,y:33089,varname:node_6371,prsc:2|A-688-T,B-5643-OUT;n:type:ShaderForge.SFN_Slider,id:5643,x:29617,y:33111,ptovrint:False,ptlb:Speed,ptin:_Speed,varname:node_5643,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1,max:10;proporder:7241-9202-8127-5643-2530-1144-6504;pass:END;sub:END;*/

Shader "Id3644/Fx/AlphaScroll" {
    Properties {
        _Color ("Color", Color) = (1,1,1,0.5)
        _Diffuase ("Diffuase", 2D) = "white" {}
        _BulgeShape ("Bulge Shape", Float ) = 1
        _Speed ("Speed", Range(0, 10)) = 0.1
        [MaterialToggle] _UseFrequency ("Use Frequency", Float ) = 0
        _FrequencyNum ("Frequency Num", Range(0, 10)) = 1
        _FrequencySpeed ("Frequency Speed", Range(0, 1)) = 1
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
            #pragma target 2.0
            uniform float4 _TimeEditor;
            uniform float4 _Color;
            uniform float _BulgeShape;
            uniform sampler2D _Diffuase; uniform float4 _Diffuase_ST;
            uniform float _FrequencyNum;
            uniform float _FrequencySpeed;
            uniform fixed _UseFrequency;
            uniform float _Speed;
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
                float3 emissive = _Color.rgb;
                float3 finalColor = emissive;
                float4 node_688 = _Time + _TimeEditor;
                float2 node_2347 = (i.uv0+lerp( (node_688.g*_Speed), (sin(node_688.g)+(sin((node_688.g*_FrequencySpeed))*_FrequencyNum)), _UseFrequency )*float2(1,0));
                float4 _Diffuase_var = tex2D(_Diffuase,TRANSFORM_TEX(node_2347, _Diffuase));
                return fixed4(finalColor,(((1.0 - pow((abs((frac(i.uv0.r)-0.5))*2.0),_BulgeShape))*_Diffuase_var.a)*_Color.a));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

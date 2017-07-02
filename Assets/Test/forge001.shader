// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|alpha-7195-OUT;n:type:ShaderForge.SFN_DepthBlend,id:3835,x:31831,y:32599,varname:node_3835,prsc:2|DIST-6872-OUT;n:type:ShaderForge.SFN_SceneDepth,id:9629,x:31834,y:32735,varname:node_9629,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:8270,x:32406,y:32150,varname:node_8270,prsc:2,tex:271f5ee3273dd7f4fae6e204d4f8c4bf,ntxv:0,isnm:False|UVIN-1640-OUT,TEX-5006-TEX;n:type:ShaderForge.SFN_ComponentMask,id:993,x:32415,y:33181,varname:node_993,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-1035-OUT;n:type:ShaderForge.SFN_Multiply,id:1035,x:32207,y:33165,varname:node_1035,prsc:2|A-3835-OUT,B-1966-OUT;n:type:ShaderForge.SFN_Vector4,id:1966,x:32014,y:33216,varname:node_1966,prsc:2,v1:1,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_Vector1,id:8599,x:31978,y:32211,varname:node_8599,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Append,id:1640,x:32186,y:32150,varname:node_1640,prsc:2|A-6432-OUT,B-8599-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:5006,x:32186,y:32309,ptovrint:False,ptlb:Ramp,ptin:_Ramp,varname:node_5006,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:271f5ee3273dd7f4fae6e204d4f8c4bf,ntxv:0,isnm:False;n:type:ShaderForge.SFN_OneMinus,id:6432,x:31978,y:32081,varname:node_6432,prsc:2|IN-4678-OUT;n:type:ShaderForge.SFN_RemapRange,id:4678,x:32049,y:32513,varname:node_4678,prsc:2,frmn:0,frmx:1,tomn:-4,tomx:4;n:type:ShaderForge.SFN_Slider,id:6872,x:31452,y:32675,ptovrint:False,ptlb:node_6872,ptin:_node_6872,varname:node_6872,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:1,max:1;n:type:ShaderForge.SFN_Color,id:1665,x:32449,y:32840,ptovrint:False,ptlb:node_1665,ptin:_node_1665,varname:node_1665,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Depth,id:7195,x:31834,y:32872,varname:node_7195,prsc:2;n:type:ShaderForge.SFN_OneMinus,id:9675,x:32134,y:32689,varname:node_9675,prsc:2|IN-3835-OUT;proporder:5006-6872-1665;pass:END;sub:END;*/

Shader "Shader Forge/forge001" {
    Properties {
        _Ramp ("Ramp", 2D) = "white" {}
        _node_6872 ("node_6872", Range(-1, 1)) = 1
        _node_1665 ("node_1665", Color) = (0.5,0.5,0.5,1)
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
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float4 projPos : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
////// Lighting:
                float3 finalColor = 0;
                return fixed4(finalColor,partZ);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

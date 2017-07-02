Shader "Custom/Lot" {
	Properties{
		_Color("Color", Color) = (1,1,1,1)
		_BorderWidth("Border Width", Range(0,1)) = 0
	}
		SubShader{
		Tags{
		"Queue" = "Transparent"
		"RenderType" = "Overlay"
		"IgnoreProjector" = "True"
	}

		Pass{
		Tags{
		"LightMode" = "Vertex"
	}
		ZWrite Off
		Blend SrcAlpha OneMinusSrcAlpha

		CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#include "UnityCG.cginc"

		// my parameters
		uniform float4 _Color;
	uniform float _BorderWidth;

	struct vertexInput {
		float4 vertex : POSITION;
		float4 texcoord : TEXCOORD0;
	};

	struct vertexOutput {
		float4 pos : SV_POSITION;
		float4 uv : TEXCOORD0;
	};

	vertexOutput vert(vertexInput v) {
		vertexOutput o;

		// assign the position (in clip space?)
		o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
		o.uv = float4(v.texcoord.xy, 0, 0);
		return o;
	}


	float4 frag(vertexOutput i) : COLOR{
		half4 col = _Color;

		col.a = 1 - smoothstep(0.0, _BorderWidth, i.uv.x) *
			(1 - smoothstep(1 - _BorderWidth, 1.0, i.uv.x)) *
			smoothstep(0.0, _BorderWidth, i.uv.y) *
			(1 - smoothstep(1 - _BorderWidth, 1.0, i.uv.y));

		return col;
	}

		ENDCG
	}
	}
		FallBack "Diffuse"
}
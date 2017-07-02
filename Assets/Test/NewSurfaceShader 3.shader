Shader "Custom/Color Map" {
	Properties{
		_MainTex("Base (RGB)", 2D) = "white" {}
	_BumpTex("BumpTex", 2D) = "bump" {}
	_MaskTex("Mask (RGBA)", 2D) = "white" {}
	_Color1("Base Tint", Color) = (1, 1, 1, 1)
		_Color2("Color2", Color) = (1, 1, 1, 1)
		_Color3("Color3", Color) = (1, 1, 1, 1)
	}
		SubShader{
		Tags{ "RenderType" = "Opaque" }
		LOD 200

		CGPROGRAM
#pragma surface surf Lambert

		sampler2D _MainTex, _BumpTex, _MaskTex;
	float4 _Color1, _Color2, _Color3;

	struct Input {
		float2 uv_MainTex;
		float2 uv_BumpTex;
	};

	void surf(Input IN, inout SurfaceOutput o) {
		half3 m = tex2D(_MaskTex, IN.uv_MainTex);
		half4 c = tex2D(_MainTex, IN.uv_MainTex);
		half3 res = m;
		if (m.r >= .1) res = _Color1.rgb;
		else if (m.g >= .1) res = _Color2.rgb;
		else if (m.b >= .1) res = _Color3.rgb;
		o.Albedo = c.rgb * res;
		o.Normal = UnpackNormal(tex2D(_BumpTex, IN.uv_BumpTex));
		o.Alpha = c.a;
	}
	ENDCG
	}
		FallBack "Diffuse"
}
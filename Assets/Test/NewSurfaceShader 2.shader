Shader "Example/3 Alpha Blended Textures" {
	Properties{
		_Color("Color", Color) = (1,1,1,1)
		_SpecColor("Specular Color", Color) = (0.5, 0.5, 0.5, 0)
		_Shininess("Shininess", Range(0.01, 1)) = 0.078125

		_MainTex("Base (RGB)", 2D) = "white" {}
	_ColorCamo("Camo Color", Color) = (1,1,1,1)
		_BlendTex("Alpha Blended (RGBA)", 2D) = "white" {}
	_ColorStripe("Stripe Color", Color) = (1,1,1,1)
		_BlendTex2("Alpha Blended (RGBA) 2", 2D) = "white" {}

	_BumpTex("BumpTex", 2D) = "bump" {}

	}
		SubShader{

		LOD 800

		ColorMask RGBA

		Pass{

		// Apply base texture
		SetTexture[_MainTex]{
		//                combine texture
		Combine texture * constant, constant
	}
		// Blend in the alpha texture using the lerp operator
		SetTexture[_BlendTex]{
		combine texture lerp(texture) previous
	}
		// Blend in the alpha texture using the lerp operator
		SetTexture[_BlendTex2]{
		combine texture lerp(texture) previous
	}
	}
		CGPROGRAM
#pragma surface surf BlinnPhong

		sampler2D _MainTex, _BumpTex;
	fixed4 _Color;
	half _Shininess;

	struct Input {
		float2 uv_MainTex;
		float2 uv_BumpTex;
	};

	void surf(Input IN, inout SurfaceOutput o) {
		fixed4 tex = tex2D(_MainTex, IN.uv_MainTex);

		o.Albedo = tex.rgb;
		o.Gloss = tex.a;
		o.Alpha = tex.a * _Color.a;
		o.Specular = _Shininess;
		o.Normal = UnpackNormal(tex2D(_BumpTex, IN.uv_BumpTex));

	}
	ENDCG
	}

}
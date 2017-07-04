Shader "Custom/CubemapReflection" {
	Properties{
		_MainTex("Texture", 2D) = "white" {}
	_Cube("Cubemap", CUBE) = "" {}   // 사용할 큐브맵을 설정합니다.
	_Blend("Blend Offset", Range(0,1)) = 0.5 // 메인 텍스처와 큐브맵의 어느 정도 비율로 blend할지 설정합니다.
	}
		SubShader{
		Tags{ "RenderType" = "Opaque" }

		CGPROGRAM

#pragma surface surf Lambert

		struct Input {
		float2 uv_MainTex;
		float3 worldRefl; // 해당 정점에 카메라 레이가 반사되는 방향을 나타내는 벡터입니다.
	};

	sampler2D _MainTex;
	samplerCUBE _Cube;
	float _Blend;

	void surf(Input IN, inout SurfaceOutput o) {
		// _Blend를 기준으로 메인 텍스처와 큐브맵의 색상값을 blend 처리하기 때문에 색상값이 1을 넘지 않습니다. Alpha Blend와 유사합니다.
		o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb * _Blend;
		o.Albedo += texCUBE(_Cube, IN.worldRefl).rgb * (1 - _Blend);
	}
	ENDCG
	}
		Fallback "Diffuse"
}
Shader "Depth Mask Blended/Blended By Depth Mask" {

Properties {
	_Color ("Color", Color) = (1,1,1)
	_MainTex ("Texture", 2D) = "white"
}

Subshader {
	Tags { "Queue" = "Background-2"} 
	// Don't draw in the RGBA channels; just the depth buffer
		
		ZWrite Off
		ZTest Greater
		Blend DstAlpha OneMinusDstAlpha
		
		// Do nothing specific in the pass:
		
		Pass {
			SetTexture[_MainTex] {
				constantColor [_Color]
				combine texture * constant
				}
		
		}
}

}
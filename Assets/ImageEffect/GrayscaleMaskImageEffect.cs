using UnityEngine;
using System.Collections;

public class GrayscaleMaskImageEffect : MonoBehaviour
{
    public Material Material;

    void OnEnable()
    {
        if(Material == null)
        {
            Debug.LogError("Material is not assigned.", this);
            this.enabled = false;
        }
    }

    void OnRenderImage(RenderTexture src, RenderTexture dest)
    {
        Graphics.Blit(src, dest, Material);
    }
}

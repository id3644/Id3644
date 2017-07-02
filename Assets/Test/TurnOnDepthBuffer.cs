using UnityEngine;
using System.Collections;

public class TurnOnDepthBuffer : MonoBehaviour
{

    void Awake()
    {
        GetComponent<Camera>().depthTextureMode = DepthTextureMode.Depth;
    }
}
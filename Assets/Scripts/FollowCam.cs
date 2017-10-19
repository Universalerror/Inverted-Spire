using UnityEngine;
using System.Collections;

public class FollowCam : MonoBehaviour {

    public Transform Target;
    public float FollowDistance;

    void Update()
    {
        transform.position = Vector3.Lerp(transform.position, Target.position + -transform.forward * FollowDistance, 0.9f);
    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Diagnostics;

public class Shooter : MonoBehaviour {

    public Weapon shot;
    public Color DebugColour = Color.blue;

	// Update is called once per frame
	void Update () {
        shot.Fire();
	}

    private void OnDrawGizmos()
    {
        Gizmos.color = DebugColour;
        Gizmos.DrawSphere(transform.position, 0.5f);
    }
}

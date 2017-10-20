using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Shooter : MonoBehaviour {

    public Weapon shot;

	// Update is called once per frame
	void Update () {
        shot.Fire();
	}
}

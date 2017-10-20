using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TimeToKill : MonoBehaviour {

    public float timeToLife;
    float _remainingTime;

    private void Start()
    {
        _remainingTime = timeToLife;
    }

    // Update is called once per frame
    void Update () {
        _remainingTime -= Time.deltaTime;
        if(_remainingTime < 0)
        {
            Destroy(gameObject);
        }
	}
}

using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour {

    public float MoveSpeed = 5;
    public float Gravity = 200;

    private float _cumulativeGrav;

    private CharacterController _char;
    private Camera _cam;

    private Vector3 _mov = Vector3.zero;

    private void Awake()
    {
        _char = GetComponentInChildren<CharacterController>();
        _cam = FindObjectOfType<Camera>();
    }

    private void Update()
    {
        ManageMovement();
        ManageRotation();
    }

    private void ManageRotation()
    {
        Ray __camRay = _cam.ScreenPointToRay(Input.mousePosition);
        RaycastHit __hitPosInfo;
        Physics.Raycast(__camRay, out __hitPosInfo, LayerMask.NameToLayer("Raycatcher"));
        _char.transform.LookAt(__hitPosInfo.point);
    }

    private void ManageMovement()
    {
        _mov = new Vector3(Input.GetAxis("Horizontal"), 0, Input.GetAxis("Vertical"));
        _mov *= MoveSpeed;
        if (_char.isGrounded)
        {
            _cumulativeGrav = 0;
        }
        _cumulativeGrav += Gravity;
        _mov.y -= _cumulativeGrav * Time.deltaTime;
        _char.Move(_mov * Time.deltaTime);
    }
}

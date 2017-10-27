using System;
using UnityEngine;
using UnityEditor;

[Serializable]
public enum WeaponType
{
    HITSCAN,
    PROJECTILE,
    BEAM,
    AURA
}

public class Weapon : MonoBehaviour
{
    [Header("Assets")]
    [SerializeField]
    GameObject shot;

    [Header("Weapon Properties")]
    [SerializeField] WeaponType type;
    [SerializeField] int _maxAmmo;
    [SerializeField] int _currentAmmo;
    [SerializeField] int _clipSize;
    [SerializeField] int _currentClipCount;
    [SerializeField] int _roundsToChamber;
    [SerializeField] bool _reloading;
                     float _timeBeganReloading;
    [SerializeField] float _reloadTime;
    [SerializeField] bool _canCancelReload;
    [SerializeField] float _reloadWarningPercentage = 20;
    [SerializeField] float _lowAmmoWarningPercentage = 20;
    [SerializeField] float interval = 0.1f;
    [SerializeField] float speed = 1f;
                     float _lastShot;

    //Getters/Setters
    #region Getter Utility
    /// <summary>
    /// returns currently held ammo supply.
    /// </summary>
    public int GetCurrentAmmo
    {
        get
        {
            return _currentAmmo;
        }
    }

    /// <summary>
    /// Used to get next bullets at max capacity or remaining bullets. Will subtract from total.
    /// </summary>
    public int GetNextClip
    {
        get
        {
            if (_clipSize > _currentAmmo)
            {
                int remaining = _currentAmmo;
                _currentAmmo = 0;
                return remaining;
            }
            else
            {
                _currentAmmo -= _clipSize;
                return _clipSize;
            }
        }
    }

    /// <summary>
    /// returns true if % of remaining ammo is less than specified %
    /// </summary>
    public bool IsLowOnAmmo
    {
        get
        {
            return (((_maxAmmo - _currentAmmo) / _maxAmmo) * 100) <= _lowAmmoWarningPercentage;
        }
    }

    /// <summary>
    /// returns true if % remaining in clip is less than specified %
    /// </summary>
    public bool IsRequiringReload
    {
        get
        {
            return (((_clipSize - _currentClipCount) / _clipSize) * 100) <= _reloadWarningPercentage;
        }
    }

    /// <summary>
    /// return true if clip is == 0
    /// </summary>
    public bool IsEmptyClip
    {
        get
        {
            return _currentClipCount == 0;
        }
    }

    /// <summary>
    /// true if fire conditions met
    /// </summary>
    public bool CanFire
    {
        get
        {
            if(_lastShot + interval < Time.time && _currentClipCount > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
    #endregion

    public bool Fire()
    {
        if (CanFire)
        {
            _lastShot = Time.time;
            switch (type)
            {
                case WeaponType.HITSCAN:
                    DoRaycast();
                    return true;
                case WeaponType.PROJECTILE:
                    LaunchShot();
                    return true;
                case WeaponType.BEAM:
                    MaintainBeam();
                    return true;
                case WeaponType.AURA:
                    ToggleAura();
                    return true;
                default:
                    return false;
            }
        }
        else
        {
            return false;
        }
    }

    private void ToggleAura()
    {
        throw new NotImplementedException();
    }

    private void MaintainBeam()
    {
        //ray for stopping the beam early
        Ray r = new Ray(transform.position, transform.forward);
        RaycastHit hit;
        
        if(Physics.Raycast(r, out hit, speed))
        {
            DrawBeam(shot, r, hit);
        }
        else
        {
            DrawBeam(shot, r, hit);
        }
    }

    private void DrawBeam(GameObject shot, Ray r, RaycastHit hit)
    {
        shot.GetComponent<BeamRenderer>().Draw(r.origin, hit.point);
    }

    private void DrawBeam(GameObject shot, Ray r, float distance)
    {
        shot.GetComponent<BeamRenderer>().Draw(r.origin, r.GetPoint(distance));
    }

    private void LaunchShot()
    {
        GameObject go = Instantiate(shot, transform);
        go.GetComponent<Rigidbody>().AddForce(transform.forward * speed, ForceMode.VelocityChange); //Can change ForceModes here, could do rockets, air resistance, heavy objects.
    }

    private void DoRaycast()
    {
        throw new NotImplementedException();
    }
}
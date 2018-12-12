using System;
using UnityEngine;
using KSP;


//
// super helpful link:
// https://forum.kerbalspaceprogram.com/index.php?/topic/153765-getting-started-the-basics-of-writing-a-plug-in/
//
namespace DragDetector {
    //[KSPAddon(KSPAddon.Startup.MainMenu, false)]
    //[KSPAddon(KSPAddon.Startup.Flight, false)]
    public class DragDetector : PartModule {


        // debug option for me when I'm looking at stuff in the terminal
        bool debug = true;
        bool verbose = true;
        bool logActive = true;


        //[KSPField(isPersistant = true, guiName = "Drag Force", guiActive = true, guiActiveEditor = true, guiUnits = "m", guiFormat = "N2")]
        //public float Distance = 0.0f;

        [KSPField(isPersistant = true, guiName = "Drag Force", guiActive = true)]
        public double valueToShow = 6.9f;


        [KSPField(isPersistant = true, guiName = "Drag Detector Enabled", guiActive = true, guiActiveEditor = true),
         UI_Toggle(disabledText = "no", enabledText = "yes")]
        public bool Activated = false;


        //void Awake()
        //{
        //    if (verbose)
        //    {
        //        Debug.Log("Part boi is awake");
        //    }
        //}

        public void Update()
        {
            if (debug)
            {
                Debug.Log("Custom Script: " + Time.realtimeSinceStartup);
            }


            Vessel vess = FlightGlobals.ActiveVessel;

            CelestialBody bd = FlightGlobals.currentMainBody;

            if (Activated)
            {
                Vector3d nVel = vess.srf_velocity.normalized;
                Vector3d vLift = Vector3d.zero; // the sum of lift from all parts
                Vector3d vDrag = Vector3d.zero; // the sum of drag from all parts

                double drag = 0.0;
                double pDrag = 0.0;
                double pLift = 0.0;
                double thrust = 0.0;
                double d = vess.atmDensity;
                double p = vess.staticPressurekPa * 1000.0;
                double Q = vess.dynamicPressurekPa * 1000.0;


                //Vector3d airVel = vess.orbit.GetVel() - bd.getRFrmVelOrbit(vess.orbit);//bd.getRFrmVel(position); //the velocity of the vessel relative to the air

                Vector3d pos = vess.GetWorldPos3D();
                Vector3d airVel = vess.orbit.GetVel() - bd.getRFrmVel(pos);

                double airspeed = vess.indicatedAirSpeed;

                if (debug)
                {
                    Debug.Log("Density: " + d);
                    Debug.Log("Static Pressure: " + p);
                    Debug.Log("Dynamic Pressure: " + Q);
                    Debug.Log("Air Velocity: " + airVel);
                    Debug.Log("Air Vel Mag: " + airVel.magnitude);
                    Debug.Log("Air Speed: " + airspeed);

                }

                // calculate the bois we need
                // loop through the parts
                for (int i = 0; i < vess.Parts.Count; ++i)
                {
                    Part pt = vess.Parts[i];
                    // get the part drag that is not from wing and surface
                    vDrag += -pt.dragVectorDir * pt.dragScalar;
                    if (!pt.hasLiftModule)
                    {
                        Vector3 bodyLift = pt.transform.rotation * (pt.bodyLiftScalar * pt.DragCubes.LiftForce);
                        bodyLift = Vector3.ProjectOnPlane(bodyLift, -pt.dragVectorDir);
                        vLift += bodyLift;
                    }
                    // now find modules
                    for (int j = 0; j < pt.Modules.Count; ++j)
                    {
                        var m = pt.Modules[j];
                        if (m is ModuleLiftingSurface) // control surface derives from this
                        {
                            ModuleLiftingSurface wing = (ModuleLiftingSurface)m;
                            vLift += wing.liftForce;
                            vDrag += wing.dragForce;


                        }
                        // Get thrust
                        if (m is ModuleEngines) // FX derives from this
                        {
                            thrust += ((ModuleEngines)m).finalThrust;
                        }
                    }
                }

                pLift = vLift.magnitude;
                pDrag = vDrag.magnitude;
                Vector3d force = vLift + vDrag; // sum of all forces on the craft
                Vector3d liftDir = -Vector3d.Cross(vess.transform.right, nVel); // we need the "lift" direction, which
                                                                                // is "up" from our current velocity vector and roll angle.
                drag = Vector3d.Dot(force, -nVel); // drag force, = pDrag + lift-induced drag


                if ((verbose || debug) && logActive)
                {
                    Debug.Log("Drag Vector: " + vDrag);
                    Debug.Log("Drag Mag: " + vDrag.magnitude);
                    Debug.Log("Lift Vector: " + vLift);
                    Debug.Log("Lift Mag: " + vLift.magnitude);
                }
                if (logActive)
                {
                    Debug.Log("Total Froce: " + force);
                    Debug.Log("Force Mag: " + force.magnitude);
                    Debug.Log("Drag Force: " + drag);
                }

                valueToShow = drag;
                //FlightGlobals.
                //valueToShow += 0.0001f;
                //if (valueToShow > 10000f)
                //{
                //    valueToShow = 0.0f;
                //}
            }


        }



    }
}
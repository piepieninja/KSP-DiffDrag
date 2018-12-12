using System;
using System.IO;
using System.Collections.Generic;
using System.Diagnostics;
using System.Reflection;
using System.Linq;
using System.Text;

using UnityEngine;
using KSP;

namespace MyKSPProject
{
    /// <summary>
    /// My first part!
    /// </summary>
    public class DragDetector : PartModule
    {
        /// <summary>
        /// Called when the part is started by Unity.
        /// </summary>

        bool hasStarted = false;
        int test = 0;

        // Thermal bits
        double scaleHeightMult, solarFlux, backgroundRadTemp, bodyAlbedoFlux, bodyEmissiveFlux, bodySunFlux, effectiveFaceTemp, bodyTemperature, sunDot, atmosphereTemperatureOffset, altTempMult, latitude, latTempMod, axialTempMod, solarAMMult, finalAtmoMod, sunFinalMult, diurnalRange;
        bool inSun;

        // display forces
        public double terminalV, alpha, sideslip, soundSpeed, mach, eas, thrust, climbrate, lift, drag, lidForce, dragUpForce, pLift, pDrag, liftUp, grav, ldRatio, Q, pressure, density, ambientTemp, shockTemp, CdS, ClS, ballisticCoeff;

        // thermal counter
        public double convectiveTotal = 0d;

        // path to log file
        string path = @"/Users/calebadams/Development/KSP-DiffDrag/data/test_output.txt";

        public override void OnStart(StartState state)
        {
            print("Drag Detector Initiated");
            if (FlightGlobals.ship_altitude > 200.0) {
                print("the ship alt is greater than 200!");
            } else {
                print("the ship alt is not greater than 200!");
            }
        }
        public override void OnFixedUpdate()
        {
            // nothing
        }
        public void FixedUpdate()
        {
            //print("yeet");
        }
        public override void OnUpdate()
        {
            if ((object)FlightGlobals.ActiveVessel != null){
                if (!hasStarted && FlightGlobals.ship_altitude > 200) { // log starts above 200km
                    print("Starting Log... ");
                    hasStarted = true;
                    //if (!File.Exists(path)){
                    //    // Create a file to write to.
                    //    string createText = "Hello and Welcome" + Environment.NewLine;
                    //    File.WriteAllText(path, createText);
                    //} 

                    //// This text is always added, making the file longer over time
                    //// if it is not deleted.
                    //string appendText = "This is extra text" + Environment.NewLine;
                    //File.AppendAllText(path, appendText);

                }
                print("Vessel Not Null!");
                Vessel v = FlightGlobals.ActiveVessel;
                Vector3d vLift = Vector3d.zero; // the sum of lift from all parts
                Vector3d vDrag = Vector3d.zero; // the sum of drag from all parts

                //double sqrMag = v.srf_velocity.sqrMagnitude;
                //Q = 0.5 * v.atmDensity * sqrMag; // dynamic pressure, aka Q

                density = v.atmDensity;
                pressure = v.staticPressurekPa * 1000.0;

                //print("adsf " + 1);
                //print("density: {0}", density);
                //print("pressure: {0}", pressure);

                print("reached spot 1");



                //int test = 69;
                //print(test.ToString());
                

                //for (int i = 0; i < v.Parts.Count; ++i)
                //{
                //    // loop parts here
                //}
                //print("counted " + v.Parts.Count + " parts ...");

            }
            // update here
            // print("ayee");
        }

    }
}

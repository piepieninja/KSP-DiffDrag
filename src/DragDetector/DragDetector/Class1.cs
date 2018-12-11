using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using UnityEngine;

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
        public override void OnStart(StartState state)
        {
            Vessel v = FlightGlobals.ActiveVessel;
            print("Drag Detector Initiated");
        }
    }
}
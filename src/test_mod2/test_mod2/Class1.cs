using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
 
using UnityEngine;
 
namespace test_mod2
{
    /// <summary>
    /// My first part!
    /// </summary>
    public class HelloKerbinMod : PartModule
    {
        /// <summary>
        /// Called when the part is started by Unity.
        /// </summary>
        public override void OnStart(StartState state)
        {
            /// Add stuff to the log
            print("Hello, Kerbin!");
        }
    }
}

// https://wiki.kerbalspaceprogram.com/wiki/Tutorial:Creating_your_first_module

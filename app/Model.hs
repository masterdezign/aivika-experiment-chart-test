
{-# LANGUAGE RecursiveDo #-}
module Model where

import Simulation.Aivika
import Simulation.Aivika.SystemDynamics
import Simulation.Aivika.Experiment

-- FHN, Izhikevich, page 106
-- dV/dt = V (a−V)(V−1) − w
-- dw/dt = bV − cw

model :: (Dynamics Double, Dynamics Double) -> Simulation Results
model (v0, w0) =
  mdo v <- integ (v * (a - v) * (v - 1) - w) v0
      w <- integ (b * v - c * w) w0
      let a = 0.1
          b = 0.01
          c = 0.1
      return $ results
        [resultSource "t" "time" time,
         resultSource "v" "variable V" v,
         resultSource "w" "variable w" w]


{-# LANGUAGE RecursiveDo #-}
module Model where

import Simulation.Aivika
import Simulation.Aivika.SystemDynamics
import Simulation.Aivika.Experiment

-- FHN, Izhikevich, page 106
-- dV/dt = V (a−V)(V−1) − w, V(t0) = 0.2
-- dw/dt = bV − cw, w(t0) = -0.5

model :: Simulation Results
model =
  mdo v <- integ (v * (a - v) * (v - 1) - w) 0.2
      w <- integ (b * v - c * w) (-0.5)
      let a = -0.1
          b = 0.01
          c = 0.02
      return $ results
        [resultSource "t" "time" time,
         resultSource "v" "variable V" v,
         resultSource "w" "variable w" w]

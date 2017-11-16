
{-# LANGUAGE RecursiveDo #-}
module Model where

import Simulation.Aivika
import Simulation.Aivika.SystemDynamics
import Simulation.Aivika.Experiment

-- Mackey-Glass delay equation
model :: Simulation Results
model =
  mdo x <- integ (beta * x / (1 + x^10) - gamma * x) 0.2
      let gamma = 0.1
          beta = 0.2

      return $ results
        [resultSource "t" "time" time,
         resultSource "x" "variable x" x]

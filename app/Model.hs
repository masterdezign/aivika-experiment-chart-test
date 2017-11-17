
{-# LANGUAGE RecursiveDo #-}
module Model where

import Simulation.Aivika
import Simulation.Aivika.SystemDynamics
import Simulation.Aivika.Experiment

-- Mackey-Glass delay equation
model :: Simulation Results
model =
  mdo xTau <- delayI x tauD 0.2
      x <- integ (beta * xTau / (1 + xTau^10) - gamma * x) 0.2
      let gamma = 0.1
          beta = 0.2
          tauD = 17  -- Delay time

      return $ results
        [resultSource "t" "time" time,
         resultSource "x" "variable x" x]

modelIkeda :: Simulation Results
modelIkeda =
  mdo xTau <- delayI x tauD 0.2
      x <- integ ((-x + beta * 0.5 * (1 - (cos $ 2 * (xTau + phi0))))/epsilon) 0.2
      let phi0 = 0.2
          beta = 3
          epsilon = 0.005
          tauD = 1  -- Delay time

      return $ results
        [resultSource "t" "time" time,
         resultSource "x" "variable x" x]

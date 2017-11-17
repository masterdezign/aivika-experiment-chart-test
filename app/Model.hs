
{-# LANGUAGE RecursiveDo #-}
module Model where

import Data.Array

import Simulation.Aivika
import Simulation.Aivika.SystemDynamics
import Simulation.Aivika.Experiment

import Simulation.Aivika.Internal.Specs
import Simulation.Aivika.Internal.Parameter
import Simulation.Aivika.Internal.Dynamics

-- Mackey-Glass delay equation
model :: Simulation Results
model =
  mdo -- xTau <- delayI x tauD 0.2
      x <- integ (beta * xTauPrecise / (1 + xTauPrecise^10) - gamma * x) 0.2
      let gamma = 0.1
          beta = 0.2
          -- tauD = 17  -- Delay time

      points <- liftParameter $
        Parameter $ \r ->
        do let xs = integPoints r
               bnds = integIterationBnds (runSpecs r)
           return $
             listArray bnds xs

      let xTauPrecise =
            Dynamics $ \p ->
              if pointIteration p > 170
              then let n  = pointIteration p
                       ph = pointPhase p
                   in if ph < 3
                      then invokeDynamics (points ! (n - 170)) x
                      else invokeDynamics (points ! (n - 169)) x
              else return 0.2

      return $ results
        [resultSource "t" "time" time,
         resultSource "x" "variable x" x]

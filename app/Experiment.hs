module Experiment where

import Data.Monoid

import Control.Arrow

import Simulation.Aivika
import Simulation.Aivika.Experiment
import Simulation.Aivika.Experiment.Chart

specs = Specs { spcStartTime = 0,
                spcStopTime = 800,
                spcDT = 0.1,
                spcMethod = RungeKutta4,
                spcGeneratorType = SimpleGenerator }

experiment :: Experiment
experiment =
  defaultExperiment {
    experimentSpecs = specs,
    experimentRunCount = 1,
    experimentTitle = "FHN model",
    experimentDescription = "FitzHugh-Nagumo model simulation. " ++
                            "Demonstrate the limit cycle." }

t = resultByName "t"
v = resultByName "v"
w = resultByName "w"

generators :: ChartRendering r => [WebPageGenerator r]
generators =
  [outputView defaultExperimentSpecsView,
   outputView $ defaultTableView {
     tableSeries = t <> v <> w },

   outputView $ defaultTimeSeriesView {
        timeSeriesTitle = "Time Series",
        timeSeriesLeftYSeries = v <> w } ]

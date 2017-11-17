module Experiment where

import Data.Monoid

import Control.Arrow

import Simulation.Aivika
import Simulation.Aivika.Experiment
import Simulation.Aivika.Experiment.Chart

specs = Specs { spcStartTime = 0,
                spcStopTime = 10,
                spcDT = 0.0005,
                spcMethod = RungeKutta4,
                spcGeneratorType = SimpleGenerator }

experiment :: Experiment
experiment =
  defaultExperiment {
    experimentSpecs = specs,
    experimentRunCount = 1,
    experimentTitle = "Ikeda",
    experimentDescription = "" }

t = resultByName "t"
x = resultByName "x"

generators :: ChartRendering r => [WebPageGenerator r]
generators =
  [outputView defaultExperimentSpecsView,
   outputView $ defaultTableView {
     tableSeries = t <> x },

   outputView $ defaultTimeSeriesView {
        timeSeriesTitle = "Time Series",
        timeSeriesLeftYSeries = x } ]

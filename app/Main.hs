import Simulation.Aivika
import Simulation.Aivika.Experiment
import Simulation.Aivika.Experiment.Base
import Data.Monoid ( (<>) )

import Model

specs = Specs { spcStartTime = 0,
                spcStopTime = 30,
                spcDT = 0.0005,
                spcMethod = RungeKutta4,
                spcGeneratorType = SimpleGenerator }

experiment :: Experiment
experiment =
  defaultExperiment {
    experimentSpecs = specs,
    experimentRunCount = 1,
    experimentTitle = "Ikeda",
    experimentDescription = "The Ikeda DDE" }
t = resultByName "t"
x = resultByName "x"

generators :: [WebPageGenerator a]
generators =
  [outputView defaultExperimentSpecsView,
   outputView defaultInfoView,
   outputView $ defaultTableView {
     tableSeries = t <> x } ]

main = runExperiment experiment generators (WebPageRenderer () experimentFilePath) modelIkeda

import qualified Data.Vector.Storable as V
import Data.Monoid ( (<>) )

import Simulation.Aivika
import Simulation.Aivika.Experiment
import Simulation.Aivika.Experiment.Base

import Model

totalT :: Double
totalT = 30

dt' :: Double
dt' = 0.0005

specs = Specs { spcStartTime = 0,
                spcStopTime = totalT,
                spcDT = dt',
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

main = runExperiment experiment generators (WebPageRenderer () experimentFilePath) $ modelIkeda u
  where u = V.replicate (round (totalT / dt')) 0  -- No input

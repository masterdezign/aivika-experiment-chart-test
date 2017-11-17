import Simulation.Aivika.Experiment
import Simulation.Aivika.Experiment.Chart
import Simulation.Aivika.Experiment.Chart.Backend.Diagrams
import Graphics.Rendering.Chart.Backend.Diagrams

import Model
import Experiment

main =
  do fonts <- loadCommonFonts
     let r0 = DiagramsRenderer SVG (return fonts)
         r  = WebPageRenderer r0 experimentFilePath
     runExperimentParallel experiment generators r modelIkeda

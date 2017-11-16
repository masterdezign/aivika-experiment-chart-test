import Simulation.Aivika.Experiment
import Simulation.Aivika.Experiment.Chart
import Simulation.Aivika.Experiment.Chart.Backend.Diagrams
import Graphics.Rendering.Chart.Backend.Diagrams

import Model
import Experiment

-- See Izhikevich*, Figure 4.22
--
-- *Izhikevich, Dynamical Systems in Neuroscience: The Geometry of Excitability and Burtsing

main =
  do fonts <- loadCommonFonts
     let r0 = DiagramsRenderer SVG (return fonts)
         r  = WebPageRenderer r0 experimentFilePath
     runExperimentParallel experiment generators r $ model (0.2, -0.5)
     -- -- Try also
     -- runExperimentParallel experiment generators r $ model (-0.2, 0.5)

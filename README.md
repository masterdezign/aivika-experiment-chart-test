
# A Simulation Model Demonstrating the Chart Plotting in Aivika

This test project demonstrates the chart plotting in the [Aivika](http://www.aivikasoft.com) simulation framework.

![DeviationChart]
(images/DeviationChart.svg)

### Prerequisites

You need [Stack](http://docs.haskellstack.org/) installed on your computer. But to reproduce the test, you don't need to know the Haskell programming language, though.

### Downloading from GitHub

Download the test code from GitHub:

```
$ git clone https://github.com/dsorokin/aivika-experiment-chart-test.git
$ cd aivika-experiment-chart-test
```

### Building Project

For the first time, you will have to set up the Stack project. In the next time, you can skip this step.

`$ stack setup`

In the beginning and after each change of the corresponding Haskell code, you have to build a binary executable anew.

`$ stack build`

### Running Simulation

To run the simulation, type in the Terminal window:

`$ stack exec aivika-experiment-chart-test`

After the application finishes, you should see the simulation results in your opening Web browser.

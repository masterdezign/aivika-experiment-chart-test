
# Mackey-Glass DDE Chart Plotting in Aivika

This project was adapted from https://github.com/dsorokin/aivika-experiment-chart-test

![Comparison](https://raw.githubusercontent.com/masterdezign/aivika-experiment-dde-test/master/images/comparison.png)

### Prerequisites

You need [Stack](http://docs.haskellstack.org/) installed on your computer. But to reproduce the test, you don't need to know the Haskell programming language, though.

### Downloading from GitHub

Download the test code from GitHub:

```
$ git clone https://github.com/masterdezign/aivika-experiment-dde-test.git
$ cd aivika-experiment-dde-test
```

### Building Project

For the first time, you will have to set up the Stack project. In the next time, you can skip this step.

`$ stack setup`

In the beginning and after each change of the corresponding Haskell code, you have to build a binary executable anew.

`$ stack build`

### Running Simulation

To run the simulation, type in the Terminal window:

`$ stack exec aivika-experiment-dde-test`

After the application terminates, you will find the simulation results in a newly created `experiment/` directory.

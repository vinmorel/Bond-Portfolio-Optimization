# Bond Portfolio Optimization using linear programming

> The goal of this project is to solve an asset allocation problem for a portfolio composed of bond ETFs. The script minimizes the risk, expressed in terms of the Mean Absolute Deviation of change in daily prices, given a minimum level of dividends and portfolio duration. 

## Results 

<p align="center">
  <img src=/Pictures/header1.png>
</p>

The optimal solution is to invest 31.14% in VAB, 18.63% in XHY, and 50.22% in CSD, if a minimum yield of 4% and a minimum duration of 4.5 years are required by the investor.


## How it works

The program minimizes the following objective function :

![Showcase1](/Pictures/ObjFunction.png)

Where 
- T : Array of days
- I : Array of ETFs
- Rti : Daily price variation at t 
- pi : Proportion of index i in portfolio
- Mi : Mean of portfolio price variation (wrt pi)
- N : Number of days

With constraints : </br>
![Showcase2](/Pictures/Cons1.png)</br>
![Showcase3](/Pictures/Cons2.png)

Where 
- LR : Minimum duration and yield requirements

## Running it on your machine

ILOG CPLEX Optimization Studio was used to model and solve the problem.

You can use the files in this repo as a template for your own portfolio. All that is needed is to adjust the information in the data file to your own. You may also need to adjust the variable names in the model file, depending on the assets you wish to include in your portfolio. 

## Acknowledgments
Special thanks to Sylvain Perron, PhD. from HEC Montréal. 

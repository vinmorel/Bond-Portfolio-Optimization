# Bond Portfolio Optimization using linear programming

> The goal of this project is to solve an asset allocation problem for a portfolio composed of 3 bond ETFs. The script minimizes the risk, expressed by the mean absolute deviation of daily prices, given a minimum level of dividends and portfolio duration. 

## Results 

<p align="center">
  <img src=/Pictures/header1.png>
</p>

The optimal solution is to invest 31.14% in VAB, 18.63% in XHY, and 50.22% in CSD, given that a minimum yield of 4% and a minimum duration of 4.5 years are added as constraints.


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

with constraints : </br>
![Showcase2](/Pictures/Cons1.png)</br>
![Showcase3](/Pictures/Cons2.png)

Where 
- LR : Duration and Yield

## Running it on your machine

ILOG CPLEX Optimization Studio was used to model and solve the problem.
You can use the files in this repo as a template for your own portfolio. You have to adjust the information in the data file, where prices reflect the daily absolute change in price for a given period. You may also need to change the variables  depending on the ammount of assets you want in your portfolio and their associated names. 

## Acknowledgments
Special thanks to Sylvain Perron, PhD. from HEC Montréal for presenting this technique to his students. 

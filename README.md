# Bond Portfolio Optimization using linear programming

> The goal of this project is to solve an asset allocation problem for a portfolio composed of 3 bond ETFs. The script minimizes the risk, expressed by the mean absolute deviation of daily prices, given a minimum level of dividends and portfolio duration. ILOG CPLEX Optimization Studio was used to model and solve the problem. 

## Results 

<p align="center">
  <img src=/header1.png>
</p>

The optimal solution is to invest 31.14% in VAB, 18.63% in XHY, and 50.22% in CSD, given that a minimum yield of 4% and a minimum duration of 4.5 years are added as constraints.


## How it works

The program minimizes the following objective function :


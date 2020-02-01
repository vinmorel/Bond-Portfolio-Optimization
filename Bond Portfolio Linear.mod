/*********************************************
 * OPL 12.8.0.0 Model
 * Author: VincentMorel
 * Creation Date: Feb 9, 2019 at 1:49:58 PM
 *********************************************/

 // Liste des titres
 setof (string) Tickers = ...;
 
 // Array des Duration (characteristique importante d'une obligation)
 float Duration[Tickers] = ...;
 
 // Array des Yield (Dividendes payées par le ETF d'obligation)
 float Yield[Tickers] = ...;
 
 // Array des MER (Coût associés aux ETF (Management expense ratio))
 float MER[Tickers] = ...;
 
 // Range des journées étudiés. (de la dernière année et demie, environ)
 int Jours = ...;
 range J = 1..Jours;
 
 // Array des variations de prix quotidiens par titre et jour 
 float Prices[Tickers][J] = ...;
 
 // decision variables (proportion de chaque ETF dans le portfolio)
 dvar float+ X[Tickers];
 
 // variable dexpr (moyenne de la valeur du portfolio pour la période étudiée)
 dexpr float Mean1 = sum(j in J) (abs(Prices["VAB"][j])*X["VAB"])/(Jours);
 dexpr float Mean2 = sum(j in J) (abs(Prices["XHY"][j])*X["XHY"])/(Jours);
 dexpr float Mean3 = sum(j in J) (abs(Prices["CSD"][j])*X["CSD"])/(Jours);
  
  
 // fonction objectif MAD (minimizer la somme de la difference absolue entre la valeur du portfolio au jour j et la moyenne du portfolio de facon a reduir la volatilite de la valeur)
 minimize (sum (j in J) (abs((X["VAB"] * Prices["VAB"][j] - Mean1) + (X["XHY"] * Prices["XHY"][j] - Mean2)+ (X["CSD"] * Prices["CSD"][j] - Mean3))))/(Jours);
 
 subject to{ 
 // Contrainte par rapport a la durée du portfolio (charactéristique reliée au risque face aux changements dans les taux d'intérêts), ici 4.50 années maximum
 Portfolio_Duration : sum(t in Tickers) (X[t] * Duration[t]) <= 4.50;
 
 // Contrainte face au pourcentage de dividendes minimales du portfolio, ici 4% annuel minimum
 Portfolio_Yield : sum(t in Tickers) (X[t] * Yield[t]) - sum(t in Tickers) (X[t] * MER[t]) >= 4;
 
 // contrainte de somme des proportions (= 100%)
 Weight : sum(t in Tickers) X[t] == 1;
 
 
 };
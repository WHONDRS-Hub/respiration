# Respiration rates
  
R script created by Vanessa Garayburu-Caruso for WHONDRS (https://whondrs.pnnl.gov).
This code is associated to WHONDRS S19S Campaign and the following ESS-DIVE data package [insert link to ESS-DIVE data package when published].
  
### Code Purpose:
Respiration_11-12-20.R was used to calculate respiration rates from time series dissolved oxygen measurements. Rates are calculated as the slope of the linear regression between dissolved oxygen and incubation time.
The input file for the script is found in the Inputs folder.
  
### Code Actions:
The script completes the following steps:
1- Removes samples for which dissolved oxygen reached 5 mg/L O2 in less than 3 minutes
2- Calculates respiration rates as the slope of the linear regression between dissolved oxygen concentration and incubation time
3- Removes samples that had an Rsq< 0.25 from their regressions
4- Plots dissolved oxygen vs incubation time

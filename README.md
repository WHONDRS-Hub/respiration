# Respiration rates
  
R script created by Vanessa Garayburu-Caruso for WHONDRS (https://whondrs.pnnl.gov).  
This code is associated with the WHONDRS S19S Campaign and the following ESS-DIVE data package [insert link to ESS-DIVE data package when published].  
  
### Code Purpose:
Respiration_11-12-20.R was used to calculate respiration rates from time series dissolved oxygen measurements. Rates are calculated as the slope of the linear regression between dissolved oxygen and incubation time as per Garayburu-Caruso et al., 2020. 
The input file for the script is found in the Inputs folder.  
  
### Code Actions:
The script completes the following steps:   

1. Removes samples for which dissolved oxygen reached 5 mg/L O2 in less than 3 minutes
2. Calculates respiration rates as the slope of the linear regression between dissolved oxygen concentration and incubation time
3. Removes samples that had an Rsq< 0.25 from their regressions
4. Plots dissolved oxygen vs incubation time


Garayburu-Caruso, V. A., Stegen, J. C., Song, H.-S., Renteria, L., Wells, J., Garcia, W., Resch, C. T., Goldman, A. E., Chu, R. K., Toyoda, J., and Graham, E. B.: Carbon Limitation Leads to Thermodynamic Regulation of Aerobic Metabolism, Environ. Sci. Technol. Lett., 7, 517–524, https://doi.org/10.1021/acs.estlett.0c00258, 2020a.

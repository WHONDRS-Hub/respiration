#load needed libraries 
library(dplyr)

#set working directory
setwd("//pnl/Projects/ECA_Project/VGC/01_Data_analysis_Nov17/Inputs")
setwd("C:/Users/mcgr323/projects/EC")

#load data     
formula_data = read.csv("Processed_S19S_Sediments_Water_11-19_fixed.csv")

#get columns with just formula and sample names
mass_data = formula_data[,c(1,2)]
formula_data = formula_data[,c(2,39:length(formula_data))]

#collapse duplicate row names
mass_data <- mass_data %>%
  group_by(MolForm) %>%
  summarise(Mass= sum(Mass))
mass_data = as.data.frame(mass_data)

#formula as row names
rownames(mass_data) <- mass_data[,1]
mass_data = mass_data[2]

#collapse duplicate row names
formula_data <- formula_data %>%
  group_by(MolForm) %>%
  summarise(across(where(is.numeric), sum))

#convert tibble to dataframe 
formula_data = as.data.frame(formula_data)

#formula as row names
rownames(formula_data) <- formula_data[,1]
formula_data = formula_data[2:length(formula_data)]

#create separate sediment and water dataframe
sed.data = as.data.frame(formula_data[grep("Sed_Field",
                                   colnames(formula_data))])
water.data = formula_data %>% select(-!!names(sed.data))

#get sums for each formula for sediment 
sed.mat = data.matrix(sed.data)
sed.sum = as.data.frame(rowSums(sed.mat))
sed.sum$total_observations = sed.sum[,1]
sed.sum$percentage = (sed.sum[,1] / sum(sed.sum$total_observations)) *100
sed.sum = sed.sum[,2:3]
sed.sum = merge(sed.sum, mass_data, by=0, all=TRUE)
names(sed.sum)[names(sed.sum) == "Row.names"] <- "formula"
sed.sum = sed.sum[order(-sed.sum$total_observations),]

#get sums for each formula for water 
water.mat = data.matrix(water.data)
water.sum = as.data.frame(rowSums(water.mat))
water.sum$total_observations = water.sum[,1]
water.sum$percentage = (water.sum[,1] / sum(water.sum$total_observations)) *100
water.sum = water.sum[,2:3]
water.sum = merge(water.sum, mass_data, by=0, all=TRUE)
names(water.sum)[names(water.sum) == "Row.names"] <- "formula"
water.sum = water.sum[order(-water.sum$total_observations),]

#export data
write.csv(sed.sum,
          "C:/Users/mcgr323/projects/EC/S19S_Sediments_formula_counts_11_24.csv",
          row.names = FALSE)

write.csv(sed.sum,
          "C:/Users/mcgr323/projects/EC/S19S_Water_formula_counts_11_24.csv",
          row.names = FALSE)


#export data
write.csv(sed.sum,
  "//pnl/Projects/ECA_Project/VGC/01_Data_analysis_Nov17/Output/Formula_Observations/S19S_Sediments_formula_counts_11_24.csv",
  row.names = FALSE)  

write.csv(water.sum,
    "//pnl/Projects/ECA_Project/VGC/01_Data_analysis_Nov17/Output/Formula_Observations/S19S_Water_formula_counts_11_24.csv",
  row.names = FALSE) 

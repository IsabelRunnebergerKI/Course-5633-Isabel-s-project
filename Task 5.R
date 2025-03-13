### Task 5
#1
data("CO2")

#2
View(CO2)
?CO2
# The CO2 data frame has 84 rows and 5 columns of data from an experiment on the cold tolerance of the grass species Echinochloa crus-galli.

#3
CO2_dt <- as.data.table(CO2) # Turn the data frame into a data table as I am more comfortable with data tables.

mean_Mississippi <- mean(CO2_dt[Type=="Mississippi", uptake])
mean_Mississippi
median_Mississippi <- median(CO2_dt[Type=="Mississippi", uptake])
median_Mississippi

mean_Quebec <- mean(CO2_dt[Type=="Quebec", uptake])
mean_Quebec
median_Quebec <- median(CO2_dt[Type=="Quebec", uptake])
median_Quebec

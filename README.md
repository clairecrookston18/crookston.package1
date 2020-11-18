# Crookston Package1
## Author: Claire Crookston
## The Purpose of this package:
### This is an R package that manipulates and analyzes the data from a specific .csv file called ORIGDATAcorrect.csv. This .csv file is modified from the original created by Christopher K. Beachy and Dean C. Adams which is used in the published article "Historical Explanations of the Phenotypic Variation in the Plethodontid Salamander 'Gyrinophilus porphyriticus'". 

###This .csv file is read in using read_csv() and saved as the object 'measurements'. This data frame manifests as a tibble since tidyverse is a package used in all three functions of this package. This tibble must at least contain the columns: 'population', 'HdLngth', 'HdDpth', 'HdWdth', 'long.deg', 'long.mins', 'lat.deg', and 'lat.mins'. 
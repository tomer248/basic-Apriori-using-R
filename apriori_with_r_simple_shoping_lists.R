
library(tidyverse) # metapackage of all tidyverse packages
#This code will help us set rules to figure out whice prodect should we reccomend.
#it is using Apriori - Association Rule Learning to classify the rules.
# if someone bought product x it is likely he would be interested in product y.

list.files(path = "../input")

# %% [code]
# Apriori

# Data Preprocessing
library(arules)
dataset = read.csv('../input/grocery-products-purchase-data/Grocery Products Purchase.csv')
dataset = read.transactions('../input/grocery-products-purchase-data/Grocery Products Purchase.csv', sep = ',', rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset, topN = 10)

# Training Apriori on the dataset
# the confidence and support are low because i needed stronger rules
#higher values whould have given me obviuse rules.
rules = apriori(data = dataset, parameter = list(support = 0.004, confidence = 0.3,minlen=1,maxlen=2))

# Visualising the results
inspect(sort(rules, by = 'lift')[1:10])



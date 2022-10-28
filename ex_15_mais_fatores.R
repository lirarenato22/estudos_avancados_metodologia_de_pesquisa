# EXERCÍCIO - Mais Fatores!!

# Aluno: Renato Lira

# QUESTÃO: Compartilhe com a gente um código criado por você com um processo de
# one hot encoding ou de discretização, e também a transformação dos
# fatores de uma base de dados em 3 tipos: mais frequente, segundo mais frequente
# e outros.
# RESPOSTA:

# Abrindo os pacotes:

library(ade4)
library(arules)
library(forcats)

breast_cancer_csv <- read.table("breast_cancer.csv", 
                       sep=";", header = T)

str(breast_cancer_csv)

# conversão em fatores:

for(i in 1:5) {
  breast_cancer_csv[,i] <- as.factor(breast_cancer_csv[,i]) } 

str(breast_cancer_csv)

# filtro por tipo de dado:

factorsbreast_cancer_csv <- unlist(lapply(breast_cancer_csv, is.factor))

breast_cancer_csvFactor <- breast_cancer_csv[ , factorsbreast_cancer_csv]

str(breast_cancer_csvFactor)

# One Hot Encoding:

breast_cancer_csvDummy <- acm.disjonctif(breast_cancer_csvFactor)

# Primeiro mais frequente, segundo mais frequente e outros:

fct_lump(breast_cancer_csvFactor$idade, n = 2)

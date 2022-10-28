# EXERC�CIO - Leitura

# Aluno: Renato Lira

# QUEST�O: Indique uma vantagem e uma desvantagem de cada tipo de
# arquivo (nativo e plano com interoperabilidade) e acrescente 
# no c�digo uma forma adicional de exporta��o e de leitura, com a
# respectiva compara��o usando a fun��o microbenchmark.

# RESPOSTA:

# Abrindo os pacotes:

library(microbenchmark)

breast_cancer <- read.csv2('https://raw.githubusercontent.com/hugoavmedeiros/cp_com_r/master/bases_tratadas/breast_cancer.csv', stringsAsFactors = T)

# Carregando a base de dados

# exporta em formato nativo do R:

saveRDS(breast_cancer, "breast_cancer.rds")

# exporta em formato tabular (.csv) - padr�o para interoperabilidade:

write.csv2(breast_cancer, "breast_cancer.csv")

# A primeira diferen�a entre os dois � que os formatos nativos do R
# ocupam muito menos espa�o de armazenamento, o que torna o processo
# mais �gil.

# carrega base de dados em formato nativo R:

breast_cancer_rds <- readRDS('breast_cancer.rds')

# carrega base de dados em formato tabular (.csv) - padr�o para interoperabilidade:

breast_cancer_csv <- read.csv2('breast_cancer.csv', sep = ';')

# compara os dois processos de exporta��o, usando a fun��o microbenchmark

microbenchmark(a <- saveRDS(breast_cancer_rds, 
                            "breast_cancer.rds"), 
               b <- write.csv2(breast_cancer_csv, "breast_cancer.csv"), 
               times = 30L)

microbenchmark(a <- readRDS('breast_cancer.rds'), 
               b <- read.csv2('breast_cancer.csv', 
                              sep = ';'), times = 10L)

# Com esse teste, vemos que o formato nativo � mais eficiente, o que � important�ssimo
# tanto em execu��o como em armazenamento quando as bases disp�em de uma quantidade
# enorme de dados.

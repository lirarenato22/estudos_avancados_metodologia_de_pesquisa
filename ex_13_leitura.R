# EXERCÍCIO - Leitura

# Aluno: Renato Lira

# QUESTÃO: Indique uma vantagem e uma desvantagem de cada tipo de
# arquivo (nativo e plano com interoperabilidade) e acrescente 
# no código uma forma adicional de exportação e de leitura, com a
# respectiva comparação.

# RESPOSTA:

# Abrindo os pacotes:

library(microbenchmark)
library(rjson)
library(xlsx)

breast_cancer <- read.csv2('https://raw.githubusercontent.com/hugoavmedeiros/cp_com_r/master/bases_tratadas/breast_cancer.csv', stringsAsFactors = T)

# Carregando a base de dados

# exporta em formato nativo do R:

saveRDS(breast_cancer, "breast_cancer.rds")

# exporta em formato tabular (.csv) - padrão para interoperabilidade:

write.csv2(breast_cancer, "breast_cancer.csv")

# exporta em formato .xlsx:

write.xlsx(breast_cancer, "breast_cancer.xlsx", sheetName = "Sheet1", 
           col.names = TRUE, row.names = TRUE, append = FALSE)

# A primeira diferença entre os três é que os formatos nativos do R
# ocupam muito menos espaço de armazenamento, o que torna o processo
# mais ágil. O que ocupa mais espaço é o formato xlsx.


# carrega base de dados em formato nativo R:

breast_cancer_rds <- readRDS('breast_cancer.rds')


# carrega base de dados em formato tabular (.csv) - padrão para interoperabilidade:

breast_cancer_csv <- read.csv2('breast_cancer.csv', sep = ';')

# carrega base de dados em formato .xlsx:

read_excel('breast_cancer.xlsx', sheet=1) 


# compara os dois processos de exportação, usando a função microbenchmark

microbenchmark(a <- saveRDS(breast_cancer_rds, 
                            "breast_cancer.rds"), 
               b <- write.csv2(breast_cancer_csv, "breast_cancer.csv"),
               c <- write.xlsx(breast_cancer, "breast_cancer.xlsx", sheetName = "Sheet1", 
                               col.names = TRUE, row.names = TRUE, append = FALSE),
               times = 30L)


microbenchmark(a <- readRDS('breast_cancer.rds'), 
               b <- read.csv2('breast_cancer.csv', 
                              sep = ';'), c <- read_excel('breast_cancer.xlsx', sheet=1), times = 10L)

# Com esse teste, vemos que o formato nativo é mais eficiente, o que é importantíssimo
# tanto em execução como em armazenamento quando as bases  que dispõem  de quantidade
# enorme de dados.

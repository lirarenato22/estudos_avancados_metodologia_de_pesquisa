# EXERCÍCIO - Leitura

# Aluno: Renato Lira

# QUESTÃO: Indique uma vantagem e uma desvantagem de cada tipo de
# arquivo (nativo e plano com interoperabilidade) e acrescente 
# no código uma forma adicional de exportação e de leitura, com a
# respectiva comparação usando a função microbenchmark.

# RESPOSTA:

# Abrindo os pacotes:

library(microbenchmark)

breast_cancer <- read.csv2('https://raw.githubusercontent.com/hugoavmedeiros/cp_com_r/master/bases_tratadas/breast_cancer.csv', stringsAsFactors = T)

# Carregando a base de dados

# exporta em formato nativo do R:

saveRDS(breast_cancer, "breast_cancer.rds")

# exporta em formato tabular (.csv) - padrão para interoperabilidade:

write.csv2(breast_cancer, "breast_cancer.csv")

# A primeira diferença entre os dois é que os formatos nativos do R
# ocupam muito menos espaço de armazenamento, o que torna o processo
# mais ágil.

# carrega base de dados em formato nativo R:

breast_cancer_rds <- readRDS('breast_cancer.rds')

# carrega base de dados em formato tabular (.csv) - padrão para interoperabilidade:

breast_cancer_csv <- read.csv2('breast_cancer.csv', sep = ';')

# compara os dois processos de exportação, usando a função microbenchmark

microbenchmark(a <- saveRDS(breast_cancer_rds, 
                            "breast_cancer.rds"), 
               b <- write.csv2(breast_cancer_csv, "breast_cancer.csv"), 
               times = 30L)

microbenchmark(a <- readRDS('breast_cancer.rds'), 
               b <- read.csv2('breast_cancer.csv', 
                              sep = ';'), times = 10L)

# Com esse teste, vemos que o formato nativo é mais eficiente, o que é importantíssimo
# tanto em execução como em armazenamento quando as bases dispõem de uma quantidade
# enorme de dados.


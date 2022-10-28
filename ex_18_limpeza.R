# EXERCÍCIO - Limpeza 

# Aluno: Renato Lira

# QUESTÃO: Compartilhe com a gente uma ampliação do código desta aula, 
# em que você remove os NA (not available) presentes nos dados.

# RESPOSTA:

# Abrindo os pacotes:

library(data.table)
library(dplyr)
library(tidyverse)
library(funModeling) 

# Carregando a base de dados

general_data <- fread("https://covid.ourworldindata.org/data/owid-covid-data.csv") # carrega dados de covid19 no mundo

latin_america_countries <-c("Argentina", "Brazil", "Bolivia", "Chile", "Colombia", "Costa Rica", "Cuba", "Dominican Republic", "Ecuador", "El Salvador", "Guatemala", "Haiti", "Honduras", "Mexico", "Nicaragua", "Panama", "Paraguay", "Peru", "Uruguay", "Venezuela") # vetor que identifica países latino americanos

latin_america <- general_data %>% filter(location %in% latin_america_countries) # filtra casos apenas no vetor

latin_america <- latin_america %>% select(location, new_cases, new_deaths)

# Observa a estrutura dos dados:

status(latin_america) 

# Observa a frequência das variáveis fator:

freq(latin_america) 

# Observa a frequência das variáveis numéricas:

plot_num(latin_america)

# Apresenta as estatísticas das variáveis numéricas:

profiling_num(latin_america) # estatísticas das variáveis numéricas

# Modificações necessárias para retirar os NA:

latin_america %>% filter(new_cases < 0)

latin_america <- latin_america %>% filter(new_cases>=0)

# Retirando:

sem_na <- na.omit(latin_america)

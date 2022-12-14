# EXERC?CIO - Estrutura??o

# Aluno: Renato Lira

# QUEST?O: Compartilhe com a gente um c?digo em que voc? implementa
# um piv? long to wide ou wide to long.

# RESPOSTA:

# Abrindo os pacotes:

library(data.table)

library(dplyr)

library(tidyverse)

# Carregando a base de dados

general_data<-fread("https://covid.ourworldindata.org/data/owid-covid-data.csv")

North_America_countries<-c("Turks and Caicos Islands", "Greenland", "Grenada", "Guatemala")

North_America_countries<- general_data %>% filter(location %in% North_America_countries)

mnortinho <- North_America_countries %>% group_by(location) %>% mutate(row = row_number()) %>% select(location, new_cases, row)

# filtra dados para garantir que todos os pa?ses tenham mesmo nro de casos:

resultado <- mnortinho %>% group_by(location) %>% filter(row == max(row))

mnortinho <- mnortinho %>% filter(row<=min(resultado$row)) 

# pivota o data frame de long para wide:

mnortinho_ <- mnortinho %>% pivot_wider(names_from = row, values_from = new_cases) %>% remove_rownames %>% column_to_rownames(var="location") 

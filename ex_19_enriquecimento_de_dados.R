# EXERCÍCIO - Enriquecimento de Dados

# Aluno: Renato Lira

# QUESTÃO: Compartilhe com a gente uma aplicação de enriquecimento 
# usando join em outra dupla de bases.


# RESPOSTA:

# Abrindo os pacotes:

pacman::p_load(dplyr, tidyverse)

# carregando as bases:

sinistrosRecife2019Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2019.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2020Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv', sep = ';', encoding = 'UTF-8')

# enriquecendo usando join:

sinistrao_recife_2 <- left_join(sinistrosRecife2019Raw, sinistrosRecife2020Raw, by = c('bairro' = 'bairro'))

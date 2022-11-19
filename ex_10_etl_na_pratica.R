# EXERCÍCIO - ETL na Prática

# Aluno: Renato Lira

# QUESTÃO: Mostre que entendeu o processo de ETL modificando um pouco a 
# extração e o tratamento. Ou seja: adicione mais um ano de sinistros de 
# trânsito à extração e lembre-se de uni-lo aos demais com o rbind; depois, 
# busque mais uma coluna para transformar em fator e acrescente isso 
# ao código. Lembre-se de compartilhar um link do github!

# RESPOSTA:

# Carregando pacote: 

pacman::p_load(dplyr)

# Abrindo as bases:

sinistrosRecife2019Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2019.csv', sep = ';', encoding = 'UTF-8')

# Abrindo as base de sinistros do site PCR: 

sinistrosRecife2020Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2021Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2021-jan.csv', sep = ';', encoding = 'UTF-8')

# Adicionando um ano:

sinistrosRecife2018Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2485590a-3b35-4ad0-b955-8dfc36b61021/download/acidentes_2018.csv')


# Repetindo o comando do docente:

colunas_iguais <- names(sinistrosRecife2020Raw[
  intersect(
    names(sinistrosRecife2020Raw), names(sinistrosRecife2021Raw))])

sinistrosRecife2020Raw <- sinistrosRecife2020Raw %>% select(all_of(colunas_iguais))

sinistrosRecifeRaw <- rbind(sinistrosRecife2020Raw, sinistrosRecife2021Raw)


# Trazendo mais um ano (2019):

names(sinistrosRecife2019Raw)[names(sinistrosRecife2019Raw) == 'DATA'] <- 'data'

sinistrao_recife <- bind_rows(sinistrosRecife2019Raw, sinistrosRecife2020Raw)

sinistrao_recife$data <- as.Date(sinistrao_recife$data, format = "%Y-%m-%d")

sinistrao_recife$descricao <- as.factor(sinistrao_recife$descricao)

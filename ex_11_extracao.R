# EXERCÍCIO - Extração

# Aluno: Renato Lira

# QUESTÃO: Mostre que você entendeu o conceito de área intermediária 
# ambiente no R, modificando o código para manter sinistrosRecifeRaw 
# e a função naZero (ela pode ser útil no futuro!). Além disso, indique 
# qual dos objetos na área intermediária mais estavam usando memória do R. 
# Lembre-se de compartilhar um link do github!

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

# Listando os objetos:

ls()

# Para saber quanto cada objeto ocupa:

for (itm in ls()) { 
  print(formatC(c(itm, object.size(get(itm))), 
                format="d", 
                width=30), 
        quote=F)
}

# O objeto que mais tem ocupado é o "sinistrao_recife_2".

# Lista todos os objetos mais uma vez:

ls() 

# Para usar o garbage collector:

gc()

naZero <- function(x) {
  x <- ifelse(is.na(x), 0, x)
}

# Lista todos os objetos mais uma vez:

ls() 

# Deletando todos, menos os listados

rm(list = c('sinistrosRecife2018Raw', 'sinistrosRecife2019Raw', 'sinistrosRecife2020Raw', 'sinistrosRecife2021Raw', 'colunas_iguais', 'sinistrosRecifeRaw'))

saveRDS(sinistrao_recife, "bases_tratadas/sinistrosRecife.rds")

write.csv2(sinistrao_recife, "bases_tratadas/sinistrosRecife.csv")
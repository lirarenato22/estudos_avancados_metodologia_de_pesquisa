# EXERCÍCIO - Dplyr

# Aluno: Renato Lira

# QUESTÃO: Compartilhe com a gente um código criado 
# por você com a aplicação de pelo menos um sumário, um agrupamento, uma
# manipulação de casos e uma manipulação de colunas.

# RESPOSTA:

# Abrindo os pacotes:

library(dplyr)

# Carregando a base de dados

sinistrosRecife2018Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2018.csv', sep = ';', encoding = 'UTF-8')

# Observa o sumário:

count(sinistrosRecife2018Raw, natureza_acidente) 

# Observa o sumário com agrupamento:

sinistrosRecife2018Raw %>% group_by(natureza_acidente) %>% summarise(avg = mean(vitimas))

# Manipulação de casos:

sinistrosRecife2018Raw %>%  filter(natureza_acidente != "COM VÍTIMA") %>% summarise(avg = mean(vitimasfatais))

sinistrosRecife2018Raw %>%  filter(natureza_acidente != "SEM VÍTIMA") %>% group_by(natureza_acidente, bairro) %>% summarise(avg = mean(vitimasfatais))

arrange(sinistrosRecife2018Raw, natureza_acidente) 

arrange(sinistrosRecife2018Raw, desc(natureza_acidente))


# Manipulação de variáveis:

# seleção de colunas

sinistrosRecife2018Raw %>% select(situacao, bairro, endereco) %>% arrange(situacao)

# novas colunas

sinistrosRecife2018Raw %>% mutate(situacao_2 = situacao)

# renomear

sinistrosRecife2018Raw %>% rename(situacaozinha = situacao)



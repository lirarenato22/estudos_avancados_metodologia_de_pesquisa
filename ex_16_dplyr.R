# EXERC?CIO - Dplyr

# Aluno: Renato Lira

# QUEST?O: Compartilhe com a gente um c?digo criado 
# por voc? com a aplica??o de pelo menos um sum?rio, um agrupamento, uma
# manipula??o de casos e uma manipula??o de colunas.

# RESPOSTA:

# Abrindo os pacotes:

library(dplyr)

# Carregando a base de dados

sinistrosRecife2018Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2018.csv', sep = ';', encoding = 'UTF-8')

# Observa o sum?rio:

count(sinistrosRecife2018Raw, natureza_acidente) 

# Observa o sum?rio com agrupamento:

sinistrosRecife2018Raw %>% group_by(natureza_acidente) %>% summarise(avg = mean(vitimas))

# Manipula??o de casos:

sinistrosRecife2018Raw %>%  filter(natureza_acidente != "COM V?TIMA") %>% summarise(avg = mean(vitimasfatais))

sinistrosRecife2018Raw %>%  filter(natureza_acidente != "SEM V?TIMA") %>% group_by(natureza_acidente, bairro) %>% summarise(avg = mean(vitimasfatais))

arrange(sinistrosRecife2018Raw, natureza_acidente) 

arrange(sinistrosRecife2018Raw, desc(natureza_acidente))


# Manipula??o de vari?veis:

# sele??o de colunas

sinistrosRecife2018Raw %>% select(situacao, bairro, endereco) %>% arrange(situacao)

# novas colunas

sinistrosRecife2018Raw %>% mutate(situacao_2 = situacao)

# renomear

sinistrosRecife2018Raw %>% rename(situacaozinha = situacao)



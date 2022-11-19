# EXERCÍCIO - Enriquecimento de Dados

# Aluno: Renato Lira

# QUESTÃO: Compartilhe com a gente uma aplicacão de enriquecimento 
# usando join em outra dupla de bases.


# RESPOSTA:

# Abrindo os pacotes:

pacman::p_load(dplyr, tidyverse)

# carregando as bases:

sinistrosRecife2019Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2019.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2020Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv', sep = ';', encoding = 'UTF-8')

# enriquecendo usando join:

sinistrao_recife_2 <- left_join(sinistrosRecife2020Raw, sinistrosRecife2019Raw, by = c('data' = 'DATA'))


#############################

# Exemplo Extra:

link <- "https://raw.githubusercontent.com/lirarenato22/Analise_de_dados_Trabalho_Final/main/consulta_cand_2018_BRASIL.csv"

link_2 <- "https://www.dropbox.com/s/u2ujij8bd3saur3/despesas_contratadas_candidatos_2018_BRASIL.csv?raw=1"

download.file(link, "consulta_cand_2018_BRASIL.csv", mode = "wb")

# Após isso, será necessário fazer o download do banco de dados 
# "consulta_cand_2018_BRASIL", do qual utilizaremos variáveis de 
# características dos candidatos.

BANCO_CONSULTA_CANDIDATOS <- read.csv2("consulta_cand_2018_BRASIL.csv")

# A partir do banco inicial "consulta_cand_2018_BRASIL.csv", selecionamos
# as variáveis CD_CARGO, NR_TURNO, SG_UF, SQ_CANDIDATO, CD_DETALHE_SITUACAO_CAND, 
# DS_COR_RACA, ST_REELEICAO, DS_GENERO, TP_AGREMIACAO, SG_PARTIDO,
# NM_PARTIDO, NM_CANDIDATO e NR_IDADE_DATA_POSSE:

BANCO_CONSULTA_CANDIDATOS_FILTRADO <- BANCO_CONSULTA_CANDIDATOS %>%
  select(CD_CARGO, NR_TURNO, SG_UF, SQ_CANDIDATO, CD_DETALHE_SITUACAO_CAND, 
         DS_COR_RACA, ST_REELEICAO, DS_GENERO, TP_AGREMIACAO, SG_PARTIDO,
         NM_PARTIDO, NM_CANDIDATO, NR_IDADE_DATA_POSSE, DS_SIT_TOT_TURNO) %>%
  filter(NR_TURNO == 1, CD_CARGO %in% c('6', '7'), 
         CD_DETALHE_SITUACAO_CAND %in% c('2', '16'))

# O segundo banco a ser baixado é o 
# "despesas_contratadas_candidatos_2018_BRASIL", do qual utilizaremos as
# variáveis "SQ_CANDIDATO", "SQ_PRESTADOR_CONTAS", "SG_UF", VR_DESPESA_CONTRATADA,
# e "DS_DESPESA" para podermos 'unificar' os bancos.

download.file(link_2, "despesas_contratadas_candidatos_2018_BRASIL.csv", mode = "wb")

BANCO_DESPESAS_CONTRATADAS <- 
  read.csv2("despesas_contratadas_candidatos_2018_BRASIL.csv")

# Como há várias observações por número sequencial, será necessário unificar
# as observações para cada número sequencial.

BANCO_DESPESAS_CONTRATADAS_POR_SEQUENCIAL <- BANCO_DESPESAS_CONTRATADAS %>%
  select(SG_UF, DS_DESPESA, SQ_PRESTADOR_CONTAS, SQ_CANDIDATO, VR_DESPESA_CONTRATADA) %>%
  group_by(SQ_PRESTADOR_CONTAS, SG_UF, SQ_CANDIDATO) %>%
  summarise(sum(VR_DESPESA_CONTRATADA))

# A partir disso, tentaremos conseguir as mesmas informações sobre
# impulsionamento de conteúdo a partir desse novo banco.

BANCO_DESPESAS_CONTRATADAS_IMPULSIONAMENTO <- BANCO_DESPESAS_CONTRATADAS %>%
  select(SG_UF, DS_ORIGEM_DESPESA, SQ_PRESTADOR_CONTAS, SQ_CANDIDATO, 
         VR_DESPESA_CONTRATADA) %>%
  filter(DS_ORIGEM_DESPESA %in% c('Despesa com Impulsionamento de Conteúdos'))

# Como o banco oferece várias informações sobre impulsionamento para
# cada número sequencial, precisaremos agrupar os valores por número 
# sequencial.

BANCO_DESPESAS_CONTRATADAS_IMPULSIONAMENTO_SOMADO <- BANCO_DESPESAS_CONTRATADAS_IMPULSIONAMENTO %>%
  group_by(SQ_PRESTADOR_CONTAS, SG_UF, DS_ORIGEM_DESPESA, SQ_CANDIDATO) %>%
  summarise(sum(VR_DESPESA_CONTRATADA))

# Depois disso, unificaremos os bancos 
# "BANCO_DESPESAS_CONTRATADAS_POR_SEQUENCIAL" e
# "BANCO_DESPESAS_CONTRATADAS_IMPULSIONAMENTO_SOMADO" com a função "merge".

BANCO_UNIFICADO <- merge(BANCO_DESPESAS_CONTRATADAS_POR_SEQUENCIAL,
                         BANCO_DESPESAS_CONTRATADAS_IMPULSIONAMENTO_SOMADO,
                         by="SQ_CANDIDATO")

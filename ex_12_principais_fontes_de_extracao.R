# EXERC?CIO - Principais Fontes de Extra??o

# Aluno: Renato Lira

# QUEST?O:  Compartilhe com a gente um c?digo criado por voc? 
# extraindo dados de pelos menos 3 dessas 5 fontes.

# RESPOSTA:

# Inicialmente, carregamos os pacotes necess?rios:

pacman::p_load(data.table, Hmisc, VIM)

# CSV: 

breast_cancer <- read.csv2('https://raw.githubusercontent.com/hugoavmedeiros/cp_com_r/master/bases_tratadas/breast_cancer.csv', stringsAsFactors = T)

# JSON

library(rjson)

pessoas_vacinadas <- fromJSON(file= "http://dados.recife.pe.gov.br/dataset/7ccb3816-0d62-49e1-b39a-3159870883b0/resource/224d1cba-d5fa-415b-979e-a15f21ee88b2/download/metadados_perfilvacinados.jso" )


# XML

library(XML)

data_astronomical <- xmlToDataFrame("http://aiweb.cs.washington.edu/research/projects/xmltk/xmldata/data/nasa/nasa.xml")



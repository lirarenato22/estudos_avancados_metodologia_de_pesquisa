# EXERC?CIO - Descoberta

# Aluno: Renato Lira

# QUEST?O: Compartilhe com a gente um c?digo em que voc? executa um processo 
# de descoberta em uma base diferente daquela do exerc?cio.

# RESPOSTA:

# Continuaremos utilizando a base de dados indicada na atividade anterior

# Inicialmente, carregaremos os pacotes necess?rios:

library(tidyverse)
library(funModeling)

pacman::p_load(funModeling, tidyverse)

# Para observar as informa??es:

glimpse(USArrests)

# Para ver a estrutura:

status(USArrests)

# Para identificar as frequ?ncias das vari?veis fator (se houver):

freq(USArrests)

# Para explorar as vari?veis num?ricas:

plot_num(USArrests)

# Para apresentar as estat?sticas das vari?veis num?ricas:

profiling_num(USArrests)


# EXERCÍCIO - Descoberta

# Aluno: Renato Lira

# QUESTÃO: Compartilhe com a gente um código em que você executa um processo 
# de descoberta em uma base diferente daquela do exercício.

# RESPOSTA:

# Continuaremos utilizando a base de dados indicada na atividade anterior

# Inicialmente, carregaremos os pacotes necessários:

library(tidyverse)
library(funModeling)

pacman::p_load(funModeling, tidyverse)

# Para observar as informações:

glimpse(USArrests)

# Para ver a estrutura:

status(USArrests)

# Para identificar as frequências das variáveis fator (se houver):

freq(USArrests)

# Para explorar as variáveis numéricas:

plot_num(USArrests)

# Para apresentar as estatísticas das variáveis numéricas:

profiling_num(USArrests)


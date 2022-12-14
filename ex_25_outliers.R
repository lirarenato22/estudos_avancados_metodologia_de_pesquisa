# EXERC?CIO - Outliers

# Aluno: Renato Lira

# QUEST?O: Compartilhe com a gente um c?digo criado por voc? usando 
# uma das t?cnicas de identifica??o de outliers, mas no lugar 
# da vari?vel casos, busque em uma das outras duas vari?veis 
# ajustadas (casos2 ou casosLog)

# RESPOSTA:

# Inicialmente, carregamos os pacotes necess?rios:

pacman::p_load(data.table, dplyr, plotly, tidyverse)

# Depois, carregamos os dados sobre covid19 em PE:

covid19PE <- fread('https://dados.seplag.pe.gov.br/apps/basegeral.csv')

covid19PEMun <- covid19PE %>% count(municipio, sort = T, name = 'casos') %>% mutate(casos2 = sqrt(casos), casosLog = log10(casos))

# Para termos os utliers em vari?veis
# observando dist?ncia interquartil para a vari?vel casosLog:


plot_ly(y = covid19PEMun$casosLog, type = "box", text = covid19PEMun$municipio, boxpoints = "all", jitter = 0.3)
boxplot.stats(covid19PEMun$casosLog)$out
boxplot.stats(covid19PEMun$casosLog, coef = 2)$out

covid19PEOut <- boxplot.stats(covid19PEMun$casosLog)$out
covid19PEOutIndex <- which(covid19PEMun$casosLog %in% c(covid19PEOut))
covid19PEOutIndex

# Al?m disso, aplicamos o filtro de Hamper:

lower_bound <- median(covid19PEMun$casosLog) - 3 * mad(covid19PEMun$casosLog, constant = 1)
upper_bound <- median(covid19PEMun$casosLog) + 3 * mad(covid19PEMun$casosLog, constant = 1)
(outlier_ind <- which(covid19PEMun$casosLog < lower_bound | covid19PEMun$casosLog > upper_bound))

# E, por fim, o teste de Rosner tamb?m ? realizado:

library(EnvStats)

covid19PERosner <- rosnerTest(covid19PEMun$casosLog, k = 10)

covid19PERosner

covid19PERosner$all.stats

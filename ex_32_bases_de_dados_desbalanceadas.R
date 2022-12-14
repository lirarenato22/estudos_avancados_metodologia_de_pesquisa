# EXERC?CIO - Bases de Dados Desbalanceadas

# Aluno: Renato Lira

# QUEST?O: Para concluir esta atividade, aplique redu??o ou ampli??o 
# em um modelo desenvolvido sobre uma base diferente da mostrada 
# no v?deo explicativo.


# RESPOSTA:

# Abrindo os pacotes:

pacman::p_load(C50, ade4, arules, car, caret, corrplot, data.table, dplyr, DMwR, e1071, forcats, funModeling, ggplot2, mlbench, mltools, randomForest, rattle, tidyverse)

# leitura da base de dados

ENEM_ESCOLA_2018 <- read.csv2('https://raw.githubusercontent.com/hugoavmedeiros/cp_com_r/master/bases_tratadas/ENEM_ESCOLA_2018.csv', stringsAsFactors = T)

# Dummies

ENEM_ESCOLA_2018_D <- acm.disjonctif(as.data.frame(ENEM_ESCOLA_2018$tipo))

names(ENEM_ESCOLA_2018_D) <- c('EREM', 'ETE', 'Federal', 'Privada', 'Regular')

ENEM_ESCOLA_2018 <- cbind(ENEM_ESCOLA_2018, ENEM_ESCOLA_2018_D)

# Discretiza??o

ENEM_ESCOLA_2018$notaDisc <- discretize(ENEM_ESCOLA_2018$nota, method = "interval", breaks = 2, labels = c("baixa", "alta"))

table(ENEM_ESCOLA_2018$notaDisc)

# Treino e Teste: Pr?-processamento

particaoENEM = createDataPartition(ENEM_ESCOLA_2018$nota, p=.7, list = F) # cria a parti??o 70-30

treinoENEM = ENEM_ESCOLA_2018[particaoENEM, ] # treino

testeENEM = ENEM_ESCOLA_2018[-particaoENEM, ] # - treino = teste

table(treinoENEM$notaDisc)

# down / under
treinoENEMDs <- downSample(x = treinoENEM[, -ncol(treinoENEM)], y = treinoENEM$notaDisc)
table(treinoENEMDs$Class)   

# up
treinoENEMUs <- upSample(x = treinoENEM[, -ncol(treinoENEM)], y = treinoENEM$notaDisc)
table(treinoENEMUs$Class)  
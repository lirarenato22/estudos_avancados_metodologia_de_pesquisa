# EXERCÍCIO - Implementação com Caret

# Aluno: Renato Lira

# QUESTÃO:  Para concluir a atividade, aplique aprendizagem 
# de máquina, comparando modelos, usando uma base diferente da do exemplo.

# RESPOSTA:

# carrega as bibliotecas
pacman::p_load(ade4, arules, car, caret, corrplot, data.table, dplyr, e1071, forcats, funModeling, ggplot2, mlbench, mltools, randomForest, rattle, tidyverse, party)

# leitura da base de dados

ENEM_ESCOLA_2018 <- read.csv2('https://raw.githubusercontent.com/hugoavmedeiros/cp_com_r/master/bases_tratadas/ENEM_ESCOLA_2018.csv', stringsAsFactors = T)

# Dummies
ENEM_ESCOLA_2018_DUMMIES <- acm.disjonctif(as.data.frame(ENEM_ESCOLA_2018$tipo))

names(ENEM_ESCOLA_2018_DUMMIES) <- c('EREM', 'ETE', 'Federal', 'Privada', 'Regular')

ENEM_ESCOLA_2018 <- cbind(ENEM_ESCOLA_2018, ENEM_ESCOLA_2018_DUMMIES)

# Discretização
ENEM_ESCOLA_2018$nota <- discretize(ENEM_ESCOLA_2018$nota, method = "frequency", breaks = 2, labels = c("baixa", "alta"))

# Treino e Teste: Pré-processamento

particaoENEM_1 = createDataPartition(ENEM_ESCOLA_2018$nota, p=.7, list = F) # cria a partição 70-30

treinoENEM_1 = ENEM_ESCOLA_2018[particaoENEM_1, ] # treino

testeENEM_1 = ENEM_ESCOLA_2018[-particaoENEM_1, ] # - treino = teste

# Validação Cruzada: Pré-processamento
# Controle de treinamento

train.control_1 <- trainControl(method = "cv", number = 20, verboseIter = T) # controle de treino

# Treinamentos

## Máquina de Vetor se Suporte (SVM)

ENEM_2018_SVM_CLASS <- train(nota ~ EREM + ETE + Federal + Privada + Regular + TDI_03 + MHA_03, data = treinoENEM_1, method = "svmLinear", trControl = train.control_1)

ENEM_2018_SVM_CLASS # sumário da máquina de vetor de suporte

plot(varImp(ENEM_2018_SVM_CLASS))

# criar a máquina de vetor de suporte
svmENEM2018CLass = svm(nota ~ EREM + ETE + Federal + Privada + Regular + TDI_03 + MHA_03, data = treinoENEM_1, cost = 10, scale = F)

svmENEM2018CLass

plot(svmENEM2018CLass, treinoENEM_1, TDI_03 ~ MHA_03)

## Árvore de Decisão
ENEM_2018_RPART_CLASS <- train(nota ~ EREM + ETE + Federal + Privada + Regular + TDI_03 + MHA_03, data = treinoENEM_1, method = "rpart", trControl = train.control_1)

summary(ENEM_2018_RPART_CLASS)

fancyRpartPlot(ENEM_2018_RPART_CLASS$finalModel) # desenho da árvore

plot(varImp(ENEM_2018_RPART_CLASS)) # importância das variáveis

# Bagging com Floresta Aleatória
ENEM_2018_RF_CLASS <- train(nota ~ EREM + ETE + Federal + Privada + Regular + TDI_03 + MHA_03, data = treinoENEM_1, method = "cforest", trControl = train.control_1)

plot(ENEM_2018_RF_CLASS) # evolução do modelo

plot(varImp(ENEM_2018_RF_CLASS)) # plot de importância

# Boosting com Boosted Generalized Linear Model
ENEM_2018_ADA_CLASS <- train(nota ~ EREM + ETE + Federal + Privada + Regular + TDI_03 + MHA_03, data = treinoENEM_1, method = "glmboost", trControl = train.control_1)

plot(ENEM_2018_ADA_CLASS) # evolução do modelo

print(ENEM_2018_ADA_CLASS) # modelo

summary(ENEM_2018_ADA_CLASS) # sumário

melhor_modelo_1 <- resamples(list(SVM = ENEM_2018_SVM_CLASS, RPART = ENEM_2018_RPART_CLASS, RF = ENEM_2018_RF_CLASS, ADABOOST = ENEM_2018_ADA_CLASS))

melhor_modelo_1

summary(melhor_modelo_1)

predVals_ENEM_2018 <- extractPrediction(list(SVM = ENEM_2018_SVM_CLASS, RPART = ENEM_2018_RPART_CLASS, RF = ENEM_2018_RF_CLASS, ADABOOST = ENEM_2018_ADA_CLASS), testX = testeENEM_1[, c(8, 12:17)], testY = testeENEM_1$nota) 

plotObsVsPred(predVals_ENEM_2018)
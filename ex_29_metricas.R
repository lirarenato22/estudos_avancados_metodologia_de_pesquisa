# EXERCÍCIO - Métricas de Performance de Modelos

# Aluno: Renato Lira

# QUESTÃO:  Para concluir esta atividade,
# aplique métricas de performance de regressão ou 
# classificação em um modelo desenvolvido sobre uma base
# diferente da mostrada no vídeo explicativo.
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

# Matriz de Confusão: matriz que relaciona as classes observadas (também chamadas de referência) e as classes preditas. Para melhor interpretação, oferece várias estatísticas auxiliares. Vamos ver as principais delas
# Accuracy (Acc) = Acuidade, ou performance geral do modelo - total de acertos, sem considerar nenhuma penalidade ou ajuste
# No Information Rate (NIR) = proporção da classe mais frequente - indica o quão a classe mais frequente está presente nos dados. É um valor de referência para compararmos com a acuidade, uma vez que o modelo poderia ganhar performance artificialmente aprendendo a sempre "chutar" na classe mais frequente. É oferecido também um teste de hipótese para verificar a hipótese de que a Acc é maior que o NIR. 
# Kappa = coeficiente kappa de Cohen - em geral, mede a concordância de duas classificações. No caso de ML, tem a ver com a estimativa de acuidade controlada pela possibilidade de classificação aleatória. Assim, permite saber se o modelo é bom, mesmo considerando a chance de "sortear" o resultado. 

predicaoENEM_2018_RF_CLASS = predict(ENEM_2018_RF_CLASS, testeENEM_1) # criar predição

cmENEM_2018_RF_CLASS <- confusionMatrix(predicaoENEM_2018_RF_CLASS, testeENEM_1$nota)

cmENEM_2018_RF_CLASS

cmENEM_2018_RF_CLASS$table

# Expected Accuracy (AccE) = Acuidade Esperada = estimativa de acuidade "esperada", ou seja, uma acuidade mínima que poderia ser conseguida simplesmente "chutando" a classe de forma aleatória. 

gtBaixa_1 <- 67+19

gtAlta_1 <- 22+65

pdBaixa_1 <- 67+22

pdAlta_1 <- 19+65

gtTotal_1 <- gtAlta_1 + gtBaixa_1

estAcc_2018 <- (gtBaixa_1*pdBaixa_1/gtTotal_1^2)+(gtAlta_1*pdAlta_1/gtTotal_1^2)

estAcc_2018
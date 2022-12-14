# EXERC?CIO - Imputa??o

# Aluno: Renato Lira

# QUEST?O: Compartilhe com a gente um c?digo criado por voc? usando uma 
# t?cnica de imputa??o num?rica e uma t?cnica de hot deck para substituir NA.

# RESPOSTA:

# Inicialmente, carregamos os pacotes necess?rios:

pacman::p_load(data.table, Hmisc, VIM)

# Base de dados USArrests

view(USArrests)

## Para fazer a imputa??o num?rica
#  com a prepara??o da base, colocando NA aleat?rios:

USArrestsDT <- USArrests %>% setDT() #copiar base iris, usando a data.table

# Para criar 10 valores aleat?rios:

(USArrestsNASeed <- round(runif(10, 1, 50))) 

# Para imputar NA nos valores aleat?rios: 

(USArrestsDT$Rape[USArrestsNASeed] <- NA)

# Para a tend?ncia central:

# M?dia
USArrestsDT$Rape <- impute(USArrestsDT$Rape, fun = mean) 

# Mediana
USArrestsDT$Rape <- impute(USArrestsDT$Rape, fun = median) 

is.imputed(USArrestsDT$Rape)

table(is.imputed(USArrestsDT$Rape)) 

# Para predi??o:
# Recolocamos os NA

USArrestsDT$Rape[USArrestsNASeed] <- NA 

# Criamos a regress?o:

regUSArrests <- lm(Rape ~ ., data = USArrestsDT) 

# Encontramos os NA:

USArrestsNAIndex <- is.na(USArrestsDT$Rape)

# Imputamos os valores preditos:

USArrestsDT$Rape[USArrestsNAIndex] <- predict(
  regUSArrests, newdata = USArrestsDT[USArrestsNAIndex, ]) 

# Para o Hot deck
# fazemos a imputa??o aleat?ria
# E recolocamos os NA:

USArrestsDT$Rape[USArrestsNASeed] <- NA 

# Imputa??o aleat?ria:

(USArrestsDT$Rape <- impute(USArrestsDT$Rape, "random"))

# Por fim, a imputa??o por inst?ncias e semelhan?a

# Novamente os NA:

USArrestsDT$Rape[USArrestsNASeed] <- NA

USArrestsDT2 <- kNN(USArrestsDT)


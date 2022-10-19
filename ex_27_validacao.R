# EXERCÍCIO - Imputação

# Aluno: Renato Lira

# QUESTÃO: Compartilhe com a gente um código criado por você usando uma 
# técnica de imputação numérica e uma técnica de hot deck para substituir NA.

# RESPOSTA:

# Inicialmente, carregamos os pacotes necessários:

pacman::p_load(data.table, Hmisc, VIM)

# Base de dados USArrests

view(USArrests)

## Para fazer a imputação numérica
#  com a preparação da base, colocando NA aleatórios:

USArrestsDT <- USArrests %>% setDT() #copiar base iris, usando a data.table

# Para criar 10 valores aleatórios:

(USArrestsNASeed <- round(runif(10, 1, 50))) 

# Para imputar NA nos valores aleatórios: 

(USArrestsDT$Rape[USArrestsNASeed] <- NA)

# Para a tendência central:

# Média
USArrestsDT$Rape <- impute(USArrestsDT$Rape, fun = mean) 

# Mediana
USArrestsDT$Rape <- impute(USArrestsDT$Rape, fun = median) 

is.imputed(USArrestsDT$Rape)

table(is.imputed(USArrestsDT$Rape)) 

# Para predição:
# Recolocamos os NA

USArrestsDT$Rape[USArrestsNASeed] <- NA 

# Criamos a regressão:

regUSArrests <- lm(Rape ~ ., data = USArrestsDT) 

# Encontramos os NA:

USArrestsNAIndex <- is.na(USArrestsDT$Rape)

# Imputamos os valores preditos:

USArrestsDT$Rape[USArrestsNAIndex] <- predict(
  regUSArrests, newdata = USArrestsDT[USArrestsNAIndex, ]) 

# Para o Hot deck
# fazemos a imputação aleatória
# E recolocamos os NA:

USArrestsDT$Rape[USArrestsNASeed] <- NA 

# Imputação aleatória:

(USArrestsDT$Rape <- impute(USArrestsDT$Rape, "random"))

# Por fim, a imputação por instâncias e semelhança

# Novamente os NA:

USArrestsDT$Rape[USArrestsNASeed] <- NA

USArrestsDT2 <- kNN(USArrestsDT)


# EXERC?CIO - Estat?stica Descritiva B?sica no R

# Aluno: Renato Lira

# QUEST?O: Compartilhe com a gente um c?digo criado por voc? em que usa 
# estat?sticas com outra base de dados. Dica: use a base USArrests.

# RESPOSTA:
  
# Inicialmente, apresentamos a tabela de frequ?ncia absoluta da vari?vel Rape
# na base USArrests:

table(USArrests$Rape)

# Ap?s isso, observaremos a tabela de frequ?ncia absoluta da vari?vel Rape
# da base USArrests:

prop.table(table(USArrests$Rape))

# Dando continuidade, podemos observar a m?dia da referida vari?vel:

mean(USArrests$Rape)

# E tamb?m a mediana:

median(USArrests$Rape)

# Denotamos tamb?m algumas separatrizes:

quantile(USArrests$Rape, probs=0.60)
quantile(USArrests$Rape, probs=0.15)
quantile(USArrests$Rape, probs=0.50)

# E representamos os dados em um gr?fico:

boxplot(USArrests$Rape)

# A seguir, identificamos o desvio padr?o:

sd(USArrests$Rape)

# E plotamos os dados:

plot(USArrests$Rape)

# Para finalizar, sumarizamos as vari?veis:

summary(USArrests)



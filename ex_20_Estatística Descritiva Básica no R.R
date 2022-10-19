# EXERCÍCIO - Estatística Descritiva Básica no R

# Aluno: Renato Lira

# QUESTÃO: Compartilhe com a gente um código criado por você em que usa 
# estatísticas com outra base de dados. Dica: use a base USArrests.

# RESPOSTA:
  
# Inicialmente, apresentamos a tabela de frequência absoluta da variável Rape
# na base USArrests:

table(USArrests$Rape)

# Após isso, observaremos a tabela de frequência absoluta da variável Rape
# da base USArrests:

prop.table(table(USArrests$Rape))

# Dando continuidade, podemos observar a média da referida variável:

mean(USArrests$Rape)

# E também a mediana:

median(USArrests$Rape)

# Denotamos também algumas separatrizes:

quantile(USArrests$Rape, probs=0.60)
quantile(USArrests$Rape, probs=0.15)
quantile(USArrests$Rape, probs=0.50)

# E representamos os dados em um gráfico:

boxplot(USArrests$Rape)

# A seguir, identificamos o desvio padrão:

sd(USArrests$Rape)

# E plotamos os dados:

plot(USArrests$Rape)

# Para finalizar, sumarizamos as variáveis:

summary(USArrests)



# ESTUDOS AVANÇADOS DE METODOLOGIA DE PESQUISA

# DISCENTE: RENATO LIRA

# EXERCÍCIO 33: AGRUPAMENTO

# Questão: Aplique agrupamento em outra base de dados, como a UsArrest.

# Carregando os pacotes:

pacman::p_load(cluster, dplyr, factoextra, ggplot2)


# Pré-processando:

View(USArrests)

# Semente aleatória: 

set.seed(1)

# Decidiu-se agrupar com kmeans.

# Agrupando utilizando kmeans:

XXX <- kmeans(x = USArrests, centers = 3) 

USArrests$cluster <- as.factor(XXX$cluster)

head(USArrests)

# Plotando com o pacote:

clusplot(USArrests, XXX$cluster, xlab = 'Um', 
         ylab = 'Dois', main = 'Agrupando Clusters', 
         lines = 0, shade = F, color = TRUE, labels = 2)

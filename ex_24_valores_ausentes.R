# EXERC?CIO - Valores Ausentes

# Aluno: Renato Lira

# QUEST?O: Compartilhe com a gente um c?digo criado por voc? 
# com uma shadow matrix e um teste de aleatoriedade de valores ausentes.

# RESPOSTA:

# Inicialmente, carregamos os pacotes necess?rios:

pacman::p_load(data.table, ggplot2)

# Depois, criamos um dataframe:


frutas <- c("laranja", "uva", "ma??", "banana", "abacaxi", "cereja")
qualidade <- c("boa", "ruim", NA, "ruim", "boa", NA)
quantidade <- c("muito", "pouco", "pouco", "muito", "pouco", "muito")

classifica??o <- data.frame(frutas, qualidade, quantidade)


# Visualizar os dados:

view(classifica??o)

status(classifica??o)

# Somente casos completos:

dim(PuroFrutas <- na.omit(classifica??o)) 

# Criando a matriz sombra:

W <- as.data.frame(abs(is.na(classifica??o)))

# Observando a matriz sombra:

head(W) 

# Apenas vari?veis/colunas com NA:

R <- W[which(sapply(W, sd) > 0)]

# Por ?ltimo, uma correla??o:

cor(R)
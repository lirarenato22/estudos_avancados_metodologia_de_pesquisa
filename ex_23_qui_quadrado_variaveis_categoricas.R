# EXERC?CIO - Qui-quadrado: Vari?veis Categ?ricas

# Aluno: Renato Lira

# QUEST?O: Compartilhe com a gente uma aplica??o de associa??o 
# usando alguma outra combina??o da base c?ncer de mama 
# que n?o seja a demonstrada no v?deo.

# RESPOSTA:

# Inicialmente, carregamos os pacotes necess?rios:

pacman::p_load(data.table, ggplot2)

# Depois, carregamos a base:

breast_cancer <- fread('https://raw.githubusercontent.com/hugoavmedeiros/cp_com_r/master/bases_tratadas/breast_cancer.csv', stringsAsFactors = T)

# Visualizar os dados:

view(breast_cancer)

# Apresentar tabela de conting?ncia:

tabela_lado_idade_cancer <- table(breast_cancer$breast, breast_cancer$idade)
tabela_lado_idade_cancer

# Plotar os gr?ficos de dispers?o pareados:

ggplot(breast_cancer) + aes(x = idade, fill = breast) + geom_bar(position = "fill")

# Realizar o teste de qui-quadrado:

teste_idade_cancer <- chisq.test(tabela_lado_idade_cancer)
teste_idade_cancer
teste_idade_cancer$observed
teste_idade_cancer$expected

# Plotar a correla??o:

corrplot(teste_idade_cancer$residuals, is.cor = FALSE)

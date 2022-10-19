# EXERCÍCIO - Qui-quadrado: Variáveis Categóricas

# Aluno: Renato Lira

# QUESTÃO: Compartilhe com a gente uma aplicação de associação 
# usando alguma outra combinação da base câncer de mama 
# que não seja a demonstrada no vídeo.

# RESPOSTA:

# Inicialmente, carregamos os pacotes necessários:

pacman::p_load(data.table, ggplot2)

# Depois, carregamos a base:

breast_cancer <- fread('https://raw.githubusercontent.com/hugoavmedeiros/cp_com_r/master/bases_tratadas/breast_cancer.csv', stringsAsFactors = T)

# Visualizar os dados:

view(breast_cancer)

# Apresentar tabela de contingência:

tabela_lado_idade_cancer <- table(breast_cancer$breast, breast_cancer$idade)
tabela_lado_idade_cancer

# Plotar os gráficos de dispersão pareados:

ggplot(breast_cancer) + aes(x = idade, fill = breast) + geom_bar(position = "fill")

# Realizar o teste de qui-quadrado:

teste_idade_cancer <- chisq.test(tabela_lado_idade_cancer)
teste_idade_cancer
teste_idade_cancer$observed
teste_idade_cancer$expected

# Plotar a correlação:

corrplot(teste_idade_cancer$residuals, is.cor = FALSE)

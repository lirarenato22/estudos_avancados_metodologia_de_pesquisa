# EXERCÍCIO - Objetos e Funções no R

# Aluno: Renato Lira

# QUESTÃO: Dê um exemplo de código que cria um objeto simples 
# (como o vetor acima) e que cria um objeto complexo, 
# criado via uma função (como a regressão acima)

# RESPOSTA:

# Criar objeto simples

vetor <- c(2, 4, 8, 16, 32) 

# Criar objeto complexo

teste_1 <- lm(UrbanPop ~ Assault, data = USArrestsDT)

summary(teste_1)

str(teste_1)
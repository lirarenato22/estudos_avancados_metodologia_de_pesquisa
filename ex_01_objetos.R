# EXERC?CIO - Objetos e Fun??es no R

# Aluno: Renato Lira

# QUEST?O: D? um exemplo de c?digo que cria um objeto simples 
# (como o vetor acima) e que cria um objeto complexo, 
# criado via uma fun??o (como a regress?o acima)

# RESPOSTA:

# Criar objeto simples

vetor <- c(2, 4, 8, 16, 32) 

# Criar objeto complexo

teste_1 <- lm(UrbanPop ~ Assault, data = USArrestsDT)

summary(teste_1)

str(teste_1)
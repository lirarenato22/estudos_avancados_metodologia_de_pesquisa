# EXERCÍCIO - Extração 

# Aluno: Renato Lira

# QUESTÃO: Compartilhe com a gente um código em que você cria uma
# estrutura de fatores.

# RESPOSTA:


frutas <- c("abacaxi", "mamão", "uva", "maçã", 
              "laranja", "manga", "banana", "graviola", "tangerina") 

frutas_fator <- factor(c("abacaxi", "mamão", "uva", "maçã", 
                           "laranja", "manga", "banana", "graviola",
                           "tangerina"))

levels(frutas_fator)

recode <- c(boa = "abacaxi", boa = "maçã", boa = "banana", boa = "laranja", boa = "manga",
            ruim = "mamão", ruim = "uva", ruim = "graviola", ruim = "tangerina")

levels(frutas_fator)

(frutas_fator <- factor(frutas_fator, levels = recode, labels = names(recode)))


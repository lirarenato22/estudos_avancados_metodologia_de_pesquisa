# EXERC?CIO - Extra??o 

# Aluno: Renato Lira

# QUEST?O: Compartilhe com a gente um c?digo em que voc? cria uma
# estrutura de fatores.

# RESPOSTA:


frutas <- c("abacaxi", "mam?o", "uva", "ma??", 
              "laranja", "manga", "banana", "graviola", "tangerina") 

frutas_fator <- factor(c("abacaxi", "mam?o", "uva", "ma??", 
                           "laranja", "manga", "banana", "graviola",
                           "tangerina"))

levels(frutas_fator)

recode <- c(boa = "abacaxi", boa = "ma??", boa = "banana", boa = "laranja", boa = "manga",
            ruim = "mam?o", ruim = "uva", ruim = "graviola", ruim = "tangerina")

levels(frutas_fator)

(frutas_fator <- factor(frutas_fator, levels = recode, labels = names(recode)))


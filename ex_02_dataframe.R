# EXERCÍCIO - CRIANDO UM DATAFRAME

# Aluno: Renato Lira

# vetor com nomes das cidades
nomeCidade <- c("Recife", "Montreal", "Cidade de Nova Iorque", 
            "Liverpool", "Shijiazhuang", "Buenos Aires")

# vetor com nomes dos estados
nomeEstado <- c("Pernambuco", "Quebec", "Nova Iorque", "Merseyside", 
            "Hebei", "Buenos Aires")

# vetor com nomes dos países
nomePaís <-  c("Brasil", "Canadá", "Estados Unidos", "Inglaterra", 
           "China", "Argentina")
  
# data.frame com base nos vetores
lugares <- data.frame(
  Cidade = nomeCidade, Estado = nomeEstado, País = nomePaís)
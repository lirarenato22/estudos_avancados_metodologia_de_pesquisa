# EXERCÍCIO - Ajuste de Atributos

# Aluno: Renato Lira

# QUESTÃO:  Para concluir esta atividade, 
# faça um ajuste de variáveis usando log transformation, 
# square root transformation em uma base diferente da mostrada 
# no vídeo explicativo.

# RESPOSTA:

pacman::p_load(dplyr, ggplot2, data.table, gridExtra)

# carregar dados 

general_data <- fread("https://covid.ourworldindata.org/data/owid-covid-data.csv") # carrega dados de covid19 no mundo

# agrupar casos por município ajustando variáveis

general_data_1 <- general_data %>% count(location, sort = T, name = 'casos') %>% mutate(casos2 = sqrt(casos), casosLog = log10(casos))

# criar loop para os diferentes gráficos

nomeVar_1 <- names(general_data_1)[2:4] # passar nomes das vars para vetor
listaPlots <- NULL

for(i in nomeVar_1) {
  plot <- general_data_1 %>% ggplot(aes_string(x = 'casos', y=i)) + geom_bar(stat = "identity") + labs(x = "país")
  listaPlots[[length(listaPlots) + 1]] <-plot} 

# criar lista com os plots

# printar todos os plots, lado a lado
grid.arrange(listaPlots[[1]], listaPlots[[2]], listaPlots[[3]], ncol=3)
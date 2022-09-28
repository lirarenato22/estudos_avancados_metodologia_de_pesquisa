# EXERCÍCIO - Extração - Área Intermediária

# Aluno: Renato Lira

# carrega a base de snistros de transito do site da PCR
sinistrosRecife2020Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2020Raw2 <- sinistrosRecife2020Raw[,-c(14)]

sinistrosRecife2021Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2021-jan.csv', sep = ';', encoding = 'UTF-8')


sinistrosRecife2019Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2019-jan.csv', sep = ';', encoding = 'UTF-8')


sinistrosRecife2018Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2018-jan.csv', sep = ';', encoding = 'UTF-8')


sinistrosRecifeRaw <- rbind(sinistrosRecife2020Raw2, sinistrosRecife2021Raw, 
                            sinistrosRecife2019Raw, sinistrosRecife2018Raw)



sinistrosRecifeRaw$tipo <- as.factor(sinistrosRecifeRaw$tipo)

# Para ver quanto cada objeto está ocupando de espaço, utilizar a sequência:

for (itm in ls()) { 
  print(formatC(c(itm, object.size(get(itm))), 
                format="d", 
                width=30), 
        quote=F)
}


# Dos objetos apresentados, o que mais ocupa espaço é "sinistrosRecifeRaw" (3730336).


# Em sequência,utilizamos a função naZero, de acordo com o solicitado:

naZero <- function(x) {
  x <- ifelse(is.na(x), 0, x)
}

sinistrosRecifeRaw[, 15:25] <- sapply(sinistrosRecifeRaw[, 15:25], naZero)




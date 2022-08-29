# EXERC�CIO - BOOTSTRAPPING

# Aluno: Renato Lira

# Exemplo de Distribui��o Normal

dist_norm <- rnorm(100000000)

View(dist_norm)


# Exemplo de Utiliza��o de Bootstrapping

bootstrapping_media_10 <- replicate(10, mean(sample(dist_norm, 
                                                32, replace = TRUE))) 

mean(bootstrapping_media_10)


bootstrapping_media_50 <- replicate(50, mean(sample(dist_norm,
                                                45, replace = TRUE)))
mean(bootstrapping_media_50)


bootstrapping_media_100 <- replicate(100, mean(sample(dist_norm, 
                                                58, replace = TRUE)))
mean(bootstrapping_media_100)
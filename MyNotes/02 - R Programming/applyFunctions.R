
#############
# use lapply #
############

x <- list(a = 1:5, b = rnorm(10))
lapply(x,mean)


#############
# use apply #
############
y <- matrix(rnorm(200), 20, 10)
apply(y, 2, mean)
apply(y, 1, sum)
plot(apply(y, 2, mean))

#Fazer essas operaçoes com APPLY, é o mesmo de realizar :
# rowSums = apply(y, 1, sum)
# rowMeans = apply(y, 1, mean)
# colSums = apply(y, 2, sum)
# colMeans = apply(y, 2, sum)
# só que utilizando apply fica mais rápido, pq vc digita menos.

apply(y, 1, quantile, probs = c(0.25, 0.75))
plot(apply(y, 1, quantile, probs = c(0.25, 0.75)))
hist(apply(y, 1, quantile, probs = c(0.25, 0.75)))


a <- array(rnorm(2 * 2 * 10), c(2,2,10))
apply(a, c(1,2), mean)
rowMeans(a, dim = 2)

#############
# use tapply #
############

# utilizada para aplicar funçoes em subconjuntos de vetor

x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3,10)
f
tapply(x, f, mean)

# take group means without simplication
tapply(x, f, mean, simplify = FALSE)

# find groups range
tapply(x, f, range)


#############
# use split #
############

# SPLIT é uma funçao que pode ser utilizada em conjunto com as APPLY

x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
split(x, f)

lapply(split(x, f), mean)


# Creating an example with Data airquality
library(datasets)
head(airquality)

# Quero calcular a média para cada mes

s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))

# Splitting on More than One Level

x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)
f1
f2
interaction(f1, f2)

str(split(x, list(f1, f2)))
str(split(x, list(f1, f2), drop = TRUE))


#############
# use mapply #
############

# mapply é uma multivariada de apply espécie de que se aplica uma função 
# em paralelo ao longo de um conjunto de argumentos 

mapply(rep, 1:4, 4:1)


# Vectorizing a function

# Quando fazemos uma funçao igual a essa:
noise <- function(n, mean, sd){
  rnorm(n, mean, sd)
}

# essa funciona corretamente:
noise(5,1,2)

# porém essa não retorna o resultado esperado:
noise(1:5, 1:5, 2)

# por este motivo nós utilizamos o mapply:
mapply(noise, 1:5, 1:5, 2)

# Instant Vectorization

# Which is the same:
list(noise(1,1,2), noise(2,2,2), noise(3,3,2), noise(4,4,2), noise(5,5,2))
# desse modo é possivel, instanteneamente criar uma funçao que não permite 
# vetores de entrada e instanteneamente vetorizá-las.


# Consluão: basicamnete as funçoes Apply são utilizadas para facilitar
# a vida do cidadão, se fossemos realizar a média de todos os elementos
# da lista, iriamos ter que digitar muito código, elas já facilitam
# vc passa o objeto e a funçaão que quer aplicar para cada elemento,
# linha, coluna, registro etc.....
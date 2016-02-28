#Base PLot
library(datasets)
data(cars)
with(cars, plot(speed,dist))

# The Lattice System
library(lattice)
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data =  state, layout = c(4,1))

#ggplot2
library(ggplot2)
data(mpg)
qplot(displ, hwy, data = mpg)

#The Base Graphic
# São os gráficos mais básicos do R como: plot(), hist(), boxplot().
# Quando essas funções são chamadas, parece simples, mas elas 
# rodam uma série de funções por trás.

# Os gráficos básicos tem uma série de parâmetros que podem ser 
# buscados pelo comando ?par
?par

# um exmplo de um gráfico básico:
hist(airquality$Ozone) # histograma
with(airquality, plot(Wind, Ozone)) # scatterplot
# Abaixo temos um exemplo o de boxplot
airquality <- transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")

# Existem alguns parâmetros chave para serem utilizados nos 
# gráficos básicos:
  # pch: formato dos símbolos no gráfico: bolinhas, triangulo etc.
  # lty: tipo da linha: solida, pontilhada etc.
  # lwd: a linha de largura: especificada com inteiro ou multiplo
  # col: a cor que será plotada no gráfico, no caso de um histograma 
  # as barras ficam azuis, ou no caso de um scatterplot as pch ficam
  # xlab: O nome do eixo X
  # ylab: O nome do eixo Y

# Parâmetros qe podem ser utilizados na função par():
  # las: orientação dos eixos
  # bg: a cor do backgroud dos gráficos
  # mar: a margem
  # oma: como se  fosse o padding no css
  # mfrow: número de pgráficos por linha, normalmente do eixo Y
  # mfcol: número de gráficos por coluna, normalemnte eixo X

# Valores Default
c(par("lty"), par("col"), par("pch"), par("bg"), par("mar"), par("mfrow"), par("mfcol"))

# Base Plotting Functions
  # plot: faz um scatterplot
  # lines: adiciona linhas em um plot, dando um vetor as valores x 
  # e correspondendo  ao vetor y , conectando dois pontos.
  # points: adiciona pontos em um gráfico
  # text: adiciona anotações usando as coordenadas certas para x e y
  # title: adicona os labels no gráfico , título, subtítulo, margens etc.
  # mtext:: add arbitrary text to the margins ( inner or outer ) of the plot
  # axis: addind axis ticks/labels

with(airquality, plot(Wind, Ozone))
title(main = "Ozone and Wind in New York City" )

with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City"))
with(subset(airquality, Month == 5 ), points(Wind, Ozone, col = "blue"))

# With Annotations
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", type = "n"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col="blue"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col="red"))
legend("topright", pch=1, col=c("blue", "red"), legend = c("May", "Other Months"))

# Gráficos com Linha de Regressão
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", pch=20))
model <- lm(Ozone~Wind, airquality)
abline(model, lwd = 2)

#Multiple Base Plots
par(mfrow = c(1,2))
with(airquality, {
  plot(Wind, Ozone, main = "Ozone and Wind")
  plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
})

# ggplot2() - Functions
# Exemplo de Base para se trabalhar com o ggplot2

library(ggplot2)
str(mpg)
 # Basic function
qplot(displ, hwy, data = mpg)
qplot(displ, hwy, data = mpg, color = drv)
qplot(displ, hwy, data = mpg, geom = c("point", "smooth"))
qplot(hwy, data = mpg, fill = drv, bins=30)
# Facets
qplot(displ, hwy, data=mpg, facets = .~drv)
qplot(hwy, data=mpg, facets = drv~., binwidth = 2)

# Exemplo Prático utilizando ggplot2 do MAACS (não importei base)
  # Exemplos de Histogramas
  qplot(log(eno), data = maacs)
  qplot(log(eno), data = maacs, fill = mopos)
  
  # Exemplos de Dist Densidade de Probabilidade
  qplot(log(eno), data = maacs, geom = "density")
  qplot(log(eno), data = maacs, geom = "density", color = mopos)
  
  # Exemplos de Scartterplots
  qplot(log(pm25), log(eno), data = maacs)
  qplot(log(pm25), log(eno), data = maacs, shape = mopos)
  qplot(log(pm25), log(eno), data = maacs, color = mopos)
  
  # Opção de Scatterplot com Linha de Regressão
  qplot(log(pm25), log(eno), data = maacs, color = mopos, geom = c("point", "smooth"), method = "lm")
  qplot(log(pm25), log(eno), data = maacs, geom = c("point", "smooth"), method = "lm", facets = .~mopos)
  
# GGplot Aditional Material
# Labels: xlab(), ylab(), labs(), ggtitle()
# Each of the "geom" functions has options to modify
# For things that only make sense globally, use theme()
#  - Example: theme(legend.position = "none")
# Two standard appearance themes are included
#  - theme_grey(): the default theme (gray background)
#  - theme_bw(): More stark/plain
  
# Axis Limits
testdat <- data.frame(x=1:100, y = rnorm(100))
testdat[50,2] <- 100 ## Outlier!
plot(testdat$x, testdat$y, type="l", ylim = c(-3,3))

g <- ggplot(testdat, aes(x = x, y=y))
g + geom_line()

g + geom_line() + ylim(-3, 3) # outlier missing
g + geom_line() + coord_cartesian(ylim = c(-3,3)) # outlier included

# More Complex Exemple
# How does the relationship btetween PM2.5 and noctural symptoms vary by BMI
# and NO2?
# Unlike our previous BMI variable, NO2 is continuous 
# We need to make NO2 categorical so we can condition on it the plotting 
# - Use the cut() function for this

# Making NO2 Tertiles
## Calculate the deciles of the data
cutpoints <- quantile(maacs$logno2_new, seq(0, 1, length = 4), na.rm = TRUE)
## Cut the data at the deciles and create a new factor variable
maacs$no2dec <- cut(maacs$logno2_new, cutpoints)
## See the levels of the newly created factor variable
levels(maacs$no2dec)

# Final Plot
## Setup ggplot with data frame
g <- ggplot(maacs, aes(logpm25, NocturnalSympt))
## Add layers
g + geom_point(alpha = 1/3)
+ facet_wrap(bmicat~no2dec, nrow = 2, ncol = 4)
+ geom_smooth(method="lm", se=FALSE, col="steelblue")
+ theme_bw(base_family = "Avenir", base_size = 10)
+ labs(x = expression("log " * PM[2.5]))
+ labs(y = "Nocturnal Symptoms")
+ labs(title = "MAACS Cohort")

# The Lattice Plotting System
  # O Lattice Plotting é uma biblioteca alternativa de gráficos e, para que seja
  # utilizada, é necessário que carregá-la.
# Functions
  # xyplot: é a principal função para criar Scatterplots (tipo plot())
  # bwplot: função para criar boxplots
  # histogram: cria histogramas
  # stripplot: como boxplos porém com pontos atuais
  # dotplot: plot dots or "violin strings"
  # splom: matrix de scartterplots 
  # levelplot, contourplot: imprime dados de imagem

# xyplot()
xyplot(y ~ x | f * g, data)
# as variáveis x e y representam os eixos
# as variáveis f e g representam as condicionais, sendo opcionais
# o * repreenta uma interação entre variáveis

library(lattice)
library(datasets)
xyplot(Ozone ~ Wind, data = airquality)

# Convetendo o mês em um fator
airquality <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1))

# Os Lattice gráficos tem um comportamento diferente do que os básicos
# Enquanto os básicos podem ser plotados diretamento em PDF, PNG, JPEG,
# esses gráficos não;
# Os Lattcie gráficos retornam um Objeto da classe "Trellis";

p <- xyplot(Ozone ~ Wind, data = airquality)
print(p)
xyplot(Ozone ~ Wind, data = airquality)

# Lattice Panel Functions
set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each=50)
y <- x + f - f * x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group 1", "Group 2"))
xyplot(y~x | f, layout = c(2,1)) ## plot with 2 panels

# Custom panel function
xyplot(y~x | f, panel = function(x, y, ...){
  panel.xyplot(x, y, ...) ## First call the default panel function for 'xyplot'
  panel.abline(h = median(y), lty = 2) ## Add a horizontal line at the median
})

# Custom panel function: Regression Line
xyplot(y~x | f, panel = function(x, y, ...){
  panel.xyplot(x, y, ...) ## First call the default panel function for 'xyplot'
  panel.lmline(x, y, col = 2) ## Overlay a simple linear regression line
  panel.abline(h = median(y), lty = 2) ## posso inserir as duas linhas tbm
})

# Resumo sobre os gréficos Lattice 
  # São construidos com uma única função  que é a xyplot();
  # Questões como, margens e espaços são automaeticamente resolvidos e não
  # há necessidade de mudar pq o default já é muito bom;
  # São ideias para criar gráficos onde você possa comparar diferentes condições
  # dos dados, como nos exemplos, Grupo 1 Grupo 2, aplicação de remédios em
  # diferentes pesoas;
  # e Lembrando que os paneis podem ser modificados utilizando as funções.
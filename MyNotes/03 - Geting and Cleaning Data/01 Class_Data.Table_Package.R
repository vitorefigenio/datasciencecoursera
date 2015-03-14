#data.table package

# Create Data.Table
install.packages("data.table")
library(data.table)
DF = data.frame(x=rnorm(9), y=rep(c("a","b","c"), each=3), z=rnorm(9))
head(DF,3)

DT = data.table(x=rnorm(9), y=rep(c("a","b","c"), each=3), z=rnorm(9))
head(DT,3)

# comando ara ver tdas as abelas criadas na memória
tables()

# Subsetting rows
DT[2,]
DT[DT$y=="a"]
DT[c(2,3)]

# Subseting columns
DT[,c(2,3)]
# É comum o uso de expressões

{
    x=1
    y=2
}
k = {print(10);5}
print(k)

# Calculating values for variables with expressions
DT[,list(mean(x),sum(z))]
DT[,table(y)]

# Adding new column
DT[,w:=z^2]
DT

# Multiple Operations
DT[,m:={tmp <- (x+z); log2(tmp+5)}]
plot(DT[,m])

# plyr like operations
DT[, a:=x>0]
DT[,b:= mean(x+w), by=a]
DT

# Special Variables
set.seed(123)
DT <- data.table(x=sample(letters[1:3], 1E5, TRUE))
DT[, .N, by=x]

# keys
DT = data.table(x=rep(c("a","b","c"), each=100), z=rnorm(300))
setkey(DT,x)
DT['a']


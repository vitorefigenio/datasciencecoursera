# A warning message:
log(-1)

# I could creat a function to express a message

printmessage <- function(x){
  if(x > 0)
    print("x is greater than zero")
  else
    print("x is less than or equal to zero")
  
  invisible(x)
}

printmessage(550)
printmessage(-90)

# A error message:
printmessage(NA)

# Corrigindo a quest�o do Erro
printmessage <- function(x){
  if(is.na(x))
    print("x is a missing value!")
  else if(x > 0)
    print("x is greater than zero")
  else
    print("x is less than or equal to zero")
  
  invisible(x)
}
printmessage(550)
printmessage(-90)
printmessage(NA)

x <- log(-1)
printmessage(x)


# Debugging Tools in R
# * traceback: prints out the function call stack after an error occurs;
#   does nothing if there's no error

mean(x)
traceback()

lm(y~x)
traceback()

# * debug: flags a function for "debug" mode which allows you to step through
#   execution of a function one line at a time

debug(lm)
lm(y~x)


# * browser: suspends the execution of a function wherever it is called and
#   puts the function in debug mode

# * trace: allows you to insert debugging code into a function a specific
#   places

# * recover: allows you to modify the error behavior so that you can browse
#   the function call stack

options(error = recover)
read.csv("nosuchfile")



# Resumo
# * H� tr�s indica��es principais de um problema / condi��o: mensagem, aviso,
#   erro
#   - Apenas um erro � fatal

# * Ao analisar uma fun��o com um problema, certifique-se que voc� pode
#   reproduzir o problema, indicar claramente as suas expectativas e como a
#   sa�da difere de sua expectativa

# * Ferramentas de depura��o interativo rastreamento, debug, browser, rastrear
#   e recuperar pode ser usado para encontrar o c�digo problem�tico em fun��es

# * Ferramentas de Depura��o n�o s�o um substituto para pensar!
# Esse tipo de arquivo HDF é utilizado para guardar um conjunto de dados
# muito grande. e Também uilizado para guadar um conjunto de dados estruturados
# O nome HDF vem do inglês Hierarchical Data Format, porque os dados são
# armazenados em grupos que contém zero ou mais conjuno de dados com o seu
# métadado.

# R HDF5 package 
source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")
library(rhdf5)
created = h5createFile("./data/example.h5")
created

# Create Groups
created = h5createGroup("example.h5","foo")
created = h5createGroup("example.h5","baa")
created = h5createGroup("example.h5","foo/foobaa")
h5ls("example.h5")

# Write to groups
A = matrix(1:10,nr=5,nc=2)
h5write(A, "example.h5", "foo/A")
B = array(seq(0.1,2.0,by=0.1), dim=c(5,2,2))
attr(B, "scale") <- "liter"
h5write(A, "example.h5", "foo/foobaa/B")
h5ls("example.h5")

# Write a Data set
df = data.frame(1L:5L,seq(0,1,length.out=5), c("ab","cde","fghi","a","s"), stringsAsFactors=FALSE)
h5write(df, "example.h5", "df")
h5ls("example.h5")

# Reading Data
readA = h5read("example.h5", "foo/A")
readB = h5read("example.h5", "foo/foobaa/B")
readdf = h5read("example.h5", "df")
readA

# Writing an reading chunks
h5write(c(12,13,14), "example.h5", "foo/A", index=list(1:3,1))
h5read("example.h5", "foo/A")


# Notes and further resources
# hdf5 can be used to optimize reading/writing from disc in R
# The rhdf5 tutorial:
# http://www.bioconductor.org/packages/release/bioc/vignettes/rhdf5/inst/doc/rhdf5.pdf
# The HDF group has informaton on HDF5 in general http://www.hdfgroup.org/HDF5/
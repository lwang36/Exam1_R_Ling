setwd("C:/Users/Ling/Desktop")
library(GEOquery)
library(limma)
library(affy)

# Download GSE1000_series_matrix.txt.gz

url <- "ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE1nnn/GSE1000/matrix/GSE1000_series_matrix.txt.gz"
filenm <- "GSE1000_series_matrix.txt.gz"
if(!file.exists(filenm)) download.file(url, destfile=filenm)

gse <- getGEO(filename=filenm)
 
head(gse) 

gse_log <- log2(exprs(gse))


# first 5 columns of gse in treatment and next 5 columns in control

treatment <- rowMeans(gse_log[,1:5])
control <- rowMeans(gse_log[,6:10])

# fold

fold <- treatment/control

# export .csv
write.csv(fold, file="Exam1_fold.csv")

# boxplot
par(mfrow=c(2,1))
boxplot(treatment, col="green")
boxplot(control, col="red")






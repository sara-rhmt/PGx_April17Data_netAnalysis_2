my.read <- function(my.file, my.header) read.table(my.file, header = my.header, as.is = T, stringsAsFactors = F, quote = "\"", comment = "", sep = " ")
data.path <- "../../Quan_April17_2020/www.quanli.tk/PGX/"
data.dir <- dire(data.path)
nchar("genes.log2TPM.CD4.") # 18
nchar("diff.out.txt")  #12

for (i in 1:18)
  assign(substr(data.dir[i], nchar("genes.log2TPM.CD4.T"), (nchar(data.dir[i]) - nchar(".diff.out.txt"))), my.read(paste(data.path, data.dir[i], sep = ""), T))
# Read all pre vs pre comparisons from the excel sheet of Dec


my.read <- function(my.file, my.header) read.table(my.file, header = my.header, as.is = T, stringsAsFactors = F, quote = "\"", comment = "", sep = " ")
data.path <- "../../Quan_April17_2020/www.quanli.tk/PGX/"
data.dir <- dire(data.path)
nchar("genes.log2TPM.CD4.") # 18
nchar("diff.out.txt")  #12

for (i in 1:18)
  assign(substr(data.dir[i], nchar("genes.log2TPM.CD4.T"), (nchar(data.dir[i]) - nchar(".diff.out.txt"))), my.read(paste(data.path, data.dir[i], sep = ""), T))
# Read all pre vs pre comparisons from the excel sheet of Dec

# conver Quan IDs to ENSG IDs
ENSG <- strsplit(IL17.responder.post.vs.IL17.non_responder.post[, 1], "\\.")
for (i in 1:length(ENSG)) ENSG[[i]] <- ENSG[[i]][2]
ENSG <- unlist(ENSG)
ls()
# select dataframes containing original data
for (j in c(8:11, 13, 18:20, 22:28, 30, 32)) 
  if (dim(get(ls()[j]))[2] == 4) 
    assign(ls()[j], cbind(ENSG, get(ls()[j])))
for (i in c(8:11, 13, 18:20, 22:28, 30, 32))
  assign(ls()[i], merge(hgnc.summary, get(ls()[i]), by.x = "Ensembl.ID.supplied.by.Ensembl.", by.y = "ENSG", no.dups = T, incomparables = NA))
my.file.names <- c("IL17.responder.pre.vs.IL17.non_responder.pre", "IL17.responder.pre.vs.TNF.non_responder.pre", "TNF.non_responder.pre.vs.IL17.non_responder.pre", "TNF.responder.pre.vs.IL17.non_responder.pre", "TNF.responder.pre.vs.IL17.responder.pre", "TNF.responder.pre.vs.TNF.non_responder.pre")
for (i in my.file.names)
  assign(i, merge(hgnc.summary, get(i), by.x = "Ensembl.ID.supplied.by.Ensembl.", by.y = "ensg.id", no.dups = T, incomparables = NA))
for (i in my.file.names){
  t1 <- get(i)
  names(t1) <- names(IL17.responder.post.vs.IL17.non_responder.post)
  assign(i, t1)
  }
remove(t1)



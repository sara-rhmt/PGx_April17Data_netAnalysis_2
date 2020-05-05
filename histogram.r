my.words <- read.table("words.txt", header = F, as.is = T, stringsAsFactors = F, quote = "\"", sep = "\t")

Length = nchar(my.words[, 1])
words.freq <- as.data.frame(table(nchar(my.words[, 1])), stringsAsFactors = F)

write.table(words.freq, file = "histogram.tsv", quote = F, row.names = F, sep = "\t")
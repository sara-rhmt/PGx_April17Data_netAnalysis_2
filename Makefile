#words.txt:
#Rscript -e 'download.file("https://svnweb.freebsd.org/base/head/share/dict/web2?view=co", destfile = "words.txt", quiet = TRUE)'
all: histogram.tsv

clean:
	rm -f words.txt histogram.tsv
	
#words.txt: /usr/share/dict/words
#cp /usr/share/dict/words words.txt

words.txt: /usr/share/dict/words
	cp $< $@

histogram.tsv: histogram.r words.txt
	Rscript $<
	
#histogram.png: histogram.tsv
#Rscript -e 'library(ggplot2); qplot(Var1, Freq, data=read.delim("$<")); ggsave("$@")'
	
histogram.png: histogram.tsv
	Rscript -e 'library(ggplot2); qplot(Var1, Freq, data=read.delim("$<")); ggsave("$@")'
	rm Rplots.pdf

report.html: report.rmd
	Rscript -e 'rmarkdown::render("$<")'


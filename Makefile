#words.txt:
#Rscript -e 'download.file("https://svnweb.freebsd.org/base/head/share/dict/web2?view=co", destfile = "words.txt", quiet = TRUE)'
all: words.txt

clean:
	rm -f words.txt
words.txt: /usr/share/dict/words
	cp /usr/share/dict/words words.txt

	words.txt: /usr/share/dict/words
	cp $< $@

histogram.tsv: histogram.r words.txt
	Rscript $<
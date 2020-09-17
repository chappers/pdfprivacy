convert: topdf


topng:
	pdftoppm -png $(PDF) document

topdf: topng
	rm -r -f tmp/
	mkdir tmp
	mv document-*.png tmp
	mogrify -format pdf tmp/*.png
	pdftk tmp/*.pdf cat output $(PDF)-new.pdf

clean:
	rm -r -f *.png
	rm -r -f tmp/
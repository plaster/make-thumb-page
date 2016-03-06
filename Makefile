index.html: index.html.bash imgs imgs/*.JPG . *.zip
	./$< > $@

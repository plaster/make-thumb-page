#!/bin/bash
for file in imgs/*.JPG
do
	thumbfile="$(echo $file | sed -e 's/.JPG$/.320.jpg/')"
	convert -auto-orient $file -resize 320x320 $thumbfile
done

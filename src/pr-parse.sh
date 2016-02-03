#!/bin/bash

DIR=$(dirname $0)

SOURCE="$DIR/Penrice"
OUT="$SOURCE"

for num in {000..178}; do
#for num in {009..010}; do
 	echo "==>> $num"
	INJPG="$SOURCE/pr-${num}.jpg"
 	ln -v "$INJPG" "$OUT/pr-${num}_original.jpg"
	#convert "$INJPG" \
	#	-bordercolor White -border 20x20 "$OUT/sg-${num}_2_preprocessed.jpg"
	#scantailor-cli -v \
	~/temp/scantailor-enhanced/scantailor-enhanced/scantailor-cli -v \
		--margins=0.1 \
		--dpi=300 \
		--output-dpi=300 \
		--threshold=0 \
		--despeckle=off \
		--content-detection=cautious \
		--layout=1 \
		"$INJPG" "$OUT"
		#"$OUT/sg-${num}_2_preprocessed.jpg" "$OUT"
		#--dewarping=auto \
		#--white-margins \
		#--dewarping=auto \

 	convert -verbose "$OUT/pr-${num}.tif" \
 		-resize 1000 -depth 1 "$OUT/pr-${num}.png"
	# -trim -depth 2 -colors 4 -resize 750
# 	identify \
#		"$OUT/hw4-${num}_original.jpg" \
#		"$OUT/hw4-${num}.tif" \
#		"$OUT/hw4-${num}.png"
done
	



### OUT="$DIR/HW4_magicked"
### 
### #for num in {0000..1316}; do
### for num in 0100 0200 0300 0400 0500; do
### 	echo
### 	echo "==>> $num"
### 	#ln -vs "$SOURCE/jpgs/DIC_Page_${num}.jpg" "$OUT/${num}_original.jpg"
### 	convert -verbose "$SOURCE/jpgs/DIC_Page_${num}.jpg" \
### 		-trim +repage "$OUT/${num}_origsize.png"
### 	convert -verbose "$SOURCE/jpgs/DIC_Page_${num}.jpg" \
### 		-trim +repage -resize 1000 -depth 2 "$OUT/${num}.png"
### 	convert -verbose "$SOURCE/jpgs/DIC_Page_${num}.jpg" \
### 		-trim +repage -resize 1000 -quality 60 "$OUT/${num}.jp2"
### done

# myOCR (Optical Character Recognition Corpus for Myanmar Language or Burmese) 

The Burmese text data are word-segmented with the delimiter "_".  
Line-level Text Images for OCR are under the folder dataset and zipped.  

The dataset format is:  

```
<img-file-path>\t<text-label>
```

## mytext2pic.sh

We used mytext2pic.sh code for conversion of Myanmar sentences into png files. The code is as follows:  

```bash
#!/bin/bash

# make "png files" for each Myanmar sentence from the input file
# written by Ye Kyaw Thu, Language Understanding Lab., Pyin Oo Lwin, Myanmar
# Note: you need "mytext.tex" latex file and your file that contained Myanmar sentences
# under the same folder with "mytext2pic.sh"
#
# Last updated: 19 June 2020 
# How to run: bash ./mytext2pic.sh <input-file>
# e.g. bash ./mytext2pic.sh ./mytxt4png.txt
# output files: line1.png, line2.png, line3.png ...

# Ref: https://tex.stackexchange.com/questions/34054/tex-to-image-over-command-line/34058#34058
# Ref: http://phyletica.org/tex-equations-on-cmd-line/

count=1;

cat $1 | while read -r line
do
   xelatex "\def\mytext{${line}}\input{mytext.tex}"
   convert -density 300 mytext.pdf -quality 90 line$count.png
   ((count++))
done
```

## Citation  
Please cite this if you use this dataset:  

Thura Aung, Ye Kyaw Thu and Myat Noe Oo, "myOCR: Optical Character Recognition for Myanmar language with Post-OCR Error Correction", In Proceedings of the 19th International Joint Symposium on Artificial Intelligence and Natural Language Processing (iSAI-NLP 2024), Nov 11 to 15, 2024, Pattaya, Thailand.   

Paper link: [https://ieeexplore.ieee.org/document/10799448](https://ieeexplore.ieee.org/document/10799448)  



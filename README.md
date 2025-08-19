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

Abstract:  
This paper presents the Myanmar Optical Character Recognition (OCR), named myOCR. It utilizes a synthetic text image dataset with 14 different font styles that contains 25,790 text images. The system includes Convolutional Neural Networks (CNN) for feature extraction, Bidirectional Long-Short Term Memory (BiLSTM) networks for sequence modeling, and Connectionist Temporal Classification (CTC) for decoding, evaluated across various iterations (3,000, 6,000, 9,000) and hidden states (64, 128, 256). Statistical Post-OCR correction methods involve N(3,4,5)-grams and edit distances with the Symmetric Delete Spelling correction algorithm (SymSpell). For Neural Machine Translation-based correction, BiLSTM and Transformer models are employed, while the mT5-base and mBART-50 models are used for LLM-based correction. The best base (optical) model is the model with 9,000 iterations that achieved a chrF++ score of over 97.90 and a Word Error Rate (WER) of 9.18%. Transformer correction improved its chrF++ to 99.31 and reduced the WER to 0.66%.  


Paper link: [https://ieeexplore.ieee.org/document/10799448](https://ieeexplore.ieee.org/document/10799448)  



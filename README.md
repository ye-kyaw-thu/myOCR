# myOCR (Optical Character Recognition Corpus for Myanmar Language or Burmese) 

The Burmese text data are word-segmented with the delimiter "_".  
Line-level Text Images for OCR are under the folder dataset and zipped.  

The dataset format is:  

```
<img-file-path>\t<text-label>
```

## Text-to-Image Conversion Script  

We used the `mytext2pic.sh` script to convert Myanmar sentences into PNG image files. The code is as follows:    

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

## Random Samples

We used 14 different Myanmar fonts for our experiments. Two random text image samples for each font are shown in the table below:    

<div align="center">
**Table 1:** Two randomly selected text image samples for each of the 14 Myanmar fonts utilized in the study  
</div>

| No | Font name | Text Image Sample-1 | Text Image Sample-2 |
|----|-----------|---------------------|---------------------|
| 1 | Burmese Handwriting Style 04 | ![B_HW_1245.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/B_HW_1245.png) | ![B_HW_2240.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/B_HW_2240.png) |
| 2 | Myanmar Chatulight | ![Chatulight_1269.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/Chatulight_1269.png) | ![Chatulight_867.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/Chatulight_867.png) |
| 3 | Kamjing | ![Kamjing_477.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/Kamjing_477.png) | ![Kamjing_631.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/Kamjing_631.png) |
| 4 | Z09-LatYaySat | ![LatYaySat_1136.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/LatYaySat_1136.png) | ![LatYaySat_795.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/LatYaySat_795.png) |
| 5 | Masterpiece Spring Revolution | ![MasterpieceSpringRev_1087.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/MasterpieceSpringRev_1087.png) | ![MasterpieceSpringRev_634.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/MasterpieceSpringRev_634.png) |
| 6 | Masterpiece Uni Type | ![MasterpieceUniType_1029.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/MasterpieceUniType_1029.png) | ![MasterpieceUniType_955.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/MasterpieceUniType_955.png) |
| 7 | Myanmar Ayar3 | ![MyanmarAyar3_121.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/MyanmarAyar3_121.png) | ![MyanmarAyar3_783.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/MyanmarAyar3_783.png) |
| 8 | Myanmar Phiskel | ![MyanmarPhiskel_1117.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/MyanmarPhiskel_1117.png) | ![MyanmarPhiskel_968.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/MyanmarPhiskel_968.png) |
| 9 | Myanmar Sanpya | ![MyanmarSanpya_812.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/MyanmarSanpya_812.png) | ![MyanmarSanpya_818.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/MyanmarSanpya_818.png) |
| 10 | Myanmar Yin Mar | ![MyanmarYinMar_1530.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/MyanmarYinMar_1530.png) | ![MyanmarYinMar_1566.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/MyanmarYinMar_1566.png) |
| 11 | NKSSmart3 | ![NKSS_1492.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/NKSS_1492.png) | ![NKSS_356.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/NKSS_356.png) |
| 12 | Z03-Press | ![Press_321.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/Press_321.png) | ![Press_827.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/Press_827.png) |
| 13 | Pyidaungsu | ![Pyidaungsu_1242.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/Pyidaungsu_1242.png) | ![Pyidaungsu_1342.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/Pyidaungsu_1342.png) |
| 14 | Z01-UMoe | ![UMoe_1909.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/UMoe_1909.png) | ![UMoe_98.png](https://github.com/ye-kyaw-thu/myOCR/raw/main/doc/random_samples/UMoe_98.png) |

## Distribution of Font Usage in Synthetic Text Images  

The following figure illustrates the distribution of text lines across different fonts used in the synthetic dataset.    

<p align="center">
<img src="https://github.com/ye-kyaw-thu/myOCR/blob/main/doc/fig/pie_chart_synthetic_txt.png" alt="pie chart of synthetic text images" width="700"/>  
</p>  
<div align="center">
   **Fig.1** Number of lines of each font used in the synthetic text images   
</div> 

<br>

## Hugging Face Link

We first uploaded the myOCR version 1.0 dataset to Hugging Face on November 18, 2024. You can access the myOCR dataset at the following link:      
[https://huggingface.co/datasets/LULab/myOCR](https://huggingface.co/datasets/LULab/myOCR)

## Citation  
Please cite this if you use this dataset:  

Thura Aung, Ye Kyaw Thu and Myat Noe Oo, "myOCR: Optical Character Recognition for Myanmar language with Post-OCR Error Correction", In Proceedings of the 19th International Joint Symposium on Artificial Intelligence and Natural Language Processing (iSAI-NLP 2024), Nov 11 to 15, 2024, Pattaya, Thailand.   

Abstract:  
This paper presents the Myanmar Optical Character Recognition (OCR), named myOCR. It utilizes a synthetic text image dataset with 14 different font styles that contains 25,790 text images. The system includes Convolutional Neural Networks (CNN) for feature extraction, Bidirectional Long-Short Term Memory (BiLSTM) networks for sequence modeling, and Connectionist Temporal Classification (CTC) for decoding, evaluated across various iterations (3,000, 6,000, 9,000) and hidden states (64, 128, 256). Statistical Post-OCR correction methods involve N(3,4,5)-grams and edit distances with the Symmetric Delete Spelling correction algorithm (SymSpell). For Neural Machine Translation-based correction, BiLSTM and Transformer models are employed, while the mT5-base and mBART-50 models are used for LLM-based correction. The best base (optical) model is the model with 9,000 iterations that achieved a chrF++ score of over 97.90 and a Word Error Rate (WER) of 9.18%. Transformer correction improved its chrF++ to 99.31 and reduced the WER to 0.66%.  


Paper link: [https://ieeexplore.ieee.org/document/10799448](https://ieeexplore.ieee.org/document/10799448)  



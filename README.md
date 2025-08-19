# myOCR (Optical Character Recognition Corpus for Myanmar Language or Burmese) 

myOCR is a comprehensive synthetic dataset for Optical Character Recognition (OCR) of the Myanmar (Burmese) language. This resource addresses the critical shortage of open, high-quality datasets for Myanmar OCR, a significant barrier to developing robust document digitization tools for this low-resource language.

We generated 25,790 synthetic text-line images using 14 diverse Myanmar font styles to ensure broad coverage and reduce data bias. The dataset supports end-to-end OCR model training and evaluation, from optical character recognition to post-processing error correction. Each image is paired with a corresponding word-segmented text label.

## Experimental Findings  

- The best-performing optical model (9,000 iterations) achieved a CHRF++ score of 97.90% and a Word Error Rate (WER) of 9.18%.
- Post-OCR correction significantly improved results:
 - Transformer-based correction reduced WER to 0.66% and increased CHRF++ to 99.31%.
 - Statistical methods (N-gram/SymSpell) also reduced WER by nearly fivefold when combined with sequence modeling.
- Error analysis revealed unique challenges in Myanmar OCR, including visual rendering vs. logical character order issues.
  
## Data Format  

The Burmese text data are word-segmented using underscore ("_") as the delimiter.
The dataset follows this format:

```
<img-file-path>\t<text-label>
```

Example from train.txt:  

```
ye@lst-hpc3090:~/tmp/myOCR/data/ver1.0$ head train.txt
Images/MasterpieceUniType_312.png       တပို့တွဲ_လ_တွင်_၂၉_ရက်_ရှိ_သည်
Images/Press_1127.png   အားနာ_စရာ_ကြီး_အကြာကြီး_ရှာ_နေ_ရ_တယ်
Images/MyanmarAyar3_664.png     စိတ်မပူ_ပါ_နဲ့_ရှာ_တွေ့_အောင်_ကြိုးစား_ပါ_မယ်
Images/UMoe_1231.png    ဘူတာ_ကြီး_အချို့_မှာ_သာ_ရထား_ကို_ရေ_ဖြည့်_လို့_ရ_တာ
Images/NKSS_164.png     သူ_ပျင်း_လာ_ရင်_အချိန်_မ_ရှိ_အခါ_မ_ရှိ_ဖုန်းဆက်_တယ်
Images/B_HW_830.png     ဈေးနှုန်း_က_ဘယ်လောက်_လဲ
Images/MyanmarYinMar_1344.png   ကိစ္စ_မ_ရှိ_ပါ_ဘူး
Images/MyanmarYinMar_42.png     ကျောင်း_မှာ_မှတ်ပုံတင်ကြေး_ပေး_သည်
Images/MasterpieceUniType_1496.png      ရှန်ဟိုင်း_မြို့_ရဲ့_လူဦးရေ_ဟာ_ဘယ်လောက်_လဲ
Images/B_HW_440.png     အမေ_က_ခင်ဗျား_ကို_သူ_နဲ့အတူ_နေ_ခွင့်_မ_ပေး_ဘူး
ye@lst-hpc3090:~/tmp/myOCR/data/ver1.0$
```

Example from valid.txt:  

```
ye@lst-hpc3090:~/tmp/myOCR/data/ver1.0$ head valid.txt
Images/MasterpieceUniType_312.png       တပို့တွဲ_လ_တွင်_၂၉_ရက်_ရှိ_သည်
Images/Pyidaungsu_207.png       နောက်_အပတ်_စနေ_နေ့_မှာ
Images/Press_1365.png   နောက်ဆုံး_ရထား_က_ဘယ်_အချိန်_ရှိ_ပါ_သလဲ
Images/B_HW_2295.png    နောက်_တစ်_ခေါက်_ထပ်_ဆို_ပါ_ဦး
Images/MasterpieceUniType_2125.png      ကိုင်_ထား_ပါ
Images/UMoe_1890.png    ခင်ဗျား_ဘယ်_နေရာ_ကို_ကြည့်_ချင်_လဲ
Images/Press_287.png    အာရုဏ်ခင်း_လေ_က_တကယ်_ကို_ပဲ_သန့်ရှင်း_လတ်ဆတ်_သည်
Images/MasterpieceUniType_838.png       ကျွန်တော်_က_ဆိုးလ်_မှာ_နေ_ပါ_တယ်
Images/MyanmarSanpya_627.png    ဟွန်း_က_အလုပ်_မ_လုပ်_ဘူး
Images/Pyidaungsu_639.png       မကြာခဏ_တွေ့ဆုံ_ရင်_အနေနီး_လာ_တာ_သဘာဝ_ပဲ
ye@lst-hpc3090:~/tmp/myOCR/data/ver1.0$
```  

## Archive with 7z

The line-level text images for OCR are stored in the data folder and compressed using 7z. Due to GitHub's file size limitations, we used the -v52m option to split the archive into 52MB volumes.  

``` 
ye@lst-hpc3090:~/tmp$ time 7z a -v52m Images.7z ./Images/

7-Zip 23.01 (x64) : Copyright (c) 1999-2023 Igor Pavlov : 2023-06-20
 64-bit locale=en_US.UTF-8 Threads:24 OPEN_MAX:1024

Scanning the drive:
1 folder, 25790 files, 91981953 bytes (88 MiB)

Creating archive: Images.7z

Add new data to archive: 1 folder, 25790 files, 91981953 bytes (88 MiB)


Files read from disk: 25790
Archive size: 85800971 bytes (82 MiB)
Volumes: 2
Everything is Ok

real    0m4.250s
user    0m8.873s
sys     0m0.260s
ye@lst-hpc3090:~/tmp$
```

The compression resulted in two split archive files:      

``` 
ye@lst-hpc3090:~/tmp$ ls -lh Images.7z.*
-rw-rw-r-- 1 ye ye 52M Aug 19 20:13 Images.7z.001
-rw-rw-r-- 1 ye ye 30M Aug 19 20:13 Images.7z.002
ye@lst-hpc3090:~/tmp$
```

To extract all images, simply unzip the first volume file. The 7z utility will automatically handle the multi-volume extraction:    

```
7z x Images.7z.001
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

<p align="center">
   Table 1: Two randomly selected text image samples for each of the 14 Myanmar fonts utilized in the study  
</p>

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
  Fig.1 Number of lines of each font used in the synthetic text images
</div> 

<br>

## Hugging Face Link

We first uploaded the myOCR version 1.0 dataset to Hugging Face on November 18, 2024. You can access the myOCR dataset at the following link:      
[https://huggingface.co/datasets/LULab/myOCR](https://huggingface.co/datasets/LULab/myOCR)

## Conference Presentation

Our work on POST-OCR error correction with the myOCR dataset was presented at the iSAI-NLP 2024 conference. The presentation slides can be accessed at: [https://github.com/ye-kyaw-thu/myOCR/blob/main/doc/slide/myOCR_isai21_v2.pdf](https://github.com/ye-kyaw-thu/myOCR/blob/main/doc/slide/myOCR_isai21_v2.pdf)  

## Citation  
Please cite this if you use this dataset:  

Thura Aung, Ye Kyaw Thu and Myat Noe Oo, "myOCR: Optical Character Recognition for Myanmar language with Post-OCR Error Correction", In Proceedings of the 19th International Joint Symposium on Artificial Intelligence and Natural Language Processing (iSAI-NLP 2024), Nov 11 to 15, 2024, Pattaya, Thailand.   

Abstract:  
This paper presents the Myanmar Optical Character Recognition (OCR), named myOCR. It utilizes a synthetic text image dataset with 14 different font styles that contains 25,790 text images. The system includes Convolutional Neural Networks (CNN) for feature extraction, Bidirectional Long-Short Term Memory (BiLSTM) networks for sequence modeling, and Connectionist Temporal Classification (CTC) for decoding, evaluated across various iterations (3,000, 6,000, 9,000) and hidden states (64, 128, 256). Statistical Post-OCR correction methods involve N(3,4,5)-grams and edit distances with the Symmetric Delete Spelling correction algorithm (SymSpell). For Neural Machine Translation-based correction, BiLSTM and Transformer models are employed, while the mT5-base and mBART-50 models are used for LLM-based correction. The best base (optical) model is the model with 9,000 iterations that achieved a chrF++ score of over 97.90 and a Word Error Rate (WER) of 9.18%. Transformer correction improved its chrF++ to 99.31 and reduced the WER to 0.66%.  


Paper link: [https://ieeexplore.ieee.org/document/10799448](https://ieeexplore.ieee.org/document/10799448)  



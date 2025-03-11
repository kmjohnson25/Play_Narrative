# Play_Narrative
This is the main repo for the study (and resulting manuscript) that I am conducting for my MAPSS thesis on children's language and gesture during pretend play and narrative development.
The research study examines two key questions:

1. How do different types of gesture (representational vs. non-representational) manifest during pretend play in children with and without brain injury?

2. How do these early gestural patterns predict later narrative development?

There are a number of terms and abbreviations used in file names as well comments/notes within Rmds and the manuscript itself that I want to clearly define:
* **P3**: refers to Project 3, the study conducted as part of the SGM Lab's Language Development Project on children with brain injuries.
    - this same population is also sometimes referred to as BI (brain injury), UBI (unilateral brain injury), PL (pre and perinatal lesions) in the literature
* **P2**: refers to Project 2, the study conducted as part of the SGM Lab's Language Development Project on typically developing children.
    - this same population is also sometimes referred to as TD (typically developing)
* **H7**: refers to Home Visit 7, the 7th (out of 12) time that researchers visited and recorded children's naturalistic speech and gesture in their homes.
    - children were about 38 months old at this visit
* **H8**: refers to Home Visit 8, the 8th (out of 12) time that researchers visited and recorded children's naturalistic speech and gesture in their homes.
    - children were about 42 months old at this visit
* **H10**: refers to Home Visit 10, the 10th (out of 12) time that researchers visited and recorded children's naturalistic speech and gesture in their homes.
    - children were about 50 months old at this visit

# Repo Contents
## _extensions
This folder contains all the apaquarto extension stuff. It needs to stay in the top level of my repo so that document rendering doesn't get messed up.

## Extras
This folder contains two subfolders:
* **Qmd stuff**:
    - contains all the extras that come with a newly created Qmd and some apaquarto examples. None of it is related to my actual project.
* **The_Role_of_Pretend_Play_in_Narrative_files**:
    - files generated from working on Qmd, none of which are necessary for final manuscript

## Play_Narrative.bib
This library is an export of my Zotero library entitled MAPSS_Thesis, which contains all of the literature I might want to cite in my manuscript.

## PN_Datasets
This folder contains two subfolders: 
* **Demographics**
    - contains scripts for wrangling as ell as basic demographic data  for P2 & P3 groups
* **Narrative**
    - contains two subfolders on narrative measures during literacy visits:
      - **CSVs_of_Combined_Data_N** 
        - contains the raw data used for my study
      - **Wrangling_N**
        - contains Rmds with code used to clean and wrangle said data
* **Pretend Play**
    - contains two subfolders on pretend play during home visits
      - **CSVs_of_Combined_Data_PP** 
        - contains the raw data used for my study 
    - **Wrangling_PP**
        - contains Rmds with code used to clean and wrangle said data

## PN_Interrater Reliability
This folder contains 3 subfolders and an Rmd
* **Coded_P3_H7**: 
    - contains the transcripts from P3 (BI group) from Home Visit 7 that have been recently coded for pretend play (in addition to previously coded gestures and utterances)
* **Coded_P3_H10**:
    - contains the transcripts from P3 (BI group) from Home Visit 10 that been recently coded for pretend play (in addition to previously coded gestures and utterances)
* **IRR scores**:
    - contains the interrater reliability scores for individual transcripts from both P3_H7 and P3_H10
* **Interrater-Relability.Rmd**:
    - code for calculating IRR scores
    
## PN_Manuscript 
This folder contains everything directly related to the final manuscript for Play_Narrative Study. So far, that entails:
* **Renders**: 
    - subfolder with all the renders from previous drafts of the manuscript

## The_Role_of_Pretend_Play_in_Narrative.Qmd: 
    - Qmd for the final manuscript of my thesis
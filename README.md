# Pipeline to analyze Copy Number Variants (CNVs) for matched normal/tumor samples from cancer patients.
## Repository created by Jose Camacho Valenzuela.
Pipeline to determine CNVs based on allele-specific segmentation using the open-source algorithm Sequenza (Favero et al., 2015).

### Disclaimer.
This repository provides an example of a mock pipeline for CNVs analysis. The pipeline is broken down into individual scripts `.sh` and `.R`, intended to serve as generalized templates, which can be adapted or modified according to users' specific needs.

## 1) Pileup analysis.
Script available in the subdirectory <b> 01_PileUp </b>, file `pileup.sh`. Pileup is performed providing matched blood and tumor BAM files of the patient in question.

## 2) Segment analysis.
Script available in the subdirectory <b> 02_Segments </b>, file `segments_analysis.R`. This step is written as an Rscript `.R`.


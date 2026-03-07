---
title: "Computer Vision based Solar Irradiance Forecasting"
# status: "Final Year Project"
hero: "/images/projects/Irradiance/pipeline.png"
primary_link_text: "Github"
primary_link_url: "https://github.com/DilsharaHerath/CV-Solar-Irradiance"
# secondary_link_text: "Slides"
# secondary_link_url: "https://docs.google.com/presentation/d/1BaOdYa-ahMpI8Iu-KiyQTarcxciEbmkU/edit?usp=drive_link&ouid=118393945755563807099&rtpof=true&sd=true"
# group: ""
Keywords: "Image processing, computer vision, Solar Irradiance forecasting, vision transformers, time-series transformers"
excerpt: >
  hybrid deep learning pipeline for very short-term solar irradiance forecasting, targeting a 20-minute prediction horizon.
order: 9
---

## Project Overview

This research developed a comprehensive hybrid deep learning pipeline for very short-term solar irradiance forecasting, targeting a 20-minute prediction horizon. The system integrates multimodal data sources—high-resolution fish-eye all-sky imagery and time-series meteorological observations—to achieve robust performance under dynamic cloud cover conditions.

### Key Components and Methodology

1. **Data Preprocessing and Image Correction**  
   Fish-eye camera images were undistorted using a cosine-weighted hemispheric sampling technique. This method preserves angular fidelity across the hemispherical field of view, ensuring accurate representation of cloud positions and solar disk location critical for irradiance estimation.

2. **Cloud Detection and Segmentation**  
   A multi-stage cloud identification pipeline was implemented:  
   - **UcloudNet**: A lightweight U-Net variant trained for semantic segmentation of cloud pixels.  
   - **Red-to-Blue Ratio (RBR) Thresholding**: Physics-based clear-sky reference model for binary mask generation.  
   - **Hybrid Fusion**: Ensemble decision logic combining segmentation confidence with RBR to produce high-reliability binary cloud masks.  
   Comparative ablation studies validated the superiority of the hybrid approach in minimizing false positives under thin cirrus and broken cloud regimes.

3. **Dual-Stream Deep Learning Architecture**  
   - **Vision Branch**: Sequences of 5 consecutive undistorted all-sky images (1-minute intervals) processed by a Vision Transformer (ViT) encoder to extract spatio-temporal cloud motion features.  
   - **Time Series Branch**: 30-minute historical window of meteorological variables (GHI, DNI, DHI, ambient temperature, barometric pressure, solar zenith/azimuth angles) encoded via a Time Series Transformer (TST).  
   - **Fusion and Regression**: Feature vectors from both branches concatenated and passed through a multilayer perceptron (MLP) head for multi-step GHI and DNI regression.

4. **Training and Evaluation**  
   The model was trained end-to-end on a dataset collected from a tropical rooftop station in Sri Lanka (2023–2024), comprising over 150,000 synchronized image–measurement pairs. Performance was benchmarked against persistence, smart persistence, and single-modality baselines using MAE, RMSE, and FS (forecast skill) metrics.

## Technical Contributions

- Designed and implemented the complete end-to-end deep learning pipeline, including data ingestion, preprocessing, model architecture, and evaluation.  
- Developed custom undistortion and hybrid cloud segmentation modules optimized for real-time deployment.  
- Conducted extensive ablation studies on distortion correction methods and segmentation algorithms to quantify their impact on forecast accuracy.  
- Demonstrated state-of-the-art performance for 20-minute ahead GHI/DNI forecasting in highly variable tropical sky conditions.

## Visual Results

<div class="project-gallery" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin: 2rem 0;">
  <figure>
    <img src="/images/projects/Irradiance/pipeline.png" alt="Sequence of undistorted fish-eye all-sky images showing cloud evolution" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <figcaption>hybrid deep learning pipeline for very short-term solar irradiance forecasting</figcaption>
  </figure>
  <figure>
    <img src="/images/projects/Irradiance/dataset.png" alt="Comparison of cloud segmentation methods" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <figcaption>Dataset used for the system - All sky images taken with sample interval of 30 seconds</figcaption>
  </figure>
  <figure>
    <img src="/images/projects/Irradiance/Undistortion.png" alt="20-minute ahead GHI forecast vs. ground truth" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <figcaption>Undistortion performed for the all sky images</figcaption>
  </figure>
  <figure>
    <img src="/images/projects/Irradiance/segmentation.png" alt="Hybrid ViT-TST model architecture diagram" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <figcaption>Cloud detection and segmentation performed on the dataset</figcaption>
  </figure>
</div>

## Acknowledgments

This work was conducted with the guidance from Prof. Roshan Godaliyadda, Prof. Parakrama Ekanayake from the Department of Electrical and Electronic Engineering, University of Peradeniya.
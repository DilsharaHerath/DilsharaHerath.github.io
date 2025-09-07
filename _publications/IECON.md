---
title: "GAN-Driven Signal Denoising and Enhancement for Robust Drone Motor Detection"
collection: publications
category: conferences            # or: manuscripts
date: 2025-09-01
venue: "IEEE IECON 2025"
venueurl: "https://iecon2025.org/"     # optional link to the conf/journal
status: "Accepted & to be publication"          # optional
authors:
  - name: Dilshara Herath
    underline: true
  - name: Chinthaka Abeyrathne
  - name: Chatura Seneviratne
  - name: Harindra Sandun Mavikumbure
# award: "Outstanding Paper Award"              # optional
contribution: "Conceptualization, Methodology, Formal analysis, Software, Validation, Writing – Original Draft, Review & Editing."
# doi: "10.1109/SoutheastCon52093.2024.10500269"        # just the DOI string; we’ll link it
paperurl: "https://www.researchgate.net/publication/395298308_GAN-Driven_Signal_Denoising_and_Enhancement_for_Robust_Drone_Motor_Detection" # optional (keeps existing download links working)
# slidesurl: "https://docs.google.com/presentation/d/1BaOdYa-ahMpI8Iu-KiyQTarcxciEbmkU/edit?usp=drive_link&ouid=118393945755563807099&rtpof=true&sd=true"
# bibtexurl: "https://doi.org/10.1109/SoutheastCon52093.2024.10500269"
# excerpt: (delete if you don’t want Jekyll to auto-generate a blurb)

---


Abstract: Drones pose significant security threats due to their stealth and versatility. Brushless DC (BLDC) motors used in drones emit unique electromagnetic signals useful for drone detection, but environmental noise often degrades their quality and interpretability. This paper presents a robust Generative Adversarial Network (GAN) based framework to enhance signal clarity through denoising. Trained on paired noisy and clean signals obtained from two drone motor types (namely A and B), the GAN outperforms traditional methods (BM3D, Wavelet, Wiener, and EMD), achieving a 30.65% and 33.04% reduction in Mean Squared Error (MSE) for motors A and B, respectively. The average signal-to-noise ratio (SNR) is increased by 1.58 dB for motor A and 1.75 dB for motor B. The GAN model is then evaluated using a convolutional neural network (CNN) classifier trained on spectral correlation density (SCD) images, and it demonstrated substantial improvements in accuracy, precision, recall, and F1-scores compared to baseline results obtained from untreated signals. Specifically, classification accuracy improved significantly, from 76.38% to 98.67% for Motor Type A (29% improvement) and from 81.97% to 97.27% for Motor Type B (19% improvement), resulting in an average improvement of 24%. These results highlight the GAN-based denoising strategy's ability to enhance signal interpretability and diagnostic reliability, significantly advancing drone motor detection capabilities.


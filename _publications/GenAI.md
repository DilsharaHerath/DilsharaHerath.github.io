---
title: "GAN-Driven Signal Denoising and Enhancement for Robust Drone Motor Detection"
collection: publications
category: conferences
permalink: /publication/2024-02-17-paper-title-number-4
excerpt: 'This paper is about a GAN based framework to enhance signal clarity through denoising.'
date: 2024-04-24
venue: 'IEEE IECON 2025'
# slidesurl: 'https://docs.google.com/presentation/d/1BaOdYa-ahMpI8Iu-KiyQTarcxciEbmkU/edit?usp=drive_link&ouid=118393945755563807099&rtpof=true&sd=true'
paperurl: 'https://www.researchgate.net/publication/395298308_GAN-Driven_Signal_Denoising_and_Enhancement_for_Robust_Drone_Motor_Detection'
citation: ''
---

Drones pose significant security threats due to their stealth and versatility. Brushless DC (BLDC) motors used in drones emit unique electromagnetic signals useful for drone detection, but environmental noise often degrades their quality and interpretability. This paper presents a robust Generative Adversarial Network (GAN) based framework to enhance signal clarity through denoising. Trained on paired noisy and clean signals obtained from two drone motor types (namely A and B), the GAN outperforms traditional methods (BM3D, Wavelet, Wiener, and EMD), achieving a 30.65% and 33.04% reduction in Mean Squared Error (MSE) for motors A and B, respectively. The average signal-to-noise ratio (SNR) is increased by 1.58 dB for motor A and 1.75 dB for motor B. The GAN model is then evaluated using a convolutional neural network (CNN) classifier trained on spectral correlation density (SCD) images, and it demonstrated substantial improvements in accuracy, precision, recall, and F1-scores compared to baseline results obtained from untreated signals. Specifically, classification accuracy improved significantly, from 76.38% to 98.67% for Motor Type A (29% improvement) and from 81.97% to 97.27% for Motor Type B (19% improvement), resulting in an average improvement of 24%. These results highlight the GAN-based denoising strategy's ability to enhance signal interpretability and diagnostic reliability, significantly advancing drone motor detection capabilities.
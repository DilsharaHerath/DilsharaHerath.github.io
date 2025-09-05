---
title: "GAN-Driven Signal Denoising and Enhancement for Robust Drone Motor Detection"
collection: publications
category: conferences
permalink: /publication/2025-09-05-gan-driven-signal-denoising-enhancement-drone-motor-detection
excerpt: 'This paper presents a GAN-based approach to denoise and enhance motor signals for accurate drone motor detection.'
date: 2025-09-05      # IEEE IECON 2025 date — insert actual day
venue: 'IEEE IECON 2025'
paperurl: 'https://www.researchgate.net/publication/395298308_GAN-Driven_Signal_Denoising_and_Enhancement_for_Robust_Drone_Motor_Detection'          # Add URL if available
citation: 'D. Herath, C. Adithya, C. Seneviratne, et al., "GAN-Driven Signal Denoising and Enhancement for Robust Drone Motor Detection," in Proc. IEEE IECON 2025, Madrid, Spain, 2025.'
keywords: {Generative adversarial networks;Signal denoising;Drone motor detection;GAN;Signal enhancement}
---

Drones pose significant security threats due to their stealth and versatility. Brushless DC (BLDC) motors used in drones emit unique electromagnetic signals useful for drone detection, but environmental noise often degrades their quality and interpretability. This paper presents a robust Generative Adversarial Network (GAN) based framework to enhance signal clarity through denoising. Trained on paired noisy and clean signals obtained from two drone motor types (namely A and B), the GAN outperforms traditional methods (BM3D, Wavelet, Wiener, and EMD), achieving a 30.65% and 33.04% reduction in Mean Squared Error (MSE) for motors A and B, respectively. The average signal-to-noise ratio (SNR) is increased by 1.58 dB for motor A and 1.75 dB for motor B. The GAN model is then evaluated using a convolutional neural network (CNN) classifier trained on spectral correlation density (SCD) images, and it demonstrated substantial improvements in accuracy, precision, recall, and F1-scores compared to baseline results obtained from untreated signals. Specifically, classification accuracy improved significantly, from 76.38% to 98.67% for Motor Type A (29% improvement) and from 81.97% to 97.27% for Motor Type B (19% improvement), resulting in an average improvement of 24%. These results highlight the GAN-based denoising strategy's ability to enhance signal interpretability and diagnostic reliability, significantly advancing drone motor detection capabilities.

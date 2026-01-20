---
title: "GAN-Driven Signal Denoising for Robust Drone Motor Detection"
# status: "Research Publication"
hero: "/images/projects/GAN/pipeline.png"
primary_link_text: "Paper (IECON 2025)"
primary_link_url: "Presentation"
secondary_link_text: "https://ieeexplore.ieee.org/document/11221467"
secondary_link_url: "https://docs.google.com/presentation/d/1kcJmhUCLGmNrhstPpaz9DCe4vlOTvSVb/edit?usp=drive_link&ouid=118393945755563807099&rtpof=true&sd=true"  # Update with DOI post-publication
Keywords: "Generative Adversarial Networks, Signal Denoising, Drone Detection, Spectral Correlation Density, CNN Classification, BLDC Motors"
excerpt: >
  Novel GAN framework denoises ELF electromagnetic signals from drone motors, outperforming traditional methods and boosting CNN detection accuracy by 24%.
order: 7
---

## Project Overview

This research introduces a GAN-based denoising pipeline for extremely low-frequency (ELF) electromagnetic signals emitted by brushless DC (BLDC) drone motors, addressing noise degradation in security-critical detection scenarios.  Trained on paired noisy/clean data from two motor types (MT2213 and 1504C), the model reduces MSE by 30-33% and improves SNR by 1.6-1.8 dB versus baselines like BM3D, Wavelet, Wiener, and EMD.  Denoised signals feed into SCD image generation for VGG19-CNN classification, achieving 97-99% accuracy up 19-29% from noisy baselines enabling reliable drone presence and health monitoring. 

### Key Components and Methodology

1. **Data Acquisition**  
   Captured ELF signals (1.5-4 kHz) using a 400-turn AWG26 loop antenna, amplified/filtered via analog frontend, and digitized with oscilloscope into MATLAB .mat files (10,000 points/segment).  Clean references from <2m range; noisy data from 3-10m to simulate real environments.

2. **Signal Processing Pipeline**  
   FFT for frequency-domain view; segmented into 1024-sample windows with 50% overlap, normalized to zero-mean/unit-variance; 80/20 train/test split. 

3. **GAN Denoising Architecture**  
   Generator: 1D CNN with downsampling (64 filters, kernel=25, stride=4), 5 residual blocks (kernel=9), upsampling (tanh output). Discriminator: Progressive 1D convs (64→512 filters, kernel=15), sigmoid classification.  Losses: Adversarial BCE + L1 reconstruction (×10) + gradient penalty; discriminator updated 5× per generator step.

4. **Cyclostationary Analysis**  
   Computed Spectral Correlation Density (SCD) from denoised signals via SCF:  
   \[ S_x^\alpha(f) = \lim_{T \to \infty} \frac{1}{T} \langle X_T(f + \alpha/2) \cdot X_T^*(f - \alpha/2) \rangle \]   
   Generated 2D SCD images exploiting motor periodicity.

5. **CNN Classification and Validation**  
   Transfer-learned VGG19 (frozen conv base + GAP + Dense(256, ReLU, dropout=0.5) + sigmoid); Adam/binary cross-entropy on SCD images.  Baseline (noisy) vs. denoised metrics confirmed gains.

## Technical Contributions

- Pioneered GAN for BLDC ELF denoising, with residual CNN generator/discriminator optimized for non-stationary signals.   
- End-to-end pipeline: Antenna → frontend → GAN → SCD → CNN, validated on real motors under noise.  
- Quantified superiority: 30.65%/33.04% MSE drop, 1.58/1.75 dB SNR gain; classification jumps (Motor A: 76.38%→98.67%, Motor B: 81.97%→97.27%).   
- Open-sourced potential via preprint; extends prior ELF drone work to fault diagnosis. 

## Visual Results

<div class="project-gallery" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin: 2rem 0;">
  <figure>
    <img src="/images/projects/GAN/pipeline_GAN.png" alt="Complete GAN denoising and detection pipeline" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <figcaption>GAN-driven pipeline from antenna capture to CNN classification</figcaption>
  </figure>
  <figure>
    <img src="/images/projects/GAN/GAN_Model.png" alt="Generator and discriminator architectures" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <figcaption>Detailed GAN model with residual blocks and losses</figcaption>
  </figure>
  <figure>
    <img src="/images/projects/GAN/Motors.png" alt="MSE and SNR distributions" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <figcaption>Types of motors and specifications of the motors used for implementing and testing the system</figcaption>
  </figure>
  <figure>
    <img src="/images/projects/GAN/classification_table.png" alt="Power spectral density before/after denoising" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <figcaption>Performance comparison of denoising methods for motor a and motor b</figcaption>
  </figure>
</div>

## Acknowledgments

This work was conducted with guidance from Dr. Chatura Seneviratne (University of Ruhuna), Dr. Harindra S. Mavikumbure (Virginia Commonwealth University).  Special thanks to IEEE Industrial Electronics Society for the GenerAI Hackathon support under Daswin De Silva and Lakshitha Gunasekara.

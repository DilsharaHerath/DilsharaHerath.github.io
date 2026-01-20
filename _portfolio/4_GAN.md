---
title: "GAN-Driven Signal Denoising for Robust Drone Motor Detection"
# status: "Research Publication"
hero: "/images/projects/GAN/GAN_Model.png"
primary_link_text: "Paper (IECON 2025)"
primary_link_url: "https://ieeexplore.ieee.org/document/11221467"
secondary_link_text: "Presentation"
secondary_link_url: "https://docs.google.com/presentation/d/1kcJmhUCLGmNrhstPpaz9DCe4vlOTvSVb/edit?usp=drive_link&ouid=118393945755563807099&rtpof=true&sd=true"  # Update with DOI post-publication
Keywords: "Generative Adversarial Networks, Signal Denoising, Drone Detection, Spectral Correlation Density, CNN Classification, BLDC Motors"
excerpt: >
  Novel GAN framework denoises ELF electromagnetic signals from drone motors, outperforming traditional methods and boosting CNN detection accuracy by 24%.
order: 6
---


This research introduces a robust Generative Adversarial Network (GAN) based framework to enhance signal clarity through denoising of extremely low-frequency (ELF) electromagnetic emissions from brushless DC (BLDC) drone motors. Environmental noise often degrades signal quality and interpretability, resulting in very low signal-to-noise ratios that challenge traditional detection methods.

The GAN model was trained on paired noisy and clean signals obtained from two drone motor types, achieving a 30.65% and 33.04% reduction in Mean Squared Error (MSE) for motors A and B respectively. The average signal-to-noise ratio (SNR) increased by 1.58 dB for motor A and 1.75 dB for motor B. When integrated with a CNN classifier trained on spectral correlation density (SCD) images, classification accuracy improved dramatically from 76.38% to 98.67% for Motor Type A (29% improvement) and from 81.97% to 97.27% for Motor Type B (19% improvement), resulting in an average improvement of 24%.

### Key Components and Methodology

1. **Data Acquisition and Signal Processing**  
   ELF signals in the 1.5-4 kHz frequency range were captured using a circular loop antenna consisting of 400 turns of American Wire Gauge (26 AWG) copper wire configured for sensitivity to low-frequency magnetic fields. The captured signals were amplified and filtered through a custom analog frontend system, then analyzed with an oscilloscope and saved as MATLAB waveform data files. Each file contained 10,000 data points segmented for processing. Fast Fourier Transform (FFT) analysis transformed time-domain signals into frequency-domain representations for feature extraction.

2. **Dataset Construction and Augmentation**  
   Clean reference signals were obtained by operating drone motors (MT2213 and 1504C) within 2 meters of the antenna to minimize noise interference. Noisy signals were captured at distances ranging from 3 to 10 meters to simulate real-world environmental conditions. The dataset was initially constructed from 200 simulations, then extended to 2000 variations through noise augmentation. Random Gaussian noise with mean=0 and standard deviation=0.01 was added to enhance model robustness. Signals were segmented into 1024-sample overlapping windows with 50% overlap, normalized to zero mean and unit variance, and partitioned into 80/20 training/testing splits.

3. **GAN Architecture Design**  
   The generator network employed a 1D CNN architecture with three key stages: downsampling via convolutional layer (64 filters, kernel=25, stride=4) with Leaky ReLU activation; residual processing through five residual blocks (64 filters, kernel=9) with batch normalization and skip connections; and upsampling via transposed convolution (kernel=25, stride=4) with hyperbolic tangent activation scaling output to [-1,1]. The discriminator utilized progressive 1D convolutional layers with increasing filter counts (64→128→256→512, kernel=15, stride=2), batch normalization, Leaky ReLU activations, followed by flattening and dense sigmoid classification producing probability scores for real/fake discrimination.

4. **Training Strategy and Loss Functions**  
   The GAN employed composite loss functions: discriminator loss combined binary cross-entropy for real/generated classifications with gradient penalty enforcing Lipschitz continuity for training stability; generator loss combined adversarial terms encouraging deception with L1 reconstruction loss weighted by factor of 10 to prioritize fidelity to clean signals. The discriminator updated five times per generator update to maintain training equilibrium. Mixed precision training enhanced computational efficiency on the TensorFlow framework.

5. **CNN Classification and Validation**  
   Denoised signals were transformed into Spectral Correlation Density (SCD) images via cyclostationary analysis computing spectral correlation functions: S_x^α(f) = lim(T→∞) (1/T) × E[X_T(f + α/2) · X_T*(f - α/2)], revealing periodic modulation patterns invisible in conventional spectra. A VGG-19 architecture with transfer learning from ImageNet was implemented using Keras, with frozen convolutional base, Global Average Pooling layer, Dense layer (256 neurons, ReLU), dropout (0.5), and sigmoid output for binary drone detection. The model was compiled with Adam optimizer and binary cross-entropy loss, establishing baseline metrics from untreated signals before evaluating GAN-enhanced performance.

## Technical Contributions

- Pioneered first GAN-based architecture specifically for ELF BLDC motor emissions, achieving 30.65%/33.04% MSE reduction and 1.58/1.75 dB SNR improvement over traditional denoising methods (BM3D, Wavelet, Wiener, EMD).
- Engineered residual CNN generator with dual-stream processing (downsampling + 5 residual blocks + upsampling) and progressive discriminator optimized for 1D signal denoising under non-stationary noise conditions.
- Developed end-to-end pipeline integrating antenna capture, analog frontend, GAN denoising, SCD transformation, and VGG-based classification, validated on real motor datasets with noise augmentation.
- Demonstrated dramatic classification improvements: Motor A accuracy increased from 76.38% to 98.67% (29% gain), Motor B from 81.97% to 97.27% (19% gain), with precision/recall exceeding 98% for both drone detection and environmental discrimination.
- Validated dual-use application potential for drone surveillance and motor health monitoring, advancing robust signal preprocessing techniques for electromagnetic-based detection systems.

## Visual Results

<div class="project-gallery" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin: 2rem 0;">
  <figure>
    <img src="/images/projects/GAN/pipeline_GAN.png" alt="Complete GAN-driven system architecture" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <figcaption>GAN-driven signal denoising system architecture from antenna capture through CNN classification</figcaption>
  </figure>
  <figure>
    <img src="/images/projects/GAN/GAN_Model.png" alt="Generator and discriminator models" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <figcaption>Detailed GAN framework showing generator residual processing and discriminator progressive convolutions</figcaption>
  </figure>
  <figure>
    <img src="/images/projects/GAN/comparison123.png" alt="MSE and SNR distribution boxplots" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <figcaption>Boxplot comparison of MSE and SNR distributions across denoising methods for Motor A</figcaption>
  </figure>
  <figure>
    <img src="/images/projects/GAN/Motors.png" alt="Power spectral density comparison" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <figcaption>Types of motors and specifications of the motors used for implementing and testing the system</figcaption>
  </figure>
</div>

## Performance Metrics

**Denoising Performance Comparison Across Methods**

| Motor | Method | MSE Noisy | MSE Denoised | MSE Improvement | SNR Noisy (dB) | SNR Denoised (dB) | SNR Improvement (dB) |
|-------|--------|-----------|--------------|-----------------|----------------|-------------------|---------------------|
| **A** | BM3D | 1.9925 | 1.9839 | 0.43% | -2.95 | -2.93 | 0.02 |
| **A** | Wavelet | 1.9925 | 1.9306 | 3.11% | -2.95 | -2.81 | 0.14 |
| **A** | Wiener | 1.9925 | 1.6387 | 17.76% | -2.95 | -2.08 | 0.87 |
| **A** | EMD | 1.9925 | 1.5450 | 22.46% | -2.95 | -1.81 | 1.14 |
| **A** | **GAN (proposed)** | 1.9925 | **1.3817** | **30.65%** | -2.95 | **-1.37** | **1.58** |
| **B** | BM3D | 1.9952 | 1.9872 | 0.40% | -2.99 | -2.97 | 0.02 |
| **B** | Wavelet | 1.9952 | 1.8530 | 7.13% | -2.99 | -2.67 | 0.32 |
| **B** | Wiener | 1.9952 | 1.4918 | 25.23% | -2.99 | -1.72 | 1.27 |
| **B** | EMD | 1.9952 | 1.4147 | 29.09% | -2.99 | -1.48 | 1.51 |
| **B** | **GAN (proposed)** | 1.9952 | **1.3359** | **33.04%** | -2.99 | **-1.24** | **1.75** |

**CNN Classification Performance: Baseline vs GAN-Denoised**

| Motor Type | Data Type | Class | Precision | Recall | F1-Score | Accuracy |
|------------|-----------|-------|-----------|--------|----------|----------|
| **A** | Baseline (Noisy) | Drone | 0.8953 | 0.6016 | 0.7196 | 76.38% |
| **A** | Baseline (Noisy) | Env | 0.6964 | 0.9286 | 0.7959 | - |
| **A** | **GAN-Denoised** | Drone | **0.9895** | **0.9840** | **0.9843** | **98.67%** |
| **A** | **GAN-Denoised** | Env | **0.9846** | **0.9922** | **0.9884** | - |
| **B** | Baseline (Noisy) | Drone | 0.8571 | 0.6923 | 0.7660 | 81.97% |
| **B** | Baseline (Noisy) | Env | 0.8000 | 0.9143 | 0.8533 | - |
| **B** | **GAN-Denoised** | Drone | **0.9901** | **0.9615** | **0.9756** | **97.27%** |
| **B** | **GAN-Denoised** | Env | **0.9512** | **0.9873** | **0.9689** | - |

**Motor Specifications Used in Study**

| Motor Type | Motor Name | Weight | Diameter | RPM | Pole Count |
|------------|------------|--------|----------|-----|------------|
| Motor A | MT2213 | 60 g | 30 mm | 6,000-8,000 | 16 |
| Motor B | 1504C | 10 g | 18 mm | 10,000-12,000 | 12 |

## Acknowledgments

This work was conducted at the Department of Electrical and Information Engineering, University of Ruhuna, Sri Lanka, with guidance from Dr. Chatura Seneviratne. The authors acknowledge Prof. Arjuna Madanayake and Hiruni Silva from Florida International University, and Dr. Soumyajit Mandal from Brookhaven National Laboratory for their support. Special thanks to IEEE Industrial Electronics Society for the GenerAI Hackathon support under the leadership of Daswin De Silva and Lakshitha Gunasekara. Accepted for presentation at the 51st Annual Conference of the IEEE Industrial Electronics Society (IECON 2025).










<!-- 

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

This work was conducted with guidance from Dr. Chatura Seneviratne (University of Ruhuna), Dr. Harindra S. Mavikumbure (Virginia Commonwealth University).  Special thanks to IEEE Industrial Electronics Society for the GenerAI Hackathon support under Daswin De Silva and Lakshitha Gunasekara. -->

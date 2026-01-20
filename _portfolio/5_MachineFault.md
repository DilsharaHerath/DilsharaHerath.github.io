---
title: "SCD-CNN Framework for Rotating Machinery Fault Detection"
# status: "Research Publication"
hero: "/images/projects/machine_Fault/DL_Pipeline.png"
primary_link_text: "Paper (MERCon 2025)"
primary_link_url: "https://ieeexplore.ieee.org/document/11217055"
secondary_link_text: "Presentation"
secondary_link_url: "https://docs.google.com/presentation/d/1JiMLeW11taiq26fHqtzFod48C3Zq2jVP/edit?usp=drive_link&ouid=118393945755563807099&rtpof=true&sd=true"
# group: "Dilshara Herath, Chinthaka Abeyrathne, Chamindu Adithya, Chathura Seneviratne"
Keywords: "Convolutional Neural Networks, Cyclostationary Analysis, Digital Signal Processing, Spectral Correlation Density, Predictive Maintenance"
excerpt: >
  A novel framework integrating cyclostationary signal processing with deep learning for detecting shaft misalignment in rotating machinery, achieving 96% accuracy using SCD-based CNN classification.
order: 5
---

This research proposes an innovative framework for detecting shaft misalignment faults in rotating machinery by integrating Spectral Correlation Density (SCD) imaging with deep learning classification. Leveraging vibration data from two distinct bearing housings, the system transforms time-domain signals into cyclostationary-derived SCD images that capture periodic fault signatures while suppressing noise.

Three convolutional neural network architectures—VGG19, DenseNet121, and InceptionResNetV2—were evaluated for multi-class classification of misalignment severity across four discrete states: Healthy, Normal (0.1mm), Mild (0.3mm), and Severe (0.5mm). InceptionResNetV2 achieved optimal performance with 96% accuracy and 0.98 recall in Housing A, where fault signatures are most pronounced due to direct shaft misalignment, while maintaining robust 92% accuracy and 0.96 recall in Housing B. The system demonstrates consistent performance across varying load conditions (0 Nm, 2 Nm, 4 Nm), offering practical flexibility in sensor placement and scalability for industrial predictive maintenance applications.

### Key Components and Methodology

1. **Dataset Acquisition and Segmentation**  
   A publicly accessible rotating machinery vibration dataset was utilized, comprising data collected from PCB352C34 accelerometers positioned at bearing housings A and B along x and y axes. Signals were sampled at 25.6 kHz under three load conditions (0 Nm, 2 Nm, 4 Nm) across four machine states: Healthy, 0.1mm misalignment (Normal), 0.3mm misalignment (Mild), and 0.5mm misalignment (Severe). Binary MATLAB files containing vibration data (measured in gravitational units g = 9.80665 m/s²) were loaded using SciPy, then segmented via NumPy array slicing into uniform 10,000-sample windows. This window size balances frequency resolution with computational feasibility during spectral correlation function computation, yielding 7,368 segments per housing type (14,736 total SCD images).

2. **Signal Processing Pipeline**  
   Fast Fourier Transform (FFT) analysis converted time-domain segments into frequency representations. Spectral Correlation Density was then computed using the FFT Accumulation Method (FAM) to reduce computational complexity. The SCD function S_x^α(f) = lim(T→∞) (1/T) × E[X_T(f + α/2) · X_T*(f - α/2)] quantifies second-order cyclostationarity at cyclic frequency α and spectral frequency f. Signals were divided into N'=1024-sample overlapping frames with 50% overlap (L=512), windowed using Hamming functions to minimize spectral leakage, and processed through Short-Time Fourier Transform (STFT). Phase compensation aligned frames via W'[i,j] = W[i,j] × exp(i2πf_j L), followed by autocorrelation S[i,j,k] = W'[i,j] · W'[i,k]* and frame-averaged SCF estimation.

3. **SCD Image Generation and Preprocessing**  
   Computed SCD matrices were rendered as 2D heatmaps with color intensity encoding S_x(f,α) magnitude, preserving cyclostationary features while maintaining computational efficiency for CNN inputs. Generated images exhibited distinct patterns: spectral ridges and peaks corresponding to periodic modulations induced by misalignment. Pixel values (range [0,255]) were normalized to [0,1] via division by 255. TensorFlow's image_dataset_from_directory utility automated class label inference from directory structure, with one-hot encoding for multi-class classification. The dataset was partitioned 70/20/10 for training/validation/test sets, processed through tf.data.Dataset API with batch size 32, random shuffling, and prefetching for scalable memory-efficient loading.

4. **Transfer Learning CNN Architectures**  
   Three pretrained models (ImageNet weights) were adapted with custom classification heads: GlobalAveragePooling2D for spatial dimensionality reduction; Dense layer (256 units, ReLU) for non-linear feature capture; Dropout (0.5 for DenseNet121/InceptionResNetV2, 0.1 for VGG19) for regularization; and final Dense layer (4 units, softmax) for class probability output. VGG19 (143.7M parameters, 19 layers) leverages deep 3x3 convolutions for hierarchical texture learning. DenseNet121 (8.1M parameters, 242 layers) employs dense connectivity to retain multi-scale features across 121 layers, reducing overfitting. InceptionResNetV2 (55.9M parameters, 449 layers) combines multi-scale Inception modules (1x1/3x3/5x5 parallel filters) with residual connections, capturing frequency-dependent fault patterns at varying scales.

5. **Training Strategy and Evaluation**  
   Models trained for 20 epochs on GPU-accelerated infrastructure with early stopping (patience=5) to prevent overfitting. Performance assessed via precision, recall (prioritized as primary metric for cost-critical missed alarms), F1-score, and overall accuracy. Normalized confusion matrices quantified class-wise prediction distributions. Training/validation accuracy curves monitored convergence dynamics, revealing rapid initial generalization (accuracy >0.90 by epoch 10) with minimal post-epoch 15 gains, confirming model convergence.

## Technical Contributions

- Pioneered integration of cyclostationary SCD imaging with CNN classification for rotating machinery fault detection, achieving noise-robust diagnostic performance through FAM-based spectral correlation computation.
- Demonstrated InceptionResNetV2's superiority via multi-scale feature extraction (96% accuracy Housing A, 92% Housing B), outperforming VGG19 (86%/74%) and DenseNet121 (95%/90%) across four misalignment severity classes.
- Validated sensor placement flexibility: Consistent high accuracy across Housing A (direct fault impact) and Housing B (indirect sensing), enabling cost-effective deployment with reduced hardware constraints.
- Established discrete classification framework (Normal/Mild/Severe/Healthy) aligned with ISO 10816 maintenance thresholds, providing actionable diagnostic outcomes over fine-grained regression susceptible to labeling noise.
- Benchmarked on publicly accessible dataset under varying loads (0-4 Nm), demonstrating robustness in dynamic operating environments critical for industrial predictive maintenance scalability.

## Visual Results

<div class="project-gallery" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin: 2rem 0;">
  <figure>
    <img src="/images/projects/machine_Fault/Meth1.1.png" alt="Complete fault monitoring system architecture" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <figcaption>Complete system architecture showing vibration data flow through signal processing pipeline to CNN classification</figcaption>
  </figure>
  <figure>
    <img src="/images/projects/machine_Fault/DL_Pipeline.png" alt="Transfer learning model architectures" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <figcaption>Transfer learning framework utilizing VGG19, InceptionResNetV2, and DenseNet121 with custom classification heads</figcaption>
  </figure>
  <figure>
    <img src="/images/projects/machine_Fault/dataset.png" alt="3D and 2D SCD representations" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <figcaption>Dataset used for the system</figcaption>
  </figure>
  <figure>
    <img src="/images/projects/machine_Fault/SCF2D_3D.png" alt="Normalized confusion matrix InceptionResNetV2" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <figcaption>SCD plots for 0.1mm Misalignment under 0Nm load condition in Housing A, in a) 3D representation b) 2D representation</figcaption>
  </figure>
</div>

## Performance Metrics

**CNN Model Comparison Across Housing A and Housing B**

| CNN Model | Housing | Misalign 0.1mm Recall | Misalign 0.3mm Recall | Misalign 0.5mm Recall | Healthy Recall | Overall Accuracy |
|-----------|---------|----------------------|----------------------|----------------------|----------------|------------------|
| VGG19 | A | 0.88 | 0.92 | 0.68 | 0.97 | **86%** |
| VGG19 | B | 0.45 | 0.85 | 0.76 | 0.89 | 74% |
| DenseNet121 | A | **0.99** | **0.99** | 0.96 | 0.88 | **95%** |
| DenseNet121 | B | 0.95 | 0.83 | 0.85 | 0.96 | **90%** |
| **InceptionResNetV2** | **A** | **0.95** | **0.97** | **0.98** | **0.98** | **96%** |
| **InceptionResNetV2** | **B** | **0.98** | **0.84** | **0.90** | **0.96** | **92%** |

**Detailed Classification Metrics - InceptionResNetV2 (Best Performing Model)**

| Housing | Misalignment Level | Precision | Recall | F1-Score |
|---------|-------------------|-----------|--------|----------|
| **A** | Normal (0.1 mm) | 0.99 | 0.95 | 0.97 |
| **A** | Mild (0.3 mm) | 0.94 | 0.97 | 0.96 |
| **A** | Severe (0.5 mm) | **0.97** | **0.98** | **0.98** |
| **A** | Healthy | 0.96 | 0.98 | 0.98 |
| **B** | Normal (0.1 mm) | 0.87 | **0.98** | 0.92 |
| **B** | Mild (0.3 mm) | 0.95 | 0.84 | 0.89 |
| **B** | Severe (0.5 mm) | 0.92 | 0.90 | 0.91 |
| **B** | Healthy | 0.94 | 0.96 | 0.95 |

**Model Architecture Specifications**

| Model | Parameters | Depth (Layers) | Inference Time (ms/step - GPU) |
|-------|-----------|----------------|-------------------------------|
| DenseNet121 | 8.1M | 242 | 5.4 |
| InceptionResNetV2 | 55.9M | 449 | 10.0 |
| VGG19 | 143.7M | 19 | 4.4 |

**Fault Classification Categories**

| Class Name | Severity | Misalignment Offset | SCD Images Generated |
|------------|----------|-------------------|---------------------|
| Healthy | None | 0 mm | 1,842 |
| Misalign 01 | Normal | 0.1 mm | 1,842 |
| Misalign 03 | Mild | 0.3 mm | 1,842 |
| Misalign 05 | Severe | 0.5 mm | 1,842 |

## Acknowledgments

This work was conducted at the Department of Electrical and Information Engineering and Department of Mechanical and Manufacturing Engineering, University of Ruhuna, Galle, Sri Lanka. The research was guided by Dr. Chathura Seneviratne with collaborative contributions from Chinthaka Abeyrathne and Chamindu Adithya. The study utilized the publicly accessible Rotating Machinery Vibration Dataset for training and validation.









<!-- ---
# title: "Machine Fault Monitoring using Spectral Correlation and Deep Learning"
# excerpt: "<img src='/images/projects/machine_Fault/Meth1.1.png' style='width:60%; max-width:400px;'>"
# collection: portfolio

title: "Machine Fault Monitoring using Spectral Correlation and Deep Learning"
# status: "Final Year Project"
hero: "/images/projects/machine_Fault/Bearing.jpg"
primary_link_text: "Paper"
primary_link_url: ""
secondary_link_text: "Paper 2"
secondary_link_url: "https://github.com/DilsharaHerath/Vision-Based-Driver-Drowsiness-Monitoring"
# group: "Dilshara Herath, Chinthaka Abeyrathne, Prabhani Jayaweera"
Keywords: "Object Detection, YOLO-You look only once, compuet vision, Drowsiness Detection"
excerpt: >
  This project presents a robust deep learning approach to diagnose bearing faults in rotating machinery using vibration signal processing and Spectral Correlation Density (SCD) images.
order: 3
---

[![GitHub Repo](https://img.shields.io/badge/View%20on%20GitHub-%2312100E?logo=github&style=for-the-badge)](https://github.com/DilsharaHerath/Intelligent-Fault-Detection-in-Rotating-Machinery)


This project presents a robust deep learning approach to diagnose **bearing faults in rotating machinery** using **vibration signal processing** and **Spectral Correlation Density (SCD)** images. Early fault detection in bearings is vital to ensure equipment reliability, reduce maintenance costs, and prevent catastrophic failures in industrial systems.


Bearing Fault by Crack Size 
<img src="/images/projects/machine_Fault/Bearing.jpg" width='1000'>

---

## 📂 Dataset

We used the publicly available dataset:

- 🔗 **[Mendeley Dataset Link](https://data.mendeley.com/datasets/ztmf3m7h5x/6)**
- 📄 **Dataset Paper:**  
  _“Vibration, Acoustic, Temperature, and Motor Current Dataset of Rotating Machine Under Varying Load Conditions for Fault Diagnosis”_  
  DOI: [10.17632/ztmf3m7h5x.6](https://doi.org/10.17632/ztmf3m7h5x.6)  
  Published: 8 February 2023, Version 6

---

## 📊 Problem Overview

Traditional signal processing techniques like **Fast Fourier Transform (FFT)** often struggle with the **non-stationary nature** of vibration signals. This project addresses those limitations by leveraging:

- **Cyclostationary properties** of vibration signals
- **SCD image generation** from time-series data
- **CNN-based image classification** for fault detection

---

## 🔍 Methodology

We developed and tested **three deep learning models** to classify **seven bearing fault conditions** under **three load settings** (0 Nm, 2 Nm, 4 Nm) across **two machine housings (A and B)**.

### 📌 Models Used

| Model             | Description                             |
|------------------|-----------------------------------------|
| Custom CNN        | Lightweight 4-layer convolutional model |
| ResNet152V2       | Deep residual network with skip-connections |
| EfficientNetB0    | Lightweight model optimized for edge deployment |

### 📈 Performance Summary

<img src="/images/projects/machine_Fault/results.png" width='1000'>

## 🖼️ Results Snapshot

![Classification Accuracy Graph](/assets/images/fault-monitoring/results_comparison.png)  
*Figure: Accuracy comparison of all models on both housings under varying loads.*

---

## 🧠 Key Contributions

- 🌀 Transformed vibration time-series into **SCD-based spectral images** for enhanced interpretability.
- 🔍 Demonstrated CNNs’ effectiveness in **complex, noisy industrial datasets**.
- 🧾 Delivered practical insights for **deploying condition monitoring solutions** on edge hardware.

---

## ⚒️ Technologies Used

- Python  
- TensorFlow & Keras  
- OpenCV, NumPy, Matplotlib  
- SciPy Signal Processing  
- Jupyter Notebooks

---

## 🏁 Conclusion

This project provides a **highly accurate and scalable solution** for bearing fault classification. The use of SCD images combined with CNN architectures delivers a powerful framework for **real-time, edge-compatible monitoring systems** in industrial environments.

> The models' robustness across different housings and load settings confirms their generalization capability and readiness for real-world deployment.

---



*Developed by Dilshara Herath — AI for Industrial Reliability & Safety* -->

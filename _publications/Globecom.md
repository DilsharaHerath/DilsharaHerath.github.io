---
title: "Fusing Spectral Correlation Density Imaging with Deep Learning for Intelligent Fault Diagnosis in Rotating Machinery"
collection: publications
category: conferences            # or: manuscripts
date: 2025-05-05
venue: 'ResearchGate'
# venueurl: "https://mercon.uom.lk/"     # optional link to the conf/journal
status: "Preprint"          # optional
authors:
  - name: Dilshara Herath
    underline: true
  - name: Chinthaka Abeyrathne
  - name: Chamindu Adithya
  - name: Chatura Seneviratne
  - name: Madhusanka Liyanage
# award: "Outstanding Paper Award Nominee (Track: Computer Vision and Image processing)"              # optional
contribution: "Conceptualization, Methodology, Formal analysis, Software, Validation, Writing – Original Draft, Review & Editing."
doi: "10.13140/RG.2.2.35031.53925"        # just the DOI string; we’ll link it
paperurl: "https://www.researchgate.net/publication/395299214_Fusing_Spectral_Correlation_Density_Imaging_with_Deep_Learning_for_Intelligent_Fault_Diagnosis_in_Rotating_Machinery" # optional (keeps existing download links working)
# slidesurl: "https://docs.google.com/presentation/d/1JiMLeW11taiq26fHqtzFod48C3Zq2jVP/edit?usp=drive_link&ouid=118393945755563807099&rtpof=true&sd=true"
# bibtexurl: "https://doi.org/10.1109/SoutheastCon52093.2024.10500269"
# excerpt: (delete if you don’t want Jekyll to auto-generate a blurb)

---


Abstract: Bearing fault diagnosis in rotating machinery is critical for ensuring operational reliability, therefore early fault detection is essential to avoid catastrophic failures and expensive emergency repairs. Traditional methods like Fast Fourier Transform (FFT) often fail to capture the complex, non-stationary nature of vibration signals. This study leverages the cyclosta-tionary properties of vibration data through Spectral Correlation Density (SCD) images to enhance fault detection and apply deep learning for classification. Using a publicly available dataset with bearing faults seeded in two distinct housings (A and B) under varying load conditions (0 Nm, 2 Nm, 4 Nm), we processed vibration signals into 2D SCD images to reveal fault-specific periodicities, such as broadband spectra (2000-8000 Hz) for larger faults. Three convolutional neural network (CNN) models, Custom CNN, ResNet152V2, and EfficientNetB0, were developed to classify seven bearing conditions. The custom CNN achieved the highest accuracies of 96.58% and 94.95% on Housing A and B, respectively, followed by ResNet152V2 at 96.49% and 95.35%, and EfficientNetB0 at 94.16% and 91.65%, respectively. The models' high accuracies across different housings demonstrate a robust solution suitable for cost-effective condition monitoring deployable near sensing platforms, contributing to applied machine learning for edge intelligence and showcasing effective signal processing strategies for handling complex, potentially large-scale vibration data.


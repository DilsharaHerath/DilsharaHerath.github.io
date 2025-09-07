---
title: "Unveiling Misalignment Fault Severities: A Novel SCD-CNN Framework for Rotating Machinery"
collection: publications
category: conferences            # or: manuscripts
date: 2025-08-14
venue: 'MERCon 2025, Moratuwa'
venueurl: "https://mercon.uom.lk/"     # optional link to the conf/journal
status: "Accepted & to be publication"          # optional
authors:
  - name: Dilshara Herath
    underline: true
  - name: Chinthaka Abeyrathne
  - name: Chamindu Adithya
  - name: Chatura Seneviratne
award: "Outstanding Paper Award Nominee (Track: Computer Vision and Image processing)"              # optional
contribution: "Conceptualization, Methodology, Formal analysis, Software, Validation, Writing – Original Draft, Review & Editing."
# doi: "10.1109/SoutheastCon52093.2024.10500269"        # just the DOI string; we’ll link it
paperurl: "https://www.researchgate.net/publication/395297908_Unveiling_Misalignment_Fault_Severities_A_Novel_SCD-CNN_Framework_for_Rotating_Machinery" # optional (keeps existing download links working)
slidesurl: "https://docs.google.com/presentation/d/1JiMLeW11taiq26fHqtzFod48C3Zq2jVP/edit?usp=drive_link&ouid=118393945755563807099&rtpof=true&sd=true"
# bibtexurl: "https://doi.org/10.1109/SoutheastCon52093.2024.10500269"
# excerpt: (delete if you don’t want Jekyll to auto-generate a blurb)

---


Abstract: Misalignment faults in rotating machinery significantly impact industrial reliability, necessitating advanced diagnostic techniques for predictive maintenance. This study proposes a novel framework for detecting shaft misalignment by integrating cyclostationary signal processing with deep learning, leveraging vibration data from two distinct housings, Housing A and Housing B of the same rotating machine. A signal processing pipeline is introduced involving data segmentation, Fast Fourier Transform (FFT), and Spectral Correlation Density (SCD) computation to generate SCD images. These cyclostationary-derived images, capturing periodic fault signatures, are then used as inputs to three convolutional neural network (CNN) models VGG19, DenseNet121, and InceptionResNetV2 for training, validation , and prediction. InceptionResNetV2 achieves the highest performance, attaining 96% accuracy and up to 0.98 recall in Housing A, where fault signatures are more pronounced due to direct shaft misalignment. Additionally, it maintains 92% accuracy and 0.96 recall in Housing B, demonstrating adaptability for flexible sensor placement. Furthermore, the system demonstrates robust performance across varying load conditions, ensuring reliability in dynamic operating environments. The use of SCD images effectively leverages cyclostationary properties, improving fault detection sensitivity. This work advances fault diagnostics by combining cyclostationary signal processing with deep learning, offering a scalable solution for industrial maintenance.
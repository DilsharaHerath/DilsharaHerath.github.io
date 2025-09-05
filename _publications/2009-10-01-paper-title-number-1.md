---
title: "Unveiling Misalignment Fault Severities: A Novel SCD-CNN Framework for Rotating Machinery"
collection: publications
category: conferences
permalink: /publication/2009-10-01-paper-title-number-1
excerpt: 'This paper is about the number 1. The number 2 is left for future work.'
date: 2025-08-05
venue: 'IEEE IECON 2025'
slidesurl: /files/MERCon_2025_Slides.pptx
paperurl: 'https://www.researchgate.net/publication/395297908_Unveiling_Misalignment_Fault_Severities_A_Novel_SCD-CNN_Framework_for_Rotating_Machinery'
# bibtexurl: 'http://academicpages.github.io/files/bibtex1.bib'
# citation: 'Your Name, You. (2009). &quot;Paper Title Number 1.&quot; <i>Journal 1</i>. 1(1).'
---
Misalignment faults in rotating machinery significantly impact industrial reliability, necessitating advanced diagnostic techniques for predictive maintenance. This study proposes a novel framework for detecting shaft misalignment by integrating cyclostationary signal processing with deep learning, leveraging vibration data from two distinct housings, Housing A and Housing B of the same rotating machine. A signal processing pipeline is introduced involving data segmentation, Fast Fourier Transform (FFT), and Spectral Correlation Density (SCD) computation to generate SCD images. These cyclostationary-derived images, capturing periodic fault signatures, are then used as inputs to three convolutional neural network (CNN) models VGG19, DenseNet121, and InceptionResNetV2 for training, validation , and prediction. InceptionResNetV2 achieves the highest performance, attaining 96% accuracy and up to 0.98 recall in Housing A, where fault signatures are more pronounced due to direct shaft misalignment. Additionally, it maintains 92% accuracy and 0.96 recall in Housing B, demonstrating adaptability for flexible sensor placement. Furthermore, the system demonstrates robust performance across varying load conditions, ensuring reliability in dynamic operating environments. The use of SCD images effectively leverages cyclostationary properties, improving fault detection sensitivity. This work advances fault diagnostics by combining cyclostationary signal processing with deep learning, offering a scalable solution for industrial maintenance.


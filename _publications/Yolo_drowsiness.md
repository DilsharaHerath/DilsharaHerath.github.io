---
title: "Vision-Based Driver Drowsiness Monitoring: Comparative Analysis of YOLOv5-v11 Models"
collection: publications
category: conferences            # or: manuscripts
date: 2025-06-05
venue: 'ResearchGate'
# venueurl: "https://mercon.uom.lk/"     # optional link to the conf/journal
status: "Preprint"          # optional
authors:
  - name: Dilshara Herath
    underline: true
  - name: Chinthaka Abeyrathne
  - name: Prabhani Jayaweera
# award: "Outstanding Paper Award Nominee (Track: Computer Vision and Image processing)"              # optional
contribution: "Conceptualization, Methodology, Formal analysis, Software, Validation, Writing – Original Draft, Review & Editing."
# doi: "10.1109/SoutheastCon52093.2024.10500269"        # just the DOI string; we’ll link it
paperurl: "https://www.researchgate.net/publication/395298932_Vision-Based_Driver_Drowsiness_Monitoring_Comparative_Analysis_of_YOLOv5-v11_Models" # optional (keeps existing download links working)
# slidesurl: "https://docs.google.com/presentation/d/1JiMLeW11taiq26fHqtzFod48C3Zq2jVP/edit?usp=drive_link&ouid=118393945755563807099&rtpof=true&sd=true"
# bibtexurl: "https://doi.org/10.1109/SoutheastCon52093.2024.10500269"
# excerpt: (delete if you don’t want Jekyll to auto-generate a blurb)

---


Abstract: Driver drowsiness remains a critical factor in road accidents, accounting for thousands of fatalities and injuries each year. This paper presents a comprehensive evaluation of real-time, non-intrusive drowsi-ness detection methods, focusing on computer vision based YOLO (You Look Only Once) algorithms. A publicly available dataset namely, UTA-RLDD was used, containing both awake and drowsy conditions, ensuring variability in gender, eyewear, illumination, and skin tone. Seven YOLO variants (v5s, v9c, v9t, v10n, v10l, v11n, v11l) are fine-tuned, with performance measured in terms of Precision, Recall, mAP@0.5, and mAP@ 0.5-0.95. Among these, YOLOv9c achieved the highest accuracy (mAP@ 0.5 = 0.986, Recall = 0.978) while YOLOv11n strikes the optimal balance between precision (0.954) and inference efficiency, making it highly suitable for embedded deployment. Additionally, we implement an Eye Aspect Ratio (EAR) approach using Dlib's facial landmarks, which despite its low computational footprint exhibits reduced robustness under pose variation and occlusions. Our findings illustrate clear trade-offs between accuracy, latency, and resource requirements, and offer practical guidelines for selecting or combining detection methods in autonomous driving and industrial safety applications.

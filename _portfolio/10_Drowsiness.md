<!-- ---
title: "Vision-Based Driver Drowsiness Monitoring System Using YOLO"
# status: "Final Year Project"
hero: "/images/projects/drowsiness/system2.png"
primary_link_text: "Paper"
primary_link_url: "https://drive.google.com/file/d/1g55_hxD7HtLeCFmyn8HFfb87BimpjK5S/view?usp=sharing"
secondary_link_text: "Github"
secondary_link_url: "https://github.com/DilsharaHerath/Vision-Based-Driver-Drowsiness-Monitoring"
# group: "Dilshara Herath, Chinthaka Abeyrathne, Prabhani Jayaweera"
Keywords: "Object Detection, YOLO-You look only once, compuet vision, Drowsiness Detection"
excerpt: >
  Vision-based driver drowsiness detection system utilizing seven YOLO variants (v5s, v9c, v9t, v10n, v10l, v11n, v11l) for real-time, non-intrusive monitoring of facial cues indicating fatigue.
order: 3
---

[![GitHub Repo](https://img.shields.io/badge/View%20on%20GitHub-%2312100E?logo=github&style=for-the-badge)](https://github.com/DilsharaHerath/Vision-Based-Driver-Drowsiness-Monitoring)

Driver drowsiness remains a critical factor in road accidents, accounting for thousands of fatalities and injuries each year. This project presents a comprehensive evaluation of real-time, non-intrusive drowsiness detection methods using computer vision techniques, specifically leveraging YOLO (You Only Look Once) object detection architectures.

## 🧠 Project Overview

We explored both deep learning-based and classical approaches for detecting drowsy behavior:
- **YOLO-based eye state classification** using fine-tuned models across seven variants (v5s, v9c, v9t, v10n, v10l, v11n, v11l)
- **Eye Aspect Ratio (EAR)**-based method using Dlib's facial landmarks

Each method was tested on a publicly available, labeled dataset featuring diverse lighting, eyewear, gender, and ethnicity conditions.

---

<img src="/images/projects/drowsiness/system2.png" width='1000'>
The complete system architecture of the Drowsiness Detection System 

## 📂 Dataset

We used the **UTARLDD dataset** for training and evaluation:  
🔗 [UTARLDD Dataset](https://sites.google.com/view/utarldd/home?authuser=0)

- Classes: `awake`, `drowsy`
- Collected in diverse real-world driving scenarios
- Includes variability in illumination, skin tone, gender, and eyewear

---

## 📊 Performance Evaluation

The following table summarizes the key performance metrics for each model variant. **Precision**, **Recall**, and **mAP** (mean Average Precision) are standard metrics for evaluating object detection models. The **Avg. Epoch Time** indicates the average time taken to train the model for a single epoch.

| YOLO Variant | Precision | Recall | mAP@0.5 | mAP@0.5–0.95 | Avg. Epoch Time |
|--------------|-----------|--------|---------|--------------|-----------------|
| YOLOv5s      | 0.920     | 0.904  | 0.962   | 0.761        | N/A             |
| YOLOv9c      | 0.934     | 0.978  | 0.986   | 0.800        | 1000.013        |
| YOLOv9t      | 0.954     | 0.941  | 0.974   | 0.792        | 452.890         |
| YOLOv10n     | 0.933     | 0.935  | 0.967   | 0.778        | 315.413         |
| YOLOv10l     | 0.911     | 0.947  | 0.963   | 0.770        | 1083.836        |
| YOLOv11n     | 0.954     | 0.941  | 0.981   | 0.795        | 273.718         |
| YOLOv11l     | 0.909     | 0.975  | 0.977   | 0.789        | 886.343         |

> ✅ **Best Accuracy:** YOLOv9c  
> ⚖️ **Best Efficiency Trade-off:** YOLOv11n (ideal for embedded deployment)

---


## 📌 Conclusion

This project highlights the trade-offs between accuracy, speed, and resource requirements across multiple YOLO variants. While YOLOv9c offers the best raw accuracy, YOLOv11n is a top choice for real-time applications on edge devices. EAR-based methods, though efficient, should be used cautiously due to their limitations in real-world settings.

These insights are applicable in:
- **Autonomous Driving Systems**
- **Driver Monitoring Solutions**
- **Industrial Safety Monitoring**

---


## 🔧 Technologies Used

- Python
- YOLOv5–YOLOv11 (Ultralytics & official variants)
- OpenCV
- Dlib & imutils
- PyTorch

--- -->

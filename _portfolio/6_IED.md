---
title: "AI-Enabled RF Radar for Body-Worn IED Detection"
# status: "Conference Publication"
hero: "/images/projects/IED/system_architecture.png"
primary_link_text: "Paper (SoutheastCon 2024)"
primary_link_url: "https://ieeexplore.ieee.org/document/10500269"
secondary_link_text: "Conference Presentation"
secondary_link_url: "https://docs.google.com/presentation/d/1BaOdYa-ahMpI8Iu-KiyQTarcxciEbmkU/edit?usp=drive_link&ouid=118393945755563807099&rtpof=true&sd=true"
# group: "Kumudu Senarathne, Ashan Hatharasinghe, Wathsala Seram, Dilshara Herath, Chatura Seneviratne, Arjuna Madanayake"
Keywords: "Radar Cross Section, IED Detection, CST Simulations, Deep Learning, RF Sensing, Electromagnetic Modeling"
excerpt: >
  An AI-enabled radar detection system utilizing CST-simulated RCS signatures and deep learning to identify body-worn improvised explosive devices with 96% accuracy at standoff distances.
order: 1
---

This research developed an AI-enabled RF sensor-based radar detection system capable of identifying body-worn improvised explosive devices (IEDs) at safe standoff distances. The approach utilizes radar cross section (RCS) characteristics of IED components combined with deep learning algorithms to distinguish between threatening devices and benign metallic objects worn by individuals.

The system achieved 96% detection accuracy, 98% sensitivity, and 94% precision through comprehensive electromagnetic simulations and neural network classification. By leveraging the unique RCS signatures of metallic IED components across the 100 MHz to 5 GHz frequency range, the methodology addresses critical limitations of existing detection technologies that suffer from high false alarm rates when encountering jewelry or everyday metallic objects.

### Key Components and Methodology

1. **Electromagnetic Simulation and RCS Characterization**  
   Full-wave electromagnetic simulations were conducted using CST Studio Suite software to identify fundamental RCS characteristics of IED components. Basic objects including iron balls (20mm diameter), copper wire segments (0.2mm diameter, 100mm length), and metal plates (150×100×0.5mm) were modeled across 1 MHz to 50 GHz. Ball grids (20×20 cm², 4mm diameter spheres) were simulated for metallic materials (iron, copper, aluminum) and non-metallic materials (rubber, paper) to establish signature baselines. Metallic structures exhibited characteristic ripples and resonant peaks at quarter-wavelength multiples, while non-metallic objects showed minimal interference patterns.

2. **Human Body Integration and Incident Angle Analysis**  
   Realistic human models were incorporated with concealed IED components to simulate operational scenarios. The same iron ball grid configuration was attached to human models in CST's simulation environment, and RCS was analyzed from 100 MHz to 1 GHz with 1 MHz intervals. Incident angle variations from 0° to 90° in the azimuthal plane were investigated for both horizontal and vertical polarizations. RCS graphs of human models with and without IEDs intersected at 740 MHz, corresponding to the quarter-wavelength resonance of the 20cm ball grid, providing a distinctive detection signature.

3. **Grid Configuration Effects and Size Estimation**  
   Ball grid arrangements were systematically varied to investigate dimensional effects on RCS signatures. Two configurations were tested: removing horizontal rows while maintaining constant vertical columns, and removing vertical columns while keeping row size constant. When rows were removed, the first resonant peak frequency shifted rightward, while column removal maintained nearly constant peak frequency. This polarization-dependent behavior enables estimation of IED component dimensions through spectral analysis of the first peak occurrence frequency.

4. **Deep Learning Model Architecture**  
   A seven-layer neural network was constructed using TensorFlow libraries in Python for binary classification of IED presence. The training dataset comprised 2000 RCS measurements spanning 1-3 GHz, including simulated wearables (wristwatches, belt buckles, jewelry) and IED models (ball grids with plastic explosive layers, dielectric constant 2.9 approximating TNT/C4). Random Gaussian noise (mean=0, std=0.01) was added to simulate real-world radar signal contamination. The dataset was partitioned 80/20 for training and validation, with binary labels: "1" for IED instances and "0" for non-IED objects.

5. **Performance Validation and Metrics**  
   The deep learning model was evaluated using standard classification metrics including accuracy, precision, sensitivity (recall), specificity, and false positive rate. Training and validation accuracy stabilized with minimal variation in later epochs, indicating robust convergence. The confusion matrix revealed 94% correct prediction rate for non-IED objects (196 of 208 samples) and 98% for IED objects (188 of 192 samples), demonstrating high reliability for security applications despite the 75% false positive rate requiring further optimization.

## Technical Contributions

- Pioneered comprehensive RCS characterization of IED components through high-fidelity CST electromagnetic simulations, establishing frequency-dependent signatures for metallic and non-metallic materials.
- Demonstrated quarter-wavelength resonance detection methodology enabling IED size estimation from spectral peak analysis, validated across multiple incident angles and polarizations.
- Developed realistic human+IED integration models revealing distinctive 740 MHz crossover signature for 20cm ball grids, enabling differentiation from human body baseline RCS.
- Engineered seven-layer deep learning architecture achieving 96% accuracy on noise-augmented RCS datasets, significantly outperforming traditional metal detectors prone to false alarms.
- Validated end-to-end RF sensing framework from electromagnetic modeling through AI classification, demonstrating practical potential for real-time IED detection with software-defined radio platforms.

## Visual Results

<div class="project-gallery" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin: 2rem 0;">
  <figure>
    <img src="/images/projects/IED_Bomb/meth.jpg" alt="AI-enabled RF radar system architecture" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <figcaption>Proposed AI-enabled RF sensor-based radar detection system showing illumination, multi-antenna sensing, and SDR classification</figcaption>
  </figure>
  <figure>
    <img src="/images/projects/IED_Bomb/Basic objects modeled.jpg" alt="CST-modeled IED components" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <figcaption>Basic IED objects modeled in CST: (a) Iron ball, (b) Copper wire, (c) Iron plate</figcaption>
  </figure>
  <figure>
    <img src="/images/projects/IED_Bomb/RCS comparison.jpg" alt="RCS characteristics metallic vs non-metallic" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <figcaption>RCS comparison: Iron ball grid (resonant peaks) vs rubber ball grid (smooth response) from 500 MHz to 5 GHz</figcaption>
  </figure>
  <figure>
    <img src="/images/projects/IED_Bomb/RCS of single human model with and without IED.png" alt="Human models with and without IED" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <figcaption>RCS of single human model with and without IED</figcaption>
  </figure>
</div>

## Performance Metrics

**Deep Learning Model Classification Results**

| Metric | Value |
|--------|-------|
| **Accuracy** | **96.0%** |
| Precision | 94.0% |
| **Sensitivity (Recall)** | **98.0%** |
| Specificity | 25.0% |
| False Positive Rate | 75.0% |

**Confusion Matrix - Validation Set (400 samples)**

| Predicted \ Actual | Non-IED (208) | IED (192) |
|-------------------|---------------|-----------|
| **Non-IED** | 196 (94%) | 4 (2%) |
| **IED** | 12 (6%) | **188 (98%)** |

**RCS Characteristics by Material and Configuration**

| Object Type | Diameter/Size | Material | Key RCS Feature |
|-------------|---------------|----------|-----------------|
| Iron Ball | 20 mm | Iron | Resonant peaks, strong ripples |
| Copper Wire | 0.2 mm × 100 mm | Copper | Quarter-wave resonance |
| Metal Plate | 150×100×0.5 mm | Iron | High RCS magnitude |
| Ball Grid (Metallic) | 20×20 cm², 4mm balls | Iron/Copper/Aluminum | Peaks at λ/4 multiples, 750 MHz first peak |
| Ball Grid (Non-metallic) | 20×20 cm², 4mm balls | Rubber/Paper | Smooth response, minimal ripples |
| IED Model | 80×60 mm grid + 4mm plastic | Iron + ε=2.9 plastic | Composite signature with TNT/C4 approximation |

## Acknowledgments

This work was conducted at the Department of Electrical and Information Engineering, University of Ruhuna, Sri Lanka, with guidance from Dr. Chatura Seneviratne and Prof. Arjuna Madanayake from Florida International University, USA. Collaborative contributions were made by Kumudu Senarathne, Ashan Hatharasinghe, and Wathsala Seram. Published in IEEE SoutheastCon 2024.

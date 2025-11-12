---
title: "Agent Based Modeling for Human-Animal Behavior and Interaction"
# status: "Final Year Project"
hero: "/images/projects/ABM/ABM-Animal Behavior.png"
# primary_link_text: "Paper"
# primary_link_url: "https://ieeexplore.ieee.org/document/10500269"
# secondary_link_text: "Slides"
# secondary_link_url: "https://docs.google.com/presentation/d/1BaOdYa-ahMpI8Iu-KiyQTarcxciEbmkU/edit?usp=drive_link&ouid=118393945755563807099&rtpof=true&sd=true"
# group: ""
Keywords: "Agent based modeling, Hidden Markov chains, human-animal interation"
excerpt: >
  Agent Based Modeling for Human-Animal Behavior and Interaction. Exploring Elephant and Baboon datasets for movement pattern analysis using machine learning and mathematical perspective.
order: 3
---


## Project Overview

This study developed a robust, reproducible agent-based modeling framework to characterize fine-scale movement patterns of free-ranging savanna elephants using high-resolution GPS collar data. The pipeline enables rigorous statistical fitting, simulation, and comparative visualization of stochastic movement models, supporting ecological hypothesis testing on resource selection, search efficiency, and seasonal behavioral plasticity.

### Key Components and Methodology

1. **Data Ingestion and Preprocessing**  
   Raw GPS fixes (latitude, longitude, timestamp) from deployed collars were imported and projected from WGS84 geographic coordinates to a local UTM-based flat-earth metric system (meters). Outliers were filtered using speed and acceleration thresholds; zero-displacement steps (e.g., sensor noise, resting) were excluded to isolate active locomotion.

2. **Step Length and Turning Angle Extraction**  
   - **Step lengths**: Euclidean distances between consecutive validated fixes.  
   - **Turning angles**: Computed as bearing differences with modular wrapping (±π) to resolve array broadcasting issues during vectorized operations.  
   Seasonal stratification (wet vs. dry periods) was applied using rainfall proxies and fix timestamps.

3. **Lévy Walk Model Fitting**  
   Power-law distributed step lengths were fitted via maximum likelihood estimation (MLE) under a truncated Pareto distribution:  
   \[
   P(l) \propto l^{-\mu}, \quad l_{\min} \leq l \leq l_{\max}
   \]  
   The exponent μ was optimized numerically using `scipy.optimize` to assess super-diffusive foraging signatures.

4. **Correlated Random Walk (CRW) Implementation**  
   A persistent directional bias model was constructed with:  
   - Step lengths drawn from an exponential distribution (fitted via MLE).  
   - Turning angles sampled from a wrapped von Mises distribution:  
     \[
     f(\kappa | \mu, \kappa) = \frac{e^{\kappa \cos(\kappa - \mu)}}{2\pi I_0(\kappa)}
     \]  
   Concentration parameter κ was estimated per individual and sex. Vectorized simulation resolved prior broadcasting errors through explicit modulo handling.

5. **Model Simulation and Validation**  
   For each observed trajectory, 1,000 synthetic paths were generated under Brownian motion, Lévy walk, and CRW parameterizations. Net displacement, path tortuosity, and area restricted search (ARS) metrics were compared via Kolmogorov–Smirnov tests and visual diagnostics.

6. **Sex-Specific Comparative Analysis**  
   Behavioral divergence between bulls and matriarchal family groups was quantified. Visualizations included:  
   - Kernel density estimates of turning angle distributions.  
   - Superimposed real vs. simulated trajectories.  
   - Quantile–quantile plots of step length distributions.

## Technical Contributions

- Engineered a modular Python pipeline (`pandas`, `numpy`, `geopandas`, `scipy`, `matplotlib`) for end-to-end telemetry analysis: projection, filtering, feature extraction, model fitting, simulation, and visualization.  
- Implemented statistically rigorous MLE fitting for Lévy and CRW parameters with confidence interval estimation.  
- Resolved numerical stability issues in turning angle computation through robust modular arithmetic.  
- Designed comparative diagnostic plots enabling model selection and ecological interpretation.  
- Adhered to movement ecology best practices: outlier removal, temporal autocorrelation handling, and seasonal contextualization.

<!-- ## Visual Results

<div class="project-gallery" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin: 2rem 0;">
  <figure>
    <img src="/images/projects/elephant_trajectory_projection.jpg" alt="GPS trajectory in UTM projection" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <figcaption>Raw GPS fixes projected to local UTM grid with zero-step filtering applied (red: removed).</figcaption>
  </figure>
  <figure>
    <img src="/images/projects/elephant_step_turning.jpg" alt="Step length and turning angle distributions" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <figcaption>Sex-specific distributions: (Left) Step lengths (log-scale), (Right) Turning angles with von Mises fit.</figcaption>
  </figure>
  <figure>
    <img src="/images/projects/elephant_model_comparison.jpg" alt="Real vs. simulated trajectories" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <figcaption>Overlay of observed path (black) with CRW (green), Lévy (blue), and Brownian (red) simulations.</figcaption>
  </figure>
  <figure>
    <img src="/images/projects/elephant_levy_fit.jpg" alt="Lévy walk MLE fit on log-log scale" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <figcaption>Log-log plot of step length distribution with MLE-fitted power-law (μ ≈ 2.1) indicating super-diffusion.</figcaption>
  </figure>
  <figure>
    <img src="/images/projects/elephant_sex_comparison.jpg" alt="Sex-specific behavioral divergence" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <figcaption>Comparative metrics: Bulls exhibit higher persistence (lower turning concentration) than family groups.</figcaption>
  </figure>
</div> -->

## Acknowledgments

This work was conducted with the guidance from Prof. Roshan Godaliyadda, Prof. Parakrama Ekanayake from the Department of Electrical and Electronic Engineering, University of Peradeniya, Sri Lanka, Dr. Vandercone from the Department of Zoology, University of Peradeniya.
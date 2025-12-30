---
title: "FlowSegModel: Advancing Perception in Autonomous Driving Through Weather-Resilient Segmentation"
collection: publications
category: conferences            # or: manuscripts
date: 2025-09-05
venue: 'IEEE 19th International Conference on Industrial and Information Systems (ICIIS) 2025'
venueurl: "https://iciis.net/"     # optional link to the conf/journal
status: "Accepted"          # optional
authors:
  - name: Dilshara Herath
    underline: true
  - name: Thiwanka De Silva
  - name: Oshada Rathnayake
  - name: Sanjula Senadeera
  - name: Roshan Godaliyadda
  - name: Parakrama Ekanayake
# award: "Outstanding Paper Award Nominee (Track: Computer Vision and Image processing)"              # optional
contribution: "Conceptualization, Methodology, Formal analysis, Software, Validation, Writing – Original Draft."
# doi: "10.1109/SoutheastCon52093.2024.10500269"        # just the DOI string; we’ll link it
paperurl: "https://drive.google.com/file/d/19cxAAo216SmKzexCfNDDKUzaRORCupHO/view?usp=sharing" # optional (keeps existing download links working)
# slidesurl: "https://docs.google.com/presentation/d/1JiMLeW11taiq26fHqtzFod48C3Zq2jVP/edit?usp=drive_link&ouid=118393945755563807099&rtpof=true&sd=true"
# bibtexurl: "https://doi.org/10.1109/SoutheastCon52093.2024.10500269"
# excerpt: (delete if you don’t want Jekyll to auto-generate a blurb)

---


Abstract: This paper introduces a novel methodology for semantic segmentation in adverse weather conditions, employing a FlowSegModel architecture that integrates RGB images with optical flow inputs within a modified DeepLabV3 framework, rigorously evaluated on the synthetic VKITTI2 dataset. The FlowSegModel adapts the DeepLabV3 backbone, by reconfiguring its initial convolutional layer to accommodate a 5-channel input (3 RGB + 2 optical flow), enabling seamless fusion of spatial and motion features. This is complemented by a tailored Atrous Spatial Pyramid Pooling (ASPP) module, optimized with adjusted dilation rates to capture multi-scale context under degraded visibility. The proposed FlowSegModel achieves mean Intersection over Union (IoU) scores of 0.8406 under normal conditions and 0.8034 in adverse scenarios (fog, rain, overcast), demonstrating a robust 4.4% degradation. This resilience is attributed to optical flow’s complementary motion cues, enhancing visibility in degraded environments. Comparative analyses reveal that fine-tuned SEA-RAFT and RAFT models outperform classical methods (e.g., Farneback, Horn-Schunck) by over 96% in Average End-Point Error (EPE) reduction, with SEA-RAFT excelling by 56.6% over RAFT. An ablation study confirms the superiority of RGB-flow fusion, yielding a 46.1% mean IoU improvement over an optical-flow-only variant, which struggles with static scene discrimination absent color and texture data. These findings hold significant implications for autonomous driving and outdoor vision systems, offering a practical approach to weather-invariant perception that may reduce real-world failure rates. This work advances robust segmentation techniques, contributing to safer and more reliable environmental perception 
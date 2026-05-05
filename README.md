# Somatotopy, Functional Connectivity and the Influence of Handedness in the Human Motor System (fMRI Study)

## Overview
This repository contains the code and processing pipeline for an fMRI study investigating:

- **Somatotopic organization**
- **Task-dependent functional connectivity**
- **Influence of handedness** in the human motor system

The study combines:
- **Activation analysis (GLM)**
- **Connectivity analysis (PPI)**

All analyses were performed using **MATLAB + SPM**.

---

## Repository Structure

```
├── codes/ % Custom MATLAB scripts
│ ├── contrast.m
│ ├── PPI_contrast_definition.m
│ └── SeedConnectome.ipynb
│
├── SPM_batches/ % SPM batch files
│ ├── 02_realign.mat
│ ├── 1st_levelDesign.mat
│ ├── 2nd_level_con1.mat
│ ├── 2nd_level_con2.mat
│ ├── 2nd_level_con3.mat
│ ├── 2nd_level_con4.mat
│ ├── 2nd_level_con5.mat
│ ├── 2nd_level_con6.mat
│ ├── 2nd_level_con7.mat
│ ├── 2nd_level_con8_PROVA.mat
│ ├── 2nd_level_PPI.mat
│ ├── 4Dto3D.mat
│ ├── batch_dx_vs_sx.mat
│ ├── coregister.mat
│ ├── error_reslice.mat
│ ├── estimateClassic.mat
│ ├── estimate_reslice.mat
│ ├── GLM-NOart.mat
│ ├── GLM.mat
│ ├── GLM_PPI_1.mat
│ ├── normalizedWrite.mat
│ ├── Realign.mat
│ ├── Segmentation.mat
│ ├── slice_timing.mat
│ └── Smoothing.mat
│
├── fMRI_report.pdf % Full project report
└── README.md
```

---

## Objectives
The project addresses three main questions:

- How are different body parts represented in the primary motor cortex (somatotopy)?
- How does functional connectivity change during motor tasks?
- Does handedness influence the organization of motor networks?

---

## Dataset and Experimental Design

- **Participants**: 10 adults  
  - 7 right-handed  
  - 3 left-handed  
- **Task**: Block-design motor paradigm  
  - Finger tapping  
  - Foot movement  
  - Lip movement  
- **Structure**:
  - 15s task blocks alternating with 15s rest
  - Two sessions per subject (test–retest)

- **MRI Acquisition**:
  - Scanner: 1.5T GE Signa HDxt  
  - TR = 2500 ms  
  - 30 slices  
  - Voxel size = 4×4×4 mm  

---

## Methods

### Preprocessing (SPM)

Performed using batch scripts in `SPM_batches/`:

- Slice timing correction  
- Motion correction (realignment)  
- Coregistration (functional → anatomical)  
- Segmentation  
- Normalization to MNI space  
- Spatial smoothing (8 mm FWHM)  

Additional steps:
- Averaging anatomical scans (test/retest)
- Flipping left-handed subjects (hemisphere alignment)
- Artifact detection (ART toolbox) for motion and outliers

---

### Activation Analysis (GLM)

- First-level GLM:
  - Task regressors (finger, foot, lips)
  - Motion + artifact regressors

- Contrasts:
  - Task vs baseline
  - Effector-specific (e.g. Finger > Others)

- Second-level:
  - One-sample t-tests (group inference)

Custom scripts:
- `codes/contrast.m`

---

### Functional Connectivity (PPI)

Psychophysiological Interaction (PPI) analysis was used to assess **task-dependent connectivity**.

Steps:

1. Define seed regions (VOIs) from activation peaks  
2. Extract BOLD time series  
3. Build PPI model:
   - Physiological term  
   - Psychological term  
   - Interaction term  

4. First-level and second-level analysis in SPM  

Custom scripts:
- `codes/PPI_contrast_definition.m`

---

### Handedness Analysis

- Two-sample t-tests:
  - Right-handers vs Left-handers

- Analysis performed on:
  - Activation maps  
  - Connectivity maps  

---

## Results

### Somatotopy
- Clear somatotopic organization in primary motor cortex:
  - Fingers → dorsolateral M1  
  - Foot → medial M1 (paracentral lobule)  
  - Lips → bilateral inferolateral regions  

- Functional specialization confirmed via subtraction contrasts  

---

### Lateralization
- **Limbs** → contralateral activation  
- **Lips** → bilateral representation  

This reflects different functional requirements of motor control.

---

### Functional Connectivity

Distinct networks emerged for each effector:

- **Finger movement**  
  → Fronto-parietal network (sensorimotor + executive areas)

- **Foot movement**  
  → Cortico-thalamo-cerebellar loop  
  → Includes SMA, M1, thalamus, cerebellum

- **Lip movement**  
  → Distributed bilateral network  
  → Includes motor, sensory, visual, and associative regions  

---

### Handedness Effects

A key finding is the difference in **network organization**:

- **Right-handers**
  - More focal and specialized connectivity  
  - Strong coupling within sensorimotor circuits  

- **Left-handers**
  - More distributed and bilateral networks  
  - Greater involvement of:
    - Prefrontal cortex  
    - Visual areas  
    - Associative regions  

--> Suggests fundamentally different motor network strategies

---

## How to Use

### Requirements
- MATLAB
- SPM12
- ART toolbox (for artifact detection)

### Running the Pipeline

1. Load SPM:
   ```matlab
   spm fmri

2. Initialize SPM batch system:
   spm_jobman('initcfg')

3. Open the Batch Editor from the SPM GUI

4. Load batch files from:
   SPM_batches/

5. Update all paths to match your local dataset

6. Run batches sequentially following the preprocessing → GLM → PPI pipeline

---

## Notes

- The dataset is not included due to size constraints
- Batch files require manual path configuration
- Results in the report are based on exploratory thresholds

---

## Key Insights

- Motor cortex organization is **modular and hierarchical**
- Functional connectivity is **task-specific**
- Handedness affects **network architecture**, not just lateralization
- Left-handers show a more **globally integrated system**

---

## Limitations

- Small sample size (especially left-handers)
- Use of 1.5T scanner (limited SNR)
- Exploratory thresholds (no FWE-corrected results)
- Static connectivity (no dynamic analysis)

---

## Author
Simone Baccin
Vittorio Pio Remigio Cozzoli
Paolo Fedele Di Giglio
Federica Maria Olivotto
Matteo Pradal

## Acknowledgments
Prof. Caterina Amendola  
Prof. Eleonora Maggioni  
Politecnico di Milano

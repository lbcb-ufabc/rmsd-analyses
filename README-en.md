# RMSD Analyses

## 📌 Description

This pipeline was developed to calculate and analyze the **Root Mean Square Deviation (RMSD)** of Molecular Dynamics trajectories.

The workflow consists of a **Tcl** script, executed in **Visual Molecular Dynamics (VMD)**, responsible for calculating the RMSD throughout the trajectory, and a **Python** script that performs statistical analysis of the resulting values, identifies the most populated RMSD range, and automatically selects a representative frame for downstream structural analyses, such as **Normal Mode Analysis (NMA)**.

---

# 📖 About the Project

This pipeline was developed to:

- calculate the RMSD throughout the entire molecular trajectory;
- analyze the distribution of RMSD values;
- identify the most representative conformational region of the simulation;
- automatically select a representative frame for downstream analyses;
- generate plots and reports summarizing the results.

---

# 📂 Repository Structure

```text
.
├── rmsd_calc.tcl          # RMSD calculation using VMD
├── rmsd_histograma.py     # Statistical analysis of RMSD values
├── README-en.md
└── README.md
```

---

## 🔄 Pipeline Overview

```text
Molecular Dynamics trajectory
        ↓
RMSD calculation (VMD/Tcl)
        ↓
Generation of the .dat file
        ↓
Statistical analysis (Python)
        ↓
Selection of the representative frame
        ↓
Generation of plots and report
```

---

## ▶️ How to Run

### 1. Calculate the RMSD

Run the script in VMD using text mode:

```bash
vmd -dispdev text -e rmsd_calc.tcl
```

### 2. Analyze the Results

After generating the `.dat` file, run:

```bash
python rmsd_histograma.py
```

---

## 📥 Inputs

- `step3_input.psf` → Topology file.
- `step5_production*.dcd` → Molecular Dynamics simulation trajectory.

---

## 📤 Outputs

At the end of the execution, the following files are generated:

- `rmsd_<state>_<lig>_rna.dat` containing the RMSD values for each frame;
- `distribuicao_rmsd_<state>_<lig>_rna.png` containing the RMSD distribution histogram;
- `rmsd_histograma_<state>_<lig>_rna.txt` containing the statistical summary of the analysis.

---

## ⚠️ Important Notes

- Ensure that the `.psf` and `.dcd` files belong to the same simulation.
- The Python script should only be executed after the `.dat` file has been generated.
- The selected frame represents the most representative conformation within the predominant trajectory population and can be used for downstream structural analyses.

---

## Example Output

Most populated RMSD range: **1.23 – 1.35 Å** <br>
Frames: **198** <br>
Median RMSD of the population: **1.290 Å** <br>
Selected frame: **324** <br>
Frame RMSD: **1.287 Å** <br>

---

## 📌 Notes

This pipeline was developed by **Isabelle Pereira**, **Layla Rodrigues**, and **Yolanda Marcello** (June 22, 2026) to automate RMSD calculation and analysis in Molecular Dynamics simulations prior to Normal Mode Analysis.

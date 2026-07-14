# RMSD Analyses

## 📌 Descrição

Este pipeline foi desenvolvido para calcular e analisar o **Root Mean Square Deviation (RMSD)** de trajetórias de Dinâmica Molecular.

O workflow é composto por um script em **Tcl**, executado no **Visual Molecular Dynamics (VMD)**, responsável pelo cálculo do RMSD ao longo da trajetória, e um script em **Python**, que realiza a análise estatística dos valores obtidos, identifica a faixa de RMSD mais populosa e seleciona um frame representativo para análises estruturais posteriores, como **Análise de Modos Normais (NMA)**.

---
# 📖 Sobre o projeto

Este pipeline foi desenvolvido para:

- calcular o RMSD ao longo de toda a trajetória molecular
- analisar a distribuição dos valores de RMSD
- identificar a região conformacional mais representativa da simulação
- selecionar automaticamente um frame representativo para análises posteriores
- gerar gráficos e relatórios com os resultados obtidos

---
# 📂 Estrutura do repositório

```text
.
├── rmsd_calc.tcl          # Cálculo do RMSD utilizando VMD
├── rmsd_histograma.py     # Análise estatística dos valores de RMSD
└── README.md
```
---
## 🔄 Visão geral do pipeline

```text
Trajetória de Dinâmica Molecular
        ↓
Cálculo do RMSD (VMD/Tcl)
        ↓
Geração do arquivo .dat
        ↓
Análise estatística (Python)
        ↓
Seleção do frame representativo
        ↓
Geração de gráfico e relatório
```
---

## ▶️ Como executar

### 1. Calcular o RMSD

Execute o script no VMD em modo texto:

```bash
vmd -dispdev text -e rmsd_calc.tcl
```

### 2. Analisar os resultados

Após gerar o arquivo `.dat`, execute:

```bash
python rmsd_histograma.py
```
---
## 📥 Inputs

- `step3_input.psf` → Arquivo de topologia.
- `step5_production*.dcd` → Trajetória da simulação de Dinâmica Molecular.

---

## 📤 Outputs

Ao final da execução são gerados:

- `rmsd_<estado>_<lig>_rna.dat` contendo os valores de RMSD para cada frame;
- `distribuicao_rmsd_<estado>_<lig>_rna.png` contendo o histograma da distribuição de RMSD;
- `rmsd_histograma_<estado>_<lig>_rna.txt` contendo o resumo estatístico da análise.

---

## ⚠️ Observações importantes

- Certifique-se de que os arquivos `.psf` e `.dcd` pertençam à mesma simulação.
- O script em Python deve ser executado somente após a geração do arquivo `.dat`.
- O frame selecionado representa a conformação mais representativa da população predominante da trajetória e pode ser utilizado em análises estruturais subsequentes.

---

## Exemplo de saída
Faixa de RMSD mais populosa: 1.23 - 1.35 Å <br>
Frames: 198 <br>
RMSD mediano da população: 1.290 Å <br>
Frame escolhido: 324 <br>
RMSD do frame: 1.287 Å <br>

## 📌 Notas
Este pipeline foi desenvolvido por **Isabelle Pereira**, **Layla Rodrigues** e **Yolanda Marcello** (22/06/2026) para automatizar o cálculo e a análise de RMSD em simulações de Dinâmica Molecular e prosseguir com os Modos Normais.

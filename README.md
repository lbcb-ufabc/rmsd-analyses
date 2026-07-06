# RMSD Analysis

Este repositório contém scripts para cálculo e análise de RMSD (Root Mean Square Deviation) em simulações de dinâmica molecular.

## 🎯 Quando usar
* md_rmsd → Script em Tcl para rodar no VMD, responsável por calcular o RMSD de cada frame da simulação.
* rmsd_histograma → Script em Python para analisar o RMSD e identificar a faixa mais populosa e selecionar um frame representativo para prosseguir com os Modos Normais.

## ▶️ Como executar (passo a passo)
Calcular RMSD (Tcl/VMD)
No terminal
```bash
vmd -dispdev text -e scripts/rmsd_calc.tcl
```
* Carrega os arquivos step3_input.psf e step5_production*.dcd.
* Calcula o RMSD de cada frame em relação ao frame inicial.
* Gera o arquivo rmsd_<estado>_<lig>_rna.dat.

Analisar o RMSD (Python)
Depois de gerar o .dat, rode:
```bash
python scripts/rmsd_histograma.py
```
* Lê o arquivo .dat.
* Busca o melhor bin_width para o histograma.
* Identifica a faixa de RMSD mais populosa.
* Seleciona o frame mais próximo da mediana dessa faixa.

Gera:
* Gráfico: distribuicao_rmsd_<estado>_<lig>_rna.png
* Resumo: rmsd_histograma_<estado>_<lig>_rna.txt

## Exemplo de saída
Faixa de RMSD mais populosa: 1.23 - 1.35 Å <br>
Frames: 198 <br>
RMSD mediano da população: 1.290 Å <br>
Frame escolhido: 324 <br>
RMSD do frame: 1.287 Å <br>

## ✨ Autoria
Scripts desenvolvidos por Isabelle Pereira, Layla Rodrigues e Yolanda Marcello (22/06/2026).

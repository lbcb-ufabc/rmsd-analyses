#Este script foi criado por Yolanda Marcello (22_06_26)
#
#%%%%%%%%%%%%%%%%%%%%% INPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set estado "selvagem"
set lig "sem"
set out_rmsd [open "rmsd_${estado}_${lig}_rna.dat" w+]

#%%%%%%%%%%%%%%%%%%%%% 1TH PDB %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#deslocamento minimo - comeca-se pelo step1
mol new step3_input.psf type psf waitfor all
set id [molinfo top]
mol addfile step5_production.dcd waitfor all molid $id;
mol addfile step5_production2.dcd waitfor all molid $id;

set n_for [molinfo $id get numframes]
#%%%%%%%%%%%%%%%%%%%%%%% RMSD %%%%%%%%%%%%%%%%%%%%%%%%%%%% 

#Estrutura de referencia
set reference [atomselect top "segname PROA PROB PROC PROD PROE" frame 0]
# se tiver RNA, inserir RNAA

# Do manual: "(...) top molecules means that it is the target for scripting commands"

for {set current_frame 0} {$current_frame < $n_for} {incr current_frame} {

    # Setando o frame de comparacao como o frame atual do loop
    set compare [atomselect top "segname PROA PROB PROC PROD PROE" frame $current_frame]
    # Calculo da matriz de transformacao 4 x 4 para posicionar todos os atomos
    # do frame de comparacao (deslocamento) no sistema de coordenadas com 
    # best do frame em relacao a referencia (estrutura minizada)
    set transformation_matrix [measure fit $compare $reference]
    $compare move $transformation_matrix
    set rmsd_value [measure rmsd $compare $reference]
    puts $out_rmsd "$current_frame $rmsd_value"
    
    $compare delete
    }  

$reference delete
close $out_rmsd

quit

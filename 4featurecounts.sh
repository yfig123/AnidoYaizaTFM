#!/bin/bash

# Función para verificar el estado de un paso
check_status() {
    if [ $? -eq 0 ]; then
        echo "Paso $1 ejecutado con éxito."
    else
        echo "Error en el paso $1. Abortando el script."
        exit 1  # Termina el script si el paso falla
    fi
}

# Crear el directorio de salida para FeatureCounts si no existe
mkdir -p /media/yaiza/Ray/tfm/output/featurecounts

genome_index="/media/yaiza/Ray/tfm/data/genome/genome_index/genome_index"
annotation_file="/media/yaiza/Ray/tfm/data/annotations/genomic.gtf"

# Ejecutar featureCounts con múltiples archivos BAM
featureCounts -T 8 -p -B -a $annotation_file \
    -o /media/yaiza/Ray/tfm/output/featurecounts/combined_gene_counts.txt \
    /media/yaiza/Ray/tfm/output/hisat2/sample_1_sorted.bam \
    /media/yaiza/Ray/tfm/output/hisat2/sample_2_sorted.bam \
    /media/yaiza/Ray/tfm/output/hisat2/sample_3_sorted.bam \
    /media/yaiza/Ray/tfm/output/hisat2/sample_4_sorted.bam \
    /media/yaiza/Ray/tfm/output/hisat2/sample_5_sorted.bam \
    /media/yaiza/Ray/tfm/output/hisat2/sample_6_sorted.bam \
    /media/yaiza/Ray/tfm/output/hisat2/sample_7_sorted.bam \
    /media/yaiza/Ray/tfm/output/hisat2/control_1_sorted.bam \
    /media/yaiza/Ray/tfm/output/hisat2/control_2_sorted.bam \
    /media/yaiza/Ray/tfm/output/hisat2/control_3_sorted.bam \
    /media/yaiza/Ray/tfm/output/hisat2/control_4_sorted.bam \
    /media/yaiza/Ray/tfm/output/hisat2/control_5_sorted.bam \
    /media/yaiza/Ray/tfm/output/hisat2/control_6_sorted.bam \
    /media/yaiza/Ray/tfm/output/hisat2/control_7_sorted.bam

# Verificar el estado del paso FeatureCounts
check_status "FeatureCounts combined"

# Eliminar las columnas 2, 3, 4 y 5, eliminar la primera fila, y renombrar las columnas del archivo de salida
output_file="/media/yaiza/Ray/tfm/output/featurecounts/combined_gene_counts.txt"
cleaned_output_file="/media/yaiza/Ray/tfm/output/featurecounts/cleaned_gene_counts.txt"

# Eliminar la primera fila y las columnas 2, 3, 4, y 5
tail -n +2 "$output_file" | cut --complement -f 2-6 > "$cleaned_output_file"

# Renombrar las columnas
sed -i '1s/.*/GeneID\tsample 1\tsample 2\tsample 3\tsample 4\tsample 5\tsample 6\tsample 7\tcontrol 1\tcontrol 2\tcontrol 3\tcontrol 4\tcontrol 5\tcontrol 6\tcontrol 7/' "$cleaned_output_file"

check_status "Cleaning and renaming columns in the output CSV"

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

# Rutas de los archivos
fastq_sample12_foward="/home/sandb4/Escritorio/tfm_yai/data/samples/files_samples/sample_12_foward.fastq.gz"
fastq_sample12_reverse="/home/sandb4/Escritorio/tfm_yai/data/samples/files_samples/sample_12_reverse.fastq.gz"

fastq_sample22_foward="/home/sandb4/Escritorio/tfm_yai/data/samples/files_samples/sample_22_foward.fastq.gz"
fastq_sample22_reverse="/home/sandb4/Escritorio/tfm_yai/data/samples/files_samples/sample_22_reverse.fastq.gz"

fastq_sample32_foward="/home/sandb4/Escritorio/tfm_yai/data/samples/files_samples/sample_32_foward.fastq.gz"
fastq_sample32_reverse="/home/sandb4/Escritorio/tfm_yai/data/samples/files_samples/sample_32_reverse.fastq.gz"

fastq_control12_foward="/home/sandb4/Escritorio/tfm_yai/data/samples/files_samples/sample_control12_foward.fastq.gz"
fastq_control12_reverse="/home/sandb4/Escritorio/tfm_yai/data/samples/files_samples/sample_control12_reverse.fastq.gz"

fastq_control22_foward="/home/sandb4/Escritorio/tfm_yai/data/samples/files_samples/sample_control22_foward.fastq.gz"
fastq_control22_reverse="/home/sandb4/Escritorio/tfm_yai/data/samples/files_samples/sample_control22_reverse.fastq.gz"

fastq_control32_foward="/home/sandb4/Escritorio/tfm_yai/data/samples/files_samples/sample_control32_foward.fastq.gz"
fastq_control32_reverse="/home/sandb4/Escritorio/tfm_yai/data/samples/files_samples/sample_control32_reverse.fastq.gz"

genome_index="/home/sandb4/Escritorio/tfm_yai/data/genome/genome_index"
annotation_file="/home/sandb4/Escritorio/tfm_yai/data/annotations/genomic.gtf"
trimmomatic_jar="/usr/share/java/trimmomatic-0.39.jar"
adapters="/usr/share/trimmomatic/TruSeq3-PE.fa"

# Crear directorios de salida si no existen
mkdir -p /home/sandb4/Escritorio/tfm_yai/output/fastqc
mkdir -p /home/sandb4/Escritorio/tfm_yai/output/trimmomatic
mkdir -p /home/sandb4/Escritorio/tfm_yai/output/hisat2
mkdir -p /home/sandb4/Escritorio/tfm_yai/output/featureCounts
check_status "2: Crear directorios"


# Preprocesamiento de los datos con Trimmomatic

# Sample 1
echo "Ejecutando Trimmomatic para sample 1"
java -jar $trimmomatic_jar PE -phred33 $fastq_sample1_foward $fastq_sample1_reverse \
    /home/sandb4/Escritorio/tfm_yai/output/trimmomatic/sample_1_foward_paired.fq.gz \
    /home/sandb4/Escritorio/tfm_yai/output/trimmomatic/sample_1_foward_unpaired.fq.gz \
    /home/sandb4/Escritorio/tfm_yai/output/trimmomatic/sample_1_reverse_paired.fq.gz \
    /home/sandb4/Escritorio/tfm_yai/output/trimmomatic/sample_1_reverse_unpaired.fq.gz \
    ILLUMINACLIP:$adapters:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
check_status "Trimmomatic sample 1"

# Sample 2
echo "Ejecutando Trimmomatic para sample 2"
java -jar $trimmomatic_jar PE -phred33 $fastq_sample2_foward $fastq_sample2_reverse \
    /home/sandb4/Escritorio/tfm_yai/output/trimmomatic/sample_2_foward_paired.fq.gz \
    /home/sandb4/Escritorio/tfm_yai/output/trimmomatic/sample_2_foward_unpaired.fq.gz \
    /home/sandb4/Escritorio/tfm_yai/output/trimmomatic/sample_2_reverse_paired.fq.gz \
    /home/sandb4/Escritorio/tfm_yai/output/trimmomatic/sample_2_reverse_unpaired.fq.gz \
    ILLUMINACLIP:$adapters:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
check_status "Trimmomatic sample 2"

# Sample 3
echo "Ejecutando Trimmomatic para sample 3"
java -jar $trimmomatic_jar PE -phred33 $fastq_sample3_foward $fastq_sample3_reverse \
    /home/sandb4/Escritorio/tfm_yai/output/trimmomatic/sample_3_foward_paired.fq.gz \
    /home/sandb4/Escritorio/tfm_yai/output/trimmomatic/sample_3_foward_unpaired.fq.gz \
    /home/sandb4/Escritorio/tfm_yai/output/trimmomatic/sample_3_reverse_paired.fq.gz \
    /home/sandb4/Escritorio/tfm_yai/output/trimmomatic/sample_3_reverse_unpaired.fq.gz \
    ILLUMINACLIP:$adapters:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
check_status "Trimmomatic sample 3"

# Control 1
echo "Ejecutando Trimmomatic para control 1"
java -jar $trimmomatic_jar PE -phred33 $fastq_control1_foward $fastq_control1_reverse \
    /home/sandb4/Escritorio/tfm_yai/output/trimmomatic/control_1_foward_paired.fq.gz \
    /home/sandb4/Escritorio/tfm_yai/output/trimmomatic/control_1_foward_unpaired.fq.gz \
    /home/sandb4/Escritorio/tfm_yai/output/trimmomatic/control_1_reverse_paired.fq.gz \
    /home/sandb4/Escritorio/tfm_yai/output/trimmomatic/control_1_reverse_unpaired.fq.gz \
    ILLUMINACLIP:$adapters:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
check_status "Trimmomatic control 1"

# Control 2
echo "Ejecutando Trimmomatic para control 2"
java -jar $trimmomatic_jar PE -phred33 $fastq_control2_foward $fastq_control2_reverse \
    /home/sandb4/Escritorio/tfm_yai/output/trimmomatic/control_2_foward_paired.fq.gz \
    /home/sandb4/Escritorio/tfm_yai/output/trimmomatic/control_2_foward_unpaired.fq.gz \
    /home/sandb4/Escritorio/tfm_yai/output/trimmomatic/control_2_reverse_paired.fq.gz \
    /home/sandb4/Escritorio/tfm_yai/output/trimmomatic/control_2_reverse_unpaired.fq.gz \
    ILLUMINACLIP:$adapters:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
check_status "Trimmomatic control 2"

# Control 3
echo "Ejecutando Trimmomatic para control 3"
java -jar $trimmomatic_jar PE -phred33 $fastq_control3_foward $fastq_control3_reverse \
    /home/sandb4/Escritorio/tfm_yai/output/trimmomatic/control_3_foward_paired.fq.gz \
    /home/sandb4/Escritorio/tfm_yai/output/trimmomatic/control_3_foward_unpaired.fq.gz \
    /home/sandb4/Escritorio/tfm_yai/output/trimmomatic/control_3_reverse_paired.fq.gz \
    /home/sandb4/Escritorio/tfm_yai/output/trimmomatic/control_3_reverse_unpaired.fq.gz \
    ILLUMINACLIP:$adapters:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
check_status "Trimmomatic
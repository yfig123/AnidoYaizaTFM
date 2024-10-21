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


genome_index="/home/sandb4/Escritorio/tfm_yai/data/genome/genome_index"
annotation_file="/home/sandb4/Escritorio/tfm_yai/data/annotations/genomic.gtf"
trimmomatic_jar="/usr/share/java/trimmomatic-0.39.jar"
adapters="/usr/share/trimmomatic/TruSeq3-PE.fa"

# Crear directorios de salida si no existen
mkdir -p /media/yaiza/Ray/tfm/output/fastqc
check_status "2: Crear directorios"

# Control de calidad de los datos con FastQC de las muestras PD
echo "Ejecutando FastQC..."

fastqc /media/yaiza/Ray/tfm/data/samplescotrols/samples/fastq_sample4_f.gz -o /media/yaiza/Ray/tfm/output/fastqc/
fastqc /media/yaiza/Ray/tfm/data/samplescotrols/samples/fastq_sample4_r.gz -o /media/yaiza/Ray/tfm/output/fastqc/

fastqc /media/yaiza/Ray/tfm/data/samplescotrols/samples/fastq_sample2_f.gz -o /media/yaiza/Ray/tfm/output/fastqc/
fastqc /media/yaiza/Ray/tfm/data/samplescotrols/samples/fastq_sample2_r.gz -o /media/yaiza/Ray/tfm/output/fastqc/

fastqc /media/yaiza/Ray/tfm/data/samplescotrols/samples/fastq_sample3_f.gz -o /media/yaiza/Ray/tfm/output/fastqc/
fastqc /media/yaiza/Ray/tfm/data/samplescotrols/samples/fastq_sample3_r.gz -o /media/yaiza/Ray/tfm/output/fastqc/

fastqc /media/yaiza/Ray/tfm/data/samplescotrols/samples/fastq_sample5_f.gz -o /media/yaiza/Ray/tfm/output/fastqc/
fastqc /media/yaiza/Ray/tfm/data/samplescotrols/samples/fastq_sample5_r.gz -o /media/yaiza/Ray/tfm/output/fastqc/

fastqc /media/yaiza/Ray/tfm/data/samplescotrols/samples/fastq_sample6_f.gz -o /media/yaiza/Ray/tfm/output/fastqc/
fastqc /media/yaiza/Ray/tfm/data/samplescotrols/samples/fastq_sample6_r.gz -o /media/yaiza/Ray/tfm/output/fastqc/

fastqc /media/yaiza/Ray/tfm/data/samplescotrols/samples/fastq_sample7_f.gz -o /media/yaiza/Ray/tfm/output/fastqc/
fastqc /media/yaiza/Ray/tfm/data/samplescotrols/samples/fastq_sample7_r.gz -o /media/yaiza/Ray/tfm/output/fastqc/


# Control de calidad de los datos con FastQC de los controles

echo "Ejecutando FastQC..."
fastqc /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control1_f.gz -o /media/yaiza/Ray/tfm/output/fastqc/
fastqc /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control1_r.gz-o /media/yaiza/Ray/tfm/output/fastqc/

fastqc /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control2_f.gz -o /media/yaiza/Ray/tfm/output/fastqc/
fastqc /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control2_r.gz-o /media/yaiza/Ray/tfm/output/fastqc/

fastqc /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control3_f.gz -o /media/yaiza/Ray/tfm/output/fastqc/
fastqc /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control3_r.gz -o /media/yaiza/Ray/tfm/output/fastqc/

fastqc /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control4_f.gz -o /media/yaiza/Ray/tfm/output/fastqc/
fastqc /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control4_r.gz -o /media/yaiza/Ray/tfm/output/fastqc/

fastqc /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control5_f.gz -o /media/yaiza/Ray/tfm/output/fastqc/
fastqc /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control5_r.gz -o /media/yaiza/Ray/tfm/output/fastqc/

fastqc /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control6_f.gz -o /media/yaiza/Ray/tfm/output/fastqc/
fastqc /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control6_r.gz -o /media/yaiza/Ray/tfm/output/fastqc/

fastqc /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control7_f.gz -o /media/yaiza/Ray/tfm/output/fastqc/
fastqc /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control7_r.gz -o /media/yaiza/Ray/tfm/output/fastqc/

check_status "3: FastQC"
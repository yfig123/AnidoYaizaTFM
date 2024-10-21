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

genome_index="/media/yaiza/Ray/tfm/data/genome/genome_index/genome_index"
annotation_file="/media/yaiza/Ray/tfm/data/annotations/genomic.gtf"


# Crear directorios de salida si no existen

mkdir -p /media/yaiza/Ray/tfm/output/hisat2

# Mapeo de los datos preprocesados al genoma de referencia humano con HISAT2 y posterior ordenación e indexado

# Sample 1
echo "Ejecutando HISAT2 para el mapeo y generando BAM para sample 1"
hisat2 -x $genome_index \
    -1 /media/yaiza/Ray/tfm/data/samplescotrols/samples/fastq_sample1_f.gz \
    -2 /media/yaiza/Ray/tfm/data/samplescotrols/samples/fastq_sample1_r.gz| \
    samtools view -bS -o /media/yaiza/Ray/tfm/output/hisat2/sample_1_mapped_reads.bam
check_status "HISAT2 sample 1"

# Ordenar y generar índice para sample 1
samtools sort -o /media/yaiza/Ray/tfm/output/hisat2/sample_1_sorted.bam /media/yaiza/Ray/tfm/output/hisat2/sample_1_mapped_reads.bam
samtools index /media/yaiza/Ray/tfm/output/hisat2/sample_1_sorted.bam
check_status "Sort/Index sample 1"

# Sample 2
echo "Ejecutando HISAT2 para el mapeo y generando BAM para sample 2"
hisat2 -x $genome_index \
    -1 /media/yaiza/Ray/tfm/data/samplescotrols/samples/fastq_sample2_f.gz \
    -2 /media/yaiza/Ray/tfm/data/samplescotrols/samples/fastq_sample2_r.gz| \
    samtools view -bS -o /media/yaiza/Ray/tfm/output/hisat2/sample_2_mapped_reads.bam
check_status "HISAT2 sample 2"

# Ordenar y generar índice para sample 2
samtools sort -o /media/yaiza/Ray/tfm/output/hisat2/sample_2_sorted.bam /media/yaiza/Ray/tfm/output/hisat2/sample_2_mapped_reads.bam
samtools index /media/yaiza/Ray/tfm/output/hisat2/sample_2_sorted.bam
check_status "Sort/Index sample 2"

# Sample 3
echo "Ejecutando HISAT2 para el mapeo y generando BAM para sample 3"
hisat2 -x $genome_index \
    -1 /media/yaiza/Ray/tfm/data/samplescotrols/samples/fastq_sample3_f.gz \
    -2 /media/yaiza/Ray/tfm/data/samplescotrols/samples/fastq_sample3_r.gz| \
    samtools view -bS -o /media/yaiza/Ray/tfm/output/hisat2/sample_3_mapped_reads.bam
check_status "HISAT2 sample 3"

# Ordenar y generar índice para sample 3
samtools sort -o /media/yaiza/Ray/tfm/output/hisat2/sample_3_sorted.bam /media/yaiza/Ray/tfm/output/hisat2/sample_3_mapped_reads.bam
samtools index /media/yaiza/Ray/tfm/output/hisat2/sample_3_sorted.bam
check_status "Sort/Index sample 3"

# Sample 4
echo "Ejecutando HISAT2 para el mapeo y generando BAM para sample 4"
hisat2 -x $genome_index \
    -1 /media/yaiza/Ray/tfm/data/samplescotrols/samples/fastq_sample4_f.gz \
    -2 /media/yaiza/Ray/tfm/data/samplescotrols/samples/fastq_sample4_f.gz| \
    samtools view -bS -o /media/yaiza/Ray/tfm/output/hisat2/sample_4_mapped_reads.bam
check_status "HISAT2 sample 4"

# Ordenar y generar índice para sample 4
samtools sort -o /media/yaiza/Ray/tfm/output/hisat2/sample_4_sorted.bam /media/yaiza/Ray/tfm/output/hisat2/sample_4_mapped_reads.bam
samtools index /media/yaiza/Ray/tfm/output/hisat2/sample_4_sorted.bam
check_status "Sort/Index sample 4"


# Sample 6
echo "Ejecutando HISAT2 para el mapeo y generando BAM para sample 6"
hisat2 -x $genome_index \
    -1 /media/yaiza/Ray/tfm/data/samplescotrols/samples/fastq_sample6_f.gz \
    -2 /media/yaiza/Ray/tfm/data/samplescotrols/samples/fastq_sample6_r.gz| \
    samtools view -bS -o /media/yaiza/Ray/tfm/output/hisat2/sample_6_mapped_reads.bam
check_status "HISAT2 sample 6"

# Ordenar y generar índice para sample 6
samtools sort -o /media/yaiza/Ray/tfm/output/hisat2/sample_6_sorted.bam /media/yaiza/Ray/tfm/output/hisat2/sample_6_mapped_reads.bam
samtools index /media/yaiza/Ray/tfm/output/hisat2/sample_6_sorted.bam
check_status "Sort/Index sample 6"

# Sample 7
echo "Ejecutando HISAT2 para el mapeo y generando BAM para sample 7"
hisat2 -x $genome_index \
    -1 /media/yaiza/Ray/tfm/data/samplescotrols/samples/fastq_sample7_f.gz \
    -2 /media/yaiza/Ray/tfm/data/samplescotrols/samples/fastq_sample7_r.gz| \
    samtools view -bS -o /media/yaiza/Ray/tfm/output/hisat2/sample_7_mapped_reads.bam
check_status "HISAT2 sample 7"

# Ordenar y generar índice para sample 7
samtools sort -o /media/yaiza/Ray/tfm/output/hisat2/sample_7_sorted.bam /media/yaiza/Ray/tfm/output/hisat2/sample_7_mapped_reads.bam
samtools index /media/yaiza/Ray/tfm/output/hisat2/sample_7_sorted.bam
check_status "Sort/Index sample 7"

# control 1
echo "Ejecutando HISAT2 para el mapeo y generando BAM para control 1"
hisat2 -x $genome_index \
    -1 /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control1_f.gz\
    -2 /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control1_r.gz| \
    samtools view -bS -o /media/yaiza/Ray/tfm/output/hisat2/control_1_mapped_reads.bam
check_status "HISAT2 control 1"

# Ordenar y generar índice para control 1
samtools sort -o /media/yaiza/Ray/tfm/output/hisat2/control_1_sorted.bam /media/yaiza/Ray/tfm/output/hisat2/control_1_mapped_reads.bam
samtools index /media/yaiza/Ray/tfm/output/hisat2/control_1_sorted.bam
check_status "Sort/Index control 1"

# control 2
echo "Ejecutando HISAT2 para el mapeo y generando BAM para control 2"
hisat2 -x $genome_index \
    -1 /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control2_f.gz \
    -2 /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control2_r.gz| \
    samtools view -bS -o /media/yaiza/Ray/tfm/output/hisat2/control_2_mapped_reads.bam
check_status "HISAT2 control 2"

# Ordenar y generar índice para control 2
samtools sort -o /media/yaiza/Ray/tfm/output/hisat2/control_2_sorted.bam /media/yaiza/Ray/tfm/output/hisat2/control_2_mapped_reads.bam
samtools index /media/yaiza/Ray/tfm/output/hisat2/control_2_sorted.bam
check_status "Sort/Index control 2"

# control 3
echo "Ejecutando HISAT2 para el mapeo y generando BAM para control 3"
hisat2 -x $genome_index \
    -1 /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control3_f.gz \
    -2 /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control3_r.gz| \
    samtools view -bS -o /media/yaiza/Ray/tfm/output/hisat2/control_3_mapped_reads.bam
check_status "HISAT2 control 3"

# Ordenar y generar índice para control 3
samtools sort -o /media/yaiza/Ray/tfm/output/hisat2/control_3_sorted.bam /media/yaiza/Ray/tfm/output/hisat2/control_3_mapped_reads.bam
samtools index /media/yaiza/Ray/tfm/output/hisat2/control_3_sorted.bam
check_status "Sort/Index control 3"

# control 4
echo "Ejecutando HISAT2 para el mapeo y generando BAM para control 4"
hisat2 -x $genome_index \
    -1 /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control4_f.gz \
    -2 /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control4_r.gz| \
    samtools view -bS -o /media/yaiza/Ray/tfm/output/hisat2/control_4_mapped_reads.bam
check_status "HISAT2 control 4"

# Ordenar y generar índice para control 4
samtools sort -o /media/yaiza/Ray/tfm/output/hisat2/control_4_sorted.bam /media/yaiza/Ray/tfm/output/hisat2/control_4_mapped_reads.bam
samtools index /media/yaiza/Ray/tfm/output/hisat2/control_4_sorted.bam
check_status "Sort/Index control 4"

# control 5
echo "Ejecutando HISAT2 para el mapeo y generando BAM para control 5"
hisat2 -x $genome_index \
    -1 /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control5_f.gz \
    -2 /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control5_r.gz| \
    samtools view -bS -o /media/yaiza/Ray/tfm/output/hisat2/control_5_mapped_reads.bam
check_status "HISAT2 control 5"

# Ordenar y generar índice para control 5
samtools sort -o /media/yaiza/Ray/tfm/output/hisat2/control_5_sorted.bam /media/yaiza/Ray/tfm/output/hisat2/control_5_mapped_reads.bam
samtools index /media/yaiza/Ray/tfm/output/hisat2/control_5_sorted.bam
check_status "Sort/Index control 5"

# control 6
echo "Ejecutando HISAT2 para el mapeo y generando BAM para control 6"
hisat2 -x $genome_index \
    -1 /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control6_f.gz \
    -2 /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control6_r.gz| \
    samtools view -bS -o /media/yaiza/Ray/tfm/output/hisat2/control_6_mapped_reads.bam
check_status "HISAT2 control 6"

# Ordenar y generar índice para control 6
samtools sort -o /media/yaiza/Ray/tfm/output/hisat2/control_6_sorted.bam /media/yaiza/Ray/tfm/output/hisat2/control_6_mapped_reads.bam
samtools index /media/yaiza/Ray/tfm/output/hisat2/control_6_sorted.bam
check_status "Sort/Index control 6"

# control 7
echo "Ejecutando HISAT2 para el mapeo y generando BAM para control 7"
hisat2 -x $genome_index \
    -1 /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control7_f.gz \
    -2 /media/yaiza/Ray/tfm/data/samplescotrols/controles/fastq_control7_r.gz| \
    samtools view -bS -o /media/yaiza/Ray/tfm/output/hisat2/control_7_mapped_reads.bam
check_status "HISAT2 control 7"

# Ordenar y generar índice para control 7
samtools sort -o /media/yaiza/Ray/tfm/output/hisat2/control_7_sorted.bam /media/yaiza/Ray/tfm/output/hisat2/control_7_mapped_reads.bam
samtools index /media/yaiza/Ray/tfm/output/hisat2/control_7_sorted.bam
check_status "Sort/Index control 7"
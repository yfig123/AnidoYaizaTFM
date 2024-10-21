# Cargar librerías necesarias
library(DESeq2)
library(pheatmap)

# Cargar la matriz de conteos brutos utilizada para el análisis de DESeq2
counts <- read.table("/media/yaiza/Ray/tfm/output/featurecounts/cleaned_gene_counts.txt", header = TRUE, row.names = 1, sep = "\t")

# Definir las condiciones experimentales
colData <- data.frame(row.names = colnames(counts), group = c("Patología", "Patología", "Patología", "Patología", "Patología", "Patología", "Patología", "Control", "Control", "Control", "Control", "Control", "Control", "Control"))

# Crear el objeto DESeqDataSet
dds <- DESeqDataSetFromMatrix(countData = counts, colData = colData, design = ~ group)

# Realizar el análisis de expresión diferencial
dds <- DESeq(dds)

# Obtener los resultados del análisis de expresión diferencial
res <- results(dds)

# Filtrar los genes con padj < 0.05
results_filtered <- subset(res, padj < 0.05)

# Filtrar la matriz de conteos utilizando los genes significativos
counts_filtered <- counts[rownames(results_filtered), ]

# Normalizar los conteos usando la transformación regularizada log (rlog)
rld <- rlog(dds, blind = FALSE)

# Extraer los valores normalizados para los genes significativos
mat <- assay(rld)[rownames(results_filtered), ]

# Guardar el heatmap como archivo PNG
png("/media/yaiza/Ray/tfm/figures/heatmap_genes_significativos.png", width = 800, height = 600)
pheatmap(mat, 
         cluster_rows = TRUE,   # Agrupar genes (filas)
         cluster_cols = TRUE,   # Agrupar muestras (columnas)
         show_rownames = TRUE, # Mostrar nombres de genes, desactívalo si hay muchos
         annotation_col = colData,  # Añadir la información de las muestras (Patología/Control)
         main = "Heatmap de genes diferencialmente expresados")
dev.off()  # Cerrar el dispositivo gráfico y guardar el archivo
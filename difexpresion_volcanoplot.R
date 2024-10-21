# Cargar las librerías necesarias
library(DESeq2)
library(ggplot2)
library(ggrepel)  # Para etiquetas de genes
library(pheatmap)  # Para generar el heatmap

# Definir el archivo de entrada y salida
input_file <- "/media/yaiza/Ray/tfm/output/featurecounts/cleaned_gene_counts.txt"
output_file <- "/media/yaiza/Ray/tfm/output/deseq2/differential_expression_results.txt"

# Leer los conteos de genes (conteos brutos) desde el archivo de entrada
counts <- read.table(file = input_file, header = TRUE, row.names = 1, sep = "\t")

# Definir las condiciones experimentales en 'colData'
colData <- data.frame(row.names = colnames(counts), group = c("Patología", "Patología", "Patología", "Patología", "Patología", "Patología", "Patología", "Control", "Control", "Control", "Control", "Control", "Control", "Control"))

# Crear el objeto DESeqDataSet con los conteos brutos
dds <- DESeqDataSetFromMatrix(countData = counts, colData = colData, design = ~ group)

# Realizar el análisis de expresión diferencial
dds <- DESeq(dds)

# Obtener los resultados del análisis de expresión diferencial
res <- results(dds)

# Guardar los resultados en un archivo de salida
write.table(res, file = output_file, sep = "\t", quote = FALSE, col.names = NA)

# Mensaje de confirmación
cat("Los resultados de la expresión diferencial se han guardado en:", output_file, "\n")

# --- CREAR EL VOLCANO PLOT ---

# Convertir los valores p ajustados a escala log10 para el Volcano Plot
res$log10padj <- -log10(res$padj)

# Definir umbrales para el corte
log2FC_cutoff <- 1      # Valor de corte para log2FoldChange
padj_cutoff <- 0.05     # Valor de corte para significancia ajustada

# Crear una columna para la categoría de cada gen en función del fold change y significancia
res$category <- "Not Significant"
res$category[res$log2FoldChange > log2FC_cutoff & res$padj < padj_cutoff] <- "Upregulated"
res$category[res$log2FoldChange < -log2FC_cutoff & res$padj < padj_cutoff] <- "Downregulated"

# Añadir una columna con el nombre de los genes si son significativos (solo para etiquetar los más relevantes)
res$gene <- rownames(res)  # Añadir los nombres de los genes
res$label <- ifelse(res$padj < padj_cutoff & abs(res$log2FoldChange) > log2FC_cutoff, res$gene, NA)

# Crear el Volcano Plot usando ggplot2 con fondo blanco y etiquetas
ggplot(res, aes(x = log2FoldChange, y = log10padj, color = category)) +
  geom_point(alpha = 0.8, size = 2) +
  scale_color_manual(values = c("Not Significant" = "gray", 
                                "Upregulated" = "red", 
                                "Downregulated" = "blue")) +
  geom_vline(xintercept = c(-log2FC_cutoff, log2FC_cutoff), col = "black", linetype = "dashed") +
  geom_hline(yintercept = -log10(padj_cutoff), col = "black", linetype = "dashed") +
  geom_text_repel(aes(label = label), size = 3, box.padding = 0.3, max.overlaps = 15) +  # Añadir etiquetas
  labs(title = "Volcano Plot",
       x = "log2(Fold Change)",
       y = "-log10(p-adj)") +
  theme_bw()  # Cambiar a fondo blanco

# Guardar el Volcano Plot como un archivo PNG
ggsave("/media/yaiza/Ray/tfm/figures/volcano_plot_with_labels.png")

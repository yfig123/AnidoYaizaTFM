# Cargar las librerías necesarias
library(DESeq2)
library(ggplot2)
library(ggrepel)  # Para etiquetas en el gráfico

# Definir el archivo de entrada para los conteos
input_file <- "/media/yaiza/Ray/tfm/output/featurecounts/cleaned_gene_counts.txt"

# Leer los conteos de genes (conteos brutos) desde el archivo de entrada
counts <- read.table(file = input_file, header = TRUE, row.names = 1, sep = "\t")

# Definir las condiciones experimentales en 'colData'
colData <- data.frame(row.names = colnames(counts), 
                      group = c("Patología", "Patología", "Patología", "Patología", "Patología", 
                                "Patología", "Patología", "Control", "Control", "Control", 
                                "Control", "Control", "Control", "Control"))

# Crear el objeto DESeqDataSet con los conteos brutos
dds <- DESeqDataSetFromMatrix(countData = counts, colData = colData, design = ~ group)

# Realizar la normalización y transformación
dds <- DESeq(dds)
rld <- rlog(dds, blind = TRUE)  # Log-transformación

# Realizar PCA
pca_data <- plotPCA(rld, intgroup = "group", returnData = TRUE)

# Calcular el porcentaje de varianza explicada por cada componente
percentVar <- round(100 * attr(pca_data, "percentVar"))

# Crear el gráfico de PCA
ggplot(pca_data, aes(x = PC1, y = PC2, color = group)) +
  geom_point(size = 3) +
  geom_text_repel(aes(label = rownames(pca_data)), size = 3, box.padding = 0.5) +  # Añadir etiquetas
  labs(title = "PCA of Gene Expression Data",
       x = paste0("PC1: ", percentVar[1], "% variance"),
       y = paste0("PC2: ", percentVar[2], "% variance")) +
  theme_bw() +  # Cambiar a fondo blanco
  scale_color_manual(values = c("Patología" = "red", "Control" = "blue"))

# Guardar el gráfico como archivo PNG
ggsave("/media/yaiza/Ray/tfm/figures/pca_plot.png")

#Transformar o arquivo em matrizes
Matriz1 <- read.delim("endereco/arquivo/all_genes_default.tsv", sep = "\t")
Matriz2 <- read.delim("endereco/arquivo/all_genes_splicing.tsv", sep = "\t")

coluna1_matriz1 <- Matriz1[, 1]
coluna1_matriz2 <- Matriz2[, 1]

#Inicialização dos vetores para armazenar os resultados

presentes <- c()
nao_presentes <- c()

#Comparar as colunas das matrizes

for (j in 1:length(coluna1_matriz2)) {
  
  presente <- FALSE  # Verificar se o elemento está presente
  
  for (i in 1:length(coluna1_matriz1)) {
    
    if (coluna1_matriz1[i] == coluna1_matriz2[j]) {
      
      presentes <- c(presentes, coluna1_matriz2[j])  # Adiciona o elemento presente ao vetor
      
      presente <- TRUE  # Atualiza a variável para indicar que o elemento está presente
      
      break  # Encerra o loop interno após encontrar o elemento desejado
      
    }
    
  }
  
  if (!presente) {
    
    nao_presentes <- c(nao_presentes, coluna1_matriz2[j])  # Adiciona o elemento ausente ao vetor
    
  }
  
}
#Armazenar
resultados_presentes <- data.frame(presentes)
resultados_nao_presentes <- data.frame(nao_presentes)

#Escreve o dataframe em um arquivo de texto
write.table(resultados_presentes, file = "endereco/salvar/arquivo/resultados_presente_all.tsv", sep = "\t", row.names = FALSE, col.names = TRUE)
write.table(resultados_nao_presentes, file = "endereco/salvar/resultados_nao_presente_all.tsv", sep = "\t", row.names = FALSE, col.names = TRUE)


#--------------------- Transformando o arquivo para criar a matriz

# Baixe o arquivo GFF
d <- "https://ftp.ncbi.nlm.nih.gov/endereco_genomic.gff.gz"
download.file(paste0(d), "nome_organismo.gff")

# Transformando em BED 
library(GenomicRanges)

# Leia o arquivo GFF
gff <- import.gff("/endereco/salvar/nome_organismo.gff")

# Converta para o formato BED
bed <- as(gff, "GRanges")
bed <- as(bed, "data.frame")

# ---------------------- Comparando

# Criar uma nova matriz vazia para armazenar os valores correspondentes
nova_matriz <- data.frame(locus_tag = character(), name = character(), stringsAsFactors = FALSE)

# Percorrer a coluna "locus_tag" da matriz
for (i in 1:nrow(bed)) {
  # Verificar se o valor está presente na lista
  if (bed[i, "locus_tag" ] %in% presentes) {
    # Guardar os valores correspondentes
    locus_tag <- bed[i, "locus_tag"]
    name <- bed[i, "Name"]

    # Adicionar os valores à nova matriz
    nova_matriz <- rbind(nova_matriz, data.frame(locus_tag = locus_tag, name = name, stringsAsFactors = FALSE))
  }
}

# Escrever a nova matriz em um arquivo
write.table(nova_matriz, file = "endereco/salvar/resultados_presente_all.csv", sep = "\t", row.names = FALSE, col.names = TRUE)

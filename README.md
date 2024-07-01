

Este programa foi desenvolvido para comparar dois arquivos gerados pelo pipeline ([FRTC ](https://github.com/alanlorenzetti/frtc.git)) resultando em outros 2 outros arquivos de intercessão, 'presente nos dois vetores ou não' e anotar os seus genes a partir de um arquivo GFF. Além disso, o programa também realiza a transformação de um arquivo GFF em um formato BED.


--------------------- REQISITOS ------------------------------------
Baixe e instale o R em seu sistema
Instale o pacote GenomicRanges no R.
Execute o programa fornecendo as matrizes e o link assembly para o arquivo GFF como entrada.

----------------------------ARQUIVOS GERADOS --------------------------
O programa gera os seguintes arquivos como saída:
resultados_presente_all.tsv: Contém os resultados da comparação dos dois arquivos frtc, incluindo os elementos presentes.
resultados_nao_presente_all.tsv: Contém os resultados da comparação dos dois arquivos frtc, incluindo os elementos ausentes.
resultados_presente_all.csv: Contém a nova matriz resultante com a anotação dos genes.

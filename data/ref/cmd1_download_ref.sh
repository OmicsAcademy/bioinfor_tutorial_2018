## Download reference genome fasta file
wget ftp://ftp.ensembl.org/pub/release-93/fasta/saccharomyces_cerevisiae/dna/Saccharomyces_cerevisiae.R64-1-1.dna.toplevel.fa.gz
## Download gtf file
wget ftp://ftp.ensembl.org/pub/release-93/gtf/saccharomyces_cerevisiae/Saccharomyces_cerevisiae.R64-1-1.93.gtf.gz
## Download protein sequences
wget ftp://ftp.ensembl.org/pub/release-93/fasta/saccharomyces_cerevisiae/pep/Saccharomyces_cerevisiae.R64-1-1.pep.all.fa.gz

## Uncompress the gzipped file
gunzip Saccharomyces_cerevisiae.R64-1-1.dna.toplevel.fa.gz
gunzip Saccharomyces_cerevisiae.R64-1-1.93.gtf.gz

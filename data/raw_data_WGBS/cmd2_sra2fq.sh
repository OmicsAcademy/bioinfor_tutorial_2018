fastq-dump 3bstrain1.sra & 
fastq-dump EV1.sra &
fastq-dump set1rep1.sra &
wait 
fastqc 3bstrain1.fastq &
fastqc EV1.fastq &
fastqc set1rep1.fastq &
wait 

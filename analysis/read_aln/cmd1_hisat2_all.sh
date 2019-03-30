hisat2 --new-summary --summary-file EV_3.log -x ../../data/ref/yeast_ref -U ../../data/raw_data//SRR1916152.fastq |samtools view -bS - | samtools sort - -o EV_3.srt.bam
samtools index  EV_3.srt.bam
hisat2 --new-summary --summary-file EV_4.log -x ../../data/ref/yeast_ref -U ../../data/raw_data//SRR1916153.fastq |samtools view -bS - | samtools sort - -o EV_4.srt.bam
samtools index  EV_4.srt.bam
hisat2 --new-summary --summary-file DNMT3B_2.log -x ../../data/ref/yeast_ref -U ../../data/raw_data//SRR1916154.fastq |samtools view -bS - | samtools sort - -o DNMT3B_2.srt.bam
samtools index  DNMT3B_2.srt.bam
hisat2 --new-summary --summary-file DNMT3B_3.log -x ../../data/ref/yeast_ref -U ../../data/raw_data//SRR1916155.fastq |samtools view -bS - | samtools sort - -o DNMT3B_3.srt.bam
samtools index  DNMT3B_3.srt.bam
hisat2 --new-summary --summary-file DNMT3B_4.log -x ../../data/ref/yeast_ref -U ../../data/raw_data//SRR1916156.fastq |samtools view -bS - | samtools sort - -o DNMT3B_4.srt.bam
samtools index  DNMT3B_4.srt.bam

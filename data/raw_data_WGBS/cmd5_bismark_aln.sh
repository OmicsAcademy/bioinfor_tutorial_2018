## make sure bowtie2 and samtools have been installed. 
bismark ../ref/bismark_index/ 3bstrain1.fastq 2> 3bstrain1.log &
bismark ../ref/bismark_index/ EV1.fastq 2> EV1.log  &
bismark ../ref/bismark_index/ set1rep1.fastq 2> set1rep1.log &
wait 

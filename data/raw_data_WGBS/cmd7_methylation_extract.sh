bismark_methylation_extractor -s --output meth_info_set1rep1/ --cytosine_report --bedGraph --genome_folder ../../data/ref/bismark_index/ set1rep1_bismark_bt2.deduplicated.bam > meth_info_set1rep1.log & 
bismark_methylation_extractor -s --output meth_info_EV1/ --cytosine_report --bedGraph --genome_folder ../../data/ref/bismark_index/ EV1_bismark_bt2.deduplicated.bam > meth_info_EV1.log &
bismark_methylation_extractor -s --output meth_info_3bstrain1/ --cytosine_report --bedGraph --genome_folder ../../data/ref/bismark_index/ 3bstrain1_bismark_bt2.deduplicated.bam > meth_info_3bstrain1.log  &

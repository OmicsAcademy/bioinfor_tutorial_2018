#cp ../meth_info_EV1/EV1_trimmed_bismark_bt2.deduplicated.CpG_report.txt cytosine_report_EV1.CpG.tab
#bgzip cytosine_report_EV1.CpG.tab
#tabix -p vcf cytosine_report_EV1.CpG.tab.gz

cp ../meth_info_dnmt3b1/dnmt3b1_trimmed_bismark_bt2.deduplicated.CpG_report.txt cytosine_report_dnmt3b1.CpG.tab
bgzip cytosine_report_dnmt3b1.CpG.tab
tabix -p vcf cytosine_report_dnmt3b1.CpG.tab.gz


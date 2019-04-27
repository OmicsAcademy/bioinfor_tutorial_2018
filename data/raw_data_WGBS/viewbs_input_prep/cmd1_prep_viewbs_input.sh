bgzip meth_info_3bstrain1.CpG_report.txt
bgzip meth_info_set1rep.CpG_report.txt
bgzip meth_info_EV1.CpG_report.txt

tabix -p vcf meth_info_3bstrain1.CpG_report.txt.gz
tabix -p vcf meth_info_set1rep.CpG_report.txt.gz
tabix -p meth_info_EV1.CpG_report.txt.gz

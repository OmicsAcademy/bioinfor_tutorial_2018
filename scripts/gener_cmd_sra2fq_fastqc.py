# read srr accession number file
# SRR00000
# wget ftp://ftp.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByRun/sra/SRR/SRR191/SRR1916152/SRR1916152.sra
# read accession file 
#    for each line:
#          generate wget cmd 
import sys
#print(sys.argv[1])
acc_file = sys.argv[1]
with open(acc_file) as acc_file_handle:
    for line in acc_file_handle:
        if line.startswith("#"):
            continue
        line = line.rstrip()
        ele = line.split("\t")
        #print(line)
        #cmd_str = "wget -O {sample_name}.sra ftp://ftp.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByRun/sra/SRR/{srr_six}/{srr_acc}/{sra_file}".format(srr_six = ele[0][0:6], srr_acc= ele[0], sra_file=ele[0]+".sra", sample_name=ele[1])
        cmd_str = "fastq-dump {sra_file}\nfastqc {fq_file}".format(sra_file=ele[1]+".sra", fq_file = ele[1]+ ".fastq")
        print(cmd_str)

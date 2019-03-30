import sys
acc_file = sys.argv[1]
with open(acc_file) as acc_file_handle:
    for line in acc_file_handle:
        line = line.rstrip()
        cmd_str = "fastq-dump {sra_file}\nfastqc {fq_file}".format(sra_file=line+".sra", fq_file = line + ".fastq")
        print(cmd_str)

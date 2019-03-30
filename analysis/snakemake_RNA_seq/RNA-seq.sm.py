import pandas as pd
from snakemake.utils import validate
from pathlib import Path   

#print(config["bowtie_build_rule"]["reference"])

#samples = pd.read_table(config["raw_data"]["sample"]).set_index("sample", drop=False)
#print(samples["SRR"])
#print(glob_wildcards(config["raw_data"]["dir"] + "/{SRR}.sra"))
#validate(config, "config.schema.yaml")
def get_srafile_list():
    sra_path = {}
    sra_acc = {}
    with open(config["raw_data"]["sample"]) as sam_list:
        next(sam_list)
        for line in sam_list:
            line = line.rstrip()
            ele = line.split("\t")
            sra_file = config["raw_data"]["dir"] + "/" + ele[0] + ".sra"
            sra_path[ele[1]] = sra_file
            sra_acc[ele[1]] = ele[0]
            #print(ele[1])
    return sra_path, sra_acc

sra_path_dict, sra_acc_dict = get_srafile_list()
print(sra_path_dict)
rule all:
    input:
        #sra_file = config["raw_data"]["dir"] + "/{SRR}.sra",
        expand('sra2fastq/{sample}.sra2fastq.log', sample=list(sra_path_dict)),
        expand("reference/bowtie/reference.{number}.ebwt", number = [1, 2, 3, 4]),
        #bowtie_index_part2 
        expand("reference/bowtie/reference.rev.{rev_number}.ebwt", rev_number = [1, 2])
        
rule sra2fastq:
    input:
        #lambda wildcards: samples[wildcards.SRR], 
        #sra_file = config["raw_data"]["dir"] + "/{SRR}.sra"
        #sra_file = lambda wildcards: expand(config["raw_data"]["dir"] + "/{samples['SRR'].tolist()[wildcards.SRR]}.sra")
        #sra_file = lambda wildcards: expand("{raw_data_dir}/{SRR}.sra", raw_data_dir=config["raw_data"]["dir"], SRR=samples["SRR"].tolist()[wildcards.SRR])
        lambda wildcards: sra_path_dict[wildcards.sample]
    params:
        lambda wildcards: sra_acc_dict[wildcards.sample]
    output:
        #directory("sra2fastq/"),
        read_file = "sra2fastq/{sample}.fastq.gz"
    log: 
        log = 'sra2fastq/{sample}.sra2fastq.log'
    shell:
        '''
fastq-dump --gzip --outdir sra2fastq/ {input}> {log}
mv sra2fastq/{params}.fastq.gz {output.read_file}
'''

rule bowtie_build:
    input:
        reference = expand("{ref}", ref=config["bowtie_build_rule"]["reference"])
    params:
        "reference/bowtie/reference"
    output: 
        ######
        #maize_ref.1.ebwt  maize_ref.3.ebwt  maize_ref.rev.1.ebwt
        #maize_ref.2.ebwt  maize_ref.4.ebwt  maize_ref.rev.2.ebwt
        ######
        expand("reference/bowtie/reference.{number}.ebwt", number = [1, 2, 3, 4]),
        expand("reference/bowtie/reference.rev.{rev_number}.ebwt", rev_number = [1, 2])
    shell: 'bowtie-build {input.reference} {params}'
 

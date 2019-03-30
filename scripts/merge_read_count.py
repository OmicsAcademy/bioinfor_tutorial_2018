import sys
sample_counts = sys.argv[1]
sample_names = sys.argv[2]

count_files = sample_counts.split(",")
sample_ids  = sample_names.split(",")
#print(count_files)

count_dict = {}
for count_file in count_files:
    with open(count_file) as count:
        for line in count:
            if line.startswith("__"):
                continue
            line = line.rstrip("\n")
            ele = line.split("\t")
            #$print(ele)
            # gene_id -> sample ->  count 
            # gene_id -> [count1, count2, count3 ]
            if ele[0] in count_dict:
                count_dict[ele[0]].append(ele[1]) 
            else:
                count_dict[ele[0]] = [ele[1]]
#print(sample_ids)
print("gene_id\t" + "\t".join(sample_ids))
for gene_id in count_dict:
    #print(count_dict[gene_id])
    #pass
    print(gene_id + "\t" + "\t".join(count_dict[gene_id]))
            
              

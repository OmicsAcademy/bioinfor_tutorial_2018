#!/usr/bin/perl -w
use strict;

my ($coor, $meth_info, $bin_num) = @ARGV;

use Bio::DB::HTS::Tabix;
 
my $tabix = Bio::DB::HTS::Tabix->new( filename => "$meth_info");

open COOR, $coor or die "$!";
## gene -> {bin1...bin n } -> methlation_info [c_num, t_num]
my %rec_meth_info;
my %rec_bin_num;
while(<COOR>){
    chomp;
    my ($chrom, $stt, $end, $id, $strand) = split;
    my $iter = $tabix->query("$chrom:$stt-$end");
    my $bin_size = ($end-$stt+1)/$bin_num;
    
    while(my $line = $iter->next){
        my ($chr, $pos, $C_strand, $c_num, $t_num, $tem_context, $seq) = split(/\t/, $line);
        next if $c_num + $t_num < 10;
        #stt=================>end 
        my $bin = 0;
        if($strand eq "+"){
            $bin = int(($pos - $stt + 1)/$bin_size) + 1;
        }else{ #stt<=================end
            $bin = int(($end - $pos + 1)/$bin_size) + 1;
        }
        ## 1000  bin_num = 20 bin_size 50 
        $bin = $bin - 1 if($bin > $bin_num);
        #$bin = "bin".$bin;
        #print "$bin\t$chr, $pos, $C_strand, $c_num, $t_num,\n";
        $rec_meth_info{$id}{$bin}[0] += $c_num;
        $rec_meth_info{$id}{$bin}[1] += $t_num;
        $rec_bin_num{$bin} ++;
    }
}
my @bin_num_key = sort {$a<=>$b} keys %rec_bin_num;
print "ID\tbin", join("\tbin", @bin_num_key), "\n";
foreach my $id(keys %rec_meth_info){
    my @tem_bin_meth;
    for(my $i =1; $i<=$bin_num; ++$i){
        if(!exists $rec_meth_info{$id}{$i}){
            push @tem_bin_meth, "NA";
        }else{
            my $tot_dep = $rec_meth_info{$id}{$i}[0] + $rec_meth_info{$id}{$i}[1]; 
            my $meth_lev = $rec_meth_info{$id}{$i}[0]/$tot_dep;
            push @tem_bin_meth, $meth_lev; 
        }
    }
    print "$id\t", join("\t", @tem_bin_meth), "\n";
}
 

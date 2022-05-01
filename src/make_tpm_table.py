#!/ccb/sw/python3/bin/python
import sys
from pathlib import Path
import pandas as pd
import numpy as np

# dir path
results_dir = "/ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/results/"
chess_dir = results_dir + "CHESS_results/"
real_dir = results_dir + "REAL_results/"
true_dir = "/ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_experiments/"

# tissue and sample info
num_tissue = 3
num_sample = 10

def parse_ground_truth(file_path, gene_tpm, tran_tpm, col=0, verbose=False):
    try:
        with open(file_path) as fh:
            for line in fh:
                # skip header
                if line.startswith('#'):
                    continue
                _, _, feature, _, _, _, _, _, attribute = line.split('\t')
                if feature == "transcript":
                    tid = attribute.split(";")[0].strip().split()[1].strip('\"')
                    gid = attribute.split(";")[1].strip().split()[1].strip('\"')
                    true_tpm = float(attribute.split(";")[-1].split('=')[1])
                    # transcript level
                    if tid not in tran_tpm:
                        tran_tpm[tid] = [0]*4
                        tran_tpm[tid][col] = true_tpm
                    else:
                        if verbose:
                            sys.stderr.write("duplicated transcript_id %s in %s!\n" % (tid, file_path))
                            sys.exit(-1)
                    # gene level
                    if gid not in gene_tpm:
                        gene_tpm[gid] = [0]*4
                        gene_tpm[gid][col] = true_tpm
                    else:
                        gene_tpm[gid][col] += true_tpm
    except IOError:
        sys.stderr.write("Could not read file: %s\n" % file_path) 
                
def parse_stringtie(file_path, gene_tpm, tran_tpm, col=3, verbose=False):
    try:
        with open(file_path) as fh:
            for line in fh:
                # skip header
                if line.startswith('#'):
                    continue
                _, _, feature, _, _, _, _, _, attribute = line.split('\t')
                if feature == "transcript":
                    tid = attribute.split("; ")[1].split()[1].strip('\"')
                    gid= attribute.split("; ")[0].split()[1].strip('\"')
                    tpm = float(attribute.split("; ")[-1].split()[1].strip(';').strip('\"'))
                    # transcript level
                    if tid not in tran_tpm:
                        if verbose:
                            sys.stderr.write("transcript_id %s in %s not found in the ground truth!\n" % (tid, file_path))
                            # sys.exit(-1)
                    else:
                        tran_tpm[tid][col] = float(tpm)
                    # gene level
                    if gid not in gene_tpm:
                        if verbose:
                            sys.stderr.write("gene_id %s in %s not found in the ground truth!\n" % (gid, file_path))
                    else:
                        gene_tpm[gid][col] += float(tpm)
    except IOError:
        sys.stderr.write("Could not read file: %s\n" % file_path) 

def parse_salmon(file_path, gene_tpm, tran_tpm, col=2, verbose=False):
    try:
        with open(file_path) as fh:
            # skip header
            fh.readline()
            for line in fh:
                tid, _, _, tpm, _ = line.split('\t')
                gid = tid.rsplit('.', 1)[0]
                # transcript level
                if tid not in tran_tpm:
                    if verbose:
                        sys.stderr.write("transcript_id %s in %s not found in the ground truth!\n" % (tid, file_path))
                        # sys.exit(-1)
                else:
                    tran_tpm[tid][col] = float(tpm)
                # gene level
                if gid not in gene_tpm:
                    if verbose:
                        sys.stderr.write("gene_id %s in %s not found in the ground truth!\n" % (gid, file_path))
                else:
                    gene_tpm[gid][col] += float(tpm)
    except IOError:
        sys.stderr.write("Could not read file: %s\n" % file_path) 

def parse_kallisto(file_path, gene_tpm, tran_tpm, col=1, verbose=False):
    try:
        with open(file_path) as fh:
            # skip header
            fh.readline()
            for line in fh:
                tid, _, _, _, tpm = line.split('\t')
                gid = tid.rsplit('.', 1)[0]
                # transcript level
                if tid not in tran_tpm:
                    if verbose:
                        sys.stderr.write("transcript_id %s in %s not found in the ground truth!\n" % (tid, file_path))
                        # sys.exit(-1)
                else:
                    tran_tpm[tid][col] = float(tpm)
                # gene level
                if gid not in gene_tpm:
                    if verbose:
                        sys.stderr.write("gene_id %s in %s not found in the ground truth!\n" % (gid, file_path))
                else:
                    gene_tpm[gid][col] += float(tpm)
    except IOError:
        sys.stderr.write("Could not read file: %s\n" % file_path) 

def write_table(expt_dir, annotation, sim_type, file_name):
    tpm_dir = results_dir + "tpm_summary/"
    # transcript_id, true_tpm, software, est_tpm, tissue, sample
    # tpm_2darray = [[None]*num_sample]*num_tissue  # 2D array of size (num_tissue, num_sample), 

    # iterate tissue
    for i in range(num_tissue):
        tissue = "tissue"+str(i)+'/'
        for j in range(num_sample):
            tran_level_tpm = {} # {transcript_id: [true_tpm, kallisto_tpm, salmon_tpm, stringtie_tpm, tissue, sample]}
            gene_level_tpm = {} # {gene_id: [true_tpm, kallisto_tpm, salmon_tpm, stringtie_tpm, tissue, sample]}
            sample = "sample"+str(j)+'/'
            # get ground truth
            ground_truth_path = true_dir + tissue + sample + "real.t%d_s%d.sorted.gtf" % (i,j)
            parse_ground_truth(ground_truth_path, gene_level_tpm, tran_level_tpm)
            # get kallisto estimation
            kallisto_path = expt_dir + "kallisto/" + tissue + sample + sim_type+"_tx_quant/abundance.tsv"
            parse_kallisto(kallisto_path, gene_level_tpm, tran_level_tpm)
            # get salmon estimation
            salmon_path = expt_dir + "salmon/" + tissue + sample + sim_type+"_tx_quant/quant.sf"
            parse_salmon(salmon_path, gene_level_tpm, tran_level_tpm)
            # get stringtie estimation
            stringtie_path = expt_dir + "stringtie_e/" + tissue + sample + sim_type+"/out_"+sim_type+".t%d_s%d.sorted.gtf" % (i,j)
            parse_stringtie(stringtie_path, gene_level_tpm, tran_level_tpm)
        
            out_dir = tpm_dir + tissue + sample
            Path(out_dir).mkdir(parents=True, exist_ok=True)
            # create dateframe
            df = pd.DataFrame.from_dict(tran_level_tpm, orient='index').reset_index()
            df.columns = ['transcript_id', 'true_tpm', 'kallisto_tpm', 'salmon_tpm', 'stringtie_tpm']
            # add tissue and sample column
            df['tissue'] = [tissue[:-1]]*len(tran_level_tpm)
            df['sample'] = [sample[:-1]]*len(tran_level_tpm)
            # write to file
            df.to_csv(out_dir + annotation+'_'+file_name+"_tran_tpm.csv", index=False)

            # do the same for gene lelvel
            # create dateframe
            df = pd.DataFrame.from_dict(gene_level_tpm, orient='index').reset_index()
            df.columns = ['gene_id', 'true_tpm', 'kallisto_tpm', 'salmon_tpm', 'stringtie_tpm']
            # add tissue and sample column
            df['tissue'] = [tissue[:-1]]*len(gene_level_tpm)
            df['sample'] = [sample[:-1]]*len(gene_level_tpm)
            # write to file
            df.to_csv(out_dir + annotation+'_'+file_name+"_gene_tpm.csv", index=False)

def main():
    # real vs. truth
    write_table(chess_dir, "CHESS", sim_type="real", file_name="clean")
    write_table(real_dir, "REAL", sim_type="real", file_name="clean")
    # merged (with noise) vs. truth
    write_table(chess_dir, "CHESS", sim_type="merged", file_name="noisy")
    write_table(real_dir, "REAL", sim_type="merged", file_name="noisy")

main()

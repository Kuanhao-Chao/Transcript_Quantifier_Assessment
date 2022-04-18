#!/ccb/sw/python3/bin/python
import sys
from pathlib import Path
import pandas as pd

# dir path
expt_dir = "/ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/results/"
true_dir = "/ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_experiments/"
results_dir = expt_dir

# tissue and sample info
num_tissue = 3
num_sample = 10

def parse_ground_truth(file_path, tpm_dict):
    try:
        with open(file_path) as fh:
            for line in fh:
                # skip header
                if line.startswith('#'):
                    continue
                _, _, feature, _, _, _, _, _, attribute = line.split('\t')
                if feature == "transcript":
                    tid = attribute.split(";")[0].strip().split()[1].strip('\"')
                    true_tpm = float(attribute.split(";")[-1].split('=')[1])
                    if tid not in tpm_dict:
                        tpm_dict[tid] = [true_tpm]
                    else:
                        sys.stderr.write("duplicated transcript_id %s in %s!\n" % (tid, file_path))
                        sys.exit(-1)
    except IOError:
        sys.stderr.write("Could not read file: %s\n" % file_path) 
                
def parse_stringtie(file_path, tpm_dict):
    try:
        with open(file_path) as fh:
            for line in fh:
                # skip header
                if line.startswith('#'):
                    continue
                _, _, feature, _, _, _, _, _, attribute = line.split('\t')
                if feature == "transcript":
                    tid = attribute.split("; ")[1].split()[1].strip('\"')
                    tpm = float(attribute.split("; ")[-1].split()[1].strip(';').strip('\"'))
                    if tid not in tpm_dict:
                        sys.stderr.write("transcript_id %s in %s not found in the ground truth!\n" % (tid, file_path))
                        sys.exit(-1)
                    else:
                        tpm_dict[tid] += [float(tpm)]
    except IOError:
        sys.stderr.write("Could not read file: %s\n" % file_path) 

def parse_salmon(file_path, tpm_dict):
    try:
        with open(file_path) as fh:
            # skip header
            fh.readline()
            for line in fh:
                name, _, _, tpm, _ = line.split('\t')
                if name not in tpm_dict:
                    sys.stderr.write("transcript_id %s in %s not found in the ground truth!\n" % (name, file_path))
                    sys.exit(-1)
                else:
                    tpm_dict[name] += [float(tpm)]
    except IOError:
        sys.stderr.write("Could not read file: %s\n" % file_path) 

def parse_kallisto(file_path, tpm_dict):
    try:
        with open(file_path) as fh:
            # skip header
            fh.readline()
            for line in fh:
                target_id, _, _, _, tpm = line.split('\t')
                if target_id not in tpm_dict:
                    sys.stderr.write("transcript_id %s in %s not found in the ground truth!\n" % (target_id, file_path))
                    sys.exit(-1)
                else:
                    tpm_dict[target_id] += [float(tpm)]
    except IOError:
        sys.stderr.write("Could not read file: %s\n" % file_path) 

def write_table(sim_type="real"):
    tpm_dir = results_dir + "tpm_summary/"
    # transcript_id, true_tpm, software, est_tpm, tissue, sample
    tpm_2darray = [[None]*num_sample]*num_tissue  # 2D array of size (num_tissue, num_sample), 

    # iterate tissue
    for i in range(num_tissue):
        tissue = "tissue"+str(i)+'/'
        for j in range(num_sample):
            tpm_2darray[i][j] = {} # {transcript_id: [true_tpm, kallisto_tpm, salmon_tpm, stringtie_tpm]}
            sample = "sample"+str(j)+'/'
            # get ground truth
            ground_truth_path = true_dir + tissue + sample + "real.t%d_s%d.sorted.gtf" % (i,j)
            parse_ground_truth(ground_truth_path, tpm_2darray[i][j])
            # get kallisto estimation
            kallisto_path = expt_dir + "kallisto/" + tissue + sample + sim_type+"_tx_quant/abundance.tsv"
            parse_kallisto(kallisto_path, tpm_2darray[i][j])
            # get salmon estimation
            salmon_path = expt_dir + "salmon/" + tissue + sample + sim_type+"_tx_quant/quant.sf"
            parse_salmon(salmon_path, tpm_2darray[i][j])
            # get stringtie estimation
            stringtie_path = expt_dir + "stringtie_e/" + tissue + sample + sim_type+"/out_"+sim_type+".t%d_s%d.sorted.gtf" % (i,j)
            parse_stringtie(stringtie_path, tpm_2darray[i][j])
            # write to file
            out_dir = tpm_dir + tissue + sample
            Path(out_dir).mkdir(parents=True, exist_ok=True)
            df = pd.DataFrame.from_dict(tpm_2darray[i][j], orient='index').reset_index()
            df.columns = ['transcript_id', 'true_tpm', 'kallisto_tpm', 'salmon_tpm', 'stringtie_tpm']
            df.to_csv(out_dir + sim_type+"_tpm.csv", index=False)

# real vs. truth
write_table(sim_type="real")
# merged (with noise) vs. truth
write_table(sim_type="merged")

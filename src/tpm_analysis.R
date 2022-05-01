library(ggplot2)
library(dplyr)
library(tidyverse)
library(patchwork)

# set working directory
setwd("/ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/results")

# set seed for reproducibility
set.seed(0)

read_tpm <- function(file_name) {
  # read in the tpm tables for all samples for all tissues
  tpm_data <- list.files('tpm_summary', 
                         pattern = file_name, recursive = TRUE, full.names = TRUE) %>%
    lapply(read_csv, col_types = cols()) %>%                                           
    bind_rows
  
  # change name
  names <- c("id", "true_tpm", "kallisto", "salmon", "stringtie", "tissue", "sample")
  colnames(tpm_data) <- names
  
  # pivot longer 
  tpm_data <- pivot_longer(
    tpm_data, 
    cols = c("kallisto", "salmon", "stringtie"), 
    names_to = "software",
    values_to = "est_tpm"
  )
  
  # drop the rows that contains NA or 0
  tpm_data <- tpm_data[complete.cases(tpm_data),] # remove NA
  tpm_data <- tpm_data[tpm_data$true_tpm>0 & tpm_data$est_tpm>0,] # remove 0
  
  return(tpm_data)
}

# ggplot
plot_tpm <- function(tpm_data, plot_name) {
  # ggplot
  p <- ggplot(data=tpm_data, aes(x = true_tpm, y = est_tpm)) +
    geom_point(aes(color=software), shape=1) +
    geom_abline(slope=1, intercept=0) +
    scale_x_continuous(trans='log10') +
    scale_y_continuous(trans='log10') +
    facet_grid(software ~ tissue) + 
    theme(legend.position = "bottom")
  
  # save as png
  aspect_ratio <- 1
  height <- 10
  ggsave(plot_name, height = height, width = height*aspect_ratio)
}

calc_err <- function(tpm_data) {
  # calculate L2 log10(fold_change) error
  kallisto_data = tpm_data[tpm_data$software=="kallisto",]
  kallisto_mse = mean(log10((kallisto_data$est_tpm) / (kallisto_data$true_tpm))^2)
  
  salmon_data = tpm_data[tpm_data$software=="salmon",]
  salmon_mse = mean(log10((salmon_data$est_tpm) / (salmon_data$true_tpm))^2)
  
  stringtie_data = tpm_data[tpm_data$software=="stringtie",]
  stringtie_mse = mean(log10((stringtie_data$est_tpm) / (stringtie_data$true_tpm))^2)
  
  return(c(kallisto_mse, salmon_mse, stringtie_mse))
}

################################################################################
# read tpm
CHESS_clean_data <- read_tpm("CHESS_clean_tran_tpm.csv")
CHESS_noisy_data <- read_tpm("CHESS_noisy_tran_tpm.csv")
REAL_clean_data <- read_tpm("REAL_clean_tran_tpm.csv")
REAL_noisy_data <- read_tpm("REAL_noisy_tran_tpm.csv")

# plot
dir.create("../plots/", showWarnings = FALSE)
plot_tpm(CHESS_clean_data, "../plots/CHESS_clean_tran_tpm.png")
plot_tpm(CHESS_noisy_data, "../plots/CHESS_noisy_tran_tpm.png")
plot_tpm(REAL_clean_data, "../plots/REAL_clean_tran_tpm.png")
plot_tpm(REAL_noisy_data, "../plots/REAL_noisy_tran_tpm.png")

# calc error
mse_summary <- rbind(calc_err(CHESS_clean_data),
                       calc_err(CHESS_noisy_data),
                       calc_err(REAL_clean_data),
                       calc_err(REAL_noisy_data))

row_names <- c("CHESS_clean", "CHESS_noisy", "REAL_clean", "REAL_noisy")
col_names <- c("kallisto", "salmon", "stringtie")

mse_summary <- as.data.frame(mse_summary)
rownames(mse_summary) <- row_names
colnames(mse_summary) <- col_names

write.csv(x=mse_summary, file="mse_tran.csv")

################################################################################
# read tpm
CHESS_clean_data <- read_tpm("CHESS_clean_gene_tpm.csv")
CHESS_noisy_data <- read_tpm("CHESS_noisy_gene_tpm.csv")
REAL_clean_data <- read_tpm("REAL_clean_gene_tpm.csv")
REAL_noisy_data <- read_tpm("REAL_noisy_gene_tpm.csv")

# plot
plot_tpm(CHESS_clean_data, "../plots/CHESS_clean_gene_tpm.png")
plot_tpm(CHESS_noisy_data, "../plots/CHESS_noisy_gene_tpm.png")
plot_tpm(REAL_clean_data, "../plots/REAL_clean_gene_tpm.png")
plot_tpm(REAL_noisy_data, "../plots/REAL_noisy_gene_tpm.png")

# calc error
mse_summary <- rbind(calc_err(CHESS_clean_data),
                       calc_err(CHESS_noisy_data),
                       calc_err(REAL_clean_data),
                       calc_err(REAL_noisy_data))

row_names <- c("CHESS_clean", "CHESS_noisy", "REAL_clean", "REAL_noisy")
col_names <- c("kallisto", "salmon", "stringtie")

mse_summary <- as.data.frame(mse_summary)
rownames(mse_summary) <- row_names
colnames(mse_summary) <- col_names

write.csv(x=mse_summary, file="mse_gene.csv")

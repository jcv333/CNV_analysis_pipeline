#####################################################################################.
###   Author: Jose Camacho Valenzuela.
###   Date: XX.
###   Description: Segment analysis - Rscript.
###   Patient ID: XX
#####################################################################################.

# 1. Load the required R libraries.
library(sequenza)
library(scarHRD)

# 2. Run segment analysis.
# ---------- a) Store the output of pileup analysis in an object.
data.file <- "/path/to/file/AFN-03791_out_small.seqz.gz"

# ---------- b) Extraction considering only chromosomes 1-22 + X-Y.
test <- sequenza.extract(data.file,
                         verbose = FALSE,
                         chromosome.list = paste0("chr",
                                                  c(1:22,"X","Y")
                                                 )
                        )
CP <- sequenza.fit(test)

# ---------- c) Plotting.
sequenza.results(sequenza.extract = test,
                 cp.table = CP,
                 sample.id = "bam2",
                 out.dir = "/home/path/to/dir/Sequenza")

# The end.

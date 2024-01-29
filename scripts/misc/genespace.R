# Import libraries necessary for GENESPACE
library(ggplot2)
library(GENESPACE)

# Initialise GENESPACE output directory
gpar <- init_genespace(wd = "analysis/genespace", path2mcscanx = "scripts/misc/MCScanX")

# Run GENESPACE
out <- run_genespace(gsParam = gpar, overwrite = T)



# This needs to be run once per R installation.
remotes::install_github(sprintf("rstudio/%s", c("reticulate", "tensorflow", "keras", "torch")))
reticulate::miniconda_uninstall()
reticulate::install_miniconda()
reticulate::conda_create("mldash")
reticulate::conda_install("mldash",
	c("jupyterlab", "pandas", "statsmodels","scipy", "scikit-learn",
	  "matplotlib", "seaborn", "numpy", "pytorch", "tensorflow"))

install.packages("BiocManager")
BiocManager::install("mixOmics")

remotes::install_github('jbryer/mldash')

# Mac users will probably need to install gfortran from here: https://mac.r-project.org/tools/

# This will be run each time you use the mldash package.
library(mldash)
Sys.setenv("RETICULATE_PYTHON" = "~/miniforge3/envs/mldash/bin/python")
reticulate::use_condaenv("mldash")
tensorflow::use_condaenv("mldash")
keras::use_condaenv("mldash")

# Test some functions
ls('package:mldash') # Exported functions from the package

datasets <- mldash::read_ml_datasets()

models <- mldash::read_ml_models()

results <- mldash::run_models(datasets = datasets,
							  models = models,
							  seed = 2112)

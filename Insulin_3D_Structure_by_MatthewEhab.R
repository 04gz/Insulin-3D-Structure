### Insulin 3D Protein Structure Visualization ###
### By: Matthew Ehab ###

#Looking for my Directory #
getwd()
setwd("F:/college/Projects")
getwd()

### Installing/Calling required libraries ###
install.packages("bio3d", dependencies = TRUE)
install.packages("shiny")
install.packages("r3dmol")

library(bio3d)
library(shiny)
library(r3dmol)
library(magrittr)

### Load Insulin structure (PDB ID: 4INS) ###
insulin = read.pdb("4ins")
insulin

### Extract protein only (remove water/zinc) ###
protein_only = trim.pdb(insulin, "protein")

### Save structure locally and prepare for visualization ###
write.pdb(protein_only, file = "insulin.pdb")
pdb_text <- paste(readLines("insulin.pdb"), collapse = "\n")

### 3D Visualization ###
viz <- r3dmol() %>%
  m_add_model(data = pdb_text, format = "pdb") %>%
  m_set_style(style = m_style_cartoon(color = "spectrum")) %>%
  m_zoom_to()

viz

### End of script - Insulin 3D model generated successfully ###
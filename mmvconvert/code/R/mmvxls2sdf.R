library(ChemmineR)
library(ChemmineOB)
library(XLConnect)

setwd("~/Dropbox/projects/OSMinformatics/mmvconvert")
mmv <- readWorksheetFromFile("data/TP compounds with solid amounts 14_3_14.xlsx", sheet = "Sheet1")
colnames(mmv)[5] <- "EC50"
mmv.sdf   <- smiles2sdf(mmv$Smiles)
cid(mmv.sdf) <- mmv$COMPOUND_ID
datablock(mmv.sdf) <- data.frame(MW = mmv$MW, EC50 = mmv$EC50)

for(i in 1:length(mmv.sdf)) {
  outfile = paste("output/sdf/", cid(mmv.sdf[i]), ".sdf", sep = "")
  write.SDF(mmv.sdf[i], outfile, cid = TRUE)
}
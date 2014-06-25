# mmvconvert

This sub-project converts the SMILES strings in spreadsheet "TP compounds with solid amounts 14_3_14.xlsx" to SDF files, containing the molecule ID and EC50.

The SDF files can then be converted to CML using Open Babel as follows:

    find output/sdf -name "*.sdf" -exec babel -xp {} output/cml/{}.cml \;
    rename 's/\.sdf\.cml/\.cml/' output/cml/*

Expect these improvements in the near-future:

* Rewrite R code as functions to make it more generic
* Remove hard-coded directory paths
* Fully-automate the process using *e.g.* a shell script

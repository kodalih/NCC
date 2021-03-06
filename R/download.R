## Download data from Dropbox

## Install dropbox API package
## devtools::install_github("karthik/rdrop2")

library(rdrop2)
library(dplyr)

## Authenticate to Dropbox API at FIRST RUN
# drop_auth()
# drop_acc()

# Not working -- API broken?
dataFiles <- rdrop2::drop_dir("NCC_PROJECT/DATA")[["path"]]
savData <- grepl("^[^A].+\\.sav$", basename(dataFiles))
dataFiles <- dataFiles[savData]

if (!dir.exists("data"))
    dir.create("data")

invisible(lapply(dataFiles, function(file) {
    drop_get(file, local_file = file.path("data", basename(file)))
})
)

## Rename files
file.rename("data/Baseline SCan & Drug.sav", "data/BaselineScanDrug.sav")
file.rename("data/24 Month Scan SPSS-updated-9.24.17.sav", "data/M24Scan.sav")

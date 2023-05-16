# load all potentially useful packages for any given script in the code base

pckgs <- c(
  "Matching", "DiagrammeR" , "gapminder", "ggvenn", "tidytext", "stopwords",
  "emayili",  "gtsummary",
  "patchwork", "corrplot", "RColorBrewer", "factoextra", "cluster",
  "httr"    , "haven"      , "glue"     , "scales"    ,
  "stringi" , "flextable"  , "magrittr"  , "openxlsx", 
  "officer", "questionr" , "data.table" , "htmltools" ,
  "janitor" , "pagedown"   , "here"      ,  "readxl", 
  "jsonlite"  , "tools"    , "rmarkdown" , "conflicted",
  "cowplot" , "knitr"      ,  "zip", "ftExtra"   , 
  "tidyverse"
)

all_pckgs <- .packages(all.available=T)

pckgs_yes <- pckgs[pckgs %in% all_pckgs]
pckgs_no <- pckgs[!pckgs %in% all_pckgs]

silent_load <- function(package){
  suppressPackageStartupMessages(do.call("library", list(package)))
  return()
}

no_ret <- sapply(pckgs_yes, silent_load)

if(length(pckgs_no) > 0) {
  print(glue("Some packages not available. Contact Henry to add {paste(pckgs_no, collapse=', ')}"))
}

conflicts_prefer(dplyr::filter())
conflicts_prefer(dplyr::select())
conflicts_prefer(dplyr::lag())
conflicts_prefer(rmarkdown::render())
conflicts_prefer(lubridate::month)
conflicts_prefer(lubridate::year)
conflicts_prefer(lubridate::day)
conflicts_prefer(flextable::as_flextable)
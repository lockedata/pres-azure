library(rmarkdown)
slides=list.files("pres","*.Rmd",full.names=TRUE)

for (f in slides) render(f,output_dir = "docs")

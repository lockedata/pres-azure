library(revealjs)
slides=list.files("pres","*.Rmd",full.names=TRUE)

for (f in slides) render(f,output_dir = "docs",
                output_format = revealjs::revealjs_presentation(
                  theme = "lockedata",
                  reveal_options = list(height="1080",
                                        width="1920",
                                        margin="0.05")
                  )
)

# setwd("D:/Users/John/Desktop/jkkweb/web/WebsiteDevel/")

# Render the web site: 
rmarkdown::render_site()
# Optional, seems unnecessary:
# rmarkdown::clean_site()

# Copy auxiliary folders and files to _site. 
if ( FALSE ) {
  
  output_dir <- c("docs","_site")[1]
  
  # Copy Art Critic folder or files to _site subdirectory:
  file.copy( from = "ArtCriticScript.html" , to = output_dir , overwrite = TRUE )
  file.copy( from = "ArtCriticGetImages.R" , to = output_dir , overwrite = TRUE )
  file.copy( from = "ArtCriticImages" , # folder
             to = output_dir , recursive = TRUE , overwrite = TRUE )
  
  # Copy `jkkteach` folder or files to _site subdirectory:
  file.copy( from = "jkkteach" , # folder
             to = output_dir , recursive = TRUE , overwrite = TRUE )
  
  # Copy `articles` folder or files to _site subdirectory:
  file.copy( from = "articles" , # folder
             to = output_dir , recursive = TRUE , overwrite = TRUE )
  
  # Copy KruschkeFreqAndBayesAppTutorial.html/.Rmd to _site subdirectory:
  file.copy( from = "KruschkeFreqAndBayesAppTutorial.html" , 
             to = output_dir , overwrite = TRUE )
  # Below, .Rmd filename is given underscore prefix so it is not processed by
  # render_site(), but I'm copying it as a record for future reference.
  file.copy( from = "_KruschkeFreqAndBayesAppTutorial.Rmd" , 
             to = "_site/_KruschkeFreqAndBayesAppTutorial.Rmd" , 
             overwrite = TRUE )
  
}
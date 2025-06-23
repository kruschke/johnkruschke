
# Specify folder for saving images:
destfolder = "ArtCriticImages"
dir.create( destfolder )

# Get images from server and save them:
getNewImages = FALSE
pixwidth = 800
pixheight = 400
if ( getNewImages ) {
  for ( idnumber in 100:999 ) {
    urlstring = paste0( "https://picsum.photos/id/" ,
                        idnumber ,
                        "/",pixwidth,"/",pixheight,"/" )
    try( 
      download.file( urlstring , mode="wb" ,
                     destfile=paste0(destfolder,"/ArtCriticImage",idnumber,".jpg")  )
    )
  }
}

# Check saved images and expunge small or zero-size files:
filenames = dir( path=destfolder )
minSize = 1000 
for ( thisFile in filenames ) {
  if ( file.info( paste0(destfolder,"/",thisFile) )$size < minSize ) {
    file.remove( paste0(destfolder,"/",thisFile) )
  }
}

# Rename image files for easy use in javascript:
filenames = dir( path=destfolder ) # done afresh because some could have been removed
imgCount = 1
for ( thisFile in filenames ) {
  file.rename( from=paste0(destfolder,"/",thisFile) ,
               to=paste0(destfolder,"/ArtCriticImg",imgCount,".jpg") )
  imgCount = imgCount + 1
}


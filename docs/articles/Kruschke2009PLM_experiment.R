# CanonicalHighlighting.R
# John K. Kruschke, August 2008.

# Clear all memory first
rm(list=ls(all=TRUE))
graphics.off()

#==============================================================================
# Define functions for use in experiment command sequence at end of file.


# Specify cue words. From Kruschke 2001 JEPLMC.
cueWordMat = matrix( c( "snake", "robin", "whale", "puppy", "skunk", "trout",
                      "child", "mouse", "ocean", "tulip", "piano", "arrow" ),
                      nrow=2 , byrow=T )
nCueSets = dim(cueWordMat)[1]
nWordsPerSet = dim(cueWordMat)[2]
# Randomly permute whole rows:
cueWordMat = cueWordMat[ sample(1:nCueSets) , ]
# Randomly permute columns within rows:
for ( rowIdx in 1:nCueSets ) {
    cueWordMat[ rowIdx , ] = cueWordMat[ rowIdx , sample(1:nWordsPerSet) ]
}
permCueWords = cueWordMat[ 1 , ]
names( permCueWords ) = c( "PE1", "I1", "PL1", "PE2", "I2", "PL2" )


# Specify the response keys:
respKeys = c("F","G","H","J")
# Permute response keys
permRespKeys = respKeys[ sample(1:length(respKeys)) ]
names( permRespKeys ) = c( "E1", "L1", "E2", "L2" )
halfBoxWidth = .4 # for plotting response key boxes


# Function for pausing for a certain duration.
pause = function( pauseDuration ) {
    pauseStart = proc.time()[3]
    waitSoFar = proc.time()[3] - pauseStart 
    while( waitSoFar < pauseDuration ) {
        waitSoFar = proc.time()[3] - pauseStart
    }
}


# Function for displaying cues.
displayCues = function( thisTrialVec , cueWords=permCueWords , instructWd=50 ,
                        rndmsd=(trialIdx*subjN) ) { # Original had rndmsd=(trialIdx*17)
    glim = 1 # Axis limit for graphical plots: xlim=c(-glim,glim)
    par( bg="grey70" ) # Set plot background to grey for all plots.
    par( pty="s" ) # square plotting region for cues.
    # make blank plot
    plot( x=0 , y=0 , xlim=c(-glim,glim) , ylim=c(-glim,glim) , type="n" ,
          bty="n" , xaxt="n" , yaxt="n" , xlab="" , ylab="" , ask=F )
          
    # Determine cue words to present
    thisCueString = NULL
    for ( wIdx in 1:length(cueWords) ) {
        if ( thisTrialVec[wIdx] == 1 ) {
           thisCueString = c( thisCueString , cueWords[wIdx] )
        }
    }
    # Permute the presentation order
    set.seed( rndmsd )
    thisCueString = thisCueString[ sample( 1:length(thisCueString) ) ]
    # Convert messageText to wrapped lines, and display them:
    displayText = paste( strwrap( thisCueString , width=instructWd ) ,
                         collapse="\n\n" )
    text( 0 , 0 , displayText , cex=3 )
}


# Function for displaying response buttons.
displayRespButtons = function( keys=respKeys , hbw=halfBoxWidth ) {
    nResp = length(keys)
    # Make blank plot.
    # par( new=T ) # Do not clear previous plot.
    par( pty="m" ) # maximal plotting region for response buttons.
    par( cex.main = 2.0 , cex.sub = 2.0 )
    plot( nResp*(0:1) , 0:1 , type="n" , bty="n" , xaxt="n" , yaxt="n" ,
		  xlab="" , ylab="" , main="" )
    title( main="Press your choice on the keyboard:" )
    # Draw response boxes
    for ( rIdx in 1:nResp ) {
        rect( rIdx-.5-.8*hbw , .5-hbw , rIdx-.5+.8*hbw , .5+hbw , col="white" )
        text( rIdx-.5 , .5 , keys[rIdx] , adj=c(.5,.5) , cex=2.0 )
    }
}


# Function for displaying correct response.
displayCorrResp = function( cr , choice , keys=respKeys , hbw=halfBoxWidth ) {
    if ( cr != "*" ) { # if training trial
       Acc = ( cr == choice )
    } else { # if testing trial
       Acc = -1
    }
    nResp = length(keys)
    # Make blank plot.
    # par( new=T ) # Do not clear previous plot.
    par( pty="m" ) # maximal plotting region for response buttons.
    par( cex.main = 2.0 , cex.sub = 2.0 )
    plot( nResp*(0:1) , 0:1 , type="n" , bty="n" , xaxt="n" , yaxt="n" ,
		  xlab="" , ylab="" , main="" )
    if ( Acc == T ) {
       mainText = paste("CORRECT! Correct response is:")
    }
    if ( Acc == F ) {
       alarm()
       mainText = paste("WRONG! Correct response is:")
    }
    if ( Acc == -1 ) {
       mainText = paste("Your response has been recorded.")
    }
    title( main=mainText , sub="PRESS SPACE BAR TO CONTINUE" )
    # Draw response boxes
    for ( rIdx in 1:nResp ) {
      if ( cr == keys[rIdx] ) {
        rect( rIdx-.5-.8*hbw , .5-hbw , rIdx-.5+.8*hbw , .5+hbw , col="white" ,
              lwd=5 )
        text( rIdx-.5 , .5 , keys[rIdx] , adj=c(.5,.5) , cex=2.0 )
      } else { # if rIdx != cr
        rect( rIdx-.5-.8*hbw , .5-hbw , rIdx-.5+.8*hbw , .5+hbw , col="grey" )
        text( rIdx-.5 , .5 , keys[rIdx] , adj=c(.5,.5) , cex=2.0 , col="grey" )
      }
    }
}


# Function for what to do when choice keypress is made.
choiceKeybd = function( key , allowKeys = respKeys ) {
    key = toupper( key ) # convert to upper case
    if ( !any( key == allowKeys ) ) { return( NULL ) }
    endRT <<- proc.time()[3] # change value of endRT in global environment
    choice <<- key # change value of choice in global environment
    return( choice )
}

# Function for what to do when study keypress is made.
studyKeybd = function( key , allowKeys = " " ) {
    key = toupper( key ) # convert to upper case; does nothing to space " ".
    if ( !any( key == allowKeys ) ) { return( NULL ) }
    endST <<- proc.time()[3] # change value of endST in global environment
    return( endST )
}

interTrialInterval = function( dur = 1.0 ) {    
    plot( 0:1 , 0:1 , type="n" , bty="n" , xaxt="n" , yaxt="n" ,
		  xlab="" , ylab="" , main="" )
    plot( 0:1 , 0:1 , type="n" , bty="n" , xaxt="n" , yaxt="n" ,
		  xlab="" , ylab="" , main="" )
    pause( dur )
}

displayInstruct = function( messageText , instructWd = 45 ) {
    # Make blank plot:
    par( bg="grey70" ) # Set plot background to grey
    par( pty="m" ) # maximal plotting region for text.
    plot( x=0 , y=0 , xlim=c(-1,1) , ylim=c(-1,1) , type="n" ,
          bty="n" , xaxt="n" , yaxt="n" , xlab="" , ylab="" , ask=F )
    # Convert messageText to wrapped lines, and display them:
    displayText = paste( strwrap( messageText , width=instructWd ) ,
                         collapse="\n" )
    text( 0 , 0 , displayText , cex=2 )
    # Display response prompt:
    par( cex.main = 2.0 , cex.sub = 2.0 )
    plot( 0:1 , 0:1 , type="n" , bty="n" , xaxt="n" , yaxt="n" ,
		  xlab="" , ylab="" , main="" )
    title( sub="PRESS SPACE BAR TO CONTINUE" )
    # Wait for space bar press:
    getGraphicsEvent( prompt="" , onKeybd = studyKeybd )
}

displayBlankWindow = function() {
    # Make blank plot:
    par( bg="grey70" ) # Set plot background to grey
    par( pty="m" ) # maximal plotting region for text.
    plot( x=0 , y=0 , xlim=c(-1,1) , ylim=c(-1,1) , type="n" ,
          bty="n" , xaxt="n" , yaxt="n" , xlab="" , ylab="" , ask=F )
    # Convert messageText to wrapped lines, and display them:
    messageText = "Experimenter: Please maximize this window. It will serve
                  to cover the screen. Press the space bar to continue."
    displayText = paste( strwrap( messageText , width=50 ) ,
                         collapse="\n" )
    text( 0 , 0 , displayText , cex=1 )
    # Wait for space bar press:
    getGraphicsEvent( prompt="" , onKeybd = studyKeybd )
}

#==============================================================================
# Specify design and trial sequence.



# Get subject number, which determines design condition:
pathname = "CanonicalHighlightingData"
try( dir.create(pathname) , silent=TRUE )

overwrite = "N"
while ( overwrite != "Y" ) {
    subjN = as.integer( readline("\n\nSpecify the Subject Number: ") )
    filenameroot = paste( "CanonicalHighlighting_" , subjN , "_" , sep="" )
    filelist = dir( path=pathname , pattern=filenameroot )
    if ( length( filelist ) > 0 ) {
        cat("File with this subject number already exists! ")
        overwrite = toupper( readline("Overwrite? (Y/N) ") )
    } else {
        overwrite = "Y"
    }
}

# Specify abstract trial structure.
#   PE1 I1 PL1 PE2 I2 PL2   Resp:E1/L1/E2/L2
blockPh1 = matrix( c(
    rep( c( 1,1,0, 0,0,0,  1 ) , 2 ) , # PE1,I1 -> E1
    rep( c( 0,1,1, 0,0,0,  2 ) , 0 ) , # I1,PL1 -> L1
    rep( c( 0,0,0, 1,1,0,  3 ) , 2 ) , # PE2,I2 -> E2
    rep( c( 0,0,0, 0,1,1,  4 ) , 0 )   # I2,PL2 -> L2
    ) , ncol = 7 , byrow=TRUE )
blockPh2 = matrix( c(
    rep( c( 1,1,0, 0,0,0,  1 ) , 3 ) , # PE1,I1 -> E1
    rep( c( 0,1,1, 0,0,0,  2 ) , 1 ) , # I1,PL1 -> L1
    rep( c( 0,0,0, 1,1,0,  3 ) , 3 ) , # PE2,I2 -> E2
    rep( c( 0,0,0, 0,1,1,  4 ) , 1 )   # I2,PL2 -> L2
    ) , ncol = 7 , byrow=TRUE )
blockPh3 = matrix( c(
    rep( c( 1,1,0, 0,0,0,  1 ) , 1 ) , # PE1,I1 -> E1
    rep( c( 0,1,1, 0,0,0,  2 ) , 3 ) , # I1,PL1 -> L1
    rep( c( 0,0,0, 1,1,0,  3 ) , 1 ) , # PE2,I2 -> E2
    rep( c( 0,0,0, 0,1,1,  4 ) , 3 )   # I2,PL2 -> L2
    ) , ncol = 7 , byrow=TRUE )
blockTst = matrix( c(
    rep( c( 1,1,0, 0,0,0,  1 ) , 2 ) , # PE1,I1 -> E1
    rep( c( 0,1,1, 0,0,0,  2 ) , 2 ) , # I1,PL1 -> L1
    rep( c( 0,0,0, 1,1,0,  3 ) , 2 ) , # PE2,I2 -> E2
    rep( c( 0,0,0, 0,1,1,  4 ) , 2 ) , # I2,PL2 -> L2
    rep( c( 0,1,0, 0,0,0,  0 ) , 1 ) , # I 1
    rep( c( 0,0,0, 0,1,0,  0 ) , 1 ) , # I 2
    rep( c( 1,0,1, 0,0,0,  0 ) , 1 ) , # PE.PL 1/2
    rep( c( 0,0,0, 1,0,1,  0 ) , 1 ) , # PE.PL 2/1
    rep( c( 1,0,0, 0,0,1,  0 ) , 1 ) , # PE.PLo 1/2
    rep( c( 0,0,1, 1,0,0,  0 ) , 1 ) , # PE.PLo 2/1
    rep( c( 1,0,0, 0,0,0,  0 ) , 1 ) , # PE 1
    rep( c( 0,0,0, 1,0,0,  0 ) , 1 ) , # PE 2
    rep( c( 0,0,1, 0,0,0,  0 ) , 1 ) , # PL 1
    rep( c( 0,0,0, 0,0,1,  0 ) , 1 ) , # PL 2
    rep( c( 1,1,1, 0,0,0,  0 ) , 1 ) , # I.PE.PL 1
    rep( c( 0,0,0, 1,1,1,  0 ) , 1 ) , # I.PE.PL 2
    rep( c( 0,1,1, 1,0,0,  0 ) , 1 ) , # I.PEo.PL 1/2
    rep( c( 1,0,0, 0,1,1,  0 ) , 1 ) , # I.PEo.PL 2/1
    rep( c( 1,1,0, 0,0,1,  0 ) , 1 ) , # I.PE.PLo 1/2
    rep( c( 0,0,1, 1,1,0,  0 ) , 1 ) , # I.PE.PLo 2/1
    rep( c( 0,1,0, 1,0,1,  0 ) , 1 ) , # I.PEo.PLo 1/2
    rep( c( 1,0,1, 0,1,0,  0 ) , 1 ) , # I.PEo.PLo 2/1
    rep( c( 0,1,0, 1,0,0,  0 ) , 1 ) , # I.PEo 1/2
    rep( c( 1,0,0, 0,1,0,  0 ) , 1 ) , # I.PEo 2/1
    rep( c( 0,1,0, 0,0,1,  0 ) , 1 ) , # I.PLo 1/2
    rep( c( 0,0,1, 0,1,0,  0 ) , 1 )   # I.PLo 2/1
    ) , ncol = 7 , byrow=TRUE )

NPh1 = 10
NPh2 = 5
NPh3 = NPh1 + NPh2
NTst = 2

trialMat = matrix( 0 , ncol=9 , nrow=0 )
for ( blkIdx in 1:NPh1 ) {
    nTrlPerBlk = dim(blockPh1)[1]
    trialMat = rbind( trialMat , 
                      cbind( rep(1,nTrlPerBlk) , 
                             rep(blkIdx,nTrlPerBlk) , 
                             blockPh1[ sample(1:nTrlPerBlk) , ] ) )
}
for ( blkIdx in 1:NPh2 ) {
    nTrlPerBlk = dim(blockPh2)[1]
    trialMat = rbind( trialMat , 
                      cbind( rep(2,nTrlPerBlk) , 
                             rep(blkIdx,nTrlPerBlk) , 
                             blockPh2[ sample(1:nTrlPerBlk) , ] ) )
}
for ( blkIdx in 1:NPh3 ) {
    nTrlPerBlk = dim(blockPh3)[1]
    trialMat = rbind( trialMat , 
                      cbind( rep(3,nTrlPerBlk) , 
                             rep(blkIdx,nTrlPerBlk) , 
                             blockPh3[ sample(1:nTrlPerBlk) , ] ) )
}
for ( blkIdx in 1:NTst ) {
    nTrlPerBlk = dim(blockTst)[1]
    trialMat = rbind( trialMat , 
                      cbind( rep(4,nTrlPerBlk) , 
                             rep(blkIdx,nTrlPerBlk) , 
                             blockTst[ sample(1:nTrlPerBlk) , ] ) )
}
colnames( trialMat ) = c( "Ph", "Blk" , names(permCueWords) , "CR" )
ntr = dim(trialMat)[1]


#==============================================================================
# Command sequence for running the experiment begins here.

# Open window that will be used as background.
#windows()
displayBlankWindow()

# Open main window in which to display all experiment graphics.
windows() # fine tune this later...
layout( matrix( c( rep(1,2*3) , rep(2,2*1) ) , ncol=2 , byrow=TRUE ) )

screen0text = "
EXPERIMENTER: \n\n Please move this window to the center of the screen.
Move the cursor off to the corner of the screen and move
the mouse away from the reach of the participant.
"

screen1text = "
Thanks for participating in this experiment.
Please turn off cell phones and other personal
electronics. Stow all belongings under the desk.
Please do not take any notes during the experiment.
"

screen2text = "
In this experiment you will see some common words on the
computer screen. Your job is to learn which words indicate which
keys to press. You can press 'F', 'G', 'H', or 'J'. When the words
are presented, you make a guess by pressing one of the keys.
Please locate the F, G, H, and J keys on the keyboard now --- they
are in the middle of the keyboard.
After you make your choice in response to the words,
the correct answer will be displayed.
"

screen3text = "
At first you will just be guessing, but after several repetitions you
can learn which words indicate which keys. The correct keys for the words
never change, so you can achieve perfect accuracy if you try. \n\n At some
times during the experiment, new words may be introduced.
Just learn these new words as accurately as you can.
"

screen4text = "
There are lots of words to go through, but the whole sequence really
takes only about 15 minutes or less (even though it might feel like much
longer!). \n\n If you have questions, please ask the experimenter now.
\n\n PLEASE NOW WAIT FOR THE EXPERIMENTER TO CLOSE THE CURTAIN BEHIND YOU.
"

displayInstruct( screen0text )
audioNtrials = 4
for ( audioTrial in 1:audioNtrials ) {
    screenAtext = paste( "EXPERIMENTER: \n\n Check the audio volume:
                         \n\n Trial " , audioTrial  , ". \n\n
                         A bell or beep will sound when you press the space bar.
                         Adjust the volume of the speakers as needed.
                         This screen will iterate " ,
                         audioNtrials , " times." , sep="" )
    displayInstruct( screenAtext )
    alarm()
}
displayInstruct( "EXPERIMENTER: Seat the participant now." )
displayInstruct( screen1text )
displayInstruct( screen2text )
displayInstruct( screen3text )
displayInstruct( screen4text )

# Prepare data matrix
dataVarNames = c("Subj","Trl",colnames(trialMat),"Chc","Acc","RT","ST")
dataMat = matrix( 0 , nrow=0 , ncol=length(dataVarNames) )
colnames( dataMat ) = dataVarNames

for ( trialIdx in 1:dim(trialMat)[1] ) {

    # Blank screen during inter-trial interval
    interTrialInterval( dur = 0.5 )
    
    # Extract cues and correct response
    cuevec = trialMat[ trialIdx , c("PE1","I1","PL1","PE2","I2","PL2") ]
    cr = permRespKeys[ trialMat[ trialIdx , "CR" ] ]
    if ( length(cr) == 0 ) cr = "*" # if testing trial, put in placeholder

    # Display the cues and response prompt.
    displayCues( cuevec ) 
    displayRespButtons()

    # Wait for response after cues.
    choice = 0
    startRT = proc.time()[3]
    getGraphicsEvent( prompt="" , onKeybd = choiceKeybd )
    #    choice value is set by choiceKeybd
    #    endRT value is set by choiceKeybd
    if ( cr != "*" ) {
       Acc = as.integer( cr == choice )
    } else {
       Acc = NA
    }
    RT = endRT - startRT

    # Display the correct answer.
    displayCues( cuevec ) 
    displayCorrResp( cr , choice )

    # Wait for response after study.
    startST = proc.time()[3]
    getGraphicsEvent( prompt="" , onKeybd = studyKeybd )
    ST = endST - startST  # endST value is set by studyKeybd

    # Append the trial data to the data matrix.
    # dataVarNames = c("Subj","Trl",colnames(trialMat),"Chc","Acc","RT","ST")
    dataMat = rbind( dataMat ,
           c( subjN ,
              trialIdx , trialMat[trialIdx,] ,
              which( permRespKeys == choice ) , Acc ,
              round(RT,3) , round(ST,3) ) )

    show( dataMat ) ; flush.console()


} # end of trial loop

filename = paste( pathname , "/" , filenameroot , "info.txt" , sep="" )
write( paste( "Subject: " , subjN , "\n" ) , file=filename )
write( date() , file=filename , append=TRUE )
write( "\npermCueWords:" , file=filename , append=TRUE )
write( permCueWords , file=filename , append=TRUE )
write( "\npermRespKeys:" , file=filename , append=TRUE )
write( permRespKeys , file=filename , append=TRUE )

filename = paste( pathname , "/" ,  filenameroot , "data.txt" , sep="" )
write.table( dataMat , file=filename , sep="," ,
             row.names = FALSE , col.names = TRUE )

screenEtext = "
That's all! \n\n
Please retrieve any personal belongings from under the desk.
So as not to disturb other participants still doing the experiment,
please QUIETLY go to the front reception area. Tell the experimenter
that you are finished. The experimenter can tell you more about the
purpose of the experiment if you like.
\n\n Thanks again for participating!
"

displayInstruct( screenEtext )


#==============================================================================
# End of program.

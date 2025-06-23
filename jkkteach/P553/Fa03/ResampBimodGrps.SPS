/* Suppose we have a measure of the 'polarity' a person           */
/* tends toward. The scale goes from -1 to +1. The people are in  */
/* two different groups, A and B. Here are the polarity scores of */
/* people in the two groups:                                      */
/* Group A: -1.0 -0.9 -0.8 -0.1 +0.4 +0.8 +0.9 +1.0 +1.0 +1.0     */
/* Group B: -1.0 -1.0 -0.9 -0.9 -0.7 +0.1 +0.9 +1.0 +1.0          */

input program .

  /* grab 10000 samples */
  loop #i = 1 to 10000 .

    /* get 19 values per sample */
    do repeat s_index = x1 to x19 .

      /* for each item sampled, get a random index from 1 to 19 */
      compute s_index = trunc(uniform(19))+1 . 

    end repeat .

    /* recode the index value to the corresponding data value */ 
    recode x1 to x19 
      (1= -1.0) (2= -0.9) (3= -0.8) (4= -0.1) (5= +0.4) (6= +0.8) 
      (7= +0.9) (8= +1.0) (9= +1.0) (10= +1.0) (11= -1.0) (12= -1.0)
      (13= -0.9) (14= -0.9) (15= -0.7) (16= +0.1) (17= +0.9) (18= +1.0)
      (19= +1.0) .

    /* compute the mean of the first group of 10 scores */
    compute meana = mean(x1 to x10) .

    /* compute the mean of the second group of 9 scores */
    compute meanb = mean(x11 to x19) .

    /* computer the difference of group means */
    compute diffmean = meana - meanb .

    end case .
  end loop .
  end file.
end input program .
execute .

/* display a histogram of the sampling distribution */
igraph
  /x1=var(diffmean) type=scale title='Sample Difference of Means'
  /y=$count title='Frequency'
  /coordinate=vertical
  /title='Histogram of 10000 Sample Differences of Means'
  /subtitle='Resampled from 19 polarity scores'
  /x1length=5.0
  /ylength=3.0
  /chartlook='C:\Program Files\SPSS\Looks\Grayscale.clo'
  /scalerange=var(diffmean) min= -2.0 max = 2.0
  /scalerange=$count min = 0.0 max = 800.0
  /histogram shape=histogram curve=on x1interval auto x1start=0 .
execute.

/* determine the critical values of the sampling distribution */
frequencies variables = diffmean
  /format = notable
  /percentiles = 2.5 5.0 15.0 16.0  84.0 85.0 95.0 97.5 .
execute .

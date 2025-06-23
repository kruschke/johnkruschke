
*define-variables*
!show-sig = no
# end of define-variables section

*error-response*
# end error-response section

*append-response*
!append-file-name = "/ip/jkkteach/www/ExcelSampler/survey.dat"
* Date: [!DATE]  Remote_host: [!REMOTE_HOST]  Remote_address: [!REMOTE_ADDR]  status: [userstatus]  visit: [visit]  where: [where]

*success-response*
<html>
<font face="tahoma">
<head>
<title>General Sampler for Excel / John K. Kruschke</title>
</head>
<body bgcolor="khaki">

<h2> General Samplers for Excel </h2> 

<!--
by <a
href="http://www.indiana.edu/~kruschke/" target="new"> John K. Kruschke </a>
-->


<p>Below are links to the samplers. There a three <em>general</em>
samplers, from which all the others are easily constructed. The three
general samplers correspond to one-group, two-group and three-group
populations. These three samplers are all that you really need, but
I've included several specific cases of each, just as examples of what
you can do. Click on any link below to download the corresponding
sampler.

<p>If you adopt these materials for a course, or find they have been
useful in your learning of statistics, or have suggestions, please
drop me a note and let me know (<font size="-1">so that I can muster
some faint hope that my existence isn't totally useless in a dark,
uncaring universe (contact info is on <a
href="http://www.indiana.edu/~kruschke/" target="new">my main web
page</a>)</font>).

<p>Enjoy! 

<ul>

<li><a
href="http://www.indiana.edu/~jkkteach/ExcelSampler/ExcelSamplers.zip">
All of 'em in one zip package.</a> But please read details
below to find out what you are getting.

<p><li><a
href="http://www.indiana.edu/~jkkteach/ExcelSampler/GeneralSamplerForOneGroup.xls">
<b>General Sampler for a One-Group Population</b> </a> <font
size="-1">(same as <em>t</em> from normal population, &mu;=0.0
&sigma;=1.0 N=4.)</font>

<font size="-1">

<p><em>Special cases of the one-group sampler:</em> (All of these are
easy to create from the general sampler.)

<dl> 

<dt><a
href="http://www.indiana.edu/~jkkteach/ExcelSampler/Mean_NormalMu0_N4.xls">
Sample mean from normal population, &mu;=0.0 &sigma;=1.0 N=4.</a>

<dd>Example assignment questions: Is the mean of the sample means
equal to &mu;? Is the standard deviation (i.e. standard error) of the
sample means equal to &sigma;/sqrt(N)? Use this as a reference
distribution for the next few cases, in which &mu;, &sigma; or N are
varied.


<dt><a
href="http://www.indiana.edu/~jkkteach/ExcelSampler/Mean_NormalMu1_N4.xls">
Sample mean from normal population, &mu;=1.0 &sigma;=1.0 N=4.</a>

<dd>Example assignment questions: Is the mean of the sample means
equal to &mu;=1.0? 


<dt><a
href="http://www.indiana.edu/~jkkteach/ExcelSampler/Mean_NormalSDpnt5_N4.xls">
Sample mean from normal population, &mu;=0.0 &sigma;=0.5 N=4.</a>

<dd>Example assignment questions: Is the standard deviation
(i.e. standard error) of the sample means equal to &sigma;/sqrt(N)?


<dt><a
href="http://www.indiana.edu/~jkkteach/ExcelSampler/Mean_NormalMu0_N9.xls">
Sample mean from normal population, &mu;=0.0 &sigma;=1.0 N=9.</a>

<dd>Example assignment questions: Is the standard deviation
(i.e. standard error) of the sample means equal to &sigma;/sqrt(N)?


<dt><a
href="http://www.indiana.edu/~jkkteach/ExcelSampler/Mean_Bimodal_N4.xls">
Sample mean from bimodal population, N=4. </a>

<dd>Example assignment questions: Why are there multiple modes in the
sampling distribution?


<dt><a
href="http://www.indiana.edu/~jkkteach/ExcelSampler/Mean_Bimodal_N9.xls">
Sample mean from bimodal population, N=9. </a>

<dd>Example assignment questions: With N=9 (instead of N=4 as in the
previous sampler), why is there a single mode in the sampling
distribution? Why is the sampling distribution looking more normal?


<dt><a
href="http://www.indiana.edu/~jkkteach/ExcelSampler/Mean_Wild_N4.xls">
Sample mean from wild population, N=4. </a>

<dd>Example assignment questions: Why does the sampling distribution
look smoother than the wild population? Is the mean of the sample
means equal to the mean of the population? Is the standard deviation
of the sampling distribution equal to the standard deviation of the
population divided by sqrt(N)?


<dt><a
href="http://www.indiana.edu/~jkkteach/ExcelSampler/t_NormalMu0_N4.xls">
<em>t</em> from normal population, &mu;=0.0 &sigma;=1.0 N=4.  </a>

<dd>Example assignment questions: Compare the critical values of the
Monte Carlo sampling distribution with the tabled values in a standard
<em>t</em> table. This should help with understanding where those
tabled values come from! Try again with &sigma;=0.5, and notice that
the sampling distribution does not change (i.e., the <em>t</em>
distribution does not depend on &sigma;).


<dt><a
href="http://www.indiana.edu/~jkkteach/ExcelSampler/t_NormalMu0_N9.xls">
<em>t</em> from normal population, &mu;=0.0 &sigma;=1.0 N=9.  </a>

<dd>Example assignment questions: Compare the critical values of the
Monte Carlo sampling distribution with the tabled values in a standard
<em>t</em> table. Notice the effect of N=9 vs N=4.


<dt><a
href="http://www.indiana.edu/~jkkteach/ExcelSampler/t_NormalMuPnt75_N4.xls">
<em>t</em> from normal population, &mu;=0.75 &sigma;=1.0 N=4.  </a>

<dd>Example assignment questions: Estimate the <b>power</b> of an
experiment run from this alternative hypothesis.


<dt><a
href="http://www.indiana.edu/~jkkteach/ExcelSampler/Max_NormalMu0_N4.xls">
Sample maximum from normal population. </a>

<dd>Example assignment questions: Emphasizes to students that the
sample statistic can be anything, not just the mean. The distribution
of the sample maximum can be used for hypothesis testing about the
tallest, fastest, etc. Useful also for exploring models of response
times.


<dt><a
href="http://www.indiana.edu/~jkkteach/ExcelSampler/Binomial_Pnt5_N14.xls">
Binomial sampling distribution, with population p=.5 and N=14. </a>

<dd>Example assignment questions: Does the Monte Carlo distribution
match the binomial formula probabilities fairly closely? If a coin
were flipped 14 times and it came up heads 12 times, would you reject
the hypothesis that p=.5? (Caution: Guard against interpreting the
graph of the population as a continuous distribution; the x-axis scale
is really nominal, not ordinal or interval.)


<dt><a
href="http://www.indiana.edu/~jkkteach/ExcelSampler/Binomial_Pnt7_N14.xls">
Binomial sampling distribution, with population p=.7 and N=14. </a>

<dd>Example assignment questions: Does the Monte Carlo distribution
match the binomial formula probabilities fairly closely? If a coin
were flipped 14 times and it came up heads 12 times, would you reject
the hypothesis that p=.75? (Caution: Guard against interpreting the
graph of the population as a continuous distribution; the x-axis scale
is really nominal, not ordinal or interval.)


</dl>

</font>

<p><li><a href="http://www.indiana.edu/~jkkteach/ExcelSampler/GeneralSamplerForTwoGroups.xls">
<b>General Sampler for a Two-Group Population</b>
</a>

<font size="-1">

<p><em>Special cases of the two-group sampler:</em> (All of these are
easy to create from the general sampler.)

<dl> 


<dt><a
href="http://www.indiana.edu/~jkkteach/ExcelSampler/t_2GrpNormalNull_N4.xls">
<em>t</em> from two normal populations, equal means, equal variances,
N=4.  </a>

<dd>Example assignment questions: Compare the Monte Carlo critical
values with the critical values in the standard <em>t</em>
table. Be careful to consider the appropriate df.


<dt><a
href="http://www.indiana.edu/~jkkteach/ExcelSampler/t_2GrpNormalNull_N9.xls">
<em>t</em> from two normal populations, equal means, equal variances,
N=9.  </a>

<dd>Example assignment questions: Compare the Monte Carlo critical
values with the critical values in the standard <em>t</em> table. Be
careful to consider the appropriate df, and notice the change from
N=4.


<dt><a
href="http://www.indiana.edu/~jkkteach/ExcelSampler/t_2GrpNormalEffectSzPnt7_N4.xls">
<em>t</em> from two normal populations, unequal means, equal
variances, N=4.  </a>

<dd>Example assignment questions: Estimate is the <b>power</b> for an
experiment sampled from this alternative population.


<dt><a
href="http://www.indiana.edu/~jkkteach/ExcelSampler/t_2GrpNormalHeteroVar_N3N5.xls">
<em>t</em> from two normal populations, equal means, unequal
variances, N<sub>1</sub>=3 N<sub>2</sub>=5.  </a>

<dd>Example assignment questions: Compare the Monte Carlo critical
values with the tabled critical values. So why must we be careful
about <b>homogeneity of variance</b> when doing a <em>t</em>-test
using the tabled critical values?


<dt><a
href="http://www.indiana.edu/~jkkteach/ExcelSampler/t_2GrpResampled_N9.xls">
<em>t</em> <b>resampled</b> from pooled data. <b>Includes extra
instruction sheet for resampling.</b> </a>

<dd>Example assignment questions: Are the critical values from the
resampled <em>t</em> distribution much different than the critical
values tabled in the textbook? Try instead with data that are
radically skewed.


</dl>

</font>

<p><li><a
href="http://www.indiana.edu/~jkkteach/ExcelSampler/GeneralSamplerForThreeGroups.xls">
<b>General Sampler for a Three-Group Population</b> </a>

<font size="-1">

<p><em>Special cases of the three-group sampler:</em> (All of these are
easy to create from the general sampler.)

<dl> 


<dt><a
href="http://www.indiana.edu/~jkkteach/ExcelSampler/F_3GrpNormalNull_N4N4N4.xls">
F sampling distribution from three groups, normal populations with
equal means, N=4. </a>

<dd>Example assignment questions: Do the Monte Carlo critical values
match the tabled critical values? Careful to consider the appropriate df.


<dt><a
href="http://www.indiana.edu/~jkkteach/ExcelSampler/F_3GrpNormalAltEffect_N4N4N4.xls">
F sampling distribution from three groups, normal populations with
unequal means, N=4.  </a>

<dd>Example assignment questions: Estimate the <b>power</b> of an
experiment run from this alternative population hypothesis. What is
the effect size in this case?


<dt><a
href="http://www.indiana.edu/~jkkteach/ExcelSampler/F_3GrpNormalHeteroVar_N4N4N4.xls">
F sampling distribution from three groups, normal populations with
nonhomogeneous variances, N=4.  </a>

<dd>Example assignment questions: Do the Monte Carlo critical values
match the tabled critical values very closely?  So why must we be
careful about <b>homogeneity of variance</b> when doing an
<em>F</em>-test using the tabled critical values?


</dl>

</font>

</ul>

<p><small>P.S. If you want to bookmark this page for future reference, you
actually need to bookmark the entry page, at <a
href="http://www.indiana.edu/~jkkteach/ExcelSampler/">
http://www.indiana.edu/~jkkteach/ExcelSampler/</a>. Trying to access
the present page directly will cause problems because of the form
processor.</small>

</body>
</font>
</html>
# end success-response section










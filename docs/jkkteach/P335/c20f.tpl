# begin template file

*define-variables*
!show-sig = no
[req-r20] = "You must enter a category choice."
# end of define-variables section

*error-response*
<html>
<head><title>Error</title></head>
<body bgcolor="#FF3333">
<br>[r20]
<p>Click the "Back" button on your web browser to return to the
previous case.
<p><hr>
</body>
</html>
# end error-response section

*success-response*
<html>
<head><title>P335 Prof Kruschke, Homework 3</title></head>
<body bgcolor="#FFFFFF">


<center>
<h3>P335 Cognitive Psychology, Prof. Kruschke</h3>
<h2>Models of Categorization</h2>
</center>

<p>You're now done with the category learning.  <em>Print this
now</em>. <strong>Be sure that everything displayed on your computer
screen has actually printed correctly.  If anything is missing from
the printed version, write it in by hand.</strong>

<p><center>
<table border=1 cellpadding=2>
<tr>
<td colspan=5 align=center><strong>Table 1: Your "raw" data.</strong></td>
</tr>
<tr>
<td align=center>Training<br>Case</td> 
<td align=center>Line<br>Position<br>(1=left, 6=right)</td> 
<td align=center>Rectangle<br>Height<br>(1=short, 6=tall)</td> 
<td align=center>Correct Response</td>  
<td align=center>Your Response</td>
</tr>
<tr> <td> 1</td> <td>1</td> <td>3</td> <td>X</td> <td>[r01]</td> </tr>
<tr> <td> 2</td> <td>3</td> <td>3</td> <td>O</td> <td>[r02]</td> </tr>
<tr> <td> 3</td> <td>3</td> <td>1</td> <td>X</td> <td>[r03]</td> </tr>
<tr> <td> 4</td> <td>5</td> <td>5</td> <td>O</td> <td>[r04]</td> </tr>
<tr> <td> 5</td> <td>3</td> <td>3</td> <td>O</td> <td>[r05]</td> </tr>
<tr> <td> 6</td> <td>1</td> <td>3</td> <td>X</td> <td>[r06]</td> </tr>
<tr> <td> 7</td> <td>5</td> <td>5</td> <td>O</td> <td>[r07]</td> </tr>
<tr> <td> 8</td> <td>3</td> <td>1</td> <td>X</td> <td>[r08]</td> </tr>
<tr> <td> 9</td> <td>1</td> <td>3</td> <td>X</td> <td>[r09]</td> </tr>
<tr> <td>10</td> <td>5</td> <td>5</td> <td>O</td> <td>[r10]</td> </tr>
<tr> <td>11</td> <td>3</td> <td>3</td> <td>O</td> <td>[r11]</td> </tr>
<tr> <td>12</td> <td>3</td> <td>1</td> <td>X</td> <td>[r12]</td> </tr>
<tr> <td>13</td> <td>3</td> <td>3</td> <td>O</td> <td>[r13]</td> </tr>
<tr> <td>14</td> <td>1</td> <td>3</td> <td>X</td> <td>[r14]</td> </tr>
<tr> <td>15</td> <td>5</td> <td>5</td> <td>O</td> <td>[r15]</td> </tr>
<tr> <td>16</td> <td>3</td> <td>1</td> <td>X</td> <td>[r16]</td> </tr>
<tr>
<td align=center>Test<br>Case</td> 
<td align=center>Line<br>Position<br>(1=left, 6=right)</td> 
<td align=center>Rectangle<br>Height<br>(1=short, 6=tall)</td> 
<td align=center>Correct Response</td>  
<td align=center>Your Response<br></td>
</tr>
<tr> <td>17</td> <td>1</td> <td>5</td> <td>?</td> <td>[r17]</td> </tr>
<tr> <td>18</td> <td>5</td> <td>1</td> <td>?</td> <td>[r18]</td> </tr>
<tr> <td>19</td> <td>1</td> <td>6</td> <td>?</td> <td>[r19]</td> </tr>
<tr> <td>20</td> <td>6</td> <td>1</td> <td>?</td> <td>[r20]</td> </tr>
</table>
</center>

<p>A summary of your responses is shown in Table 1, above. Each row of
Table 1 indicates a single training or testing trial.  Each row
specifies which stimulus was shown, what the correct answer was, and
what choice you made.  The position of the line segment is specified
on a horizontal scale from 1 to 6, where 1 means far left and 6 means
far right.  The rectangle height is specified on a vertical scale,
where 1 means short and 6 means tall.  For the test cases that came at
the end (trials 17-20), there was no correct answer supplied, so Table
1 just shows a "?" for the correct answer.

<p>There were 16 training trials (cases 1-16), followed by 4 trials
that tested generalization to novel stimuli (cases 17-20).  The 16
training trials consisted of 4 repetitions of 4 different stimuli.
Thus, trials 1-4 showed four different stimuli, then trials 5-8 showed
the same four stimuli again (in a different order), then the same
stimuli were repeated again in trials 9-12, and then again in trials
13-16.  Look at Table 1, above, for reference, and
<strong>list the 4 different <em>training</em> stimuli (<em>not</em>
the <em>test</em> stimuli) in the Table 2 below:</strong>

<center>
<table border=1 cellpadding=10 width=60%>
<tr>
<td colspan=3 align=center>Table 2: The four training stimuli.</td>
</tr>
<tr>
<td align=center>Line<br>Position<br>(1=left, 6=right)</td> 
<td align=center>Rectangle<br>Height<br>(1=short, 6=tall)</td> 
<td align=center>Correct Response</td>  
</tr>
<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
</table>
</center>


<p>
<table align=right width=60% vspace=3 hspace=3 border=1 cellpadding=3>
<tr><td align=center valign=center>
<img src="http://www.indiana.edu/~jkkteach/P335/cathwfig1.gif">
</td></tr>
<tr><td><font size=-1>Figure 1.  The dot at point 3,1 denotes 
the stimulus with line position 3 and rectangle height 1.</font></td></tr>
</table>
</td>
</tr>
</table>

<strong>Notation:</strong> From this point on, a stimulus with line
position <em>p</em> and height <em>h</em> will be denoted
<em>p,h</em>.  For example, the stimulus with line position 3 and
height 1 will be denoted <em>stimulus 3,1</em>.  Figure 1 (right)
shows how a stimulus is indicated in "stimulus space."  The horizontal
axis indicates the line position, and the vertical axis indicates the
rectangle height.  Thus, a point at 3,1 in the space, as shown in
Figure 1, corresponds to the stimulus with a line position of 3 and a
height of 1.  

<p>For you own understanding, you should draw points in Figure 1 that
correspond to the four training items from Table 2.  Label each point
with its correct category label (X or O).  You should also draw points
in Figure 1 that correspond to the four test items from the end of
Table 1.  Label these test points with questions marks, to indicate
that the correct category label is not specified.

<p>
<table align=right width=60% vspace=3 hspace=3 border=1 cellpadding=3>
<tr><td align=center valign=center>
<img src="http://www.indiana.edu/~jkkteach/P335/cathwfig2.gif">
</td></tr>
<tr><td><font size=-1>Figure 2. The distance between stimuli 3,1 and 5,5 is 
6.</font></td></tr>
</table>

<strong>Computing Distance Between
Stimuli.</strong> For purposes of testing theories, we'll need to
measure the "distance" between stimuli.  The idea is this: If we've
learned to classify one stimulus as an X, then we should classify
another <em>similar</em> stimulus as an X too.  So we need to decide
what we mean by one stimulus being <em>similar</em> to another
stimulus.  We can measure the similarity of two rectangle-and-line
stimuli as the sum of their similarity in height and their similarity
in line position.  For example, consider stimuli <em>3,1</em> and
<em>5,5</em>, as shown in Figure 2.  The difference in their line
positions is 2 (because &#124;3-5&#124;=2) and the difference in their
heights is 4 (because &#124;1-5&#124;=4).  Then the <em>overall</em>
difference between the stimuli is just the sum of their position
difference and their height difference.  So, we'll say that the
<strong>distance</strong> between stimulus <em>3,1</em> and stimulus
<em>5,5</em> is &#124;3-5&#124; + &#124;1-5&#124; = 6.
In summary, two stimuli have <em>big similarity</em> if
there is <em>little distance</em> between them.  Distance between
stimuli is measured as the sum of the position difference and the
height difference.



<p><strong>Prototype Theory.</strong> Prototype theory claims that we
mentally <em>represent</em> a category by its central tendency (i.e.,
its prototype).  The <em>process</em> of classifying a stimulus
consists of determining which mental prototype is most similar (least
distant) from the stimulus, and then classifying the stimulus into
that prototype's category.  We will now test whether prototype theory
makes predictions that match your data.


<p>Determine the prototypes of the X and O categories, by computing
the average height and line position of the X cases and of the O
cases. Each category had just 2 training instances; use the Table 2
for reference.  For example, the two stimuli from category X had line
positions of 1 and 3, so the average line position was (1+3)/2 = 2.
Enter your answers in Table 3, below.

<p><center>
<table border=1 cellpadding=10 width=60%>
<tr><td colspan=3 align=center>Table 3: The category prototypes</td></tr>
<tr>
<td>Category</td>  
<td>Average<br>Line<br>Position</td> 
<td>Average<br>Rectangle<br>Height</td> 
</tr>
<tr><td>X</td><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><td>O</td><td>&nbsp;</td><td>&nbsp;</td></tr>
</table>
</center>

<p>For you own understanding, you should draw points in Figure 1 that
correspond to the two prototypes from Table 3.  Label each point as
the X prototype or the O prototype.  The prototype for X should lie
halfway between the two X instances, and the prototype for O should
lie halfway between the two O instances.

<p>Now determine the predictions of prototype theory for the four test
cases you classified at the end of training, and compare the
predictions with your responses.  To do this, you need to determine,
for each test stimulus, which category prototype is closest, and then
check whether the closest category's prototype corresponds to your
choice preference.  Fill out Table 4, below.

<p>

<p><table border=1 cellpadding=2>
<tr><td colspan=8 align=center>Table 4: 
Predictions of prototype theory</td></tr>
<tr>
<td>Test Case</td>
<td>Line Position</td>
<td>Rect. Height</td>
<td>Distance from X Prototype</td>
<td>Distance from O Prototype</td>
<td>What is the category (X or O) of the closest prototype, 
or are they equidistant?</td>
<td>Your Response</td>
<td>Does your response correspond to the prototype theory prediction?</td>
</tr>
<tr><td>17</td><td>1</td><td>5</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r17]</td><td>&nbsp;</td></tr>
<tr><td>18</td><td>5</td><td>1</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r18]</td><td>&nbsp;</td></tr>
<tr><td>19</td><td>1</td><td>6</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r19]</td><td>&nbsp;</td></tr>
<tr><td>20</td><td>6</td><td>1</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r20]</td><td>&nbsp;</td></tr>
</table>

<p><strong>Exemplar Theory.</strong> A simple version of exemplar
theory claims that we mentally <em>represent</em> categories by all
the learned instances (instead of by just a prototype).  The
<em>process</em> of classifying a stimulus consists of determining
which mental exemplar is most similar (least distant), and then
classifying the stimulus into that exemplar's category.  (Note: This
version of exemplar theory uses only the <em>closest</em> exemplar to
determine the classification of the stimulus.  This version of
exemplar theory does not integrate, or compute the average of,
similarities to all exemplars.)  Fill out Table 5, below, to determine
whether your responses are well matched by the predictions of exemplar
theory:

<p><table border=1 cellpadding=2>
<tr><td colspan=10 align=center>Table 5: Predictions of exemplar 
theory</td></tr><tr>
<td rowspan=2>Test Case</td>
<td rowspan=2>Line Position</td>
<td rowspan=2>Rect. Height</td>
<td colspan=4 align=center>Distance from known exemplars</td>
<td rowspan=2>What is the category of the closest exemplar?</td>
<td rowspan=2>Your Response</td>
<td rowspan=2>Does your response correspond to the 
exemplar theory prediction?</td>
</tr>
<tr>
<td>Distance from <em>1,3</em> (cat. X)</td>
<td>Distance from <em>3,1</em> (cat. X)</td>
<td>Distance from <em>3,3</em> (cat. O)</td>
<td>Distance from <em>5,5</em> (cat. O)</td>
</tr>
<tr><td>17</td><td>1</td><td>5</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r17]</td><td>&nbsp;</td></tr>
<tr><td>18</td><td>5</td><td>1</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r18]</td><td>&nbsp;</td></tr>
<tr><td>19</td><td>1</td><td>6</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r19]</td><td>&nbsp;</td></tr>
<tr><td>20</td><td>6</td><td>1</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r20]</td><td>&nbsp;</td></tr>
</table>

<p><strong>Rule and Exception Theory.</strong> This theory claims that
we learn a rule for separating categories, along with any exceptions
to the rule.  The mental <em>representation</em> of a category is its
defining rule and exceptions.  The <em>process</em> of classifying a
stimulus is applying all the known rules, and if any of the rules'
conditions are satisfied, then classifying the stimulus according to
the rule.  For example, suppose we learn this rule: <blockquote>"If
the <em>line position</em> is greater than 2, then it's an O, except
for stimulus <em>3,1</em>, which is an X."</blockquote> This rule
accurately classifies the training cases; for example, training
stimulus <em>5,5</em> has line position 5, which is greater than 2,
and so is categorized correctly as an O.  Apply this rule to the test
cases, and check whether it matches your ratings.  Fill out Table 6,
below:

<p><table border=1 cellpadding=2>
<tr><td colspan=6 align=center>Table 6: Predictions of rule and exception 
theory</td></tr><tr>
<td>Test Case</td>
<td>Line Position</td>
<td>Rect. Height</td>
<td>Rule Categorizaton</td>
<td>Your Response</td>
<td>Does your rating correspond to the rule and exception theory prediction?</td>
</tr>
<tr><td>17</td><td>1</td><td>5</td><td>&nbsp;</td><td>[r17]</td><td>&nbsp;</td></tr>
<tr><td>18</td><td>5</td><td>1</td><td>&nbsp;</td><td>[r18]</td><td>&nbsp;</td></tr>
<tr><td>19</td><td>1</td><td>6</td><td>&nbsp;</td><td>[r19]</td><td>&nbsp;</td></tr>
<tr><td>20</td><td>6</td><td>1</td><td>&nbsp;</td><td>[r20]</td><td>&nbsp;</td></tr>
</table>

<!--

<p><strong>Rule and Exception Theory (Height Dominant).</strong>
Consider instead the rule, <blockquote>"If the <em>height</em> is
greater than 2, then it's an O, except for stimulus <em>1,3</em>,
which is an X."</blockquote> Apply this rule to the test cases, and
see if it matches your ratings.  Fill out the table below:

<p><table border=1 cellpadding=2>
<tr>
<td>Test Case</td>
<td>Line Position</td>
<td>Rect. Height</td>
<td>Rule Categorizaton</td>
<td>Your Response</td>
<td>Does your response correspond 
to the rule and exception theory prediction?</td>
</tr>
<tr><td>17</td><td>1</td><td>5</td><td>&nbsp;</td><td>[r17]</td><td>&nbsp;</td></tr>
<tr><td>18</td><td>5</td><td>1</td><td>&nbsp;</td><td>[r18]</td><td>&nbsp;</td></tr>
<tr><td>19</td><td>1</td><td>6</td><td>&nbsp;</td><td>[r19]</td><td>&nbsp;</td></tr>
<tr><td>20</td><td>6</td><td>1</td><td>&nbsp;</td><td>[r20]</td><td>&nbsp;</td></tr>
</table>


<p><strong>Weighted Dimensions for Computing Distance Between
Stimuli.</strong> In the prototype and exemplar theories we considered
above, distance between stimuli was measured by simply summing the
position difference and the height difference.  This simple summation
assumes that a certain difference in line position is just as
important or noticeable as an equal difference in rectangle height.
But this might be inappropriate.  Instead, viewers might perceive a
difference in line position as being more noticeable or important than
a physically equal difference in height.  If we want our measure of
distance to reflect the perceived, psychological difference between
stimuli, then we should allow position and height to have unequal impact.

<p> One way to do this is to multiply the position difference and the
height difference by weighting factors that reflect their relative
importance or noticeability.  For example, suppose that the position
difference is three times as noticeable as the height difference.
Then the psychological distance between stimuli <em>3,1</em> and
<em>5,5</em> would be given by 3x&#124;3-5&#124; + &#124;1-5&#124; =
10.  If, instead, the height is three times as noticeable as the line
position, then the psychological distance would be &#124;3-5&#124; +
3x&#124;1-5&#124; = 14.



<p><strong>Weighted Dimensions Prototype Theory (Position
Dominant).</strong> Determine the predictions of prototype theory,
<em>when the position dimension is weighted three times as important
or noticeable as the height dimension</em>. Fill out the table below:

<p><table border=1 cellpadding=2>
<tr>
<td>Test Case</td>
<td>Line Position</td>
<td>Rect. Height</td>
<td>Weighted Distance from X Prototype</td>
<td>Weighted Distance from O Prototype</td>
<td>Which prototype (X or O) is closest, or are they equidistant?</td>
<td>Your Rating</td>
<td>Does your rating correspond to the weighted dim. prototype theory prediction?</td>
</tr>
<tr><td>17</td><td>1</td><td>5</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r17]</td><td>&nbsp;</td></tr>
<tr><td>18</td><td>5</td><td>1</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r18]</td><td>&nbsp;</td></tr>
<tr><td>19</td><td>1</td><td>6</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r19]</td><td>&nbsp;</td></tr>
<tr><td>20</td><td>6</td><td>1</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r20]</td><td>&nbsp;</td></tr>
</table>

<p><strong>Weighted Dimensions Prototype Theory (Height
Dominant).</strong> Determine the predictions of prototype theory,
<em>when the height dimension is weighted three times as important or
noticeable as the position dimension</em>. Fill out the table below:

<p><table border=1 cellpadding=2>
<tr>
<td>Test Case</td>
<td>Line Position</td>
<td>Rect. Height</td>
<td>Weighted Distance from X Prototype</td>
<td>Weighted Distance from O Prototype</td>
<td>Which prototype (X or O) is closest, or are they equidistant?</td>
<td>Your Rating</td>
<td>Does your rating correspond to the weighted dim. prototype theory prediction?</td>
</tr>
<tr><td>17</td><td>1</td><td>5</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r17]</td><td>&nbsp;</td></tr>
<tr><td>18</td><td>5</td><td>1</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r18]</td><td>&nbsp;</td></tr>
<tr><td>19</td><td>1</td><td>6</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r19]</td><td>&nbsp;</td></tr>
<tr><td>20</td><td>6</td><td>1</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r20]</td><td>&nbsp;</td></tr>
</table>


<p><strong>Weighted Dimensions Exemplar Theory (Position
Dominant).</strong> Consider the predictions of exemplar theory when
distance is computed <em>with position being three times as important
or noticeable as height</em>.  Fill out the table:

<p><table border=1 cellpadding=2>
<tr>
<td rowspan=2>Test Case</td>
<td rowspan=2>Line Position</td>
<td rowspan=2>Rect. Height</td>
<td colspan=4 align=center>Distance from known exemplars</td>
<td rowspan=2>What is the category of the closest known exemplar?</td>
<td rowspan=2>Your Rating</td>
<td rowspan=2>Does your rating correspond to the wtd. dim. exemplar theory prediction?</td>
</tr>
<tr>
<td>Wtd. Distance from <em>1,3</em> (cat. X)</td>
<td>Wtd. Distance from <em>3,1</em> (cat. X)</td>
<td>Wtd. Distance from <em>3,3</em> (cat. O)</td>
<td>Wtd. Distance from <em>5,5</em> (cat. O)</td>
</tr>
<tr><td>17</td><td>1</td><td>5</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r17]</td><td>&nbsp;</td></tr>
<tr><td>18</td><td>5</td><td>1</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r18]</td><td>&nbsp;</td></tr>
<tr><td>19</td><td>1</td><td>6</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r19]</td><td>&nbsp;</td></tr>
<tr><td>20</td><td>6</td><td>1</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r20]</td><td>&nbsp;</td></tr>
</table>

<p><strong>Weighted Dimensions Exemplar Theory (Height
Dominant).</strong> Consider the predictions of exemplar theory when
distance is computed <em>with height being three times as important or
noticeable as position</em>.  Fill out the table:

<p><table border=1 cellpadding=2>
<tr>
<td rowspan=2>Test Case</td>
<td rowspan=2>Line Position</td>
<td rowspan=2>Rect. Height</td>
<td colspan=4 align=center>Distance from known exemplars</td>
<td rowspan=2>What is the category of the closest known exemplar?</td>
<td rowspan=2>Your Rating</td>
<td rowspan=2>Does your rating correspond to the wtd. dim. exemplar theory prediction?</td>
</tr>
<tr>
<td>Wtd. Distance from <em>1,3</em> (cat. X)</td>
<td>Wtd. Distance from <em>3,1</em> (cat. X)</td>
<td>Wtd. Distance from <em>3,3</em> (cat. O)</td>
<td>Wtd. Distance from <em>5,5</em> (cat. O)</td>
</tr>
<tr><td>17</td><td>1</td><td>5</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r17]</td><td>&nbsp;</td></tr>
<tr><td>18</td><td>5</td><td>1</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r18]</td><td>&nbsp;</td></tr>
<tr><td>19</td><td>1</td><td>6</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r19]</td><td>&nbsp;</td></tr>
<tr><td>20</td><td>6</td><td>1</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r20]</td><td>&nbsp;</td></tr>
</table>

-->

<strong>

<p>Which of the theories, if any, gave predictions that corresponded
with all four of your responses?


<center><table border=1 width=75%>
<tr><td>&nbsp;<br><br><br><br></td></tr>
</table></center>


<p>Describe how you intuitively thought of the
categories.  Did you memorize exemplars, or abstract a prototype, or
come up with a rule?  

<center><table border=1 width=75%>
<tr><td>&nbsp;<br><br><br><br></td></tr>
</table></center>


<p>If you think you learned a rule for classifying the stimuli, what
was the rule?

<center><table border=1 width=75%>
<tr><td>&nbsp;<br><br><br><br></td></tr>
</table></center>

</strong>

<p>Compare your individual data with <a
href="http://www.indiana.edu/~jkkteach/P335/hw3results.html"><strong>group
average results</strong></a>.

<p><strong>So what?</strong> Categorization is central to
cognition. How we mentally carve up the world into parts determines
how we respond in the future on the basis of what we've learned in the
past.  If we can figure out how the mind learns and uses categories,
we'll have made a significant step in understanding cognition.

<p><strong>To learn more:</strong> An excellent, very readable survey
of issues in categorization can be found in the book by E. E. Smith
and D. Medin, entitled <em>Categories and Concepts</em> (1981, Harvard
U. Press).  For a recent article on models of category learning, see
Erickson, M. A. and Kruschke, J. K. (1998). Rules and Exemplars in
Category Learning. <em>Journal of Experimental Psychology:
General</em>, <strong>127</strong>, 107-140.

<p><strong>Grading criteria.</strong> This homework assignment is
worth up to 20 points.  Points are deducted for inaccuracies or
omissions. (<a
href="http://www.indiana.edu/~jkkteach/P335/latepolicy.html">Click
here to read the Late Policy.</a>)

<!--
<p><strong>What do you think of this assignment?</strong> Only between
the due date of this assignment and the date of the next exam, please
provide your evaluation of this assignment.  To fill out an evaluation
form and get 2 points for your effort, <a
href="http://www.indiana.edu/~jkkteach/P335/hweval.html">click
here</a>.
-->

<center>
<h5><p>Copyright &copy; 1998, 1999 John K. Kruschke</h5>
</center>
<p><hr>
</body>
</html>
# end of success-response section


*append-response*
!append-file-name = "/ip/jkkteach/www/P335/cathw3.dat"
[r01]	[r02]	[r03]	[r04]	[r05]	[r06]	[r07]	[r08]	[r09]	[r10]	[r11]	[r12]	[r13]	[r14]	[r15]	[r16]	[r17]	[r18]	[r19]	[r20]	[!TIME]	[!DATE]

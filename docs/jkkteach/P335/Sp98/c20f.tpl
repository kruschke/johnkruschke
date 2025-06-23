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
<h2> P335 Cognitive Psychology, Prof. John K. Kruschke</h2>
</center>
<center>
<h2>Homework 3: Models of Categorization</h2>
</center>

<p>You're now done with the category learning.  <em>Print this
now</em> and read on.

<p>Here is a summary of your responses:

<p><center>
<table border=1 cellpadding=2>

<tr>
<td>Training<br>Case</td> 
<td>Line<br>Position<br>(1=left, 6=right)</td> 
<td>Rectangle<br>Height<br>(1=short, 6=tall)</td> 
<td>Correct Response<br>(1=X, 2=O)</td>  
<td>Your Response<br>(1=X, 2=O)</td>
</tr>
<tr> <td> 1</td> <td>1</td> <td>3</td> <td>1</td> <td>[r01]</td> </tr>
<tr> <td> 2</td> <td>3</td> <td>3</td> <td>2</td> <td>[r02]</td> </tr>
<tr> <td> 3</td> <td>3</td> <td>1</td> <td>1</td> <td>[r03]</td> </tr>
<tr> <td> 4</td> <td>5</td> <td>5</td> <td>2</td> <td>[r04]</td> </tr>
<tr> <td> 5</td> <td>3</td> <td>3</td> <td>2</td> <td>[r05]</td> </tr>
<tr> <td> 6</td> <td>1</td> <td>3</td> <td>1</td> <td>[r06]</td> </tr>
<tr> <td> 7</td> <td>5</td> <td>5</td> <td>2</td> <td>[r07]</td> </tr>
<tr> <td> 8</td> <td>3</td> <td>1</td> <td>1</td> <td>[r08]</td> </tr>
<tr> <td> 9</td> <td>1</td> <td>3</td> <td>1</td> <td>[r09]</td> </tr>
<tr> <td>10</td> <td>5</td> <td>5</td> <td>2</td> <td>[r10]</td> </tr>
<tr> <td>11</td> <td>3</td> <td>3</td> <td>2</td> <td>[r11]</td> </tr>
<tr> <td>12</td> <td>3</td> <td>1</td> <td>1</td> <td>[r12]</td> </tr>
<tr> <td>13</td> <td>3</td> <td>3</td> <td>2</td> <td>[r13]</td> </tr>
<tr> <td>14</td> <td>1</td> <td>3</td> <td>1</td> <td>[r14]</td> </tr>
<tr> <td>15</td> <td>5</td> <td>5</td> <td>2</td> <td>[r15]</td> </tr>
<tr> <td>16</td> <td>3</td> <td>1</td> <td>1</td> <td>[r16]</td> </tr>
<tr>
<td>Test<br>Case</td> 
<td>Line<br>Position<br>(1=left, 6=right)</td> 
<td>Rectangle<br>Height<br>(1=short, 6=tall)</td> 
<td>Correct Response</td>  
<td>Your Rating<br>(1.00=Very Probably X, <br>1.25=Probably X, 
<br>1.50=Equally X or O, <br>1.75=Probably O, <br>2.00=Very Probably O)</td>
</tr>
<tr> <td>17</td> <td>1</td> <td>5</td> <td>?</td> <td>[r17]</td> </tr>
<tr> <td>18</td> <td>5</td> <td>1</td> <td>?</td> <td>[r18]</td> </tr>
<tr> <td>19</td> <td>1</td> <td>6</td> <td>?</td> <td>[r19]</td> </tr>
<tr> <td>20</td> <td>6</td> <td>1</td> <td>?</td> <td>[r20]</td> </tr>
</table>

</center>

<p>There were 16 training trials (cases 1-16), followed by 4 trials
that tested generalization to novel stimuli (cases 17-20).  The 16
training trials consisted of 4 repetitions of 4 different stimuli.
Look at the summary table above for reference, and <strong>list the 4
different <em>training</em> stimuli (<em>not</em> the <em>test</em>
stimuli) in the table below:</strong>

<center>
<table>
<table border=1 cellpadding=10 width=60%>
<tr>
<td>Line<br>Position<br>(1=left, 6=right)</td> 
<td>Rectangle<br>Height<br>(1=short, 6=tall)</td> 
<td>Correct Response<br>(1=X, 2=O)</td>  
</tr>
<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
</table>
</center>

<p><strong>Notation:</strong> From here on, a stimulus with line
position <em>p</em> and height <em>h</em> will be denoted
<em>p,h</em>.  For example, the stimulus with line position 3 and
height 1 will be denoted <em>stimulus 3,1</em>.

<p><strong>Computing Distance Between Stimuli.</strong> For purposes
of testing theories, we'll need to measure the "distance" between
stimuli.  The idea is this: If we've learned to classify one stimulus
as an X, then we should classify another similar stimulus as an X too.
So we need to decide what we mean by one stimulus being "similar" to
another stimulus. We can measure the similarity of two
rectangle-and-line stimuli by how different their positions and
heights are. Consider stimuli <em>3,1</em> and <em>5,5</em>.  The
difference in their line positions is 2 (because &#124;3-5&#124;=2)
and the difference in their heights is 4 (because &#124;1-5&#124;=4).
Now, what is the <em>overall</em> difference between the stimuli?  The
simplest answer is just the sum of their position difference and their
height difference.  So, for now, we'll say that the
<strong>distance</strong> between stimulus <em>3,1</em> and stimulus
<em>5,5</em> is &#124;3-5&#124; + &#124;1-5&#124; = 6.  The greater
the distance between stimuli, the less similar they are.


<p><strong>Prototype Theory.</strong> Prototype theory says that we
represent a category by its central tendency (i.e., its prototype),
and we classify an item by determining which learned prototype is
closest to it.

<p>Determine the prototypes of the X and O categories, by computing
the average height and line position of the X cases and of the O
cases. Each category had just 2 training instances; use the table you
filled out above for reference.  Enter your answers in the following
table:

<p><center>
<table>
<table border=1 cellpadding=10 width=60%>
<tr>
<td>Category</td>  
<td>Average<br>Line<br>Position</td> 
<td>Average<br>Rectangle<br>Height</td> 
</tr>
<tr><td>X</td><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><td>O</td><td>&nbsp;</td><td>&nbsp;</td></tr>
</table>
</center>

<p>Now determine the predictions of prototype theory for the four test
cases you classified at the end of training, and compare the
predictions with your responses.  Fill out the table below.  

<p><strong><em>Where a table asks, "Does your rating correspond to the
prediction?", answer "yes" if the prediction is X and you rated it 1.0
or 1.25, or if the prediction is equal and you rated it 1.5, or if the
prediction is O and you rated it 1.75 or 2.0.</em></strong>

<p><table border=1 cellpadding=2>
<tr>
<td>Test Case</td>
<td>Line Position</td>
<td>Rect. Height</td>
<td>Distance from X Prototype</td>
<td>Distance from O Prototype</td>
<td>Which prototype (X or O) is closest, or are they equidistant?</td>
<td>Your Rating</td>
<td>Does your rating correspond to the prototype theory prediction?</td>
</tr>
<tr><td>17</td><td>1</td><td>5</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r17]</td><td>&nbsp;</td></tr>
<tr><td>18</td><td>5</td><td>1</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r18]</td><td>&nbsp;</td></tr>
<tr><td>19</td><td>1</td><td>6</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r19]</td><td>&nbsp;</td></tr>
<tr><td>20</td><td>6</td><td>1</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[r20]</td><td>&nbsp;</td></tr>
</table>

<p><strong>Exemplar Theory.</strong> One version of exemplar theory
says that we represent categories by all the learned instances
(instead of by a prototype).  The theory says that we classify a novel
item in the same category as the closest known exemplar.  Fill out the
table below to determine whether your responses are well matched by
the predictions of exemplar theory:

<p><table border=1 cellpadding=2>
<tr>
<td rowspan=2>Test Case</td>
<td rowspan=2>Line Position</td>
<td rowspan=2>Rect. Height</td>
<td colspan=4 align=center>Distance from known exemplars</td>
<td rowspan=2>What is the category of the closest known exemplar?</td>
<td rowspan=2>Your Rating</td>
<td rowspan=2>Does your rating correspond to the exemplar theory prediction?</td>
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

<p><strong>Rule and Exception Theory (Position Dominant).</strong>
This theory says that we learn a rule for separating categories, along
with any exceptions to the rule.  Suppose we learn the rule,
<blockquote>"If the <em>line position</em> is greater than 2, then
it's an O, except for stimulus <em>3,1</em>, which is an
X."</blockquote> This rule accurately classifies the training cases;
for example, training stimulus <em>5,5</em> has line position 5, which
is greater than 2, and so is categorized correctly as an O.  Apply
this rule to the test cases, and see if it matches your ratings.  Fill
out the table below:

<p><table border=1 cellpadding=2>
<tr>
<td>Test Case</td>
<td>Line Position</td>
<td>Rect. Height</td>
<td>Rule Categorizaton</td>
<td>Your Rating</td>
<td>Does your rating correspond to the rule and exception theory prediction?</td>
</tr>
<tr><td>17</td><td>1</td><td>5</td><td>&nbsp;</td><td>[r17]</td><td>&nbsp;</td></tr>
<tr><td>18</td><td>5</td><td>1</td><td>&nbsp;</td><td>[r18]</td><td>&nbsp;</td></tr>
<tr><td>19</td><td>1</td><td>6</td><td>&nbsp;</td><td>[r19]</td><td>&nbsp;</td></tr>
<tr><td>20</td><td>6</td><td>1</td><td>&nbsp;</td><td>[r20]</td><td>&nbsp;</td></tr>
</table>

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
<td>Your Rating</td>
<td>Does your rating correspond to the rule and exception theory prediction?</td>
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


<p><strong>Which of the theories fit your ratings? 

<p>&nbsp;

<p>&nbsp;

<p>How would you describe how you intuitively thought of the
categories?  Did you memorize exemplars, or abstract a prototype, or
come up with a rule (and what was the rule)?  Did you think line
position was more important, or did you think that height was more
important?

</strong>


(If there is insufficient space here to answer this question, attach another page.)




</FORM>
</body>
</html>
# end of success-response section


*append-response*
!append-file-name = "/ip/jkkteach/www/P335/cathw3.dat"
[r01]	[r02]	[r03]	[r04]	[r05]	[r06]	[r07]	[r08]	[r09]	[r10]	[r11]	[r12]	[r13]	[r14]	[r15]	[r16]	[r17]	[r18]	[r19]	[r20]	[!TIME]	[!DATE]

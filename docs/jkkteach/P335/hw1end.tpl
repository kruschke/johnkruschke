# begin template file

*define-variables*
!show-sig = no
[req-s214] = "You must enter a rating for every pair of patterns."
[req-s314] = "You must enter a rating for every pair of patterns."
[req-s414] = "You must enter a rating for every pair of patterns."
[req-s514] = "You must enter a rating for every pair of patterns."
[req-s324] = "You must enter a rating for every pair of patterns."
[req-s424] = "You must enter a rating for every pair of patterns."
[req-s524] = "You must enter a rating for every pair of patterns."
[req-s434] = "You must enter a rating for every pair of patterns."
[req-s534] = "You must enter a rating for every pair of patterns."
[req-s544] = "You must enter a rating for every pair of patterns."
# end of define-variables section

*error-response*
<html>
<head><title>Error</title></head>
<body bgcolor="#FF3333">
<br>[s214]
<br>[s314]
<br>[s414]
<br>[s514]
<br>[s324]
<br>[s424]
<br>[s524]
<br>[s434]
<br>[s534]
<br>[s544]
<p>Click the "Back" button on your web browser to return to the
previous ratings page.
<p><hr>
</body>
</html>
# end error-response section

*success-response*
<html>
<head><title>P335 Prof Kruschke, Homework 1</title></head>
<body bgcolor="#FFBBBB">


<center>
<h2> P335 Cognitive Psychology, Prof. John K. Kruschke</h2>
</center>
<center>
<h2>Homework 1: Template Model of Pattern Perception</h2>
</center>

<p>You're now done with the ratings.  <em>Print this page, and be sure
to check that everything shown on your screen is properly and fully
printed.</em> If anything is missing from the printed version, copy it
from the computer screen by hand.  Complete the printed paper by hand,
and turn it in on the due date.


<p><table><tr><td valign=top> 

<strong>A record of your data.</strong> Each cell of Table 1 contains
the four ratings you gave for the corresponding pair of patterns. For
each pair, the first letter is shown on the left margin of the Table,
and the second letter is shown on the top margin of the Table.  For
example, your ratings for the pair "KS" are shown in the lower right
cell of Table 1.  The Table has some cells missing because it assumes
that the order of the letters in the pair shouldn't matter for your
rating; for example, your rating of "KS" should be the same as your
rating of "SK".  Other cells are missing because you never rated
identical letters, such as "BB".

<p>What we want to do now is explore a model of how you compared the
two patterns to generate these similarity ratings.

</td><td>
<table border=2 cellpadding=1>
<tr>
<td colspan=5 align=center><em>Table 1: Your Ratings ("raw" data)</em></td>
</tr>
<tr>
<td align=center></td>
<td align=center><img src="http://www.indiana.edu/~jkkteach/P335/B.gif"></td>
<td align=center><img src="http://www.indiana.edu/~jkkteach/P335/D.gif"></td>
<td align=center><img src="http://www.indiana.edu/~jkkteach/P335/K.gif"></td>
<td align=center><img src="http://www.indiana.edu/~jkkteach/P335/S.gif"></td>
</tr>
<tr>
<td align=center><img src="http://www.indiana.edu/~jkkteach/P335/A.gif"></td>
<td align=center>[s121], [s212],<br> [s123], [s214]</td>
<td align=center>[s131], [s312],<br> [s133], [s314]</td>
<td align=center>[s141], [s412],<br> [s143], [s414]</td>
<td align=center>[s151], [s512],<br> [s153], [s514]</td>
</tr>
<tr>
<td align=center><img src="http://www.indiana.edu/~jkkteach/P335/B.gif"></td>
<td align=center></td>
<td align=center>[s231], [s322],<br> [s233], [s324]</td>
<td align=center>[s241], [s422],<br> [s243], [s424]</td>
<td align=center>[s251], [s522],<br> [s253], [s524]</td>
</tr>
<tr>
<td align=center><img src="http://www.indiana.edu/~jkkteach/P335/D.gif"></td>
<td align=center></td>
<td align=center></td>
<td align=center>[s341], [s432],<br> [s343], [s434]</td>
<td align=center>[s351], [s532],<br> [s353], [s534]</td>
</tr>
<tr>
<td align=center><img src="http://www.indiana.edu/~jkkteach/P335/K.gif"></td>
<td align=center></td>
<td align=center></td>
<td align=center></td>
<td align=center>[s451], [s542],<br> [s453], [s544]</td>
</tr>
</table>
</td>
</tr>
</table>


<p><strong>A Template Model of Pattern Similarity.</strong> Figure 1
(below) shows a flowchart for a template model of similarity ratings.
It starts with the two patterns, on the left.  This pair of patterns
is the physical stimulus.  

<p>When the patterns are perceived, they are mentally converted to
psychological representations (as indicated by the arrows).  The
template model asserts that the psychological representation is just a
mental snapshot, or template, of the physical pattern. The template
representation is suggested in Figure 1 by the grid on the patterns.

<p>The two templates are then compared by computing their amount of
overlap. For our simple patterns, the amount of overlap is merely the
number of corresponding black or white squares shared by the two
patterns.  Figure 1 depicts the overlay of "K" and "S" by showing
black squares where both patterns have black squares, white squares
where both patterns have white squares, and grey squares where one
pattern has a black square and the other has a white square.  If you
count the number of black, white, or grey squares, you can determine
that 8 of the 20 squares match (there are 12 mismatching, grey
squares).

<p>After the amount of overlap is determined, it is converted into an
overt similarity rating, i.e., the response. The function that
converts amount of overlap to similarity rating is assumed to be
<em>monotonic</em>, that is, it preserves ordering so that greater
overlap of patterns generates higher similarity ratings.  Figure 1
shows a response of "2" just as a plausible example; the actual
response for this stimulus pair could be anything from 1 to 9.

<p>
<center>
<table border=1 cellpadding=5>
<tr><td>
<p><IMG SRC="http://www.indiana.edu/~jkkteach/P335/hw1flowchart.gif" align=center>
</td></tr>
<tr><td align=center>
Figure 1: A flowchart for template-based similarity ratings.
</td></tr>
</table>
</center>

<p>This template-matching theory makes certain claims about the
representations and processing involved in information integration.

<p>In terms of representation, the theory claims that the patterns can
be represented as templates. The <em>content</em> of the
representation is the light intensity at each point in the image;
i.e., whether each component square is black or white.  The
<em>format</em> of the representation is spatial; i.e., which
component square is next to which other component squares.  

<p>In terms of processing, the theory asserts that patterns are
compared by measuring the amount of overlap between patterns; i.e., by
counting the number of corresponding component squares that have the
same color.



<p>We want to find out whether this template model fits your ratings.


<p><table><tr><td valign=top> 
<strong>Summarize your data.</strong> We need to get a summary of
your ratings.  For each combination of patterns, compute your <em>mean</em>
rating and enter the means in Table 2.  For example, for the
pair "KS", in the lower right cell of Table 2, you should
write in the mean of [s451], [s542], [s453] and [s544]  (these were
your four ratings of this combination, as you can see from Table 1).
</td><td>
<table border=2 cellpadding=1>
<tr>
<td colspan=5 align=center><em>Table 2: Your MEAN Ratings</em></td>
</tr>
<tr>
<td align=center></td>
<td align=center><img src="http://www.indiana.edu/~jkkteach/P335/B.gif"></td>
<td align=center><img src="http://www.indiana.edu/~jkkteach/P335/D.gif"></td>
<td align=center><img src="http://www.indiana.edu/~jkkteach/P335/K.gif"></td>
<td align=center><img src="http://www.indiana.edu/~jkkteach/P335/S.gif"></td>
</tr>
<tr>
<td align=center><img src="http://www.indiana.edu/~jkkteach/P335/A.gif"></td>
<td align=center>&nbsp;</td>
<td align=center>&nbsp;</td>
<td align=center>&nbsp;</td>
<td align=center>&nbsp;</td>
</tr>
<tr>
<td align=center><img src="http://www.indiana.edu/~jkkteach/P335/B.gif"></td>
<td align=center></td>
<td align=center>&nbsp;</td>
<td align=center>&nbsp;</td>
<td align=center>&nbsp;</td>
</tr>
<tr>
<td align=center><img src="http://www.indiana.edu/~jkkteach/P335/D.gif"></td>
<td align=center></td>
<td align=center></td>
<td align=center>&nbsp;</td>
<td align=center>&nbsp;</td>
</tr>
<tr>
<td align=center><img src="http://www.indiana.edu/~jkkteach/P335/K.gif"></td>
<td align=center></td>
<td align=center></td>
<td align=center></td>
<td align=center>&nbsp;</td>
</tr>
</table>
</td>
</tr>
</table>




<p><table><tr><td valign=top> <strong>Generate predictions of the
model.</strong> Now determine the predictions of the template model.
For each pair of patterns, just count the number of corresponding
component squares that are the same, and write the result in Table 3.
Notice that each pattern is four squares across and five squares tall.
This might be easiest to see by looking at Figure 2, below.
Therefore, each pattern consists of twenty squares (4x5=20), and you
just count the number of corresponding squares in each pattern pair
that match.  It might be easier to count the number of squares that
<em>mis</em>match, and then subtract that value from 20.

<p>
<center>
<table border=1 cellpadding=5>
<tr><td align=center>
<IMG SRC="http://www.indiana.edu/~jkkteach/P335/lettergrid.gif" align=center>
</td></tr>
<tr><td align=center>
<font size=-1>Figure 2: The letters with their grids shown explicitly.</font>
</td></tr>
</table>
</center>
 
<p>A few of the pairs have already been done for you in Table 3.  For
example, the pair "KS," in the lower right cell of Table 3, has
already been filled in with the "8" that was determined in Figure
1. Be very careful when counting the squares; it's easy to make a
mistake.

</td><td>
<table border=2 cellpadding=1>
<tr>
<td colspan=5 align=center><em>Table 3: Predictions of Template Model
<br>(Number of matching squares)</em></td>
</tr>
<tr>
<td align=center></td>
<td align=center><img src="http://www.indiana.edu/~jkkteach/P335/B.gif"></td>
<td align=center><img src="http://www.indiana.edu/~jkkteach/P335/D.gif"></td>
<td align=center><img src="http://www.indiana.edu/~jkkteach/P335/K.gif"></td>
<td align=center><img src="http://www.indiana.edu/~jkkteach/P335/S.gif"></td>
</tr>
<tr>
<td align=center><img src="http://www.indiana.edu/~jkkteach/P335/A.gif"></td>
<td align=center>&nbsp;</td>
<td align=center>&nbsp;</td>
<td align=center><font size=+1>10</font></td>
<td align=center>&nbsp;</td>
</tr>
<tr>
<td align=center><img src="http://www.indiana.edu/~jkkteach/P335/B.gif"></td>
<td align=center></td>
<td align=center><font size=+1>17</font></td>
<td align=center>&nbsp;</td>
<td align=center><font size=+1>15</font></td>
</tr>
<tr>
<td align=center><img src="http://www.indiana.edu/~jkkteach/P335/D.gif"></td>
<td align=center></td>
<td align=center></td>
<td align=center>&nbsp;</td>
<td align=center><font size=+1>12</font></td>
</tr>
<tr>
<td align=center><img src="http://www.indiana.edu/~jkkteach/P335/K.gif"></td>
<td align=center></td>
<td align=center></td>
<td align=center></td>
<td align=center><font size=+1>8</font></td>
</tr>
</table>
</td>
</tr>
</table>



<p><table><tr><td valign=top> <strong>Compare your ratings with the
model predictions.</strong> On the axes of Graph 1 (to the right),
plot your mean ratings (from Table 2) against the predicted overlap
(from Table 3).  There are ten pairs of patterns, so you'll be
plotting ten points. Each point has a y-position corresponding to your
mean similarity rating, and has an x-position corresponding to the
predicted overlap.  <em>Make sure to label each point with the letter pair
it plots (e.g., write "KS" next to the point that plots the data for
pair "KS").</em>
</td><td>
<table border=1 cellpadding=10>
<tr><td align=center>
<IMG SRC="http://www.indiana.edu/~jkkteach/P335/hw1blankgraph.gif" align=center>
</td></tr>
<tr><td align=center>
Graph 1: Your Mean Similarity Ratings vs. Template Model Predictions
</td></tr>
</table>
</td>
</tr>
</table>

<p>If the theory is correct, then your ratings of similarity should
increase as the amount of overlap increases. To check this, <em>draw a
line from the point with the <em>lowest predicted overlap</em> to the
point with the <em>next lowest</em> predicted overlap, and then on to
the point with the next lowest predicted overlap, on so on.</em> If
two points have the same predicted overlap, then connect lines through
both; for example:
<pre>
     *
    / \
   /   \
--*     *--
   \   /
    \ /
     *
</pre>

<p>Please answer the following questions in the space provided.

<p><strong>Question:</strong> Does this line increase monotonically?
That is, from left to right, does it never go down?

<center><table border=1 width=80%>
<tr><td>&nbsp;<br><br><br><br></td></tr>
</table></center>


<p><strong>Question:</strong> If there are violations of monotonic
increase, are these violations severe or minor? List each violation
and indicate whether or not you think it is severe.  (We could answer
this question with inferential statistics, of course, but we won't do
that here.)

<center><table border=1 width=80%>
<tr><td>&nbsp;<br><br><br><br></td></tr>
</table></center>

<p><strong>Question:</strong> Which pairs of letters have the same
predicted overlap? 

<center><table border=1 width=80%>
<tr><td>&nbsp;<br><br><br><br></td></tr>
</table></center>

<p><strong>Question:</strong> For these pairs with the same predicted
overlap, are your similarity ratings about the same, or do they differ
drastically? List each set of pairs with the same predicted
similarities, and indicate whether your similarity ratings are about
the same.  (We could also answer this question with inferential
statistics, of course, but we won't do that here.)

<center><table border=1 width=80%>
<tr><td>&nbsp;<br><br><br><br></td></tr>
</table></center>

<p><strong>Question:</strong> Do you believe, intuitively, that you
were mentally using templates to generate your similarity ratings?  If
not, what do you feel that you were doing?  Which theory - template,
feature, or structure - does your intuition correspond with most
closely?

<center><table border=1 width=80%>
<tr><td>&nbsp;<br><br><br><br></td></tr>
</table></center>

<p><hr width=70%>

<p><strong>So what?</strong> How people recognize patterns is a
crucial issue in a wide range of situations.  If we can figure out how
people recognize patterns, then it might be possible to design
computer recognition devices that automatically identify our produce
at the grocery check-out line, or that automatically assemble parts
drawn from a bin, or that automatically reject imposters at the bank
ATM.  You can think of many other situations where an understanding of
pattern recognition could have big consequences.

<p><strong>To learn more:</strong> This exercise was loosely based on
experiments described in your textbook (Reed, 1996, pp. 26-28).  The
textbook describes template theories on pp. 20-24, and Chapter 2 of
the textbook provides a nice description of alternative theories.

<p><strong>Grading criteria.</strong> This homework assignment is
worth up to 20 points.  Points are deducted for inaccuracies or
omissions. (<a href="http://www.indiana.edu/~jkkteach/P335/latepolicy.html">Click here to read the Late
Policy.</a>)

<!--
<p><strong>What do you think of this assignment?</strong> Only
<em>after</em> the lecture discussing this topic, please provide your
evaluation of this assignment.  To fill out an evaluation form and get
2 points for your effort, <a href="http://www.indiana.edu/~jkkteach/P335/hweval.html">click here</a>.
-->


<center>
<h5><p>Copyright &copy; 1998 John K. Kruschke</h5>
</center>

<p><hr>

</body>
</html>
# end of success-response section


*append-response*
!append-file-name = "/ip/jkkteach/www/P335/hw1ratings.dat"
[s121] [s131] [s141] [s151] [s231] [s241] [s251] [s341] [s351] [s451] [s212] [s312] [s412] [s512] [s322] [s422] [s522] [s432] [s532] [s542] [s123] [s133] [s143] [s153] [s233] [s243] [s253] [s343] [s353] [s453] [s214] [s314] [s414] [s514] [s324] [s424] [s524] [s434] [s534] [s544] [!TIME] [!DATE]

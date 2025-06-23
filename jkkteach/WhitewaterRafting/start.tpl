############################## DEFINE-VARIABLES SECTION #################
*define-variables*
!show-sig = no
### end of define-variables section
############################## ERROR-RESPONSE SECTION ###################
*error-response*
### end error-response section
############################## APPEND-RESPONSE SECTION ##################
*append-response*
### end append-response section
############################## SUCCESS-RESPONSE SECTION #################
*success-response*
<HTML>

<HEAD>
<TITLE>Adventures in whitewater rafting</TITLE>
</HEAD>

<BODY bgcolor="white">

<FORM METHOD="POST"
ACTION="transform.cgi?jkkteach/www/WhitewaterRafting/instructions">

<p><strong>Write this number in the Notes on the paper subject record:
[subj]</strong>

<p><strong>Is the computer mouse clear?</strong> Make sure that the
mouse is accessible, unsnarled, and unobstructed.

<p><strong>Maximize your browser window to cover the entire computer
screen.</strong> <ul>

<li> On <strong>Windows95/98/NT</strong>, do this as follows: First,
locate the three buttons at the <em>top-right</em> of the browser
window. The middle of these three buttons has a rectangle in it (the
left button has a lower line in it; the right button has an X in
it). Click the middle button that has the rectangle. <em>The browser
window should now cover the entire computer screen.</em>

<!--
<li>On <strong>Macintosh</strong> machines, do this as follows: Slide
the window to the top left corner of the screen (click on the top bar
of the window and drag it to the top left). Then click on the bottom
right corner of the window and drag it to the bottom right corner of
the screen.  
-->

</ul>

<p><strong>Hide the "toolbars" of your browser.</strong> Here's how to
do this: <ul>

<li><strong>Netscape users:</strong> <ul><li>click on the
"<u>V</u>iew" menu near the top-left of the window, <li>under
"Sho<u>w</u>", be sure that none of the items is checked. Just click
on any item label that is checked to uncheck it.<li>Repeat this
process until no item is checked. At this point, The top of the
Netscape window should have only the
"<u>F</u>ile&nbsp;<u>E</u>dit&nbsp;<u>V</u>iew..."  line showing, and
<em>no other toolbars.</em> </ul>

<!--
<li><strong>Explorer users:</strong>, <ul><li>click on the
"<u>V</u>iew" menu near the top-left of the window, <li>under
"<u>T</u>oolbars", be sure that none of the items is checked. Just
click on any item that is checked to uncheck it. <li>Repeat this
process until no item is checked. At this point, The top of the
Explorer window should have only the
"<u>F</u>ile&nbsp;<u>E</u>dit&nbsp;<u>V</u>iew..."  line showing, and
<em>no other toolbars.</em> </ul>
-->

</ul>

<strong>Most important: Adjust the font size.</strong><ul>

<li> <strong>Netscape users:</strong> Adjust the font size by going to
the "<u>V</u>iew" menu and then clicking on
"In<u>c</u>rease&nbsp;Font" or "<u>D</u>ecrease&nbsp;Font" until the
row of numerals below is a large as possible with<em>out</em> a scroll
bar appearing at the <em>bottom</em> of the window. If a scroll bar
appears at the <em>bottom</em> of the window, make the font smaller.
<hr>
12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345
<hr>

<!--
<li> <strong>Explorer users:</strong> Adjust the font size by going to
the "<u>V</u>iew" menu and then clicking on "Te<u>x</u>t&nbsp;Size"
Select a size such that the row of numerals below is a large as
possible with<em>out</em> a scroll bar appearing at the
<em>bottom</em> of the window. If a scroll bar appears at the
<em>bottom</em> of the window, make the font smaller.  <hr>
12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345
<hr>
-->

</ul>

<center>
<table width=70% border=1 cellpadding=10>
<tr><td align=right bgcolor="yellow">
<p>Experimenter Initials: &nbsp;&nbsp; <input name="inits" size="3">
<p>Booth:
<select size="1" name="booth">
<option value="" selected>(select one)
<option value="A">A
<option value="B">B
<option value="C">C
<option value="D">D
<option value="E">E
</select>
<p>Tell participants: "The following information helps us determine the general
characteristics of the participants in our experiment. This information
is not linked to your name. 
Your honesty helps us have meaningful data about human
cognition."
<p>Sex:
<select size="1" name="sex">
<option value="" selected>(select one)
<option value="F">female
<option value="M">male
<option value="dts">decline to state
</select>
<p>Handedness:
<select size="1" name="hand">
<option value="" selected>(select one)
<option value="R">right
<option value="L">left
<option value="A">ambidextrous
<option value="dts">decline to state
</select>
<p>Age (in years): &nbsp;&nbsp; <input name="age" size="2">
<br>(Just enter -1 if participant prefers not to state.)
</td></tr></table></center>


!carry-forward [subj] [permute_sec]

<p>
<center><input type="submit" value="Click here to begin the experiment."></center>

</FORM> 
</BODY> 
</HTML>










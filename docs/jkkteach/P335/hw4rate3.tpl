# begin template file

*define-variables*
!show-sig = no
[req-s112] = "You must enter a rating for every combination of characteristics."
[req-s122] = "You must enter a rating for every combination of characteristics."
[req-s132] = "You must enter a rating for every combination of characteristics."
[req-s212] = "You must enter a rating for every combination of characteristics."
[req-s222] = "You must enter a rating for every combination of characteristics."
[req-s232] = "You must enter a rating for every combination of characteristics."
[req-s312] = "You must enter a rating for every combination of characteristics."
[req-s322] = "You must enter a rating for every combination of characteristics."
[req-s332] = "You must enter a rating for every combination of characteristics."
# end of define-variables section

*error-response*
<html>
<head><title>Error</title></head>
<body bgcolor="#FF3333">
<br>[s112]
<br>[s122]
<br>[s132]
<br>[s212]
<br>[s222]
<br>[s232]
<br>[s312]
<br>[s322]
<br>[s332]
<p>Click the "Back" button on your web browser to return to the
previous ratings page.
<p><hr>
</body>
</html>
# end error-response section

*success-response*
<html>
<head><title>Rate 3</title></head>
<body bgcolor="#BBBBBB">
<FORM 
METHOD="POST" 
ACTION="/cgi-bin-local/public/transform2?jkkteach/www/P335/hw4rate4">
<center>

<p>
<table border=2 cellpadding=10>

<tr>
<td align=center>
<em>Characteristics</em>
</td>
<td align=center>
<em>
Your Rating of Likability
</em>
<br>
(1=unlikable, 9=likable)
</td>
</tr>

<tr>
<td align=center>
<strong>
ungrateful
<br>
humorless
</strong>
</td>
<td>
<INPUT TYPE="radio" NAME="s333" VALUE=1>1
<INPUT TYPE="radio" NAME="s333" VALUE=2>2
<INPUT TYPE="radio" NAME="s333" VALUE=3>3
<INPUT TYPE="radio" NAME="s333" VALUE=4>4
<INPUT TYPE="radio" NAME="s333" VALUE=5>5
<INPUT TYPE="radio" NAME="s333" VALUE=6>6
<INPUT TYPE="radio" NAME="s333" VALUE=7>7
<INPUT TYPE="radio" NAME="s333" VALUE=8>8
<INPUT TYPE="radio" NAME="s333" VALUE=9>9
</td>
</tr>

<tr>
<td align=center>
<strong>
unsophisticated
<br>
good-natured
</strong>
</td>
<td>
<INPUT TYPE="radio" NAME="s213" VALUE=1>1
<INPUT TYPE="radio" NAME="s213" VALUE=2>2
<INPUT TYPE="radio" NAME="s213" VALUE=3>3
<INPUT TYPE="radio" NAME="s213" VALUE=4>4
<INPUT TYPE="radio" NAME="s213" VALUE=5>5
<INPUT TYPE="radio" NAME="s213" VALUE=6>6
<INPUT TYPE="radio" NAME="s213" VALUE=7>7
<INPUT TYPE="radio" NAME="s213" VALUE=8>8
<INPUT TYPE="radio" NAME="s213" VALUE=9>9
</td>
</tr>

<tr>
<td align=center>
<strong>
level-headed
<br>
bold
</strong>
</td>
<td>
<INPUT TYPE="radio" NAME="s123" VALUE=1>1
<INPUT TYPE="radio" NAME="s123" VALUE=2>2
<INPUT TYPE="radio" NAME="s123" VALUE=3>3
<INPUT TYPE="radio" NAME="s123" VALUE=4>4
<INPUT TYPE="radio" NAME="s123" VALUE=5>5
<INPUT TYPE="radio" NAME="s123" VALUE=6>6
<INPUT TYPE="radio" NAME="s123" VALUE=7>7
<INPUT TYPE="radio" NAME="s123" VALUE=8>8
<INPUT TYPE="radio" NAME="s123" VALUE=9>9
</td>
</tr>

<tr>
<td align=center>
<strong>
ungrateful
<br>
good-natured
</strong>
</td>
<td>
<INPUT TYPE="radio" NAME="s313" VALUE=1>1
<INPUT TYPE="radio" NAME="s313" VALUE=2>2
<INPUT TYPE="radio" NAME="s313" VALUE=3>3
<INPUT TYPE="radio" NAME="s313" VALUE=4>4
<INPUT TYPE="radio" NAME="s313" VALUE=5>5
<INPUT TYPE="radio" NAME="s313" VALUE=6>6
<INPUT TYPE="radio" NAME="s313" VALUE=7>7
<INPUT TYPE="radio" NAME="s313" VALUE=8>8
<INPUT TYPE="radio" NAME="s313" VALUE=9>9
</td>
</tr>

<tr>
<td align=center>
<strong>
level-headed
<br>
humorless
</strong>
</td>
<td>
<INPUT TYPE="radio" NAME="s133" VALUE=1>1
<INPUT TYPE="radio" NAME="s133" VALUE=2>2
<INPUT TYPE="radio" NAME="s133" VALUE=3>3
<INPUT TYPE="radio" NAME="s133" VALUE=4>4
<INPUT TYPE="radio" NAME="s133" VALUE=5>5
<INPUT TYPE="radio" NAME="s133" VALUE=6>6
<INPUT TYPE="radio" NAME="s133" VALUE=7>7
<INPUT TYPE="radio" NAME="s133" VALUE=8>8
<INPUT TYPE="radio" NAME="s133" VALUE=9>9
</td>
</tr>

<tr>
<td align=center>
<strong>
unsophisticated
<br>
bold
</strong>
</td>
<td>
<INPUT TYPE="radio" NAME="s223" VALUE=1>1
<INPUT TYPE="radio" NAME="s223" VALUE=2>2
<INPUT TYPE="radio" NAME="s223" VALUE=3>3
<INPUT TYPE="radio" NAME="s223" VALUE=4>4
<INPUT TYPE="radio" NAME="s223" VALUE=5>5
<INPUT TYPE="radio" NAME="s223" VALUE=6>6
<INPUT TYPE="radio" NAME="s223" VALUE=7>7
<INPUT TYPE="radio" NAME="s223" VALUE=8>8
<INPUT TYPE="radio" NAME="s223" VALUE=9>9
</td>
</tr>

<tr>
<td align=center>
<strong>
level-headed
<br>
good-natured
</strong>
</td>
<td>
<INPUT TYPE="radio" NAME="s113" VALUE=1>1
<INPUT TYPE="radio" NAME="s113" VALUE=2>2
<INPUT TYPE="radio" NAME="s113" VALUE=3>3
<INPUT TYPE="radio" NAME="s113" VALUE=4>4
<INPUT TYPE="radio" NAME="s113" VALUE=5>5
<INPUT TYPE="radio" NAME="s113" VALUE=6>6
<INPUT TYPE="radio" NAME="s113" VALUE=7>7
<INPUT TYPE="radio" NAME="s113" VALUE=8>8
<INPUT TYPE="radio" NAME="s113" VALUE=9>9
</td>
</tr>

<tr>
<td align=center>
<strong>
ungrateful
<br>
bold
</strong>
</td>
<td>
<INPUT TYPE="radio" NAME="s323" VALUE=1>1
<INPUT TYPE="radio" NAME="s323" VALUE=2>2
<INPUT TYPE="radio" NAME="s323" VALUE=3>3
<INPUT TYPE="radio" NAME="s323" VALUE=4>4
<INPUT TYPE="radio" NAME="s323" VALUE=5>5
<INPUT TYPE="radio" NAME="s323" VALUE=6>6
<INPUT TYPE="radio" NAME="s323" VALUE=7>7
<INPUT TYPE="radio" NAME="s323" VALUE=8>8
<INPUT TYPE="radio" NAME="s323" VALUE=9>9
</td>
</tr>

<tr>
<td align=center>
<strong>
unsophisticated
<br>
humorless
</strong>
</td>
<td>
<INPUT TYPE="radio" NAME="s233" VALUE=1>1
<INPUT TYPE="radio" NAME="s233" VALUE=2>2
<INPUT TYPE="radio" NAME="s233" VALUE=3>3
<INPUT TYPE="radio" NAME="s233" VALUE=4>4
<INPUT TYPE="radio" NAME="s233" VALUE=5>5
<INPUT TYPE="radio" NAME="s233" VALUE=6>6
<INPUT TYPE="radio" NAME="s233" VALUE=7>7
<INPUT TYPE="radio" NAME="s233" VALUE=8>8
<INPUT TYPE="radio" NAME="s233" VALUE=9>9
</td>
</tr>


</table>

<p><strong><INPUT TYPE="submit" VALUE="Continue"></strong>
</center>

!carry-forward [s111] [s121] [s131] [s211] [s221] [s231] [s311] [s321] [s331] [s112] [s122] [s132] [s212] [s222] [s232] [s312] [s322] [s332] [s113] [s123] [s133] [s213] [s223] [s233] [s313] [s323] [s333] [s114] [s124] [s134] [s214] [s224] [s234] [s314] [s324] [s334] 

#<br>Resp's so far:
#<br>[s111] [s121] [s131] [s211] [s221] [s231] [s311] [s321] [s331] 
#<br>[s112] [s122] [s132] [s212] [s222] [s232] [s312] [s322] [s332] 
#<br>[s113] [s123] [s133] [s213] [s223] [s233] [s313] [s323] [s333] 
#<br>[s114] [s124] [s134] [s214] [s224] [s234] [s314] [s324] [s334] 


</FORM>
</body>
</html>
# end of success-response section


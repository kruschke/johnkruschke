# begin template file

*define-variables*
!show-sig = no
[req-s111] = "You must enter a rating for every combination of characteristics."
[req-s121] = "You must enter a rating for every combination of characteristics."
[req-s131] = "You must enter a rating for every combination of characteristics."
[req-s211] = "You must enter a rating for every combination of characteristics."
[req-s221] = "You must enter a rating for every combination of characteristics."
[req-s231] = "You must enter a rating for every combination of characteristics."
[req-s311] = "You must enter a rating for every combination of characteristics."
[req-s321] = "You must enter a rating for every combination of characteristics."
[req-s331] = "You must enter a rating for every combination of characteristics."
# end of define-variables section

*error-response*
<html>
<head><title>Error</title></head>
<body bgcolor="#FF3333">
<br>[s111]
<br>[s121]
<br>[s131]
<br>[s211]
<br>[s221]
<br>[s231]
<br>[s311]
<br>[s321]
<br>[s331]
<p>Click the "Back" button on your web browser to return to the
previous ratings page.
<p><hr>
</body>
</html>
# end error-response section

*success-response*
<html>
<head><title>Rate 2</title></head>
<body bgcolor="#BBBBBB">
<FORM 
METHOD="POST" 
ACTION="/cgi-bin-local/public/transform2?jkkteach/www/P335/hw4rate3">
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
level-headed
<br>
bold
</strong>
</td>
<td>
<INPUT TYPE="radio" NAME="s122" VALUE=1>1
<INPUT TYPE="radio" NAME="s122" VALUE=2>2
<INPUT TYPE="radio" NAME="s122" VALUE=3>3
<INPUT TYPE="radio" NAME="s122" VALUE=4>4
<INPUT TYPE="radio" NAME="s122" VALUE=5>5
<INPUT TYPE="radio" NAME="s122" VALUE=6>6
<INPUT TYPE="radio" NAME="s122" VALUE=7>7
<INPUT TYPE="radio" NAME="s122" VALUE=8>8
<INPUT TYPE="radio" NAME="s122" VALUE=9>9
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
<INPUT TYPE="radio" NAME="s332" VALUE=1>1
<INPUT TYPE="radio" NAME="s332" VALUE=2>2
<INPUT TYPE="radio" NAME="s332" VALUE=3>3
<INPUT TYPE="radio" NAME="s332" VALUE=4>4
<INPUT TYPE="radio" NAME="s332" VALUE=5>5
<INPUT TYPE="radio" NAME="s332" VALUE=6>6
<INPUT TYPE="radio" NAME="s332" VALUE=7>7
<INPUT TYPE="radio" NAME="s332" VALUE=8>8
<INPUT TYPE="radio" NAME="s332" VALUE=9>9
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
<INPUT TYPE="radio" NAME="s212" VALUE=1>1
<INPUT TYPE="radio" NAME="s212" VALUE=2>2
<INPUT TYPE="radio" NAME="s212" VALUE=3>3
<INPUT TYPE="radio" NAME="s212" VALUE=4>4
<INPUT TYPE="radio" NAME="s212" VALUE=5>5
<INPUT TYPE="radio" NAME="s212" VALUE=6>6
<INPUT TYPE="radio" NAME="s212" VALUE=7>7
<INPUT TYPE="radio" NAME="s212" VALUE=8>8
<INPUT TYPE="radio" NAME="s212" VALUE=9>9
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
<INPUT TYPE="radio" NAME="s322" VALUE=1>1
<INPUT TYPE="radio" NAME="s322" VALUE=2>2
<INPUT TYPE="radio" NAME="s322" VALUE=3>3
<INPUT TYPE="radio" NAME="s322" VALUE=4>4
<INPUT TYPE="radio" NAME="s322" VALUE=5>5
<INPUT TYPE="radio" NAME="s322" VALUE=6>6
<INPUT TYPE="radio" NAME="s322" VALUE=7>7
<INPUT TYPE="radio" NAME="s322" VALUE=8>8
<INPUT TYPE="radio" NAME="s322" VALUE=9>9
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
<INPUT TYPE="radio" NAME="s132" VALUE=1>1
<INPUT TYPE="radio" NAME="s132" VALUE=2>2
<INPUT TYPE="radio" NAME="s132" VALUE=3>3
<INPUT TYPE="radio" NAME="s132" VALUE=4>4
<INPUT TYPE="radio" NAME="s132" VALUE=5>5
<INPUT TYPE="radio" NAME="s132" VALUE=6>6
<INPUT TYPE="radio" NAME="s132" VALUE=7>7
<INPUT TYPE="radio" NAME="s132" VALUE=8>8
<INPUT TYPE="radio" NAME="s132" VALUE=9>9
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
<INPUT TYPE="radio" NAME="s222" VALUE=1>1
<INPUT TYPE="radio" NAME="s222" VALUE=2>2
<INPUT TYPE="radio" NAME="s222" VALUE=3>3
<INPUT TYPE="radio" NAME="s222" VALUE=4>4
<INPUT TYPE="radio" NAME="s222" VALUE=5>5
<INPUT TYPE="radio" NAME="s222" VALUE=6>6
<INPUT TYPE="radio" NAME="s222" VALUE=7>7
<INPUT TYPE="radio" NAME="s222" VALUE=8>8
<INPUT TYPE="radio" NAME="s222" VALUE=9>9
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
<INPUT TYPE="radio" NAME="s112" VALUE=1>1
<INPUT TYPE="radio" NAME="s112" VALUE=2>2
<INPUT TYPE="radio" NAME="s112" VALUE=3>3
<INPUT TYPE="radio" NAME="s112" VALUE=4>4
<INPUT TYPE="radio" NAME="s112" VALUE=5>5
<INPUT TYPE="radio" NAME="s112" VALUE=6>6
<INPUT TYPE="radio" NAME="s112" VALUE=7>7
<INPUT TYPE="radio" NAME="s112" VALUE=8>8
<INPUT TYPE="radio" NAME="s112" VALUE=9>9
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
<INPUT TYPE="radio" NAME="s232" VALUE=1>1
<INPUT TYPE="radio" NAME="s232" VALUE=2>2
<INPUT TYPE="radio" NAME="s232" VALUE=3>3
<INPUT TYPE="radio" NAME="s232" VALUE=4>4
<INPUT TYPE="radio" NAME="s232" VALUE=5>5
<INPUT TYPE="radio" NAME="s232" VALUE=6>6
<INPUT TYPE="radio" NAME="s232" VALUE=7>7
<INPUT TYPE="radio" NAME="s232" VALUE=8>8
<INPUT TYPE="radio" NAME="s232" VALUE=9>9
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
<INPUT TYPE="radio" NAME="s312" VALUE=1>1
<INPUT TYPE="radio" NAME="s312" VALUE=2>2
<INPUT TYPE="radio" NAME="s312" VALUE=3>3
<INPUT TYPE="radio" NAME="s312" VALUE=4>4
<INPUT TYPE="radio" NAME="s312" VALUE=5>5
<INPUT TYPE="radio" NAME="s312" VALUE=6>6
<INPUT TYPE="radio" NAME="s312" VALUE=7>7
<INPUT TYPE="radio" NAME="s312" VALUE=8>8
<INPUT TYPE="radio" NAME="s312" VALUE=9>9
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


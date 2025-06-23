# begin template file

*define-variables*
!show-sig = no
# end of define-variables section

*error-response*
# end error-response section

*success-response*
<html>
<head><title>Rate 1</title></head>
<body bgcolor="#BBBBBB">
<FORM 
METHOD="POST" 
ACTION="/cgi-bin-local/public/transform2?jkkteach/www/P335/hw4rate2">
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
good-natured
</strong>
</td>
<td>
<INPUT TYPE="radio" NAME="s311" VALUE=1>1
<INPUT TYPE="radio" NAME="s311" VALUE=2>2
<INPUT TYPE="radio" NAME="s311" VALUE=3>3
<INPUT TYPE="radio" NAME="s311" VALUE=4>4
<INPUT TYPE="radio" NAME="s311" VALUE=5>5
<INPUT TYPE="radio" NAME="s311" VALUE=6>6
<INPUT TYPE="radio" NAME="s311" VALUE=7>7
<INPUT TYPE="radio" NAME="s311" VALUE=8>8
<INPUT TYPE="radio" NAME="s311" VALUE=9>9
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
<INPUT TYPE="radio" NAME="s121" VALUE=1>1
<INPUT TYPE="radio" NAME="s121" VALUE=2>2
<INPUT TYPE="radio" NAME="s121" VALUE=3>3
<INPUT TYPE="radio" NAME="s121" VALUE=4>4
<INPUT TYPE="radio" NAME="s121" VALUE=5>5
<INPUT TYPE="radio" NAME="s121" VALUE=6>6
<INPUT TYPE="radio" NAME="s121" VALUE=7>7
<INPUT TYPE="radio" NAME="s121" VALUE=8>8
<INPUT TYPE="radio" NAME="s121" VALUE=9>9
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
<INPUT TYPE="radio" NAME="s211" VALUE=1>1
<INPUT TYPE="radio" NAME="s211" VALUE=2>2
<INPUT TYPE="radio" NAME="s211" VALUE=3>3
<INPUT TYPE="radio" NAME="s211" VALUE=4>4
<INPUT TYPE="radio" NAME="s211" VALUE=5>5
<INPUT TYPE="radio" NAME="s211" VALUE=6>6
<INPUT TYPE="radio" NAME="s211" VALUE=7>7
<INPUT TYPE="radio" NAME="s211" VALUE=8>8
<INPUT TYPE="radio" NAME="s211" VALUE=9>9
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
<INPUT TYPE="radio" NAME="s131" VALUE=1>1
<INPUT TYPE="radio" NAME="s131" VALUE=2>2
<INPUT TYPE="radio" NAME="s131" VALUE=3>3
<INPUT TYPE="radio" NAME="s131" VALUE=4>4
<INPUT TYPE="radio" NAME="s131" VALUE=5>5
<INPUT TYPE="radio" NAME="s131" VALUE=6>6
<INPUT TYPE="radio" NAME="s131" VALUE=7>7
<INPUT TYPE="radio" NAME="s131" VALUE=8>8
<INPUT TYPE="radio" NAME="s131" VALUE=9>9
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
<INPUT TYPE="radio" NAME="s321" VALUE=1>1
<INPUT TYPE="radio" NAME="s321" VALUE=2>2
<INPUT TYPE="radio" NAME="s321" VALUE=3>3
<INPUT TYPE="radio" NAME="s321" VALUE=4>4
<INPUT TYPE="radio" NAME="s321" VALUE=5>5
<INPUT TYPE="radio" NAME="s321" VALUE=6>6
<INPUT TYPE="radio" NAME="s321" VALUE=7>7
<INPUT TYPE="radio" NAME="s321" VALUE=8>8
<INPUT TYPE="radio" NAME="s321" VALUE=9>9
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
<INPUT TYPE="radio" NAME="s231" VALUE=1>1
<INPUT TYPE="radio" NAME="s231" VALUE=2>2
<INPUT TYPE="radio" NAME="s231" VALUE=3>3
<INPUT TYPE="radio" NAME="s231" VALUE=4>4
<INPUT TYPE="radio" NAME="s231" VALUE=5>5
<INPUT TYPE="radio" NAME="s231" VALUE=6>6
<INPUT TYPE="radio" NAME="s231" VALUE=7>7
<INPUT TYPE="radio" NAME="s231" VALUE=8>8
<INPUT TYPE="radio" NAME="s231" VALUE=9>9
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
<INPUT TYPE="radio" NAME="s111" VALUE=1>1
<INPUT TYPE="radio" NAME="s111" VALUE=2>2
<INPUT TYPE="radio" NAME="s111" VALUE=3>3
<INPUT TYPE="radio" NAME="s111" VALUE=4>4
<INPUT TYPE="radio" NAME="s111" VALUE=5>5
<INPUT TYPE="radio" NAME="s111" VALUE=6>6
<INPUT TYPE="radio" NAME="s111" VALUE=7>7
<INPUT TYPE="radio" NAME="s111" VALUE=8>8
<INPUT TYPE="radio" NAME="s111" VALUE=9>9
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
<INPUT TYPE="radio" NAME="s221" VALUE=1>1
<INPUT TYPE="radio" NAME="s221" VALUE=2>2
<INPUT TYPE="radio" NAME="s221" VALUE=3>3
<INPUT TYPE="radio" NAME="s221" VALUE=4>4
<INPUT TYPE="radio" NAME="s221" VALUE=5>5
<INPUT TYPE="radio" NAME="s221" VALUE=6>6
<INPUT TYPE="radio" NAME="s221" VALUE=7>7
<INPUT TYPE="radio" NAME="s221" VALUE=8>8
<INPUT TYPE="radio" NAME="s221" VALUE=9>9
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
<INPUT TYPE="radio" NAME="s331" VALUE=1>1
<INPUT TYPE="radio" NAME="s331" VALUE=2>2
<INPUT TYPE="radio" NAME="s331" VALUE=3>3
<INPUT TYPE="radio" NAME="s331" VALUE=4>4
<INPUT TYPE="radio" NAME="s331" VALUE=5>5
<INPUT TYPE="radio" NAME="s331" VALUE=6>6
<INPUT TYPE="radio" NAME="s331" VALUE=7>7
<INPUT TYPE="radio" NAME="s331" VALUE=8>8
<INPUT TYPE="radio" NAME="s331" VALUE=9>9
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


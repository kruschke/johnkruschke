# begin template file

*define-variables*
!show-sig = no
[req-s113] = "You must enter a rating for every combination of characteristics."
[req-s123] = "You must enter a rating for every combination of characteristics."
[req-s133] = "You must enter a rating for every combination of characteristics."
[req-s213] = "You must enter a rating for every combination of characteristics."
[req-s223] = "You must enter a rating for every combination of characteristics."
[req-s233] = "You must enter a rating for every combination of characteristics."
[req-s313] = "You must enter a rating for every combination of characteristics."
[req-s323] = "You must enter a rating for every combination of characteristics."
[req-s333] = "You must enter a rating for every combination of characteristics."
# end of define-variables section

*error-response*
<html>
<head><title>Error</title></head>
<body bgcolor="#FF3333">
<br>[s113]
<br>[s123]
<br>[s133]
<br>[s213]
<br>[s223]
<br>[s233]
<br>[s313]
<br>[s323]
<br>[s333]
<p>Click the "Back" button on your web browser to return to the
previous ratings page.
<p><hr>
</body>
</html>
# end error-response section

*success-response*
<html>
<head><title>Rate 4</title></head>
<body bgcolor="#BBBBBB">
<FORM
METHOD="POST"
ACTION="transform.cgi?jkkteach/www/model_exercises/additive_integration/ai_end">
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
good-natured
</strong>
</td>
<td>
<INPUT TYPE="radio" NAME="s114" VALUE=1>1
<INPUT TYPE="radio" NAME="s114" VALUE=2>2
<INPUT TYPE="radio" NAME="s114" VALUE=3>3
<INPUT TYPE="radio" NAME="s114" VALUE=4>4
<INPUT TYPE="radio" NAME="s114" VALUE=5>5
<INPUT TYPE="radio" NAME="s114" VALUE=6>6
<INPUT TYPE="radio" NAME="s114" VALUE=7>7
<INPUT TYPE="radio" NAME="s114" VALUE=8>8
<INPUT TYPE="radio" NAME="s114" VALUE=9>9
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
<INPUT TYPE="radio" NAME="s334" VALUE=1>1
<INPUT TYPE="radio" NAME="s334" VALUE=2>2
<INPUT TYPE="radio" NAME="s334" VALUE=3>3
<INPUT TYPE="radio" NAME="s334" VALUE=4>4
<INPUT TYPE="radio" NAME="s334" VALUE=5>5
<INPUT TYPE="radio" NAME="s334" VALUE=6>6
<INPUT TYPE="radio" NAME="s334" VALUE=7>7
<INPUT TYPE="radio" NAME="s334" VALUE=8>8
<INPUT TYPE="radio" NAME="s334" VALUE=9>9
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
<INPUT TYPE="radio" NAME="s214" VALUE=1>1
<INPUT TYPE="radio" NAME="s214" VALUE=2>2
<INPUT TYPE="radio" NAME="s214" VALUE=3>3
<INPUT TYPE="radio" NAME="s214" VALUE=4>4
<INPUT TYPE="radio" NAME="s214" VALUE=5>5
<INPUT TYPE="radio" NAME="s214" VALUE=6>6
<INPUT TYPE="radio" NAME="s214" VALUE=7>7
<INPUT TYPE="radio" NAME="s214" VALUE=8>8
<INPUT TYPE="radio" NAME="s214" VALUE=9>9
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
<INPUT TYPE="radio" NAME="s124" VALUE=1>1
<INPUT TYPE="radio" NAME="s124" VALUE=2>2
<INPUT TYPE="radio" NAME="s124" VALUE=3>3
<INPUT TYPE="radio" NAME="s124" VALUE=4>4
<INPUT TYPE="radio" NAME="s124" VALUE=5>5
<INPUT TYPE="radio" NAME="s124" VALUE=6>6
<INPUT TYPE="radio" NAME="s124" VALUE=7>7
<INPUT TYPE="radio" NAME="s124" VALUE=8>8
<INPUT TYPE="radio" NAME="s124" VALUE=9>9
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
<INPUT TYPE="radio" NAME="s314" VALUE=1>1
<INPUT TYPE="radio" NAME="s314" VALUE=2>2
<INPUT TYPE="radio" NAME="s314" VALUE=3>3
<INPUT TYPE="radio" NAME="s314" VALUE=4>4
<INPUT TYPE="radio" NAME="s314" VALUE=5>5
<INPUT TYPE="radio" NAME="s314" VALUE=6>6
<INPUT TYPE="radio" NAME="s314" VALUE=7>7
<INPUT TYPE="radio" NAME="s314" VALUE=8>8
<INPUT TYPE="radio" NAME="s314" VALUE=9>9
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
<INPUT TYPE="radio" NAME="s224" VALUE=1>1
<INPUT TYPE="radio" NAME="s224" VALUE=2>2
<INPUT TYPE="radio" NAME="s224" VALUE=3>3
<INPUT TYPE="radio" NAME="s224" VALUE=4>4
<INPUT TYPE="radio" NAME="s224" VALUE=5>5
<INPUT TYPE="radio" NAME="s224" VALUE=6>6
<INPUT TYPE="radio" NAME="s224" VALUE=7>7
<INPUT TYPE="radio" NAME="s224" VALUE=8>8
<INPUT TYPE="radio" NAME="s224" VALUE=9>9
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
<INPUT TYPE="radio" NAME="s134" VALUE=1>1
<INPUT TYPE="radio" NAME="s134" VALUE=2>2
<INPUT TYPE="radio" NAME="s134" VALUE=3>3
<INPUT TYPE="radio" NAME="s134" VALUE=4>4
<INPUT TYPE="radio" NAME="s134" VALUE=5>5
<INPUT TYPE="radio" NAME="s134" VALUE=6>6
<INPUT TYPE="radio" NAME="s134" VALUE=7>7
<INPUT TYPE="radio" NAME="s134" VALUE=8>8
<INPUT TYPE="radio" NAME="s134" VALUE=9>9
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
<INPUT TYPE="radio" NAME="s324" VALUE=1>1
<INPUT TYPE="radio" NAME="s324" VALUE=2>2
<INPUT TYPE="radio" NAME="s324" VALUE=3>3
<INPUT TYPE="radio" NAME="s324" VALUE=4>4
<INPUT TYPE="radio" NAME="s324" VALUE=5>5
<INPUT TYPE="radio" NAME="s324" VALUE=6>6
<INPUT TYPE="radio" NAME="s324" VALUE=7>7
<INPUT TYPE="radio" NAME="s324" VALUE=8>8
<INPUT TYPE="radio" NAME="s324" VALUE=9>9
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
<INPUT TYPE="radio" NAME="s234" VALUE=1>1
<INPUT TYPE="radio" NAME="s234" VALUE=2>2
<INPUT TYPE="radio" NAME="s234" VALUE=3>3
<INPUT TYPE="radio" NAME="s234" VALUE=4>4
<INPUT TYPE="radio" NAME="s234" VALUE=5>5
<INPUT TYPE="radio" NAME="s234" VALUE=6>6
<INPUT TYPE="radio" NAME="s234" VALUE=7>7
<INPUT TYPE="radio" NAME="s234" VALUE=8>8
<INPUT TYPE="radio" NAME="s234" VALUE=9>9
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


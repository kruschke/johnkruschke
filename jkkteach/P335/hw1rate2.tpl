# begin template file

*define-variables*
!show-sig = no
[req-s121] = "You must enter a rating for every pair of patterns."
[req-s131] = "You must enter a rating for every pair of patterns."
[req-s141] = "You must enter a rating for every pair of patterns."
[req-s151] = "You must enter a rating for every pair of patterns."
[req-s231] = "You must enter a rating for every pair of patterns."
[req-s241] = "You must enter a rating for every pair of patterns."
[req-s251] = "You must enter a rating for every pair of patterns."
[req-s341] = "You must enter a rating for every pair of patterns."
[req-s351] = "You must enter a rating for every pair of patterns."
[req-s451] = "You must enter a rating for every pair of patterns."
# end of define-variables section

*error-response*
<html>
<head><title>Error</title></head>
<body bgcolor="#FF3333">
<br>[s121]
<br>[s131]
<br>[s141]
<br>[s151]
<br>[s231]
<br>[s241]
<br>[s251]
<br>[s341]
<br>[s351]
<br>[s451]
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
ACTION="/cgi-bin-local/public/transform2?jkkteach/www/P335/hw1rate3">
<center>
 

<p>
<table border=2 cellpadding=10>

<tr>
<td align=center>
<em>Patterns</em>
</td>
<td align=center>
<em>
Your Rating of Similarity
</em>
<br>
(1 = least similar, 9 = most similar)
</td>
</tr>

<!-- 9 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/P335/S.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/P335/D.gif" height=70 width=59 align=right>
</td>
<td>
<INPUT TYPE="radio" NAME="s532" VALUE=1>1
<INPUT TYPE="radio" NAME="s532" VALUE=2>2
<INPUT TYPE="radio" NAME="s532" VALUE=3>3
<INPUT TYPE="radio" NAME="s532" VALUE=4>4
<INPUT TYPE="radio" NAME="s532" VALUE=5>5
<INPUT TYPE="radio" NAME="s532" VALUE=6>6
<INPUT TYPE="radio" NAME="s532" VALUE=7>7
<INPUT TYPE="radio" NAME="s532" VALUE=8>8
<INPUT TYPE="radio" NAME="s532" VALUE=9>9
</td>
</tr>

<!-- 8 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/P335/K.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/P335/D.gif" height=70 width=59 align=right>
</td>
<td>
<INPUT TYPE="radio" NAME="s432" VALUE=1>1
<INPUT TYPE="radio" NAME="s432" VALUE=2>2
<INPUT TYPE="radio" NAME="s432" VALUE=3>3
<INPUT TYPE="radio" NAME="s432" VALUE=4>4
<INPUT TYPE="radio" NAME="s432" VALUE=5>5
<INPUT TYPE="radio" NAME="s432" VALUE=6>6
<INPUT TYPE="radio" NAME="s432" VALUE=7>7
<INPUT TYPE="radio" NAME="s432" VALUE=8>8
<INPUT TYPE="radio" NAME="s432" VALUE=9>9
</td>
</tr>

<!-- 10 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/P335/S.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/P335/K.gif" height=70 width=59 align=right>
</td>
<td>
<INPUT TYPE="radio" NAME="s542" VALUE=1>1
<INPUT TYPE="radio" NAME="s542" VALUE=2>2
<INPUT TYPE="radio" NAME="s542" VALUE=3>3
<INPUT TYPE="radio" NAME="s542" VALUE=4>4
<INPUT TYPE="radio" NAME="s542" VALUE=5>5
<INPUT TYPE="radio" NAME="s542" VALUE=6>6
<INPUT TYPE="radio" NAME="s542" VALUE=7>7
<INPUT TYPE="radio" NAME="s542" VALUE=8>8
<INPUT TYPE="radio" NAME="s542" VALUE=9>9
</td>
</tr>

<!-- 1 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/P335/B.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/P335/A.gif" height=70 width=59 align=right>
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

<!-- 2 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/P335/D.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/P335/A.gif" height=70 width=59 align=right>
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

<!-- 6 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/P335/K.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/P335/B.gif" height=70 width=59 align=right>
</td>
<td>
<INPUT TYPE="radio" NAME="s422" VALUE=1>1
<INPUT TYPE="radio" NAME="s422" VALUE=2>2
<INPUT TYPE="radio" NAME="s422" VALUE=3>3
<INPUT TYPE="radio" NAME="s422" VALUE=4>4
<INPUT TYPE="radio" NAME="s422" VALUE=5>5
<INPUT TYPE="radio" NAME="s422" VALUE=6>6
<INPUT TYPE="radio" NAME="s422" VALUE=7>7
<INPUT TYPE="radio" NAME="s422" VALUE=8>8
<INPUT TYPE="radio" NAME="s422" VALUE=9>9
</td>
</tr>

<!-- 7 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/P335/S.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/P335/B.gif" height=70 width=59 align=right>
</td>
<td>
<INPUT TYPE="radio" NAME="s522" VALUE=1>1
<INPUT TYPE="radio" NAME="s522" VALUE=2>2
<INPUT TYPE="radio" NAME="s522" VALUE=3>3
<INPUT TYPE="radio" NAME="s522" VALUE=4>4
<INPUT TYPE="radio" NAME="s522" VALUE=5>5
<INPUT TYPE="radio" NAME="s522" VALUE=6>6
<INPUT TYPE="radio" NAME="s522" VALUE=7>7
<INPUT TYPE="radio" NAME="s522" VALUE=8>8
<INPUT TYPE="radio" NAME="s522" VALUE=9>9
</td>
</tr>

<!-- 3 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/P335/K.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/P335/A.gif" height=70 width=59 align=right>
</td>
<td>
<INPUT TYPE="radio" NAME="s412" VALUE=1>1
<INPUT TYPE="radio" NAME="s412" VALUE=2>2
<INPUT TYPE="radio" NAME="s412" VALUE=3>3
<INPUT TYPE="radio" NAME="s412" VALUE=4>4
<INPUT TYPE="radio" NAME="s412" VALUE=5>5
<INPUT TYPE="radio" NAME="s412" VALUE=6>6
<INPUT TYPE="radio" NAME="s412" VALUE=7>7
<INPUT TYPE="radio" NAME="s412" VALUE=8>8
<INPUT TYPE="radio" NAME="s412" VALUE=9>9
</td>
</tr>

<!-- 5 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/P335/D.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/P335/B.gif" height=70 width=59 align=right>
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

<!-- 4 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/P335/S.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/P335/A.gif" height=70 width=59 align=right>
</td>
<td>
<INPUT TYPE="radio" NAME="s512" VALUE=1>1
<INPUT TYPE="radio" NAME="s512" VALUE=2>2
<INPUT TYPE="radio" NAME="s512" VALUE=3>3
<INPUT TYPE="radio" NAME="s512" VALUE=4>4
<INPUT TYPE="radio" NAME="s512" VALUE=5>5
<INPUT TYPE="radio" NAME="s512" VALUE=6>6
<INPUT TYPE="radio" NAME="s512" VALUE=7>7
<INPUT TYPE="radio" NAME="s512" VALUE=8>8
<INPUT TYPE="radio" NAME="s512" VALUE=9>9
</td>
</tr>


</table>

<p><strong><INPUT TYPE="submit" VALUE="Continue"></strong>
</center>

!carry-forward [s121] [s131] [s141] [s151] [s231] [s241] [s251] [s341] [s351] [s451] [s212] [s312] [s412] [s512] [s322] [s422] [s522] [s432] [s532] [s542] [s123] [s133] [s143] [s153] [s233] [s243] [s253] [s343] [s353] [s453] [s214] [s314] [s414] [s514] [s324] [s424] [s524] [s434] [s534] [s544]

#<br>Resp's so far:
#<br>[s121] [s131] [s141] [s151] [s231] [s241] [s251] [s341] [s351] [s451]
#<br>[s212] [s312] [s412] [s512] [s322] [s422] [s522] [s432] [s532] [s542]
#<br>[s123] [s133] [s143] [s153] [s233] [s243] [s253] [s343] [s353] [s453]
#<br>[s214] [s314] [s414] [s514] [s324] [s424] [s524] [s434] [s534] [s544]
 
</FORM>
</body>
</html>
# end of success-response section


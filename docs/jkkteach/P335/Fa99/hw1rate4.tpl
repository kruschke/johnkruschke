# begin template file

*define-variables*
!show-sig = no
[req-s123] = "You must enter a rating for every pair of patterns."
[req-s133] = "You must enter a rating for every pair of patterns."
[req-s143] = "You must enter a rating for every pair of patterns."
[req-s153] = "You must enter a rating for every pair of patterns."
[req-s233] = "You must enter a rating for every pair of patterns."
[req-s243] = "You must enter a rating for every pair of patterns."
[req-s253] = "You must enter a rating for every pair of patterns."
[req-s343] = "You must enter a rating for every pair of patterns."
[req-s353] = "You must enter a rating for every pair of patterns."
[req-s453] = "You must enter a rating for every pair of patterns."
# end of define-variables section

*error-response*
<html>
<head><title>Error</title></head>
<body bgcolor="#FF3333">
<br>[s123]
<br>[s133]
<br>[s143]
<br>[s153]
<br>[s233]
<br>[s243]
<br>[s253]
<br>[s343]
<br>[s353]
<br>[s453]
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
ACTION="/cgi-bin-local/public/transform2?jkkteach/www/P335/hw1end">
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

<!-- 3 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/P335/K.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/P335/A.gif" height=70 width=59 align=right>
</td>
<td>
<INPUT TYPE="radio" NAME="s414" VALUE=1>1
<INPUT TYPE="radio" NAME="s414" VALUE=2>2
<INPUT TYPE="radio" NAME="s414" VALUE=3>3
<INPUT TYPE="radio" NAME="s414" VALUE=4>4
<INPUT TYPE="radio" NAME="s414" VALUE=5>5
<INPUT TYPE="radio" NAME="s414" VALUE=6>6
<INPUT TYPE="radio" NAME="s414" VALUE=7>7
<INPUT TYPE="radio" NAME="s414" VALUE=8>8
<INPUT TYPE="radio" NAME="s414" VALUE=9>9
</td>
</tr>

<!-- 5 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/P335/D.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/P335/B.gif" height=70 width=59 align=right>
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

<!-- 6 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/P335/K.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/P335/B.gif" height=70 width=59 align=right>
</td>
<td>
<INPUT TYPE="radio" NAME="s424" VALUE=1>1
<INPUT TYPE="radio" NAME="s424" VALUE=2>2
<INPUT TYPE="radio" NAME="s424" VALUE=3>3
<INPUT TYPE="radio" NAME="s424" VALUE=4>4
<INPUT TYPE="radio" NAME="s424" VALUE=5>5
<INPUT TYPE="radio" NAME="s424" VALUE=6>6
<INPUT TYPE="radio" NAME="s424" VALUE=7>7
<INPUT TYPE="radio" NAME="s424" VALUE=8>8
<INPUT TYPE="radio" NAME="s424" VALUE=9>9
</td>
</tr>

<!-- 1 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/P335/B.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/P335/A.gif" height=70 width=59 align=right>
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

<!-- 7 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/P335/S.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/P335/B.gif" height=70 width=59 align=right>
</td>
<td>
<INPUT TYPE="radio" NAME="s524" VALUE=1>1
<INPUT TYPE="radio" NAME="s524" VALUE=2>2
<INPUT TYPE="radio" NAME="s524" VALUE=3>3
<INPUT TYPE="radio" NAME="s524" VALUE=4>4
<INPUT TYPE="radio" NAME="s524" VALUE=5>5
<INPUT TYPE="radio" NAME="s524" VALUE=6>6
<INPUT TYPE="radio" NAME="s524" VALUE=7>7
<INPUT TYPE="radio" NAME="s524" VALUE=8>8
<INPUT TYPE="radio" NAME="s524" VALUE=9>9
</td>
</tr>

<!-- 8 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/P335/K.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/P335/D.gif" height=70 width=59 align=right>
</td>
<td>
<INPUT TYPE="radio" NAME="s434" VALUE=1>1
<INPUT TYPE="radio" NAME="s434" VALUE=2>2
<INPUT TYPE="radio" NAME="s434" VALUE=3>3
<INPUT TYPE="radio" NAME="s434" VALUE=4>4
<INPUT TYPE="radio" NAME="s434" VALUE=5>5
<INPUT TYPE="radio" NAME="s434" VALUE=6>6
<INPUT TYPE="radio" NAME="s434" VALUE=7>7
<INPUT TYPE="radio" NAME="s434" VALUE=8>8
<INPUT TYPE="radio" NAME="s434" VALUE=9>9
</td>
</tr>

<!-- 4 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/P335/S.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/P335/A.gif" height=70 width=59 align=right>
</td>
<td>
<INPUT TYPE="radio" NAME="s514" VALUE=1>1
<INPUT TYPE="radio" NAME="s514" VALUE=2>2
<INPUT TYPE="radio" NAME="s514" VALUE=3>3
<INPUT TYPE="radio" NAME="s514" VALUE=4>4
<INPUT TYPE="radio" NAME="s514" VALUE=5>5
<INPUT TYPE="radio" NAME="s514" VALUE=6>6
<INPUT TYPE="radio" NAME="s514" VALUE=7>7
<INPUT TYPE="radio" NAME="s514" VALUE=8>8
<INPUT TYPE="radio" NAME="s514" VALUE=9>9
</td>
</tr>

<!-- 9 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/P335/S.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/P335/D.gif" height=70 width=59 align=right>
</td>
<td>
<INPUT TYPE="radio" NAME="s534" VALUE=1>1
<INPUT TYPE="radio" NAME="s534" VALUE=2>2
<INPUT TYPE="radio" NAME="s534" VALUE=3>3
<INPUT TYPE="radio" NAME="s534" VALUE=4>4
<INPUT TYPE="radio" NAME="s534" VALUE=5>5
<INPUT TYPE="radio" NAME="s534" VALUE=6>6
<INPUT TYPE="radio" NAME="s534" VALUE=7>7
<INPUT TYPE="radio" NAME="s534" VALUE=8>8
<INPUT TYPE="radio" NAME="s534" VALUE=9>9
</td>
</tr>

<!-- 10 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/P335/S.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/P335/K.gif" height=70 width=59 align=right>
</td>
<td>
<INPUT TYPE="radio" NAME="s544" VALUE=1>1
<INPUT TYPE="radio" NAME="s544" VALUE=2>2
<INPUT TYPE="radio" NAME="s544" VALUE=3>3
<INPUT TYPE="radio" NAME="s544" VALUE=4>4
<INPUT TYPE="radio" NAME="s544" VALUE=5>5
<INPUT TYPE="radio" NAME="s544" VALUE=6>6
<INPUT TYPE="radio" NAME="s544" VALUE=7>7
<INPUT TYPE="radio" NAME="s544" VALUE=8>8
<INPUT TYPE="radio" NAME="s544" VALUE=9>9
</td>
</tr>

<!-- 2 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/P335/D.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/P335/A.gif" height=70 width=59 align=right>
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


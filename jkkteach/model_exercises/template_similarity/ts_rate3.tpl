# begin template file

*define-variables*
!show-sig = no
[req-s212] = "You must enter a rating for every pair of patterns."
[req-s312] = "You must enter a rating for every pair of patterns."
[req-s412] = "You must enter a rating for every pair of patterns."
[req-s512] = "You must enter a rating for every pair of patterns."
[req-s322] = "You must enter a rating for every pair of patterns."
[req-s422] = "You must enter a rating for every pair of patterns."
[req-s522] = "You must enter a rating for every pair of patterns."
[req-s432] = "You must enter a rating for every pair of patterns."
[req-s532] = "You must enter a rating for every pair of patterns."
[req-s542] = "You must enter a rating for every pair of patterns."
# end of define-variables section

*error-response*
<html>
<head><title>Error</title></head>
<body bgcolor="#FF3333">
<br>[s212]
<br>[s312]
<br>[s412]
<br>[s512]
<br>[s322]
<br>[s422]
<br>[s522]
<br>[s432]
<br>[s532]
<br>[s542]
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
ACTION="transform.cgi?jkkteach/www/model_exercises/template_similarity/ts_rate4">
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

<!-- 10 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/model_exercises/template_similarity/ts_k.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/model_exercises/template_similarity/ts_s.gif" height=70 width=59 align=right>
</td>
<td>
<INPUT TYPE="radio" NAME="s453" VALUE=1>1
<INPUT TYPE="radio" NAME="s453" VALUE=2>2
<INPUT TYPE="radio" NAME="s453" VALUE=3>3
<INPUT TYPE="radio" NAME="s453" VALUE=4>4
<INPUT TYPE="radio" NAME="s453" VALUE=5>5
<INPUT TYPE="radio" NAME="s453" VALUE=6>6
<INPUT TYPE="radio" NAME="s453" VALUE=7>7
<INPUT TYPE="radio" NAME="s453" VALUE=8>8
<INPUT TYPE="radio" NAME="s453" VALUE=9>9
</td>
</tr>

<!-- 3 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/model_exercises/template_similarity/ts_a.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/model_exercises/template_similarity/ts_k.gif" height=70 width=59 align=right>
</td>
<td>
<INPUT TYPE="radio" NAME="s143" VALUE=1>1
<INPUT TYPE="radio" NAME="s143" VALUE=2>2
<INPUT TYPE="radio" NAME="s143" VALUE=3>3
<INPUT TYPE="radio" NAME="s143" VALUE=4>4
<INPUT TYPE="radio" NAME="s143" VALUE=5>5
<INPUT TYPE="radio" NAME="s143" VALUE=6>6
<INPUT TYPE="radio" NAME="s143" VALUE=7>7
<INPUT TYPE="radio" NAME="s143" VALUE=8>8
<INPUT TYPE="radio" NAME="s143" VALUE=9>9
</td>
</tr>

<!-- 4 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/model_exercises/template_similarity/ts_a.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/model_exercises/template_similarity/ts_s.gif" height=70 width=59 align=right>
</td>
<td>
<INPUT TYPE="radio" NAME="s153" VALUE=1>1
<INPUT TYPE="radio" NAME="s153" VALUE=2>2
<INPUT TYPE="radio" NAME="s153" VALUE=3>3
<INPUT TYPE="radio" NAME="s153" VALUE=4>4
<INPUT TYPE="radio" NAME="s153" VALUE=5>5
<INPUT TYPE="radio" NAME="s153" VALUE=6>6
<INPUT TYPE="radio" NAME="s153" VALUE=7>7
<INPUT TYPE="radio" NAME="s153" VALUE=8>8
<INPUT TYPE="radio" NAME="s153" VALUE=9>9
</td>
</tr>

<!-- 5 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/model_exercises/template_similarity/ts_b.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/model_exercises/template_similarity/ts_d.gif" height=70 width=59 align=right>
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

<!-- 2 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/model_exercises/template_similarity/ts_a.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/model_exercises/template_similarity/ts_d.gif" height=70 width=59 align=right>
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

<!-- 6 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/model_exercises/template_similarity/ts_b.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/model_exercises/template_similarity/ts_k.gif" height=70 width=59 align=right>
</td>
<td>
<INPUT TYPE="radio" NAME="s243" VALUE=1>1
<INPUT TYPE="radio" NAME="s243" VALUE=2>2
<INPUT TYPE="radio" NAME="s243" VALUE=3>3
<INPUT TYPE="radio" NAME="s243" VALUE=4>4
<INPUT TYPE="radio" NAME="s243" VALUE=5>5
<INPUT TYPE="radio" NAME="s243" VALUE=6>6
<INPUT TYPE="radio" NAME="s243" VALUE=7>7
<INPUT TYPE="radio" NAME="s243" VALUE=8>8
<INPUT TYPE="radio" NAME="s243" VALUE=9>9
</td>
</tr>

<!-- 8 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/model_exercises/template_similarity/ts_d.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/model_exercises/template_similarity/ts_k.gif" height=70 width=59 align=right>
</td>
<td>
<INPUT TYPE="radio" NAME="s343" VALUE=1>1
<INPUT TYPE="radio" NAME="s343" VALUE=2>2
<INPUT TYPE="radio" NAME="s343" VALUE=3>3
<INPUT TYPE="radio" NAME="s343" VALUE=4>4
<INPUT TYPE="radio" NAME="s343" VALUE=5>5
<INPUT TYPE="radio" NAME="s343" VALUE=6>6
<INPUT TYPE="radio" NAME="s343" VALUE=7>7
<INPUT TYPE="radio" NAME="s343" VALUE=8>8
<INPUT TYPE="radio" NAME="s343" VALUE=9>9
</td>
</tr>

<!-- 7 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/model_exercises/template_similarity/ts_b.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/model_exercises/template_similarity/ts_s.gif" height=70 width=59 align=right>
</td>
<td>
<INPUT TYPE="radio" NAME="s253" VALUE=1>1
<INPUT TYPE="radio" NAME="s253" VALUE=2>2
<INPUT TYPE="radio" NAME="s253" VALUE=3>3
<INPUT TYPE="radio" NAME="s253" VALUE=4>4
<INPUT TYPE="radio" NAME="s253" VALUE=5>5
<INPUT TYPE="radio" NAME="s253" VALUE=6>6
<INPUT TYPE="radio" NAME="s253" VALUE=7>7
<INPUT TYPE="radio" NAME="s253" VALUE=8>8
<INPUT TYPE="radio" NAME="s253" VALUE=9>9
</td>
</tr>

<!-- 1 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/model_exercises/template_similarity/ts_a.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/model_exercises/template_similarity/ts_b.gif" height=70 width=59 align=right>
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

<!-- 9 -->
<tr>
<td align=center width=150>
<img src="http://www.indiana.edu/~jkkteach/model_exercises/template_similarity/ts_d.gif" height=70 width=59 align=left>
<img src="http://www.indiana.edu/~jkkteach/model_exercises/template_similarity/ts_s.gif" height=70 width=59 align=right>
</td>
<td>
<INPUT TYPE="radio" NAME="s353" VALUE=1>1
<INPUT TYPE="radio" NAME="s353" VALUE=2>2
<INPUT TYPE="radio" NAME="s353" VALUE=3>3
<INPUT TYPE="radio" NAME="s353" VALUE=4>4
<INPUT TYPE="radio" NAME="s353" VALUE=5>5
<INPUT TYPE="radio" NAME="s353" VALUE=6>6
<INPUT TYPE="radio" NAME="s353" VALUE=7>7
<INPUT TYPE="radio" NAME="s353" VALUE=8>8
<INPUT TYPE="radio" NAME="s353" VALUE=9>9
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


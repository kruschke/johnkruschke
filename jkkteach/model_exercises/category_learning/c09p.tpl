# begin template file

*define-variables*
!show-sig = no
# end of define-variables section

*error-response*
# end error-response section

*success-response*
<html>
<head><title>Case 09</title></head>
<body bgcolor="#FFFFFF">
<FORM
METHOD="POST"
ACTION="transform.cgi?jkkteach/www/model_exercises/category_learning/c09f">
<center>
Case 9 of 16
<p>
<table width=60%>
<tr>
<td align=center>
<IMG SRC="http://www.indiana.edu/~jkkteach/model_exercises/category_learning/catstim13.gif">
</td>
</tr>
<tr>
<td align=center bgcolor="#FFDDDD">
Is this a case of category X or O ?<br>
(click your choice below)<br>
<INPUT TYPE="radio" NAME="r09" VALUE="X">X
<INPUT TYPE="radio" NAME="r09" VALUE="O">O
</td>
</tr>
</table>
<p><strong><INPUT TYPE="submit" VALUE="Show Correct Answer"></strong>
</center>
!carry-forward [r01] [r02] [r03] [r04] [r05] [r06] [r07] [r08] [r09] [r10] [r11] [r12] [r13] [r14] [r15] [r16]
#<br>Resp's so far: [r01] [r02] [r03] [r04] [r05] [r06] [r07] [r08] [r09] [r10] [r11] [r12] [r13] [r14] [r15] [r16]
</FORM>
</body>
</html>
# end of success-response section


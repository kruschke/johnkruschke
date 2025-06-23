# begin template file

*define-variables*
!show-sig = no
# end of define-variables section

*error-response*
# end error-response section

*success-response*
<html>
<head><title>Case 16</title></head>
<body bgcolor="#FFFFFF">
<FORM 
METHOD="POST" 
ACTION="/cgi-bin-local/public/transform2?jkkteach/www/P335/c16f">
<center>
Case 16 of 16
<p>
<table width=60%>
<tr>
<td align=center>
<IMG SRC="http://www.indiana.edu/~jkkteach/P335/catstim31.gif"> 
</td>
</tr>
<tr>
<td align=center bgcolor="#FFDDDD">
Is this a case of category X or O ?<br>
(click your choice below)<br>
<INPUT TYPE="radio" NAME="r16" VALUE=1>X
<INPUT TYPE="radio" NAME="r16" VALUE=2>O
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


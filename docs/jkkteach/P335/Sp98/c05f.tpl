# begin template file

*define-variables*
!show-sig = no
[req-r05] = "You must enter a category choice."
# end of define-variables section

*error-response*
<html>
<head><title>Error</title></head>
<body bgcolor="#FF3333">
<br>[r05]
<p>Click the "Back" button on your web browser to return to the
previous case.
<p><hr>
</body>
</html>
# end error-response section

*success-response*
<html>
<head><title>Correct Answer</title></head>
<body bgcolor="#FFFFFF">
<FORM 
METHOD="POST" 
ACTION="/cgi-bin-local/public/transform2?jkkteach/www/P335/c06p">
<center>
Case 5 of 16
<p>
<table width=60%>
<tr>
<td align=center>
<IMG SRC="http://www.indiana.edu/~jkkteach/P335/catstim33.gif"> 
</td>
</tr>
<tr>
<td align=center bgcolor="#DDFFDD">
!print-if [r05] eq 2
Correct!<br>
!print-if [r05] eq 1
<blink>WRONG!</blink><br>
!end-print-if
This is a case of category <strong>O</strong>
</td>
</tr>
</table>
<p>
After you have studied this case, click below to see the<br>
<strong>
<INPUT TYPE="submit" VALUE="next case">
</a> 
</strong>
</center>
!carry-forward [r01] [r02] [r03] [r04] [r05] [r06] [r07] [r08] [r09] [r10] [r11] [r12] [r13] [r14] [r15] [r16]
#<br>Resp's so far: [r01] [r02] [r03] [r04] [r05] [r06] [r07] [r08] [r09] [r10] [r11] [r12] [r13] [r14] [r15] [r16]
</FORM>
</body>
</html>
# end of success-response section


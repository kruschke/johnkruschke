# begin template file

*define-variables*
!show-sig = no
[req-r18] = "You must enter a category choice."
# end of define-variables section

*error-response*
<html>
<head><title>Error</title></head>
<body bgcolor="#FF3333">
<br>[r18]
<p>Click the "Back" button on your web browser to return to the
previous case.
<p><hr>
</body>
</html>
# end error-response section

*success-response*
<html>
<head><title>Test Feedback</title></head>
<body bgcolor="#FFFFFF">
<FORM 
METHOD="POST" 
ACTION="/cgi-bin-local/public/transform2?jkkteach/www/P335/c19p">
<center>
Test (case 18)
<p>
<table width=60%>
<tr>
<td align=center>
<IMG SRC="http://www.indiana.edu/~jkkteach/P335/catstim51.gif"> 
</td>
</tr>
<tr>
<td align=center bgcolor="#DDFFDD">
Thank you for your response.
</td>
</tr>
</table>
<p>
Please continue to the
<strong>
<INPUT TYPE="submit" VALUE="next case">
</a> 
</strong>
</center>
!carry-forward [r01] [r02] [r03] [r04] [r05] [r06] [r07] [r08] [r09] [r10] [r11] [r12] [r13] [r14] [r15] [r16] [r17] [r18] [r19] [r20]
#<br>Resp's so far: [r01] [r02] [r03] [r04] [r05] [r06] [r07] [r08] [r09] [r10] [r11] [r12] [r13] [r14] [r15] [r16] [r17] [r18] [r19] [r20]
</FORM>
</body>
</html>
# end of success-response section


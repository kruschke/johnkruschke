# begin template file

# Due date TIMEs:
# 886508928
# 888928128
# 891520128
# 893939328

*define-variables*
!show-sig = no
[req-idnum] = "You must enter your student ID number."
[req-lastname] = "You must enter your last name."
[req-firstname] = "You must enter your first name."
[req-email] = "You must enter your e-mail address."
[req-papernum] = "You must select the paper number (1-4)."
# end of define-variables section

*error-response*
<html>
<head><title>Error</title></head>
<body>
<h2>Sorry, but you need to supply the following info:</h2>
<br>ID: [idnum]
<br>Last name: [lastname]
<br>Firt name: [firstname]
<br>Email: [email]
<br>Paper number: [papernum]
<p>Although your evaluation is not anonymous, the content of your
evaluation does not affect your grade in any way.  Your sincere evaluation
will help improve the course and gives you 2 points.
<p>Click the "Back" button on your web browser to return to the
evaluation form.
<p><hr>
</body>
</html>
# end error-response section

*success-response*
<html>
<head><title>Relevance paper by [firstname] [lastname]</title></head>
<body>

<center>
<h2>
[PaperTitle]
<p>
by [firstname] [lastname]
<br>([idnum])
<br><a href=mailto:[email]>[email]</a>
<p>[!DATE]
</h2>
<p>
<h3>
Relevance Paper [papernum] for 
P335 Cognitive Psychology, Prof. Kruschke
</h3>
</center>

<p><strong>[SituationTitle]</strong>
<pre>
[SituationDescription]
</pre>




<p><hr>
</body>
</html>
# end of success-response section

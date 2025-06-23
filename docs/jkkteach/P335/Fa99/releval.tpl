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
<head><title>Thanks for the feedback!</title></head>
<body>
<h2>Thanks, [firstname], for your feedback!</h2>
<p>Your evaluation will help improve this assignment, and you get 2
points for your effort (just once per paper, or course, and if you
submitted your evaluation after it was due but before the next one is
due).
<p>Again, the content of your evaluation does not affect your grade.
<p><hr>
</body>
</html>
# end of success-response section

# e-mail to assistant 
*email-response*
To:kasilva@indiana.edu
From:[email]
Subject: P335 Relevance Paper Evaluation Points

Please add 2 points to the following student, for completing
evaluation of relevance paper number [papernum].  Please check that
the evaluation is made after the paper is due but before the next
paper is due. Thanks!

ID: [idnum]
Name: [lastname], [firstname]
E-mail: [email]

Paper number: [papernum]
Date: [!DATE]
Time: [!TIME]
# end e-mail section

# e-mail to Kruschke
*email-response*
To:kruschke@indiana.edu
From:[email]
Subject: P335 Relevance Paper Evaluation

Evaluator: 
ID: [idnum]
Name: [lastname], [firstname]
E-mail: [email]

Paper number: [papernum]

Paper situation: 
[situation]

Paper applications: 
[applications]

    Relevant? [relevant]
 Interesting? [interesting]
 Explanatory? [explanatory]
  Time Spent? [timespent]
Attend Class? [attended]
Disc. Rating: [classdisc]

Discussion comments:
[disccomment]

Other assignment ideas?
[otherassign]

Other comments?
[othercomment]
# end e-mail section

*append-response*
!append-file-name = "/ip/jkkteach/www/P335/releval.dat"
[papernum]	[idnum]	[relevant]	[interesting]	[explanatory]	[timespent]	[attended]	[classdisc]	[!TIME]	[!DATE]

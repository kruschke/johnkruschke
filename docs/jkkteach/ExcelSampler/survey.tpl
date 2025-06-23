# survey.tpl
#
# begin template file

*define-variables*
!show-sig = no
# end of define-variables section

*error-response*
# end error-response section

*success-response*
<html><font face="tahoma">
<head><title>Excel Sampler Survey</title></head>
<body bgcolor="khaki">
<form method="post" action="transform.cgi?jkkteach/www/ExcelSampler/SamplerLinks.tpl">

<h2>
General Samplers for Excel
</h2>
<h3>
Excel workbooks that generate sampling distributions from arbitrary
populations for any sample statistic.
</h3>
by John K. Kruschke

<p>Just one more thing before getting to the Excel samplers
themselves.  I am interested in knowing approximately where the
samplers are being used and by how many people. Therefore I would be
very pleased if you would let me know the basic information
below. Submitting this information is optional, but your responses
would be greatly appreciated!

<p><table border="1" cellpadding="10">

<tr><td>

<p> Please click button that best describes your status while using
the Excel Samplers:

<br><input type="radio" name="userstatus" value="student">Student

<br><input type="radio" name="userstatus" value="instructor">Instructor

<br><input type="radio" name="userstatus" value="joker">Hey,
<em>status</em> is an atavistic presumption that dehumanizes <font
size="-1"> caring, sentient beings who were created equal and turns
them into mere timber <font size="-2"> for holding up your
pre-Enlightenment horror hut of mental slavery and fascist injustice
<font size="-3"> that permeates all extant societies and so don't
pretend to me, buster, that your little question about "status" is an
innocuous button click!!!!! </font> </font> </font>




<p> Please click the button that best describes your current visit to
this site:

<br><input type="radio" name="visit" value="justtrying">I'm just
trying these to see what they're like. I'll let you know later if I
end up using them.

<br><input type="radio" name="visit" value="forcourse">I'm using these
for a course that I'm teaching or taking (or find them useful for self
study).

<br><input type="radio" name="visit" value="joker">I'm waiting to see
how you're gonna get Excel to do needlework embroidery (you know, make
a "sampler").



<p> Please type in the Dept., University/Organization and City with
which you are affiliated: <br>(I'm genuinely interested, so please be
polite) <br> <input type="text" name="where" size="60">
</td></tr>
</table>

<p><b> <input type="submit" value="Continue"> </b>

</body></font></html>
# end success-response section





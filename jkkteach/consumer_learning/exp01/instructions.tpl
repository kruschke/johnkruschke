############################## DEFINE-VARIABLES SECTION #################
*define-variables*
!show-sig = no
[req-subj_number] = "SUBJECT NUMBER IS MISSING."
[req-age] = "SUBJECT AGE IS MISSING."
[req-booth] = "BOOTH IS MISSING."
[req-sex] = "SUBJECT SEX IS MISSING."
[req-handedness] = "SUBJECT HANDEDNESS IS MISSING."
[req-initials] = "YOUR INITIALS ARE MISSING."
### end of define-variables section
############################## ERROR-RESPONSE SECTION ###################
*error-response*
<html>
<head><title>Error</title></head>
<body bgcolor="#FF9999">
<p>Here is what you entered; something is missing:
<br>Subject number: [subj_number]
<br>Age: [age]
<br>Booth: [booth]
<br>Sex: [sex]
<br>Handedness: [handedness]
<br>Your initials: [initials]
<p>Click the "Back" button on the web browser to return to the
previous page and fill in the missing information.
<p><hr>
</body>
</html>
### end error-response section
############################## APPEND-RESPONSE SECTION ##################
*append-response*
!append-file-name = "~jkkteach/www/consumer_learning/exp01/data/exp01subj[subj_number].dat"
exp01 [subj_number] [age] [sex] [handedness] [initials] [booth] [!DD]-[!SMOY]-[!YYYY] [!HOUR]:[!MIN]:[!SEC]
[!TIME] training_phase_instructions
### end append-response section
############################## SUCCESS-RESPONSE SECTION #################
*success-response*
<html>
<head><title>Instructions</title></head>
<body bgcolor="#FFFFFF">
<FORM METHOD="POST"
ACTION="transform.cgi?jkkteach/www/consumer_learning/exp01/train_items.tpl">
!carry-forward [subj_number]
<p>
<strong>Here are the instructions to the participant...</strong>
###
!include = "~jkkteach/www/consumer_learning/exp01/training_choice_list.include"
###
</FORM>
</body>
</html>
# end of success-response section

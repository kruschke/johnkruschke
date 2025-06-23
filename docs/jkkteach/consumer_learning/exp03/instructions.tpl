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
<head><title>Adventures in whitewater rafting</title></head>
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
!append-file-name = "~jkkteach/www/consumer_learning/exp03/data/exp03subj[subj_number].dat"
exp03 Subj=[subj_number] SubjModTwelve=[SubjModTwelve] Age=[age] Sex=[sex] Hand=[handedness] AdminBy=[initials] Booth=[booth] [!DD]-[!SMOY]-[!YYYY] [!HOUR]:[!MIN]:[!SEC]
[!TIME] training_phase_instructions
### end append-response section
############################## SUCCESS-RESPONSE SECTION #################
*success-response*
<html>
<head><title>Adventures in whitewater rafting</title></head>
<body background="backg.jpg">
<FORM METHOD="POST"
ACTION="transform.cgi?jkkteach/www/consumer_learning/exp03/train_items.tpl">
<input type=hidden name="CueA" value="Sewn Seams">
<input type=hidden name="CueB" value="Duraskin Coating">
<input type=hidden name="CueC" value="Barrel Pump">
<input type=hidden name="CueD" value="Steel D Rings">
!print-if [SubjModTwelve] eq "1"
<input type=hidden name="CueI" value="Side Valves">
<input type=hidden name="CuePE" value="PVC Material">
<input type=hidden name="CuePL" value="Floor Rigidity">
<input type=hidden name="OutE" value="High">
<input type=hidden name="OutL" value="Low">
!end-print-if
!print-if [SubjModTwelve] eq "2"
<input type=hidden name="CueI" value="Side Valves">
<input type=hidden name="CuePE" value="Floor Rigidity">
<input type=hidden name="CuePL" value="PVC Material">
<input type=hidden name="OutE" value="High">
<input type=hidden name="OutL" value="Low">
!end-print-if
!print-if [SubjModTwelve] eq "3"
<input type=hidden name="CueI" value="PVC Material">
<input type=hidden name="CuePE" value="Side Valves">
<input type=hidden name="CuePL" value="Floor Rigidity">
<input type=hidden name="OutE" value="High">
<input type=hidden name="OutL" value="Low">
!end-print-if
!print-if [SubjModTwelve] eq "4"
<input type=hidden name="CueI" value="PVC Material">
<input type=hidden name="CuePE" value="Floor Rigidity">
<input type=hidden name="CuePL" value="Side Valves">
<input type=hidden name="OutE" value="High">
<input type=hidden name="OutL" value="Low">
!end-print-if
!print-if [SubjModTwelve] eq "5"
<input type=hidden name="CueI" value="Floor Rigidity">
<input type=hidden name="CuePE" value="Side Valves">
<input type=hidden name="CuePL" value="PVC Material">
<input type=hidden name="OutE" value="High">
<input type=hidden name="OutL" value="Low">
!end-print-if
!print-if [SubjModTwelve] eq "6"
<input type=hidden name="CueI" value="Floor Rigidity">
<input type=hidden name="CuePE" value="PVC Material">
<input type=hidden name="CuePL" value="Side Valves">
<input type=hidden name="OutE" value="High">
<input type=hidden name="OutL" value="Low">
!end-print-if
!print-if [SubjModTwelve] eq "7"
<input type=hidden name="CueI" value="Side Valves">
<input type=hidden name="CuePE" value="PVC Material">
<input type=hidden name="CuePL" value="Floor Rigidity">
<input type=hidden name="OutE" value="Low">
<input type=hidden name="OutL" value="High">
!end-print-if
!print-if [SubjModTwelve] eq "8"
<input type=hidden name="CueI" value="Side Valves">
<input type=hidden name="CuePE" value="Floor Rigidity">
<input type=hidden name="CuePL" value="PVC Material">
<input type=hidden name="OutE" value="Low">
<input type=hidden name="OutL" value="High">
!end-print-if
!print-if [SubjModTwelve] eq "9"
<input type=hidden name="CueI" value="PVC Material">
<input type=hidden name="CuePE" value="Side Valves">
<input type=hidden name="CuePL" value="Floor Rigidity">
<input type=hidden name="OutE" value="Low">
<input type=hidden name="OutL" value="High">
!end-print-if
!print-if [SubjModTwelve] eq "10"
<input type=hidden name="CueI" value="PVC Material">
<input type=hidden name="CuePE" value="Floor Rigidity">
<input type=hidden name="CuePL" value="Side Valves">
<input type=hidden name="OutE" value="Low">
<input type=hidden name="OutL" value="High">
!end-print-if
!print-if [SubjModTwelve] eq "11"
<input type=hidden name="CueI" value="Floor Rigidity">
<input type=hidden name="CuePE" value="Side Valves">
<input type=hidden name="CuePL" value="PVC Material">
<input type=hidden name="OutE" value="Low">
<input type=hidden name="OutL" value="High">
!end-print-if
!print-if [SubjModTwelve] eq "0"
<input type=hidden name="CueI" value="Floor Rigidity">
<input type=hidden name="CuePE" value="PVC Material">
<input type=hidden name="CuePL" value="Side Valves">
<input type=hidden name="OutE" value="Low">
<input type=hidden name="OutL" value="High">
!end-print-if
###
!print-file = "~jkkteach/www/consumer_learning/exp03/Main_Instruct"
###
!print-file = "~jkkteach/www/consumer_learning/exp03/training_choice_list"
###
!carry-forward [subj_number]
</FORM>
</body>
</html>
# end of success-response section











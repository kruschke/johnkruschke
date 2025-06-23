############################## DEFINE-VARIABLES SECTION #################
*define-variables*
!show-sig = no
[req-age] = "YOUR AGE IS MISSING."
[req-sex] = "YOUR SEX IS MISSING."
[req-hand] = "YOUR HANDEDNESS IS MISSING."
### end of define-variables section
############################## ERROR-RESPONSE SECTION ###################
*error-response*
<html>
<head><title>Adventures in whitewater rafting</title></head>
<body bgcolor="#FF9999">
<p>Here is what you entered; something is missing:
<br>Age: [age]
<br>Sex: [sex]
<br>Handedness: [hand]
<p>
To return to the previous page: <ul>
<li>In <strong>Netscape</strong>, at the top of the browser click
"<u>G</u>o", then "<u>B</u>ack".
<p><li> In <strong>Explorer</strong>, at the top of the browser click
"<u>V</u>iew", then "<u>G</u>o&nbsp;To", then "<u>B</u>ack". </ul>
<p><hr>
</body>
</html>
### end error-response section
############################## APPEND-RESPONSE SECTION ##################
*append-response*
!append-file-name = "~jkkteach/www/whitewater_rafting/data/[subj].dat"
subj=[subj] permute_sec=[permute_sec] age=[age] sex=[sex] hand=[hand]
[!DD]-[!SMOY]-[!YYYY] [!HOUR]:[!MIN]:[!SEC]
[!TIME] training_phase_instructions
### end append-response section
############################## SUCCESS-RESPONSE SECTION #################
*success-response*
<html>
<head><title>Adventures in whitewater rafting</title></head>
<body background="backg.jpg">
<FORM METHOD="POST"
ACTION="transform.cgi?jkkteach/www/whitewater_rafting/train_items.tpl">


permute_sec=[permute_sec]


<input type=hidden name="CueA" value="Sewn Seams">
<input type=hidden name="CueB" value="Duraskin Coating">
<input type=hidden name="CueC" value="Barrel Pump">
<input type=hidden name="CueD" value="Steel D Rings">

!print-if 
!! [permute_sec] eq "00" or
!! [permute_sec] eq "12" or
!! [permute_sec] eq "24" or
!! [permute_sec] eq "36" or
!! [permute_sec] eq "48"
<input type=hidden name="CueI" value="Lateral Valves">
<input type=hidden name="CuePE" value="Hexagonal Aircells">
<input type=hidden name="CuePL" value="Sodium Seam Glue">
<input type=hidden name="OutE" value="High">
<input type=hidden name="OutL" value="Low">
!end-print-if

!print-if 
!! [permute_sec] eq "01" or
!! [permute_sec] eq "13" or
!! [permute_sec] eq "25" or
!! [permute_sec] eq "37" or
!! [permute_sec] eq "49"
<input type=hidden name="CueI" value="Lateral Valves">
<input type=hidden name="CuePE" value="Sodium Seam Glue">
<input type=hidden name="CuePL" value="Hexagonal Aircells">
<input type=hidden name="OutE" value="High">
<input type=hidden name="OutL" value="Low">
!end-print-if

!print-if 
!! [permute_sec] eq "02" or
!! [permute_sec] eq "14" or
!! [permute_sec] eq "26" or
!! [permute_sec] eq "38" or
!! [permute_sec] eq "50"
<input type=hidden name="CueI" value="Hexagonal Aircells">
<input type=hidden name="CuePE" value="Lateral Valves">
<input type=hidden name="CuePL" value="Sodium Seam Glue">
<input type=hidden name="OutE" value="High">
<input type=hidden name="OutL" value="Low">
!end-print-if

!print-if 
!! [permute_sec] eq "03" or
!! [permute_sec] eq "15" or
!! [permute_sec] eq "27" or
!! [permute_sec] eq "39" or
!! [permute_sec] eq "51"
<input type=hidden name="CueI" value="Hexagonal Aircells">
<input type=hidden name="CuePE" value="Sodium Seam Glue">
<input type=hidden name="CuePL" value="Lateral Valves">
<input type=hidden name="OutE" value="High">
<input type=hidden name="OutL" value="Low">
!end-print-if

!print-if 
!! [permute_sec] eq "04" or
!! [permute_sec] eq "16" or
!! [permute_sec] eq "28" or
!! [permute_sec] eq "40" or
!! [permute_sec] eq "52"
<input type=hidden name="CueI" value="Sodium Seam Glue">
<input type=hidden name="CuePE" value="Lateral Valves">
<input type=hidden name="CuePL" value="Hexagonal Aircells">
<input type=hidden name="OutE" value="High">
<input type=hidden name="OutL" value="Low">
!end-print-if

!print-if 
!! [permute_sec] eq "05" or
!! [permute_sec] eq "17" or
!! [permute_sec] eq "29" or
!! [permute_sec] eq "41" or
!! [permute_sec] eq "53"
<input type=hidden name="CueI" value="Sodium Seam Glue">
<input type=hidden name="CuePE" value="Hexagonal Aircells">
<input type=hidden name="CuePL" value="Lateral Valves">
<input type=hidden name="OutE" value="High">
<input type=hidden name="OutL" value="Low">
!end-print-if

!print-if 
!! [permute_sec] eq "06" or
!! [permute_sec] eq "18" or
!! [permute_sec] eq "30" or
!! [permute_sec] eq "42" or
!! [permute_sec] eq "54"
<input type=hidden name="CueI" value="Lateral Valves">
<input type=hidden name="CuePE" value="Hexagonal Aircells">
<input type=hidden name="CuePL" value="Sodium Seam Glue">
<input type=hidden name="OutE" value="Low">
<input type=hidden name="OutL" value="High">
!end-print-if

!print-if 
!! [permute_sec] eq "07" or
!! [permute_sec] eq "19" or
!! [permute_sec] eq "31" or
!! [permute_sec] eq "43" or
!! [permute_sec] eq "55"
<input type=hidden name="CueI" value="Lateral Valves">
<input type=hidden name="CuePE" value="Sodium Seam Glue">
<input type=hidden name="CuePL" value="Hexagonal Aircells">
<input type=hidden name="OutE" value="Low">
<input type=hidden name="OutL" value="High">
!end-print-if

!print-if 
!! [permute_sec] eq "08" or
!! [permute_sec] eq "20" or
!! [permute_sec] eq "32" or
!! [permute_sec] eq "44" or
!! [permute_sec] eq "56"
<input type=hidden name="CueI" value="Lateral Valves">
<input type=hidden name="CueI" value="Hexagonal Aircells">
<input type=hidden name="CuePE" value="Lateral Valves">
<input type=hidden name="CuePL" value="Sodium Seam Glue">
<input type=hidden name="OutE" value="Low">
<input type=hidden name="OutL" value="High">
!end-print-if

!print-if 
!! [permute_sec] eq "09" or
!! [permute_sec] eq "21" or
!! [permute_sec] eq "33" or
!! [permute_sec] eq "45" or
!! [permute_sec] eq "57"
<input type=hidden name="CueI" value="Hexagonal Aircells">
<input type=hidden name="CuePE" value="Sodium Seam Glue">
<input type=hidden name="CuePL" value="Lateral Valves">
<input type=hidden name="OutE" value="Low">
<input type=hidden name="OutL" value="High">
!end-print-if

!print-if 
!! [permute_sec] eq "10" or
!! [permute_sec] eq "22" or
!! [permute_sec] eq "34" or
!! [permute_sec] eq "46" or
!! [permute_sec] eq "58"
<input type=hidden name="CueI" value="Sodium Seam Glue">
<input type=hidden name="CuePE" value="Lateral Valves">
<input type=hidden name="CuePL" value="Hexagonal Aircells">
<input type=hidden name="OutE" value="Low">
<input type=hidden name="OutL" value="High">
!end-print-if

!print-if 
!! [permute_sec] eq "11" or
!! [permute_sec] eq "23" or
!! [permute_sec] eq "35" or
!! [permute_sec] eq "47" or
!! [permute_sec] eq "59"
<input type=hidden name="CueI" value="Sodium Seam Glue">
<input type=hidden name="CuePE" value="Hexagonal Aircells">
<input type=hidden name="CuePL" value="Lateral Valves">
<input type=hidden name="OutE" value="Low">
<input type=hidden name="OutL" value="High">
!end-print-if
###
!print-file = "~jkkteach/www/whitewater_rafting/Main_Instruct"
###
!print-file = "~jkkteach/www/whitewater_rafting/training_choice_list"
###
!carry-forward [subj]
</FORM>
</body>
</html>
# end of success-response section











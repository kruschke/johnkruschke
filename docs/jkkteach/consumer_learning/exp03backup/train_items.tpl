############################## DEFINE-VARIABLES SECTION #################
*define-variables*
!show-sig = no
!force-error-if (
!!          [item_code] eq ""
!!        )
!force-error-if (
!!          [test_response] eq ""
!!        ) and (
!!          [item_code] eq "Itest_1" or
!!          [item_code] eq "Itest_2" or
!!          [item_code] eq "Itest_3" or
!!          [item_code] eq "Itest_4" or
!!          [item_code] eq "PE.PLtest_1" or
!!          [item_code] eq "PE.PLtest_2" or
!!          [item_code] eq "PL.PEtest_1" or
!!          [item_code] eq "PL.PEtest_2" or
!!          [item_code] eq "I.PEtest_1" or
!!          [item_code] eq "I.PEtest_2" or
!!          [item_code] eq "PE.Itest_1" or
!!          [item_code] eq "PE.Itest_2" or
!!          [item_code] eq "I.PLtest_1" or
!!          [item_code] eq "I.PLtest_2" or
!!          [item_code] eq "PL.Itest_1" or
!!          [item_code] eq "PL.Itest_2" 
!!        )
### end of define-variables section
############################## ERROR-RESPONSE SECTION ###################
*error-response*
!use-if (
!!          [item_code] eq ""
!!        )
<html>
YOU MUST SELECT A NEXT RAFT.
<p>Click the BACK button on the web browser to return to the list of rafts.
</html>
*error-response*
!use-if (
!!          [test_response] eq ""
!!       ) and (
!!          [item_code] eq "Itest_1" or
!!          [item_code] eq "Itest_2" or
!!          [item_code] eq "Itest_3" or
!!          [item_code] eq "Itest_4" or
!!          [item_code] eq "PE.PLtest_1" or
!!          [item_code] eq "PE.PLtest_2" or
!!          [item_code] eq "PL.PEtest_1" or
!!          [item_code] eq "PL.PEtest_2" or
!!          [item_code] eq "I.PEtest_1" or
!!          [item_code] eq "I.PEtest_2" or
!!          [item_code] eq "PE.Itest_1" or
!!          [item_code] eq "PE.Itest_2" or
!!          [item_code] eq "I.PLtest_1" or
!!          [item_code] eq "I.PLtest_2" or
!!          [item_code] eq "PL.Itest_1" or
!!          [item_code] eq "PL.Itest_2" 
!!       )
<html>
YOU MUST PREDICT THE QUALITY OF THE RAFT.
<p>Click the BACK button on the web browser to return to the raft description.
</html>
### end error-response section
############################## APPEND-RESPONSE SECTION ##################
*append-response*
!use-if (
!!        [item_code] eq "I.PE_1" or
!!        [item_code] eq "I.PE_2" or
!!        [item_code] eq "I.PE_3" or
!!        [item_code] eq "PL.I_1" or
!!        [item_code] eq "I.PE_4" or
!!        [item_code] eq "PE.I_1" or
!!        [item_code] eq "PE.I_2" or
!!        [item_code] eq "PL.I_2" or
!!        [item_code] eq "PE.I_3" or
!!        [item_code] eq "PE.I_4" or
!!        [item_code] eq "I.PL_1" or
!!        [item_code] eq "PL.I_3" or
!!        [item_code] eq "I.PL_2" or
!!        [item_code] eq "I.PL_3" or
!!        [item_code] eq "I.PL_4" or
!!        [item_code] eq "PL.I_4" 
!!      ) and (
!!        [I.PE_1chosen] eq "" or 
!!        [I.PE_2chosen] eq "" or 
!!        [I.PE_3chosen] eq "" or 
!!        [PL.I_1chosen] eq "" or
!!        [I.PE_4chosen] eq "" or 
!!        [PE.I_1chosen] eq "" or 
!!        [PE.I_2chosen] eq "" or 
!!        [PL.I_2chosen] eq "" or
!!        [PE.I_3chosen] eq "" or 
!!        [PE.I_4chosen] eq "" or 
!!        [I.PL_1chosen] eq "" or 
!!        [PL.I_3chosen] eq "" or
!!        [I.PL_2chosen] eq "" or 
!!        [I.PL_3chosen] eq "" or 
!!        [I.PL_4chosen] eq "" or 
!!        [PL.I_4chosen] eq "" 
!!      )
!append-file-name = "~jkkteach/www/consumer_learning/exp03/data/exp03subj[subj_number].dat"
[!TIME] [item_code] 
###
*append-response*
!use-if (
!!        [item_code] eq "I.PE_1" or
!!        [item_code] eq "I.PE_2" or
!!        [item_code] eq "I.PE_3" or
!!        [item_code] eq "PL.I_1" or
!!        [item_code] eq "PE.I_1" or
!!        [item_code] eq "PE.I_2" or
!!        [item_code] eq "PL.I_2" or
!!        [item_code] eq "PE.I_3" or
!!        [item_code] eq "PE.I_4" or
!!        [item_code] eq "I.PL_1" or
!!        [item_code] eq "PL.I_3" or
!!        [item_code] eq "I.PL_2" or
!!        [item_code] eq "I.PL_3" or
!!        [item_code] eq "I.PL_4" or
!!        [item_code] eq "PL.I_4" 
!!      ) and (
!!        [I.PE_1chosen] ne "" and 
!!        [I.PE_2chosen] ne "" and 
!!        [I.PE_3chosen] ne "" and 
!!        [PL.I_1chosen] ne "" and
!!        [I.PE_4chosen] ne "" and 
!!        [PE.I_1chosen] ne "" and 
!!        [PE.I_2chosen] ne "" and 
!!        [PL.I_2chosen] ne "" and
!!        [PE.I_3chosen] ne "" and 
!!        [PE.I_4chosen] ne "" and 
!!        [I.PL_1chosen] ne "" and 
!!        [PL.I_3chosen] ne "" and
!!        [I.PL_2chosen] ne "" and 
!!        [I.PL_3chosen] ne "" and 
!!        [I.PL_4chosen] ne "" and 
!!        [PL.I_4chosen] ne "" 
!!      )
!append-file-name = "~jkkteach/www/consumer_learning/exp03/data/exp03subj[subj_number].dat"
[!TIME] test_phase_instructions 
###
*append-response*
!use-if (
!!          [item_code] eq "Itest_1" or
!!          [item_code] eq "Itest_2" or
!!          [item_code] eq "Itest_3" or
!!          [item_code] eq "Itest_4" or
!!          [item_code] eq "PE.PLtest_1" or
!!          [item_code] eq "PE.PLtest_2" or
!!          [item_code] eq "PL.PEtest_1" or
!!          [item_code] eq "PL.PEtest_2" or
!!          [item_code] eq "I.PEtest_1" or
!!          [item_code] eq "I.PEtest_2" or
!!          [item_code] eq "PE.Itest_1" or
!!          [item_code] eq "PE.Itest_2" or
!!          [item_code] eq "I.PLtest_1" or
!!          [item_code] eq "I.PLtest_2" or
!!          [item_code] eq "PL.Itest_1" or
!!          [item_code] eq "PL.Itest_2" 
!!      ) and (
!!        [I.PEtest_1chosen]  eq "" or
!!        [I.PLtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PE.PLtest_1chosen] eq "" or
!!        [I.PEtest_2chosen]  eq "" or
!!        [I.PLtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PE.PLtest_2chosen] eq "" or
!!        [PE.Itest_1chosen]  eq "" or
!!        [PL.Itest_1chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PL.PEtest_1chosen] eq "" or
!!        [PE.Itest_2chosen]  eq "" or
!!        [PL.Itest_2chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PL.PEtest_2chosen] eq "" 
!!      )
!append-file-name = "~jkkteach/www/consumer_learning/exp03/data/exp03subj[subj_number].dat"
[test_response] [!TIME] [item_code]
###
*append-response*
!use-if (
!!          [item_code] eq "Itest_1" or
!!          [item_code] eq "Itest_2" or
!!          [item_code] eq "Itest_3" or
!!          [item_code] eq "Itest_4" or
!!          [item_code] eq "PE.PLtest_1" or
!!          [item_code] eq "PE.PLtest_2" or
!!          [item_code] eq "PL.PEtest_1" or
!!          [item_code] eq "PL.PEtest_2" or
!!          [item_code] eq "I.PEtest_1" or
!!          [item_code] eq "I.PEtest_2" or
!!          [item_code] eq "PE.Itest_1" or
!!          [item_code] eq "PE.Itest_2" or
!!          [item_code] eq "I.PLtest_1" or
!!          [item_code] eq "I.PLtest_2" or
!!          [item_code] eq "PL.Itest_1" or
!!          [item_code] eq "PL.Itest_2" 
!!        ) and ( not (
!!        [I.PEtest_1chosen]  eq "" or
!!        [I.PLtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PE.PLtest_1chosen] eq "" or
!!        [I.PEtest_2chosen]  eq "" or
!!        [I.PLtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PE.PLtest_2chosen] eq "" or
!!        [PE.Itest_1chosen]  eq "" or
!!        [PL.Itest_1chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PL.PEtest_1chosen] eq "" or
!!        [PE.Itest_2chosen]  eq "" or
!!        [PL.Itest_2chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PL.PEtest_2chosen] eq "" 
!!        ) )
!append-file-name = "~jkkteach/www/consumer_learning/exp03/data/exp03subj[subj_number].dat"
[test_response] [!TIME] farewell
### end append-response section
############################## SUCCESS-RESPONSE SECTION #################
*success-response*
<html>
<head><title>Adventures in whitewater rafting</title></head>
<body background="backg.jpg">
<FORM METHOD="POST"
ACTION="transform.cgi?jkkteach/www/consumer_learning/exp03/train_items.tpl">
###
!print-if [item_code] eq "I.PE_1"
!!        and (
!!        [I.PE_1chosen] eq "" or 
!!        [I.PE_2chosen] eq "" or 
!!        [I.PE_3chosen] eq "" or 
!!        [I.PE_4chosen] eq "" or 
!!        [PE.I_1chosen] eq "" or 
!!        [PE.I_2chosen] eq "" or 
!!        [PE.I_3chosen] eq "" or 
!!        [PE.I_4chosen] eq "" or 
!!        [I.PL_1chosen] eq "" or 
!!        [I.PL_2chosen] eq "" or 
!!        [I.PL_3chosen] eq "" or 
!!        [I.PL_4chosen] eq "" or 
!!        [PL.I_1chosen] eq "" or
!!        [PL.I_2chosen] eq "" or
!!        [PL.I_3chosen] eq "" or
!!        [PL.I_4chosen] eq "" )
<input type="hidden" name="I.PE_1chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/I.PE_1"
!print-file = "~jkkteach/www/consumer_learning/exp03/training_choice_list"
!end-print-if
###
!print-if [item_code] eq "I.PE_2"
!!        and (
!!        [I.PE_1chosen] eq "" or 
!!        [I.PE_2chosen] eq "" or 
!!        [I.PE_3chosen] eq "" or 
!!        [PL.I_1chosen] eq "" or
!!        [I.PE_4chosen] eq "" or 
!!        [PE.I_1chosen] eq "" or 
!!        [PE.I_2chosen] eq "" or 
!!        [PL.I_2chosen] eq "" or
!!        [PE.I_3chosen] eq "" or 
!!        [PE.I_4chosen] eq "" or 
!!        [I.PL_1chosen] eq "" or 
!!        [PL.I_3chosen] eq "" or
!!        [I.PL_2chosen] eq "" or 
!!        [I.PL_3chosen] eq "" or 
!!        [I.PL_4chosen] eq "" or 
!!        [PL.I_4chosen] eq "" )
<input type="hidden" name="I.PE_2chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/I.PE_2"
!print-file = "~jkkteach/www/consumer_learning/exp03/training_choice_list"
!end-print-if
###
!print-if [item_code] eq "I.PE_3"
!!        and (
!!        [I.PE_1chosen] eq "" or 
!!        [I.PE_2chosen] eq "" or 
!!        [I.PE_3chosen] eq "" or 
!!        [PL.I_1chosen] eq "" or
!!        [I.PE_4chosen] eq "" or 
!!        [PE.I_1chosen] eq "" or 
!!        [PE.I_2chosen] eq "" or 
!!        [PL.I_2chosen] eq "" or
!!        [PE.I_3chosen] eq "" or 
!!        [PE.I_4chosen] eq "" or 
!!        [I.PL_1chosen] eq "" or 
!!        [PL.I_3chosen] eq "" or
!!        [I.PL_2chosen] eq "" or 
!!        [I.PL_3chosen] eq "" or 
!!        [I.PL_4chosen] eq "" or 
!!        [PL.I_4chosen] eq "" )
<input type="hidden" name="I.PE_3chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/I.PE_3"
!print-file = "~jkkteach/www/consumer_learning/exp03/training_choice_list"
!end-print-if
###
!print-if [item_code] eq "I.PE_4"
!!        and (
!!        [I.PE_1chosen] eq "" or 
!!        [I.PE_2chosen] eq "" or 
!!        [I.PE_3chosen] eq "" or 
!!        [PL.I_1chosen] eq "" or
!!        [I.PE_4chosen] eq "" or 
!!        [PE.I_1chosen] eq "" or 
!!        [PE.I_2chosen] eq "" or 
!!        [PL.I_2chosen] eq "" or
!!        [PE.I_3chosen] eq "" or 
!!        [PE.I_4chosen] eq "" or 
!!        [I.PL_1chosen] eq "" or 
!!        [PL.I_3chosen] eq "" or
!!        [I.PL_2chosen] eq "" or 
!!        [I.PL_3chosen] eq "" or 
!!        [I.PL_4chosen] eq "" or 
!!        [PL.I_4chosen] eq "" )
<input type="hidden" name="I.PE_4chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/I.PE_4"
!print-file = "~jkkteach/www/consumer_learning/exp03/training_choice_list"
!end-print-if
###
!print-if [item_code] eq "PE.I_1"
!!        and (
!!        [I.PE_1chosen] eq "" or 
!!        [I.PE_2chosen] eq "" or 
!!        [I.PE_3chosen] eq "" or 
!!        [PL.I_1chosen] eq "" or
!!        [I.PE_4chosen] eq "" or 
!!        [PE.I_1chosen] eq "" or 
!!        [PE.I_2chosen] eq "" or 
!!        [PL.I_2chosen] eq "" or
!!        [PE.I_3chosen] eq "" or 
!!        [PE.I_4chosen] eq "" or 
!!        [I.PL_1chosen] eq "" or 
!!        [PL.I_3chosen] eq "" or
!!        [I.PL_2chosen] eq "" or 
!!        [I.PL_3chosen] eq "" or 
!!        [I.PL_4chosen] eq "" or 
!!        [PL.I_4chosen] eq "" )
<input type="hidden" name="PE.I_1chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/PE.I_1"
!print-file = "~jkkteach/www/consumer_learning/exp03/training_choice_list"
!end-print-if
###
!print-if [item_code] eq "PE.I_2"
!!        and (
!!        [I.PE_1chosen] eq "" or 
!!        [I.PE_2chosen] eq "" or 
!!        [I.PE_3chosen] eq "" or 
!!        [PL.I_1chosen] eq "" or
!!        [I.PE_4chosen] eq "" or 
!!        [PE.I_1chosen] eq "" or 
!!        [PE.I_2chosen] eq "" or 
!!        [PL.I_2chosen] eq "" or
!!        [PE.I_3chosen] eq "" or 
!!        [PE.I_4chosen] eq "" or 
!!        [I.PL_1chosen] eq "" or 
!!        [PL.I_3chosen] eq "" or
!!        [I.PL_2chosen] eq "" or 
!!        [I.PL_3chosen] eq "" or 
!!        [I.PL_4chosen] eq "" or 
!!        [PL.I_4chosen] eq "" )
<input type="hidden" name="PE.I_2chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/PE.I_2"
!print-file = "~jkkteach/www/consumer_learning/exp03/training_choice_list"
!end-print-if
###
!print-if [item_code] eq "PE.I_3"
!!        and (
!!        [I.PE_1chosen] eq "" or 
!!        [I.PE_2chosen] eq "" or 
!!        [I.PE_3chosen] eq "" or 
!!        [PL.I_1chosen] eq "" or
!!        [I.PE_4chosen] eq "" or 
!!        [PE.I_1chosen] eq "" or 
!!        [PE.I_2chosen] eq "" or 
!!        [PL.I_2chosen] eq "" or
!!        [PE.I_3chosen] eq "" or 
!!        [PE.I_4chosen] eq "" or 
!!        [I.PL_1chosen] eq "" or 
!!        [PL.I_3chosen] eq "" or
!!        [I.PL_2chosen] eq "" or 
!!        [I.PL_3chosen] eq "" or 
!!        [I.PL_4chosen] eq "" or 
!!        [PL.I_4chosen] eq "" )
<input type="hidden" name="PE.I_3chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/PE.I_3"
!print-file = "~jkkteach/www/consumer_learning/exp03/training_choice_list"
!end-print-if
###
!print-if [item_code] eq "PE.I_4"
!!        and (
!!        [I.PE_1chosen] eq "" or 
!!        [I.PE_2chosen] eq "" or 
!!        [I.PE_3chosen] eq "" or 
!!        [PL.I_1chosen] eq "" or
!!        [I.PE_4chosen] eq "" or 
!!        [PE.I_1chosen] eq "" or 
!!        [PE.I_2chosen] eq "" or 
!!        [PL.I_2chosen] eq "" or
!!        [PE.I_3chosen] eq "" or 
!!        [PE.I_4chosen] eq "" or 
!!        [I.PL_1chosen] eq "" or 
!!        [PL.I_3chosen] eq "" or
!!        [I.PL_2chosen] eq "" or 
!!        [I.PL_3chosen] eq "" or 
!!        [I.PL_4chosen] eq "" or 
!!        [PL.I_4chosen] eq "" )
<input type="hidden" name="PE.I_4chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/PE.I_4"
!print-file = "~jkkteach/www/consumer_learning/exp03/training_choice_list"
!end-print-if
###
!print-if [item_code] eq "I.PL_1"
!!        and (
!!        [I.PE_1chosen] eq "" or 
!!        [I.PE_2chosen] eq "" or 
!!        [I.PE_3chosen] eq "" or 
!!        [PL.I_1chosen] eq "" or
!!        [I.PE_4chosen] eq "" or 
!!        [PE.I_1chosen] eq "" or 
!!        [PE.I_2chosen] eq "" or 
!!        [PL.I_2chosen] eq "" or
!!        [PE.I_3chosen] eq "" or 
!!        [PE.I_4chosen] eq "" or 
!!        [I.PL_1chosen] eq "" or 
!!        [PL.I_3chosen] eq "" or
!!        [I.PL_2chosen] eq "" or 
!!        [I.PL_3chosen] eq "" or 
!!        [I.PL_4chosen] eq "" or 
!!        [PL.I_4chosen] eq "" )
<input type="hidden" name="I.PL_1chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/I.PL_1"
!print-file = "~jkkteach/www/consumer_learning/exp03/training_choice_list"
!end-print-if
###
!print-if [item_code] eq "I.PL_2"
!!        and (
!!        [I.PE_1chosen] eq "" or 
!!        [I.PE_2chosen] eq "" or 
!!        [I.PE_3chosen] eq "" or 
!!        [PL.I_1chosen] eq "" or
!!        [I.PE_4chosen] eq "" or 
!!        [PE.I_1chosen] eq "" or 
!!        [PE.I_2chosen] eq "" or 
!!        [PL.I_2chosen] eq "" or
!!        [PE.I_3chosen] eq "" or 
!!        [PE.I_4chosen] eq "" or 
!!        [I.PL_1chosen] eq "" or 
!!        [PL.I_3chosen] eq "" or
!!        [I.PL_2chosen] eq "" or 
!!        [I.PL_3chosen] eq "" or 
!!        [I.PL_4chosen] eq "" or 
!!        [PL.I_4chosen] eq "" )
<input type="hidden" name="I.PL_2chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/I.PL_2"
!print-file = "~jkkteach/www/consumer_learning/exp03/training_choice_list"
!end-print-if
###
!print-if [item_code] eq "I.PL_3"
!!        and (
!!        [I.PE_1chosen] eq "" or 
!!        [I.PE_2chosen] eq "" or 
!!        [I.PE_3chosen] eq "" or 
!!        [PL.I_1chosen] eq "" or
!!        [I.PE_4chosen] eq "" or 
!!        [PE.I_1chosen] eq "" or 
!!        [PE.I_2chosen] eq "" or 
!!        [PL.I_2chosen] eq "" or
!!        [PE.I_3chosen] eq "" or 
!!        [PE.I_4chosen] eq "" or 
!!        [I.PL_1chosen] eq "" or 
!!        [PL.I_3chosen] eq "" or
!!        [I.PL_2chosen] eq "" or 
!!        [I.PL_3chosen] eq "" or 
!!        [I.PL_4chosen] eq "" or 
!!        [PL.I_4chosen] eq "" )
<input type="hidden" name="I.PL_3chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/I.PL_3"
!print-file = "~jkkteach/www/consumer_learning/exp03/training_choice_list"
!end-print-if
###
!print-if [item_code] eq "I.PL_4"
!!        and (
!!        [I.PE_1chosen] eq "" or 
!!        [I.PE_2chosen] eq "" or 
!!        [I.PE_3chosen] eq "" or 
!!        [PL.I_1chosen] eq "" or
!!        [I.PE_4chosen] eq "" or 
!!        [PE.I_1chosen] eq "" or 
!!        [PE.I_2chosen] eq "" or 
!!        [PL.I_2chosen] eq "" or
!!        [PE.I_3chosen] eq "" or 
!!        [PE.I_4chosen] eq "" or 
!!        [I.PL_1chosen] eq "" or 
!!        [PL.I_3chosen] eq "" or
!!        [I.PL_2chosen] eq "" or 
!!        [I.PL_3chosen] eq "" or 
!!        [I.PL_4chosen] eq "" or 
!!        [PL.I_4chosen] eq "" )
<input type="hidden" name="I.PL_4chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/I.PL_4"
!print-file = "~jkkteach/www/consumer_learning/exp03/training_choice_list"
!end-print-if
###
!print-if [item_code] eq "PL.I_1"
!!        and (
!!        [I.PE_1chosen] eq "" or 
!!        [I.PE_2chosen] eq "" or 
!!        [I.PE_3chosen] eq "" or 
!!        [PL.I_1chosen] eq "" or
!!        [I.PE_4chosen] eq "" or 
!!        [PE.I_1chosen] eq "" or 
!!        [PE.I_2chosen] eq "" or 
!!        [PL.I_2chosen] eq "" or
!!        [PE.I_3chosen] eq "" or 
!!        [PE.I_4chosen] eq "" or 
!!        [I.PL_1chosen] eq "" or 
!!        [PL.I_3chosen] eq "" or
!!        [I.PL_2chosen] eq "" or 
!!        [I.PL_3chosen] eq "" or 
!!        [I.PL_4chosen] eq "" or 
!!        [PL.I_4chosen] eq "" )
<input type="hidden" name="PL.I_1chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/PL.I_1"
!print-file = "~jkkteach/www/consumer_learning/exp03/training_choice_list"
!end-print-if
###
!print-if [item_code] eq "PL.I_2"
!!        and (
!!        [I.PE_1chosen] eq "" or 
!!        [I.PE_2chosen] eq "" or 
!!        [I.PE_3chosen] eq "" or 
!!        [PL.I_1chosen] eq "" or
!!        [I.PE_4chosen] eq "" or 
!!        [PE.I_1chosen] eq "" or 
!!        [PE.I_2chosen] eq "" or 
!!        [PL.I_2chosen] eq "" or
!!        [PE.I_3chosen] eq "" or 
!!        [PE.I_4chosen] eq "" or 
!!        [I.PL_1chosen] eq "" or 
!!        [PL.I_3chosen] eq "" or
!!        [I.PL_2chosen] eq "" or 
!!        [I.PL_3chosen] eq "" or 
!!        [I.PL_4chosen] eq "" or 
!!        [PL.I_4chosen] eq "" )
<input type="hidden" name="PL.I_2chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/PL.I_2"
!print-file = "~jkkteach/www/consumer_learning/exp03/training_choice_list"
!end-print-if
###
!print-if [item_code] eq "PL.I_3"
!!        and (
!!        [I.PE_1chosen] eq "" or 
!!        [I.PE_2chosen] eq "" or 
!!        [I.PE_3chosen] eq "" or 
!!        [PL.I_1chosen] eq "" or
!!        [I.PE_4chosen] eq "" or 
!!        [PE.I_1chosen] eq "" or 
!!        [PE.I_2chosen] eq "" or 
!!        [PL.I_2chosen] eq "" or
!!        [PE.I_3chosen] eq "" or 
!!        [PE.I_4chosen] eq "" or 
!!        [I.PL_1chosen] eq "" or 
!!        [PL.I_3chosen] eq "" or
!!        [I.PL_2chosen] eq "" or 
!!        [I.PL_3chosen] eq "" or 
!!        [I.PL_4chosen] eq "" or 
!!        [PL.I_4chosen] eq "" )
<input type="hidden" name="PL.I_3chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/PL.I_3"
!print-file = "~jkkteach/www/consumer_learning/exp03/training_choice_list"
!end-print-if
###
!print-if [item_code] eq "PL.I_4"
!!        and (
!!        [I.PE_1chosen] eq "" or 
!!        [I.PE_2chosen] eq "" or 
!!        [I.PE_3chosen] eq "" or 
!!        [PL.I_1chosen] eq "" or
!!        [I.PE_4chosen] eq "" or 
!!        [PE.I_1chosen] eq "" or 
!!        [PE.I_2chosen] eq "" or 
!!        [PL.I_2chosen] eq "" or
!!        [PE.I_3chosen] eq "" or 
!!        [PE.I_4chosen] eq "" or 
!!        [I.PL_1chosen] eq "" or 
!!        [PL.I_3chosen] eq "" or
!!        [I.PL_2chosen] eq "" or 
!!        [I.PL_3chosen] eq "" or 
!!        [I.PL_4chosen] eq "" or 
!!        [PL.I_4chosen] eq "" )
<input type="hidden" name="PL.I_4chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/PL.I_4"
!print-file = "~jkkteach/www/consumer_learning/exp03/training_choice_list"
!end-print-if
###
!print-if (
!!          [item_code] eq "I.PE_1" or
!!          [item_code] eq "I.PE_2" or
!!          [item_code] eq "I.PE_3" or
!!          [item_code] eq "I.PE_4" or
!!          [item_code] eq "PE.I_1" or
!!          [item_code] eq "PE.I_2" or
!!          [item_code] eq "PE.I_3" or
!!          [item_code] eq "PE.I_4" or
!!          [item_code] eq "I.PL_1" or
!!          [item_code] eq "I.PL_2" or
!!          [item_code] eq "I.PL_3" or
!!          [item_code] eq "I.PL_4" or
!!          [item_code] eq "PL.I_1" or
!!          [item_code] eq "PL.I_2" or
!!          [item_code] eq "PL.I_3" or
!!          [item_code] eq "PL.I_4"
!!        ) and (
!!          [I.PE_1chosen] ne "" and 
!!          [I.PE_2chosen] ne "" and 
!!          [I.PE_3chosen] ne "" and 
!!          [I.PE_4chosen] ne "" and 
!!          [PE.I_1chosen] ne "" and 
!!          [PE.I_2chosen] ne "" and 
!!          [PE.I_3chosen] ne "" and 
!!          [PE.I_4chosen] ne "" and 
!!          [I.PL_1chosen] ne "" and 
!!          [I.PL_2chosen] ne "" and 
!!          [I.PL_3chosen] ne "" and 
!!          [I.PL_4chosen] ne "" and 
!!          [PL.I_1chosen] ne "" and 
!!          [PL.I_2chosen] ne "" and 
!!          [PL.I_3chosen] ne "" and 
!!          [PL.I_4chosen] ne "" 
!!        )
<table width=70% align=center><tr><td> Although you selected another
raft to look at, you have now looked at all the rafts at least once.
Therefore we'd like you to take a consumer survey instead.  You'll see
rafts similar to those you've seen before, but all these rafts are
still in the production stages.  <em>The manufacturers would like to know
what you think would be the overall quality of the rafts, based on the
features of the rafts.  <strong>For each raft you view, indicate your
prediction of the quality by clicking the appropriate button in the
display.</strong> You must rate all the rafts at least once.</em>
Please do not go back to review the rafts; we are interested in your
predictions based on your memory. 
</td></tr></table>
<input type="hidden" name="test_response" value="(test_instruction_resp)">
!print-file = "~jkkteach/www/consumer_learning/exp03/test_choice_list"
!end-print-if
###
!print-if [item_code] eq "Itest_1"
!!        and (
!!        [I.PEtest_1chosen]  eq "" or
!!        [I.PLtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PE.PLtest_1chosen] eq "" or
!!        [I.PEtest_2chosen]  eq "" or
!!        [I.PLtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PE.PLtest_2chosen] eq "" or
!!        [PE.Itest_1chosen]  eq "" or
!!        [PL.Itest_1chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PL.PEtest_1chosen] eq "" or
!!        [PE.Itest_2chosen]  eq "" or
!!        [PL.Itest_2chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PL.PEtest_2chosen] eq "" 
!! )
<input type="hidden" name="Itest_1chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/Itest_1"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_resp"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_choice_list"
!end-print-if
###
!print-if [item_code] eq "PE.PLtest_1"
!!        and (
!!        [I.PEtest_1chosen]  eq "" or
!!        [I.PLtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PE.PLtest_1chosen] eq "" or
!!        [I.PEtest_2chosen]  eq "" or
!!        [I.PLtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PE.PLtest_2chosen] eq "" or
!!        [PE.Itest_1chosen]  eq "" or
!!        [PL.Itest_1chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PL.PEtest_1chosen] eq "" or
!!        [PE.Itest_2chosen]  eq "" or
!!        [PL.Itest_2chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PL.PEtest_2chosen] eq "" 
!! )
<input type="hidden" name="PE.PLtest_1chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/PE.PLtest_1"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_resp"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_choice_list"
!end-print-if
###
!print-if [item_code] eq "I.PEtest_1"
!!        and (
!!        [I.PEtest_1chosen]  eq "" or
!!        [I.PLtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PE.PLtest_1chosen] eq "" or
!!        [I.PEtest_2chosen]  eq "" or
!!        [I.PLtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PE.PLtest_2chosen] eq "" or
!!        [PE.Itest_1chosen]  eq "" or
!!        [PL.Itest_1chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PL.PEtest_1chosen] eq "" or
!!        [PE.Itest_2chosen]  eq "" or
!!        [PL.Itest_2chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PL.PEtest_2chosen] eq "" 
!! )
<input type="hidden" name="I.PEtest_1chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/I.PEtest_1"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_resp"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_choice_list"
!end-print-if
###
!print-if [item_code] eq "I.PLtest_1"
!!        and (
!!        [I.PEtest_1chosen]  eq "" or
!!        [I.PLtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PE.PLtest_1chosen] eq "" or
!!        [I.PEtest_2chosen]  eq "" or
!!        [I.PLtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PE.PLtest_2chosen] eq "" or
!!        [PE.Itest_1chosen]  eq "" or
!!        [PL.Itest_1chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PL.PEtest_1chosen] eq "" or
!!        [PE.Itest_2chosen]  eq "" or
!!        [PL.Itest_2chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PL.PEtest_2chosen] eq "" 
!! )
<input type="hidden" name="I.PLtest_1chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/I.PLtest_1"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_resp"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_choice_list"
!end-print-if
###
!print-if [item_code] eq "Itest_2"
!!        and (
!!        [I.PEtest_1chosen]  eq "" or
!!        [I.PLtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PE.PLtest_1chosen] eq "" or
!!        [I.PEtest_2chosen]  eq "" or
!!        [I.PLtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PE.PLtest_2chosen] eq "" or
!!        [PE.Itest_1chosen]  eq "" or
!!        [PL.Itest_1chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PL.PEtest_1chosen] eq "" or
!!        [PE.Itest_2chosen]  eq "" or
!!        [PL.Itest_2chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PL.PEtest_2chosen] eq "" 
!! )
<input type="hidden" name="Itest_2chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/Itest_2"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_resp"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_choice_list"
!end-print-if
###
!print-if [item_code] eq "PE.PLtest_2"
!!        and (
!!        [I.PEtest_1chosen]  eq "" or
!!        [I.PLtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PE.PLtest_1chosen] eq "" or
!!        [I.PEtest_2chosen]  eq "" or
!!        [I.PLtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PE.PLtest_2chosen] eq "" or
!!        [PE.Itest_1chosen]  eq "" or
!!        [PL.Itest_1chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PL.PEtest_1chosen] eq "" or
!!        [PE.Itest_2chosen]  eq "" or
!!        [PL.Itest_2chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PL.PEtest_2chosen] eq "" 
!! )
<input type="hidden" name="PE.PLtest_2chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/PE.PLtest_2"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_resp"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_choice_list"
!end-print-if
###
!print-if [item_code] eq "I.PEtest_2"
!!        and (
!!        [I.PEtest_1chosen]  eq "" or
!!        [I.PLtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PE.PLtest_1chosen] eq "" or
!!        [I.PEtest_2chosen]  eq "" or
!!        [I.PLtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PE.PLtest_2chosen] eq "" or
!!        [PE.Itest_1chosen]  eq "" or
!!        [PL.Itest_1chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PL.PEtest_1chosen] eq "" or
!!        [PE.Itest_2chosen]  eq "" or
!!        [PL.Itest_2chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PL.PEtest_2chosen] eq "" 
!! )
<input type="hidden" name="I.PEtest_2chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/I.PEtest_2"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_resp"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_choice_list"
!end-print-if
###
!print-if [item_code] eq "I.PLtest_2"
!!        and (
!!        [I.PEtest_1chosen]  eq "" or
!!        [I.PLtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PE.PLtest_1chosen] eq "" or
!!        [I.PEtest_2chosen]  eq "" or
!!        [I.PLtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PE.PLtest_2chosen] eq "" or
!!        [PE.Itest_1chosen]  eq "" or
!!        [PL.Itest_1chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PL.PEtest_1chosen] eq "" or
!!        [PE.Itest_2chosen]  eq "" or
!!        [PL.Itest_2chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PL.PEtest_2chosen] eq "" 
!! )
<input type="hidden" name="I.PLtest_2chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/I.PLtest_2"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_resp"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_choice_list"
!end-print-if
###
!print-if [item_code] eq "Itest_3"
!!        and (
!!        [I.PEtest_1chosen]  eq "" or
!!        [I.PLtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PE.PLtest_1chosen] eq "" or
!!        [I.PEtest_2chosen]  eq "" or
!!        [I.PLtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PE.PLtest_2chosen] eq "" or
!!        [PE.Itest_1chosen]  eq "" or
!!        [PL.Itest_1chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PL.PEtest_1chosen] eq "" or
!!        [PE.Itest_2chosen]  eq "" or
!!        [PL.Itest_2chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PL.PEtest_2chosen] eq "" 
!! )
<input type="hidden" name="Itest_3chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/Itest_3"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_resp"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_choice_list"
!end-print-if
###
!print-if [item_code] eq "PL.PEtest_1"
!!        and (
!!        [I.PEtest_1chosen]  eq "" or
!!        [I.PLtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PE.PLtest_1chosen] eq "" or
!!        [I.PEtest_2chosen]  eq "" or
!!        [I.PLtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PE.PLtest_2chosen] eq "" or
!!        [PE.Itest_1chosen]  eq "" or
!!        [PL.Itest_1chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PL.PEtest_1chosen] eq "" or
!!        [PE.Itest_2chosen]  eq "" or
!!        [PL.Itest_2chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PL.PEtest_2chosen] eq "" 
!! )
<input type="hidden" name="PL.PEtest_1chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/PL.PEtest_1"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_resp"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_choice_list"
!end-print-if
###
!print-if [item_code] eq "PE.Itest_1"
!!        and (
!!        [I.PEtest_1chosen]  eq "" or
!!        [I.PLtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PE.PLtest_1chosen] eq "" or
!!        [I.PEtest_2chosen]  eq "" or
!!        [I.PLtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PE.PLtest_2chosen] eq "" or
!!        [PE.Itest_1chosen]  eq "" or
!!        [PL.Itest_1chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PL.PEtest_1chosen] eq "" or
!!        [PE.Itest_2chosen]  eq "" or
!!        [PL.Itest_2chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PL.PEtest_2chosen] eq "" 
!! )
<input type="hidden" name="PE.Itest_1chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/PE.Itest_1"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_resp"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_choice_list"
!end-print-if
###
!print-if [item_code] eq "PL.Itest_1"
!!        and (
!!        [I.PEtest_1chosen]  eq "" or
!!        [I.PLtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PE.PLtest_1chosen] eq "" or
!!        [I.PEtest_2chosen]  eq "" or
!!        [I.PLtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PE.PLtest_2chosen] eq "" or
!!        [PE.Itest_1chosen]  eq "" or
!!        [PL.Itest_1chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PL.PEtest_1chosen] eq "" or
!!        [PE.Itest_2chosen]  eq "" or
!!        [PL.Itest_2chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PL.PEtest_2chosen] eq "" 
!! )
<input type="hidden" name="PL.Itest_1chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/PL.Itest_1"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_resp"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_choice_list"
!end-print-if
###
!print-if [item_code] eq "Itest_4"
!!        and (
!!        [I.PEtest_1chosen]  eq "" or
!!        [I.PLtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PE.PLtest_1chosen] eq "" or
!!        [I.PEtest_2chosen]  eq "" or
!!        [I.PLtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PE.PLtest_2chosen] eq "" or
!!        [PE.Itest_1chosen]  eq "" or
!!        [PL.Itest_1chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PL.PEtest_1chosen] eq "" or
!!        [PE.Itest_2chosen]  eq "" or
!!        [PL.Itest_2chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PL.PEtest_2chosen] eq "" 
!! )
<input type="hidden" name="Itest_4chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/Itest_4"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_resp"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_choice_list"
!end-print-if
###
!print-if [item_code] eq "PL.PEtest_2"
!!        and (
!!        [I.PEtest_1chosen]  eq "" or
!!        [I.PLtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PE.PLtest_1chosen] eq "" or
!!        [I.PEtest_2chosen]  eq "" or
!!        [I.PLtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PE.PLtest_2chosen] eq "" or
!!        [PE.Itest_1chosen]  eq "" or
!!        [PL.Itest_1chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PL.PEtest_1chosen] eq "" or
!!        [PE.Itest_2chosen]  eq "" or
!!        [PL.Itest_2chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PL.PEtest_2chosen] eq "" 
!! )
<input type="hidden" name="PL.PEtest_2chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/PL.PEtest_2"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_resp"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_choice_list"
!end-print-if
###
!print-if [item_code] eq "PE.Itest_2"
!!        and (
!!        [I.PEtest_1chosen]  eq "" or
!!        [I.PLtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PE.PLtest_1chosen] eq "" or
!!        [I.PEtest_2chosen]  eq "" or
!!        [I.PLtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PE.PLtest_2chosen] eq "" or
!!        [PE.Itest_1chosen]  eq "" or
!!        [PL.Itest_1chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PL.PEtest_1chosen] eq "" or
!!        [PE.Itest_2chosen]  eq "" or
!!        [PL.Itest_2chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PL.PEtest_2chosen] eq "" 
!! )
<input type="hidden" name="PE.Itest_2chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/PE.Itest_2"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_resp"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_choice_list"
!end-print-if
###
!print-if [item_code] eq "PL.Itest_2"
!!        and (
!!        [I.PEtest_1chosen]  eq "" or
!!        [I.PLtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PE.PLtest_1chosen] eq "" or
!!        [I.PEtest_2chosen]  eq "" or
!!        [I.PLtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PE.PLtest_2chosen] eq "" or
!!        [PE.Itest_1chosen]  eq "" or
!!        [PL.Itest_1chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PL.PEtest_1chosen] eq "" or
!!        [PE.Itest_2chosen]  eq "" or
!!        [PL.Itest_2chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PL.PEtest_2chosen] eq "" 
!! )
<input type="hidden" name="PL.Itest_2chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp03/PL.Itest_2"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_resp"
!print-file = "~jkkteach/www/consumer_learning/exp03/test_choice_list"
!end-print-if
###
!print-if  NOT (
!!        [I.PEtest_1chosen]  eq "" or
!!        [I.PLtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PE.PLtest_1chosen] eq "" or
!!        [I.PEtest_2chosen]  eq "" or
!!        [I.PLtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PE.PLtest_2chosen] eq "" or
!!        [PE.Itest_1chosen]  eq "" or
!!        [PL.Itest_1chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PL.PEtest_1chosen] eq "" or
!!        [PE.Itest_2chosen]  eq "" or
!!        [PL.Itest_2chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PL.PEtest_2chosen] eq "" 
!!        )
<table width=70% align=center><tr><td> 
Although you selected another raft to look at, you have now rated all
the production rafts at least once.  <p><strong><font
color="red">IMPORTANT:</font> All of the information in this
experiment has been random and fictitious. There is no "Society of
Whitewater Rafters," and the correspondence between features and
quality was determined randomly for each participant in the
experiment. Do not let any of the information about rafts in this
experiment influence you in any way if you ever actually deal with
real whitewater rafts!  If you ever deal with whitewater rafts, please
get accurate information from reliable sources.  </strong> <p>The
experiment is now over. Please <em>quietly</em> go to the front
reception room. Take any personal belongings with you, and
<em>quietly</em> close the door behind you.  <p><strong><u>Thank you
very much for participanting!</u></strong>
</td></tr></table>
!end-print-if
###
!carry-forward [subj_number]
!carry-forward [CueI] [CuePE] [CuePL] [OutE] [OutL]
!carry-forward [I.PE_1chosen] [I.PE_2chosen] [I.PE_3chosen] [I.PE_4chosen]
!carry-forward [PE.I_1chosen] [PE.I_2chosen] [PE.I_3chosen] [PE.I_4chosen]
!carry-forward [I.PL_1chosen] [I.PL_2chosen] [I.PL_3chosen] [I.PL_4chosen]
!carry-forward [PL.I_1chosen] [PL.I_2chosen] [PL.I_3chosen] [PL.I_4chosen]
!carry-forward [Itest_1chosen] [PE.PLtest_1chosen] [I.PEtest_1chosen] [I.PLtest_1chosen]
!carry-forward [Itest_2chosen] [PE.PLtest_2chosen] [I.PEtest_2chosen] [I.PLtest_2chosen]
!carry-forward [Itest_3chosen] [PL.PEtest_1chosen] [PE.Itest_1chosen] [PL.Itest_1chosen]
!carry-forward [Itest_4chosen] [PL.PEtest_2chosen] [PE.Itest_2chosen] [PL.Itest_2chosen]
</FORM>
</body>
</html>
# end of success-response section


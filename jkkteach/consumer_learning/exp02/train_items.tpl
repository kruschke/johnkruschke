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
!!          [item_code] eq "PC.PRtest_1" or
!!          [item_code] eq "PC.PRtest_2" or
!!          [item_code] eq "PC.PRtest_3" or
!!          [item_code] eq "PC.PRtest_4" or
!!          [item_code] eq "I.PCtest_1" or
!!          [item_code] eq "I.PCtest_2" or
!!          [item_code] eq "I.PCtest_3" or
!!          [item_code] eq "I.PCtest_4" or
!!          [item_code] eq "I.PRtest_1" or
!!          [item_code] eq "I.PRtest_2" or
!!          [item_code] eq "I.PRtest_3" or
!!          [item_code] eq "I.PRtest_4" 
!!        )
### end of define-variables section
############################## ERROR-RESPONSE SECTION ###################
*error-response*
!use-if (
!!          [item_code] eq ""
!!        )
<html>
YOU MUST SELECT A NEXT ITEM.
<p>Click the BACK button on the web browser to return to the item list.
</html>
*error-response*
!use-if (
!!          [test_response] eq ""
!!       ) and (
!!          [item_code] eq "Itest_1" or
!!          [item_code] eq "Itest_2" or
!!          [item_code] eq "Itest_3" or
!!          [item_code] eq "Itest_4" or
!!          [item_code] eq "PC.PRtest_1" or
!!          [item_code] eq "PC.PRtest_2" or
!!          [item_code] eq "PC.PRtest_3" or
!!          [item_code] eq "PC.PRtest_4" or
!!          [item_code] eq "I.PCtest_1" or
!!          [item_code] eq "I.PCtest_2" or
!!          [item_code] eq "I.PCtest_3" or
!!          [item_code] eq "I.PCtest_4" or
!!          [item_code] eq "I.PRtest_1" or
!!          [item_code] eq "I.PRtest_2" or
!!          [item_code] eq "I.PRtest_3" or
!!          [item_code] eq "I.PRtest_4" 
!!       )
<html>
YOU MUST RATE THE ITEM.
<p>Click the BACK button on the web browser to return to the item description.
</html>
### end error-response section
############################## APPEND-RESPONSE SECTION ##################
*append-response*
!use-if (
!!        [item_code] eq "I.PC_1" or
!!        [item_code] eq "I.PC_2" or
!!        [item_code] eq "I.PC_3" or
!!        [item_code] eq "I.PR_1" or
!!        [item_code] eq "I.PC_4" or
!!        [item_code] eq "I.PC_5" or
!!        [item_code] eq "I.PC_6" or
!!        [item_code] eq "I.PR_2" or
!!        [item_code] eq "I.PC_7" or
!!        [item_code] eq "I.PC_8" or
!!        [item_code] eq "I.PC_9" or
!!        [item_code] eq "I.PR_3" or
!!        [item_code] eq "I.PC_10" or
!!        [item_code] eq "I.PC_11" or
!!        [item_code] eq "I.PC_12" or
!!        [item_code] eq "I.PR_4" 
!!      ) and (
!!        [I.PC_1chosen] eq "" or 
!!        [I.PC_2chosen] eq "" or 
!!        [I.PC_3chosen] eq "" or 
!!        [I.PR_1chosen] eq "" or
!!        [I.PC_4chosen] eq "" or 
!!        [I.PC_5chosen] eq "" or 
!!        [I.PC_6chosen] eq "" or 
!!        [I.PR_2chosen] eq "" or
!!        [I.PC_7chosen] eq "" or 
!!        [I.PC_8chosen] eq "" or 
!!        [I.PC_9chosen] eq "" or 
!!        [I.PR_3chosen] eq "" or
!!        [I.PC_10chosen] eq "" or 
!!        [I.PC_11chosen] eq "" or 
!!        [I.PC_12chosen] eq "" or 
!!        [I.PR_4chosen] eq "" 
!!      )
!append-file-name = "~jkkteach/www/consumer_learning/exp02/data/exp02subj[subj_number].dat"
[!TIME] [item_code] 
###
*append-response*
!use-if (
!!        [item_code] eq "I.PC_1" or
!!        [item_code] eq "I.PC_2" or
!!        [item_code] eq "I.PC_3" or
!!        [item_code] eq "I.PR_1" or
!!        [item_code] eq "I.PC_5" or
!!        [item_code] eq "I.PC_6" or
!!        [item_code] eq "I.PR_2" or
!!        [item_code] eq "I.PC_7" or
!!        [item_code] eq "I.PC_8" or
!!        [item_code] eq "I.PC_9" or
!!        [item_code] eq "I.PR_3" or
!!        [item_code] eq "I.PC_10" or
!!        [item_code] eq "I.PC_11" or
!!        [item_code] eq "I.PC_12" or
!!        [item_code] eq "I.PR_4" 
!!      ) and (
!!        [I.PC_1chosen] ne "" and 
!!        [I.PC_2chosen] ne "" and 
!!        [I.PC_3chosen] ne "" and 
!!        [I.PR_1chosen] ne "" and
!!        [I.PC_4chosen] ne "" and 
!!        [I.PC_5chosen] ne "" and 
!!        [I.PC_6chosen] ne "" and 
!!        [I.PR_2chosen] ne "" and
!!        [I.PC_7chosen] ne "" and 
!!        [I.PC_8chosen] ne "" and 
!!        [I.PC_9chosen] ne "" and 
!!        [I.PR_3chosen] ne "" and
!!        [I.PC_10chosen] ne "" and 
!!        [I.PC_11chosen] ne "" and 
!!        [I.PC_12chosen] ne "" and 
!!        [I.PR_4chosen] ne "" 
!!      )
!append-file-name = "~jkkteach/www/consumer_learning/exp02/data/exp02subj[subj_number].dat"
[!TIME] test_phase_instructions 
###
*append-response*
!use-if (
!!          [item_code] eq "Itest_1" or
!!          [item_code] eq "Itest_2" or
!!          [item_code] eq "Itest_3" or
!!          [item_code] eq "Itest_4" or
!!          [item_code] eq "PC.PRtest_1" or
!!          [item_code] eq "PC.PRtest_2" or
!!          [item_code] eq "PC.PRtest_3" or
!!          [item_code] eq "PC.PRtest_4" or
!!          [item_code] eq "I.PCtest_1" or
!!          [item_code] eq "I.PCtest_2" or
!!          [item_code] eq "I.PCtest_3" or
!!          [item_code] eq "I.PCtest_4" or
!!          [item_code] eq "I.PRtest_1" or
!!          [item_code] eq "I.PRtest_2" or
!!          [item_code] eq "I.PRtest_3" or
!!          [item_code] eq "I.PRtest_4" 
!!      ) and (
!!        [I.PCtest_1chosen]  eq "" or
!!        [I.PRtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PC.PRtest_1chosen] eq "" or
!!        [I.PCtest_2chosen]  eq "" or
!!        [I.PRtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PC.PRtest_2chosen] eq "" or
!!        [I.PCtest_3chosen]  eq "" or
!!        [I.PRtest_3chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PC.PRtest_3chosen] eq "" or
!!        [I.PCtest_4chosen]  eq "" or
!!        [I.PRtest_4chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PC.PRtest_4chosen] eq "" 
!!      )
!append-file-name = "~jkkteach/www/consumer_learning/exp02/data/exp02subj[subj_number].dat"
[test_response] [!TIME] [item_code]
###
*append-response*
!use-if (
!!          [item_code] eq "Itest_1" or
!!          [item_code] eq "Itest_2" or
!!          [item_code] eq "Itest_3" or
!!          [item_code] eq "Itest_4" or
!!          [item_code] eq "PC.PRtest_1" or
!!          [item_code] eq "PC.PRtest_2" or
!!          [item_code] eq "PC.PRtest_3" or
!!          [item_code] eq "PC.PRtest_4" or
!!          [item_code] eq "I.PCtest_1" or
!!          [item_code] eq "I.PCtest_2" or
!!          [item_code] eq "I.PCtest_3" or
!!          [item_code] eq "I.PCtest_4" or
!!          [item_code] eq "I.PRtest_1" or
!!          [item_code] eq "I.PRtest_2" or
!!          [item_code] eq "I.PRtest_3" or
!!          [item_code] eq "I.PRtest_4" 
!!        ) and ( not (
!!        [I.PCtest_1chosen]  eq "" or
!!        [I.PRtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PC.PRtest_1chosen] eq "" or
!!        [I.PCtest_2chosen]  eq "" or
!!        [I.PRtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PC.PRtest_2chosen] eq "" or
!!        [I.PCtest_3chosen]  eq "" or
!!        [I.PRtest_3chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PC.PRtest_3chosen] eq "" or
!!        [I.PCtest_4chosen]  eq "" or
!!        [I.PRtest_4chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PC.PRtest_4chosen] eq "" 
!!        ) )
!append-file-name = "~jkkteach/www/consumer_learning/exp02/data/exp02subj[subj_number].dat"
[test_response] [!TIME] farewell
### end append-response section
############################## SUCCESS-RESPONSE SECTION #################
*success-response*
<html>
<head><title>Adventures in whitewater rafting</title></head>
<body bgcolor="#FFFFFF">
<FORM METHOD="POST"
ACTION="transform.cgi?jkkteach/www/consumer_learning/exp02/train_items.tpl">
###
!print-if [item_code] eq "I.PC_1"
!!        and (
!!        [I.PC_1chosen] eq "" or 
!!        [I.PC_2chosen] eq "" or 
!!        [I.PC_3chosen] eq "" or 
!!        [I.PR_1chosen] eq "" or
!!        [I.PC_4chosen] eq "" or 
!!        [I.PC_5chosen] eq "" or 
!!        [I.PC_6chosen] eq "" or 
!!        [I.PR_2chosen] eq "" or
!!        [I.PC_7chosen] eq "" or 
!!        [I.PC_8chosen] eq "" or 
!!        [I.PC_9chosen] eq "" or 
!!        [I.PR_3chosen] eq "" or
!!        [I.PC_10chosen] eq "" or 
!!        [I.PC_11chosen] eq "" or 
!!        [I.PC_12chosen] eq "" or 
!!        [I.PR_4chosen] eq "" )
<input type="hidden" name="I.PC_1chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/I.PC_1.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/training_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "I.PC_2"
!!        and (
!!        [I.PC_1chosen] eq "" or 
!!        [I.PC_2chosen] eq "" or 
!!        [I.PC_3chosen] eq "" or 
!!        [I.PR_1chosen] eq "" or
!!        [I.PC_4chosen] eq "" or 
!!        [I.PC_5chosen] eq "" or 
!!        [I.PC_6chosen] eq "" or 
!!        [I.PR_2chosen] eq "" or
!!        [I.PC_7chosen] eq "" or 
!!        [I.PC_8chosen] eq "" or 
!!        [I.PC_9chosen] eq "" or 
!!        [I.PR_3chosen] eq "" or
!!        [I.PC_10chosen] eq "" or 
!!        [I.PC_11chosen] eq "" or 
!!        [I.PC_12chosen] eq "" or 
!!        [I.PR_4chosen] eq "" )
<input type="hidden" name="I.PC_2chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/I.PC_2.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/training_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "I.PC_3"
!!        and (
!!        [I.PC_1chosen] eq "" or 
!!        [I.PC_2chosen] eq "" or 
!!        [I.PC_3chosen] eq "" or 
!!        [I.PR_1chosen] eq "" or
!!        [I.PC_4chosen] eq "" or 
!!        [I.PC_5chosen] eq "" or 
!!        [I.PC_6chosen] eq "" or 
!!        [I.PR_2chosen] eq "" or
!!        [I.PC_7chosen] eq "" or 
!!        [I.PC_8chosen] eq "" or 
!!        [I.PC_9chosen] eq "" or 
!!        [I.PR_3chosen] eq "" or
!!        [I.PC_10chosen] eq "" or 
!!        [I.PC_11chosen] eq "" or 
!!        [I.PC_12chosen] eq "" or 
!!        [I.PR_4chosen] eq "" )
<input type="hidden" name="I.PC_3chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/I.PC_3.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/training_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "I.PC_4"
!!        and (
!!        [I.PC_1chosen] eq "" or 
!!        [I.PC_2chosen] eq "" or 
!!        [I.PC_3chosen] eq "" or 
!!        [I.PR_1chosen] eq "" or
!!        [I.PC_4chosen] eq "" or 
!!        [I.PC_5chosen] eq "" or 
!!        [I.PC_6chosen] eq "" or 
!!        [I.PR_2chosen] eq "" or
!!        [I.PC_7chosen] eq "" or 
!!        [I.PC_8chosen] eq "" or 
!!        [I.PC_9chosen] eq "" or 
!!        [I.PR_3chosen] eq "" or
!!        [I.PC_10chosen] eq "" or 
!!        [I.PC_11chosen] eq "" or 
!!        [I.PC_12chosen] eq "" or 
!!        [I.PR_4chosen] eq "" )
<input type="hidden" name="I.PC_4chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/I.PC_4.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/training_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "I.PC_5"
!!        and (
!!        [I.PC_1chosen] eq "" or 
!!        [I.PC_2chosen] eq "" or 
!!        [I.PC_3chosen] eq "" or 
!!        [I.PR_1chosen] eq "" or
!!        [I.PC_4chosen] eq "" or 
!!        [I.PC_5chosen] eq "" or 
!!        [I.PC_6chosen] eq "" or 
!!        [I.PR_2chosen] eq "" or
!!        [I.PC_7chosen] eq "" or 
!!        [I.PC_8chosen] eq "" or 
!!        [I.PC_9chosen] eq "" or 
!!        [I.PR_3chosen] eq "" or
!!        [I.PC_10chosen] eq "" or 
!!        [I.PC_11chosen] eq "" or 
!!        [I.PC_12chosen] eq "" or 
!!        [I.PR_4chosen] eq "" )
<input type="hidden" name="I.PC_5chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/I.PC_5.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/training_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "I.PC_6"
!!        and (
!!        [I.PC_1chosen] eq "" or 
!!        [I.PC_2chosen] eq "" or 
!!        [I.PC_3chosen] eq "" or 
!!        [I.PR_1chosen] eq "" or
!!        [I.PC_4chosen] eq "" or 
!!        [I.PC_5chosen] eq "" or 
!!        [I.PC_6chosen] eq "" or 
!!        [I.PR_2chosen] eq "" or
!!        [I.PC_7chosen] eq "" or 
!!        [I.PC_8chosen] eq "" or 
!!        [I.PC_9chosen] eq "" or 
!!        [I.PR_3chosen] eq "" or
!!        [I.PC_10chosen] eq "" or 
!!        [I.PC_11chosen] eq "" or 
!!        [I.PC_12chosen] eq "" or 
!!        [I.PR_4chosen] eq "" )
<input type="hidden" name="I.PC_6chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/I.PC_6.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/training_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "I.PC_7"
!!        and (
!!        [I.PC_1chosen] eq "" or 
!!        [I.PC_2chosen] eq "" or 
!!        [I.PC_3chosen] eq "" or 
!!        [I.PR_1chosen] eq "" or
!!        [I.PC_4chosen] eq "" or 
!!        [I.PC_5chosen] eq "" or 
!!        [I.PC_6chosen] eq "" or 
!!        [I.PR_2chosen] eq "" or
!!        [I.PC_7chosen] eq "" or 
!!        [I.PC_8chosen] eq "" or 
!!        [I.PC_9chosen] eq "" or 
!!        [I.PR_3chosen] eq "" or
!!        [I.PC_10chosen] eq "" or 
!!        [I.PC_11chosen] eq "" or 
!!        [I.PC_12chosen] eq "" or 
!!        [I.PR_4chosen] eq "" )
<input type="hidden" name="I.PC_7chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/I.PC_7.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/training_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "I.PC_8"
!!        and (
!!        [I.PC_1chosen] eq "" or 
!!        [I.PC_2chosen] eq "" or 
!!        [I.PC_3chosen] eq "" or 
!!        [I.PR_1chosen] eq "" or
!!        [I.PC_4chosen] eq "" or 
!!        [I.PC_5chosen] eq "" or 
!!        [I.PC_6chosen] eq "" or 
!!        [I.PR_2chosen] eq "" or
!!        [I.PC_7chosen] eq "" or 
!!        [I.PC_8chosen] eq "" or 
!!        [I.PC_9chosen] eq "" or 
!!        [I.PR_3chosen] eq "" or
!!        [I.PC_10chosen] eq "" or 
!!        [I.PC_11chosen] eq "" or 
!!        [I.PC_12chosen] eq "" or 
!!        [I.PR_4chosen] eq "" )
<input type="hidden" name="I.PC_8chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/I.PC_8.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/training_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "I.PC_9"
!!        and (
!!        [I.PC_1chosen] eq "" or 
!!        [I.PC_2chosen] eq "" or 
!!        [I.PC_3chosen] eq "" or 
!!        [I.PR_1chosen] eq "" or
!!        [I.PC_4chosen] eq "" or 
!!        [I.PC_5chosen] eq "" or 
!!        [I.PC_6chosen] eq "" or 
!!        [I.PR_2chosen] eq "" or
!!        [I.PC_7chosen] eq "" or 
!!        [I.PC_8chosen] eq "" or 
!!        [I.PC_9chosen] eq "" or 
!!        [I.PR_3chosen] eq "" or
!!        [I.PC_10chosen] eq "" or 
!!        [I.PC_11chosen] eq "" or 
!!        [I.PC_12chosen] eq "" or 
!!        [I.PR_4chosen] eq "" )
<input type="hidden" name="I.PC_9chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/I.PC_9.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/training_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "I.PC_10"
!!        and (
!!        [I.PC_1chosen] eq "" or 
!!        [I.PC_2chosen] eq "" or 
!!        [I.PC_3chosen] eq "" or 
!!        [I.PR_1chosen] eq "" or
!!        [I.PC_4chosen] eq "" or 
!!        [I.PC_5chosen] eq "" or 
!!        [I.PC_6chosen] eq "" or 
!!        [I.PR_2chosen] eq "" or
!!        [I.PC_7chosen] eq "" or 
!!        [I.PC_8chosen] eq "" or 
!!        [I.PC_9chosen] eq "" or 
!!        [I.PR_3chosen] eq "" or
!!        [I.PC_10chosen] eq "" or 
!!        [I.PC_11chosen] eq "" or 
!!        [I.PC_12chosen] eq "" or 
!!        [I.PR_4chosen] eq "" )
<input type="hidden" name="I.PC_10chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/I.PC_10.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/training_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "I.PC_11"
!!        and (
!!        [I.PC_1chosen] eq "" or 
!!        [I.PC_2chosen] eq "" or 
!!        [I.PC_3chosen] eq "" or 
!!        [I.PR_1chosen] eq "" or
!!        [I.PC_4chosen] eq "" or 
!!        [I.PC_5chosen] eq "" or 
!!        [I.PC_6chosen] eq "" or 
!!        [I.PR_2chosen] eq "" or
!!        [I.PC_7chosen] eq "" or 
!!        [I.PC_8chosen] eq "" or 
!!        [I.PC_9chosen] eq "" or 
!!        [I.PR_3chosen] eq "" or
!!        [I.PC_10chosen] eq "" or 
!!        [I.PC_11chosen] eq "" or 
!!        [I.PC_12chosen] eq "" or 
!!        [I.PR_4chosen] eq "" )
<input type="hidden" name="I.PC_11chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/I.PC_11.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/training_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "I.PC_12"
!!        and (
!!        [I.PC_1chosen] eq "" or 
!!        [I.PC_2chosen] eq "" or 
!!        [I.PC_3chosen] eq "" or 
!!        [I.PR_1chosen] eq "" or
!!        [I.PC_4chosen] eq "" or 
!!        [I.PC_5chosen] eq "" or 
!!        [I.PC_6chosen] eq "" or 
!!        [I.PR_2chosen] eq "" or
!!        [I.PC_7chosen] eq "" or 
!!        [I.PC_8chosen] eq "" or 
!!        [I.PC_9chosen] eq "" or 
!!        [I.PR_3chosen] eq "" or
!!        [I.PC_10chosen] eq "" or 
!!        [I.PC_11chosen] eq "" or 
!!        [I.PC_12chosen] eq "" or 
!!        [I.PR_4chosen] eq "" )
<input type="hidden" name="I.PC_12chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/I.PC_12.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/training_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "I.PR_1"
!!        and (
!!        [I.PC_1chosen] eq "" or 
!!        [I.PC_2chosen] eq "" or 
!!        [I.PC_3chosen] eq "" or 
!!        [I.PR_1chosen] eq "" or
!!        [I.PC_4chosen] eq "" or 
!!        [I.PC_5chosen] eq "" or 
!!        [I.PC_6chosen] eq "" or 
!!        [I.PR_2chosen] eq "" or
!!        [I.PC_7chosen] eq "" or 
!!        [I.PC_8chosen] eq "" or 
!!        [I.PC_9chosen] eq "" or 
!!        [I.PR_3chosen] eq "" or
!!        [I.PC_10chosen] eq "" or 
!!        [I.PC_11chosen] eq "" or 
!!        [I.PC_12chosen] eq "" or 
!!        [I.PR_4chosen] eq "" )
<input type="hidden" name="I.PR_1chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/I.PR_1.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/training_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "I.PR_2"
!!        and (
!!        [I.PC_1chosen] eq "" or 
!!        [I.PC_2chosen] eq "" or 
!!        [I.PC_3chosen] eq "" or 
!!        [I.PR_1chosen] eq "" or
!!        [I.PC_4chosen] eq "" or 
!!        [I.PC_5chosen] eq "" or 
!!        [I.PC_6chosen] eq "" or 
!!        [I.PR_2chosen] eq "" or
!!        [I.PC_7chosen] eq "" or 
!!        [I.PC_8chosen] eq "" or 
!!        [I.PC_9chosen] eq "" or 
!!        [I.PR_3chosen] eq "" or
!!        [I.PC_10chosen] eq "" or 
!!        [I.PC_11chosen] eq "" or 
!!        [I.PC_12chosen] eq "" or 
!!        [I.PR_4chosen] eq "" )
<input type="hidden" name="I.PR_2chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/I.PR_2.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/training_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "I.PR_3"
!!        and (
!!        [I.PC_1chosen] eq "" or 
!!        [I.PC_2chosen] eq "" or 
!!        [I.PC_3chosen] eq "" or 
!!        [I.PR_1chosen] eq "" or
!!        [I.PC_4chosen] eq "" or 
!!        [I.PC_5chosen] eq "" or 
!!        [I.PC_6chosen] eq "" or 
!!        [I.PR_2chosen] eq "" or
!!        [I.PC_7chosen] eq "" or 
!!        [I.PC_8chosen] eq "" or 
!!        [I.PC_9chosen] eq "" or 
!!        [I.PR_3chosen] eq "" or
!!        [I.PC_10chosen] eq "" or 
!!        [I.PC_11chosen] eq "" or 
!!        [I.PC_12chosen] eq "" or 
!!        [I.PR_4chosen] eq "" )
<input type="hidden" name="I.PR_3chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/I.PR_3.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/training_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "I.PR_4"
!!        and (
!!        [I.PC_1chosen] eq "" or 
!!        [I.PC_2chosen] eq "" or 
!!        [I.PC_3chosen] eq "" or 
!!        [I.PR_1chosen] eq "" or
!!        [I.PC_4chosen] eq "" or 
!!        [I.PC_5chosen] eq "" or 
!!        [I.PC_6chosen] eq "" or 
!!        [I.PR_2chosen] eq "" or
!!        [I.PC_7chosen] eq "" or 
!!        [I.PC_8chosen] eq "" or 
!!        [I.PC_9chosen] eq "" or 
!!        [I.PR_3chosen] eq "" or
!!        [I.PC_10chosen] eq "" or 
!!        [I.PC_11chosen] eq "" or 
!!        [I.PC_12chosen] eq "" or 
!!        [I.PR_4chosen] eq "" )
<input type="hidden" name="I.PR_4chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/I.PR_4.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/training_choice_list.incl"
!end-print-if
###
!print-if (
!!          [item_code] eq "I.PC_1" or
!!          [item_code] eq "I.PC_2" or
!!          [item_code] eq "I.PC_3" or
!!          [item_code] eq "I.PR_1" or
!!          [item_code] eq "I.PC_5" or
!!          [item_code] eq "I.PC_6" or
!!          [item_code] eq "I.PR_2" or
!!          [item_code] eq "I.PC_7" or
!!          [item_code] eq "I.PC_8" or
!!          [item_code] eq "I.PC_9" or
!!          [item_code] eq "I.PR_3" or
!!          [item_code] eq "I.PC_10" or
!!          [item_code] eq "I.PC_11" or
!!          [item_code] eq "I.PC_12" or
!!          [item_code] eq "I.PR_4"
!!        ) and (
!!          [I.PC_1chosen] ne "" and 
!!          [I.PC_2chosen] ne "" and 
!!          [I.PC_3chosen] ne "" and 
!!          [I.PR_1chosen] ne "" and 
!!          [I.PC_4chosen] ne "" and 
!!          [I.PC_5chosen] ne "" and 
!!          [I.PC_6chosen] ne "" and 
!!          [I.PR_2chosen] ne "" and 
!!          [I.PC_7chosen] ne "" and 
!!          [I.PC_8chosen] ne "" and 
!!          [I.PC_9chosen] ne "" and 
!!          [I.PR_3chosen] ne "" and 
!!          [I.PC_10chosen] ne "" and 
!!          [I.PC_11chosen] ne "" and 
!!          [I.PC_12chosen] ne "" and 
!!          [I.PR_4chosen] ne "" 
!!        )
Although you selected another item to look at, 
you have now looked at all the items at least once.
Therefore we'd like you to take a consumer survey instead.
You'll again see more items similar to those you've seen before,
but now you'll be asked a question about each item.
<input type="hidden" name="test_response" value="(test_instruction_resp)">
!print-file = "~jkkteach/www/consumer_learning/exp02/test_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "Itest_1"
!!        and (
!!        [I.PCtest_1chosen]  eq "" or
!!        [I.PRtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PC.PRtest_1chosen] eq "" or
!!        [I.PCtest_2chosen]  eq "" or
!!        [I.PRtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PC.PRtest_2chosen] eq "" or
!!        [I.PCtest_3chosen]  eq "" or
!!        [I.PRtest_3chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PC.PRtest_3chosen] eq "" or
!!        [I.PCtest_4chosen]  eq "" or
!!        [I.PRtest_4chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PC.PRtest_4chosen] eq "" 
!! )
<input type="hidden" name="Itest_1chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/Itest_1.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_resp.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "PC.PRtest_1"
!!        and (
!!        [I.PCtest_1chosen]  eq "" or
!!        [I.PRtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PC.PRtest_1chosen] eq "" or
!!        [I.PCtest_2chosen]  eq "" or
!!        [I.PRtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PC.PRtest_2chosen] eq "" or
!!        [I.PCtest_3chosen]  eq "" or
!!        [I.PRtest_3chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PC.PRtest_3chosen] eq "" or
!!        [I.PCtest_4chosen]  eq "" or
!!        [I.PRtest_4chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PC.PRtest_4chosen] eq "" 
!! )
<input type="hidden" name="PC.PRtest_1chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/PC.PRtest_1.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_resp.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "I.PCtest_1"
!!        and (
!!        [I.PCtest_1chosen]  eq "" or
!!        [I.PRtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PC.PRtest_1chosen] eq "" or
!!        [I.PCtest_2chosen]  eq "" or
!!        [I.PRtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PC.PRtest_2chosen] eq "" or
!!        [I.PCtest_3chosen]  eq "" or
!!        [I.PRtest_3chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PC.PRtest_3chosen] eq "" or
!!        [I.PCtest_4chosen]  eq "" or
!!        [I.PRtest_4chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PC.PRtest_4chosen] eq "" 
!! )
<input type="hidden" name="I.PCtest_1chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/I.PCtest_1.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_resp.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "I.PRtest_1"
!!        and (
!!        [I.PCtest_1chosen]  eq "" or
!!        [I.PRtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PC.PRtest_1chosen] eq "" or
!!        [I.PCtest_2chosen]  eq "" or
!!        [I.PRtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PC.PRtest_2chosen] eq "" or
!!        [I.PCtest_3chosen]  eq "" or
!!        [I.PRtest_3chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PC.PRtest_3chosen] eq "" or
!!        [I.PCtest_4chosen]  eq "" or
!!        [I.PRtest_4chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PC.PRtest_4chosen] eq "" 
!! )
<input type="hidden" name="I.PRtest_1chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/I.PRtest_1.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_resp.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "Itest_2"
!!        and (
!!        [I.PCtest_1chosen]  eq "" or
!!        [I.PRtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PC.PRtest_1chosen] eq "" or
!!        [I.PCtest_2chosen]  eq "" or
!!        [I.PRtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PC.PRtest_2chosen] eq "" or
!!        [I.PCtest_3chosen]  eq "" or
!!        [I.PRtest_3chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PC.PRtest_3chosen] eq "" or
!!        [I.PCtest_4chosen]  eq "" or
!!        [I.PRtest_4chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PC.PRtest_4chosen] eq "" 
!! )
<input type="hidden" name="Itest_2chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/Itest_2.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_resp.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "PC.PRtest_2"
!!        and (
!!        [I.PCtest_1chosen]  eq "" or
!!        [I.PRtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PC.PRtest_1chosen] eq "" or
!!        [I.PCtest_2chosen]  eq "" or
!!        [I.PRtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PC.PRtest_2chosen] eq "" or
!!        [I.PCtest_3chosen]  eq "" or
!!        [I.PRtest_3chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PC.PRtest_3chosen] eq "" or
!!        [I.PCtest_4chosen]  eq "" or
!!        [I.PRtest_4chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PC.PRtest_4chosen] eq "" 
!! )
<input type="hidden" name="PC.PRtest_2chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/PC.PRtest_2.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_resp.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "I.PCtest_2"
!!        and (
!!        [I.PCtest_1chosen]  eq "" or
!!        [I.PRtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PC.PRtest_1chosen] eq "" or
!!        [I.PCtest_2chosen]  eq "" or
!!        [I.PRtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PC.PRtest_2chosen] eq "" or
!!        [I.PCtest_3chosen]  eq "" or
!!        [I.PRtest_3chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PC.PRtest_3chosen] eq "" or
!!        [I.PCtest_4chosen]  eq "" or
!!        [I.PRtest_4chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PC.PRtest_4chosen] eq "" 
!! )
<input type="hidden" name="I.PCtest_2chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/I.PCtest_2.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_resp.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "I.PRtest_2"
!!        and (
!!        [I.PCtest_1chosen]  eq "" or
!!        [I.PRtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PC.PRtest_1chosen] eq "" or
!!        [I.PCtest_2chosen]  eq "" or
!!        [I.PRtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PC.PRtest_2chosen] eq "" or
!!        [I.PCtest_3chosen]  eq "" or
!!        [I.PRtest_3chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PC.PRtest_3chosen] eq "" or
!!        [I.PCtest_4chosen]  eq "" or
!!        [I.PRtest_4chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PC.PRtest_4chosen] eq "" 
!! )
<input type="hidden" name="I.PRtest_2chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/I.PRtest_2.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_resp.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "Itest_3"
!!        and (
!!        [I.PCtest_1chosen]  eq "" or
!!        [I.PRtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PC.PRtest_1chosen] eq "" or
!!        [I.PCtest_2chosen]  eq "" or
!!        [I.PRtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PC.PRtest_2chosen] eq "" or
!!        [I.PCtest_3chosen]  eq "" or
!!        [I.PRtest_3chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PC.PRtest_3chosen] eq "" or
!!        [I.PCtest_4chosen]  eq "" or
!!        [I.PRtest_4chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PC.PRtest_4chosen] eq "" 
!! )
<input type="hidden" name="Itest_3chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/Itest_3.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_resp.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "PC.PRtest_3"
!!        and (
!!        [I.PCtest_1chosen]  eq "" or
!!        [I.PRtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PC.PRtest_1chosen] eq "" or
!!        [I.PCtest_2chosen]  eq "" or
!!        [I.PRtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PC.PRtest_2chosen] eq "" or
!!        [I.PCtest_3chosen]  eq "" or
!!        [I.PRtest_3chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PC.PRtest_3chosen] eq "" or
!!        [I.PCtest_4chosen]  eq "" or
!!        [I.PRtest_4chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PC.PRtest_4chosen] eq "" 
!! )
<input type="hidden" name="PC.PRtest_3chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/PC.PRtest_3.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_resp.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "I.PCtest_3"
!!        and (
!!        [I.PCtest_1chosen]  eq "" or
!!        [I.PRtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PC.PRtest_1chosen] eq "" or
!!        [I.PCtest_2chosen]  eq "" or
!!        [I.PRtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PC.PRtest_2chosen] eq "" or
!!        [I.PCtest_3chosen]  eq "" or
!!        [I.PRtest_3chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PC.PRtest_3chosen] eq "" or
!!        [I.PCtest_4chosen]  eq "" or
!!        [I.PRtest_4chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PC.PRtest_4chosen] eq "" 
!! )
<input type="hidden" name="I.PCtest_3chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/I.PCtest_3.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_resp.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "I.PRtest_3"
!!        and (
!!        [I.PCtest_1chosen]  eq "" or
!!        [I.PRtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PC.PRtest_1chosen] eq "" or
!!        [I.PCtest_2chosen]  eq "" or
!!        [I.PRtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PC.PRtest_2chosen] eq "" or
!!        [I.PCtest_3chosen]  eq "" or
!!        [I.PRtest_3chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PC.PRtest_3chosen] eq "" or
!!        [I.PCtest_4chosen]  eq "" or
!!        [I.PRtest_4chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PC.PRtest_4chosen] eq "" 
!! )
<input type="hidden" name="I.PRtest_3chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/I.PRtest_3.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_resp.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "Itest_4"
!!        and (
!!        [I.PCtest_1chosen]  eq "" or
!!        [I.PRtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PC.PRtest_1chosen] eq "" or
!!        [I.PCtest_2chosen]  eq "" or
!!        [I.PRtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PC.PRtest_2chosen] eq "" or
!!        [I.PCtest_3chosen]  eq "" or
!!        [I.PRtest_3chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PC.PRtest_3chosen] eq "" or
!!        [I.PCtest_4chosen]  eq "" or
!!        [I.PRtest_4chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PC.PRtest_4chosen] eq "" 
!! )
<input type="hidden" name="Itest_4chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/Itest_4.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_resp.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "PC.PRtest_4"
!!        and (
!!        [I.PCtest_1chosen]  eq "" or
!!        [I.PRtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PC.PRtest_1chosen] eq "" or
!!        [I.PCtest_2chosen]  eq "" or
!!        [I.PRtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PC.PRtest_2chosen] eq "" or
!!        [I.PCtest_3chosen]  eq "" or
!!        [I.PRtest_3chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PC.PRtest_3chosen] eq "" or
!!        [I.PCtest_4chosen]  eq "" or
!!        [I.PRtest_4chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PC.PRtest_4chosen] eq "" 
!! )
<input type="hidden" name="PC.PRtest_4chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/PC.PRtest_4.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_resp.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "I.PCtest_4"
!!        and (
!!        [I.PCtest_1chosen]  eq "" or
!!        [I.PRtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PC.PRtest_1chosen] eq "" or
!!        [I.PCtest_2chosen]  eq "" or
!!        [I.PRtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PC.PRtest_2chosen] eq "" or
!!        [I.PCtest_3chosen]  eq "" or
!!        [I.PRtest_3chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PC.PRtest_3chosen] eq "" or
!!        [I.PCtest_4chosen]  eq "" or
!!        [I.PRtest_4chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PC.PRtest_4chosen] eq "" 
!! )
<input type="hidden" name="I.PCtest_4chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/I.PCtest_4.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_resp.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_choice_list.incl"
!end-print-if
###
!print-if [item_code] eq "I.PRtest_4"
!!        and (
!!        [I.PCtest_1chosen]  eq "" or
!!        [I.PRtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PC.PRtest_1chosen] eq "" or
!!        [I.PCtest_2chosen]  eq "" or
!!        [I.PRtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PC.PRtest_2chosen] eq "" or
!!        [I.PCtest_3chosen]  eq "" or
!!        [I.PRtest_3chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PC.PRtest_3chosen] eq "" or
!!        [I.PCtest_4chosen]  eq "" or
!!        [I.PRtest_4chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PC.PRtest_4chosen] eq "" 
!! )
<input type="hidden" name="I.PRtest_4chosen" value="yes">
!print-file = "~jkkteach/www/consumer_learning/exp02/I.PRtest_4.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_resp.incl"
!print-file = "~jkkteach/www/consumer_learning/exp02/test_choice_list.incl"
!end-print-if
###
!print-if  NOT (
!!        [I.PCtest_1chosen]  eq "" or
!!        [I.PRtest_1chosen]  eq "" or
!!        [Itest_1chosen]     eq "" or 
!!        [PC.PRtest_1chosen] eq "" or
!!        [I.PCtest_2chosen]  eq "" or
!!        [I.PRtest_2chosen]  eq "" or
!!        [Itest_2chosen]     eq "" or 
!!        [PC.PRtest_2chosen] eq "" or
!!        [I.PCtest_3chosen]  eq "" or
!!        [I.PRtest_3chosen]  eq "" or
!!        [Itest_3chosen]     eq "" or 
!!        [PC.PRtest_3chosen] eq "" or
!!        [I.PCtest_4chosen]  eq "" or
!!        [I.PRtest_4chosen]  eq "" or
!!        [Itest_4chosen]     eq "" or 
!!        [PC.PRtest_4chosen] eq "" 
!!        )
Although you selected another item to look at, 
you have now looked at all the survey items at least once.
Therefore you are done with the experiment! Thank you!
!end-print-if
###
!carry-forward [subj_number]
!carry-forward [I.PC_1chosen] [I.PC_2chosen] [I.PC_3chosen] [I.PR_1chosen]
!carry-forward [I.PC_4chosen] [I.PC_5chosen] [I.PC_6chosen] [I.PR_2chosen]
!carry-forward [I.PC_7chosen] [I.PC_8chosen] [I.PC_9chosen] [I.PR_3chosen]
!carry-forward [I.PC_10chosen] [I.PC_11chosen] [I.PC_12chosen] [I.PR_4chosen]
!carry-forward [Itest_1chosen] [PC.PRtest_1chosen] [I.PCtest_1chosen] [I.PRtest_1chosen]
!carry-forward [Itest_2chosen] [PC.PRtest_2chosen] [I.PCtest_2chosen] [I.PRtest_2chosen]
!carry-forward [Itest_3chosen] [PC.PRtest_3chosen] [I.PCtest_3chosen] [I.PRtest_3chosen]
!carry-forward [Itest_4chosen] [PC.PRtest_4chosen] [I.PCtest_4chosen] [I.PRtest_4chosen]
</FORM>
</body>
</html>
# end of success-response section


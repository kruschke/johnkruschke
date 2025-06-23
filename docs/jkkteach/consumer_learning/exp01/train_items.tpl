############################## DEFINE-VARIABLES SECTION #################
*define-variables*
!show-sig = no
!force-error-if (
!!          [item_code] eq ""
!!        )
!force-error-if (
!!          [item_code] eq "I" or
!!          [item_code] eq "PC.PR"
!!        ) and (
!!          [test_response] eq ""
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
!!          [item_code] eq "I" or
!!          [item_code] eq "PC.PR"
!!        ) and (
!!          [test_response] eq ""
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
!!        [item_code] eq "I.PR_1" 
!!      ) and (
!!        [I.PC_1chosen] eq "" or 
!!        [I.PC_2chosen] eq "" or 
!!        [I.PC_3chosen] eq "" or 
!!        [I.PR_1chosen] eq ""
!!      )
!append-file-name = "~jkkteach/www/consumer_learning/exp01/data/exp01subj[subj_number].dat"
[!TIME] [item_code] 
###
*append-response*
!use-if (
!!          [item_code] eq "I.PC_1" or
!!          [item_code] eq "I.PC_2" or
!!          [item_code] eq "I.PC_3" or
!!          [item_code] eq "I.PR_1" 
!!        ) and (
!!          [I.PC_1chosen] ne "" and 
!!          [I.PC_2chosen] ne "" and 
!!          [I.PC_3chosen] ne "" and 
!!          [I.PR_1chosen] ne "" 
!!        )
!append-file-name = "~jkkteach/www/consumer_learning/exp01/data/exp01subj[subj_number].dat"
[!TIME] test_phase_instructions 
###
*append-response*
!use-if (
!!        [item_code] eq "I" or
!!        [item_code] eq "PC.PR"
!!      ) and (
!!        [Ichosen]     eq "" or 
!!        [PC.PRchosen] eq ""
!!      )
!append-file-name = "~jkkteach/www/consumer_learning/exp01/data/exp01subj[subj_number].dat"
[test_response] [!TIME] [item_code]
###
*append-response*
!use-if (
!!          [item_code] eq "I" or
!!          [item_code] eq "PC.PR"
!!        ) and (
!!          [Ichosen]     ne "" and 
!!          [PC.PRchosen] ne ""
!!        )
!append-file-name = "~jkkteach/www/consumer_learning/exp01/data/exp01subj[subj_number].dat"
[test_response] [!TIME] farewell
### end append-response section
############################## SUCCESS-RESPONSE SECTION #################
*success-response*
<html>
<head><title>Adventures in whitewater rafting</title></head>
<body bgcolor="#FFFFFF">
<FORM METHOD="POST"
ACTION="transform.cgi?jkkteach/www/consumer_learning/exp01/train_items.tpl">
###
!print-if [item_code] eq "I.PC_1"
!!        and (
!!        [I.PC_1chosen] eq "" or 
!!        [I.PC_2chosen] eq "" or 
!!        [I.PC_3chosen] eq "" or 
!!        [I.PR_1chosen] eq "" )
<input type="hidden" name="I.PC_1chosen" value="yes">
!include = "~jkkteach/www/consumer_learning/exp01/I.PC_1.include"
!include = "~jkkteach/www/consumer_learning/exp01/training_choice_list.include"
!end-print-if
###
!print-if [item_code] eq "I.PC_2"
!!        and (
!!        [I.PC_1chosen] eq "" or 
!!        [I.PC_2chosen] eq "" or 
!!        [I.PC_3chosen] eq "" or 
!!        [I.PR_1chosen] eq "" )
<input type="hidden" name="I.PC_2chosen" value="yes">
!include = "~jkkteach/www/consumer_learning/exp01/I.PC_2.include"
!include = "~jkkteach/www/consumer_learning/exp01/training_choice_list.include"
!end-print-if
###
!print-if [item_code] eq "I.PC_3"
!!        and (
!!        [I.PC_1chosen] eq "" or 
!!        [I.PC_2chosen] eq "" or 
!!        [I.PC_3chosen] eq "" or 
!!        [I.PR_1chosen] eq "" )
<input type="hidden" name="I.PC_3chosen" value="yes">
!include = "~jkkteach/www/consumer_learning/exp01/I.PC_3.include"
!include = "~jkkteach/www/consumer_learning/exp01/training_choice_list.include"
!end-print-if
###
!print-if [item_code] eq "I.PR_1"
!!        and (
!!        [I.PC_1chosen] eq "" or 
!!        [I.PC_2chosen] eq "" or 
!!        [I.PC_3chosen] eq "" or 
!!        [I.PR_1chosen] eq "" )
<input type="hidden" name="I.PR_1chosen" value="yes">
!include = "~jkkteach/www/consumer_learning/exp01/I.PR_1.include"
!include = "~jkkteach/www/consumer_learning/exp01/training_choice_list.include"
!end-print-if
###
!print-if (
!!          [item_code] eq "I.PC_1" or
!!          [item_code] eq "I.PC_2" or
!!          [item_code] eq "I.PC_3" or
!!          [item_code] eq "I.PR_1" 
!!        ) and (
!!          [I.PC_1chosen] ne "" and 
!!          [I.PC_2chosen] ne "" and 
!!          [I.PC_3chosen] ne "" and 
!!          [I.PR_1chosen] ne "" 
!!        )
Although you selected another item to look at, 
you have now looked at all the items at least once.
Therefore we'd like you to take a consumer survey instead.
You'll again see more items similar to those you've seen before,
but now you'll be asked a question about each item.
<input type="hidden" name="test_response" value="(test_instruction_resp)">
!include = "~jkkteach/www/consumer_learning/exp01/test_choice_list.include"
!end-print-if
###
!print-if [item_code] eq "I"
!!        and (
!!        [Ichosen] eq "" or 
!!        [PC.PRchosen] eq "" )
<input type="hidden" name="Ichosen" value="yes">
!include = "~jkkteach/www/consumer_learning/exp01/I.include"
!include = "~jkkteach/www/consumer_learning/exp01/test_choice_list.include"
!end-print-if
###
!print-if [item_code] eq "PC.PR"
!!        and (
!!        [Ichosen] eq "" or 
!!        [PC.PRchosen] eq "" )
<input type="hidden" name="PC.PRchosen" value="yes">
!include = "~jkkteach/www/consumer_learning/exp01/PC.PR.include"
!include = "~jkkteach/www/consumer_learning/exp01/test_choice_list.include"
!end-print-if
###
!print-if (
!!          [item_code] eq "I" or
!!          [item_code] eq "PC.PR"
!!        ) and (
!!          [Ichosen] ne "" and 
!!          [PC.PRchosen] ne ""
!!        )
Although you selected another item to look at, 
you have now looked at all the survey items at least once.
Therefore you are done with the experiment! Thank you!
!end-print-if
###
!carry-forward [subj_number]
!carry-forward [I.PC_1chosen] [I.PC_2chosen] [I.PC_3chosen] [I.PR_1chosen]
!carry-forward [Ichosen] [PC.PRchosen]
</FORM>
</body>
</html>
# end of success-response section









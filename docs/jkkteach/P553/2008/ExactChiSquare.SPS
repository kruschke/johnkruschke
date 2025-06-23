/* This is an SPSS program for computing the exact Pearson chi-square */
/* distribution when there are three categories and a sample size of four. */
/* The probability of each category is specified at the beginning of the */
/* program. */
/*  */
/* John Kruschke, December 2003. */

input program .

compute #ncats = 3 . /* There are 3 categorical outcomes. */
compute #pcata = 0.3333333 . /* Hypothesis is equal probability of each category. */
compute #pcatb = 0.3333333 .
compute #pcatc = 1.0 - #pcata - #pcatb .

compute #nitems = 4 .

/* The following nested loops generate all possible samples. */
string item1 item2 item3 item4 (A1) . /* Sample size is 4, hence 4 items. */

loop #item1 = 1 to #ncats .  /* Sample size is 4, hence 4 nested loops. */
	loop #item2 = 1 to #ncats .
		loop #item3 = 1 to #ncats .
			loop #item4 = 1 to #ncats .

				/* Probability of this case is the product of */
				/* the probabilities of each item. We start this */
				/* recursive product at 1.0. */
				compute #pcase = 1.0 . 

				do if (#item1 eq 1) .
					compute item1 = 'a' .
					compute #pcase = #pcase * #pcata .
				else if (#item1 eq 2) .
					compute item1 = 'b' .
					compute #pcase = #pcase * #pcatb .
				else if (#item1 eq 3) .
					compute item1 = 'c' .
					compute #pcase = #pcase * #pcatc .
				end if .

				do if (#item2 eq 1) .
					compute item2 = 'a' .
					compute #pcase = #pcase * #pcata .
				else if (#item2 eq 2) .
					compute item2 = 'b' .
					compute #pcase = #pcase * #pcatb .
				else if (#item2 eq 3) .
					compute item2 = 'c' .
					compute #pcase = #pcase * #pcatc .
				end if .

				do if (#item3 eq 1) .
					compute item3 = 'a' .
					compute #pcase = #pcase * #pcata .
				else if (#item3 eq 2) .
					compute item3 = 'b' .
					compute #pcase = #pcase * #pcatb .
				else if (#item3 eq 3) .
					compute item3 = 'c' .
					compute #pcase = #pcase * #pcatc .
				end if .

				do if (#item4 eq 1) .
					compute item4 = 'a' .
					compute #pcase = #pcase * #pcata .
				else if (#item4 eq 2) .
					compute item4 = 'b' .
					compute #pcase = #pcase * #pcatb .
				else if (#item4 eq 3) .
					compute item4 = 'c' .
					compute #pcase = #pcase * #pcatc .
				end if .

				compute pcase = #pcase .

				/* Now compute the expected frequencies of each outcome. */
				/* This is done here only because the value of the scratch */
				/* variables #pcata, etc., are defined only inside the loops. */
				compute expa = #pcata * #nitems .
				compute expb = #pcatb * #nitems .
				compute expc = #pcatc * #nitems .

				end case .
			end loop .
		end loop .
	end loop .
end loop .

end file .
end input program .
execute .

/* Now count the number of occurrences of each category. */
count
  obsa = item1 item2 item3 item4  ('a')  .
count
  obsb = item1 item2 item3 item4  ('b')  .
count
  obsc = item1 item2 item3 item4  ('c')  .
execute .

/* Now compute the chi-square value of each sample. */
compute chisq = (obsa-expa)**2/expa + (obsb-expb)**2/expb + (obsc-expc)**2/expc .
execute .

/* Just so that visible inspection of the spread sheet makes sense, */
/* sort the cases by the value of chi-square, descending, */
/* and within tied values of chi-square, by the probability of the case, descending . */
sort cases by
  chisq (D) pcase (D) . 

/* For purposes of graphing and summarizing, */
/* round the chi-square value to three decimal places */
/* so that they are reasonably binned together in the graph. */
compute chisq = (rnd(chisq*1000))/1000 .
execute .

formats chisq (F7.3) pcase (F5.3) .

SUMMARIZE
  /TABLES = pcase  BY chisq
  /CELLS=SUM .


/* That's all folks! */ .


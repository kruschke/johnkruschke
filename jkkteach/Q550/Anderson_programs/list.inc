{Lists the stimuli on the screen.  Because this program can be    }
{modified for heteroassociation, both the f (input) and g(output) }
{sets can be shown.                                               }

PROCEDURE List_test_set;
     VAR Nr_of_characters: INTEGER;
         Backward, Forward, Quit: BOOLEAN;
 
     PROCEDURE Write_Message (Biggest: INTEGER);
         VAR Input_char: CHAR;
         BEGIN;
         Save_cursor;
         Bottom_line;
         Backward:= FALSE; Forward:= FALSE; Quit:= FALSE;
         WRITE  ('There are', Biggest:3,
                 ' stimuli to write. B)ack. F)orward. > ');
         READLN (Input_char);
         CASE Input_char OF
              'B','b': Backward:= TRUE;
              'F','f': Forward := TRUE;
              OTHERWISE Quit:= TRUE;
              END; 
         Restore_cursor;
         END;

     PROCEDURE Write_pair (One, Two: CHAR; I: INTEGER);
         VAR J: INTEGER;
             Name_one, Name_two: STRING;
         BEGIN
         CASE One OF 'F','f': Name_one:= F_set [I].Name;
                     'G','g': Name_one:= G_set [I].Name;
                     'T','t': Name_one:= T_set [I].Name;
                     END;

         CASE Two OF 'F','f': Name_two:= F_set [I].Name;
                     'G','g': Name_two:= G_set [I].Name;
                     'T','t': Name_two:= T_set [I].Name;
                     END;
    
         WRITE ('   ',One:1,'[',I:2,']. ');
         FOR J:= 1 TO Nr_of_Characters DO WRITE (Name_one [J]);
         WRITE ('   ',Two:1,'[',I:2,']. ');
         FOR J:= 1 TO Nr_of_Characters DO WRITE (Name_two [J]);
         WRITELN;
         END;

     PROCEDURE List_screen (One, Two: CHAR);
         VAR I, First, Last, Largest, Last_pair: INTEGER;
         BEGIN
         IF Number_present_in_set (One) >= Number_present_in_set (Two)
              THEN Largest:= Number_present_in_set (One) 
              ELSE Largest:= Number_present_in_set (Two);
         First:= 1;
         Last_pair:= Largest;
         IF Last_pair > 16 THEN Last:= 16 ELSE Last:= Last_pair;
         FOR I:= First TO Last DO Write_pair (One, Two, I);
         IF Last_pair > 16 THEN 
           REPEAT Write_message (Largest);
                  IF Forward AND (NOT Quit) THEN 
                             BEGIN 
                             First:= Last + 1;
                             Last:=  Last + 8;     {Write 7 more.}
                             IF Last > Last_pair THEN Last:= Last_pair;
                             FOR I:= First TO Last DO Write_pair (One, Two, I);
                             First:= Last - 15;
                             END;
                  IF Backward AND (NOT Quit) THEN 
                             BEGIN
                             First:= First - 8;
                             IF First < 1 THEN First:= 1;
                             Last:= First + 15;
                             IF Last > Last_pair THEN BEGIN
                                                      Last:= Last_pair;
                                                      First:= Last_pair - 15;
                                                      END;
                             Clear_block;
                             WRITELN;
                             FOR I:= First TO Last DO Write_pair (One, Two, I);
                             END;
                 UNTIL Quit;
         END;

     PROCEDURE Type_list (One, Two: CHAR);  {To be used if do not have VT-100.}
         VAR I, Largest: INTEGER;
         BEGIN
         IF Number_present_in_set (One) >= Number_present_in_set (Two)
              THEN Largest:= Number_present_in_set (One) 
              ELSE Largest:= Number_present_in_set (Two);
         FOR I:= 1 TO Largest DO Write_pair (One, Two, I);
         END;

     BEGIN  {List_test_set.}
     Nr_of_Characters:= Dimensionality DIV 8;
     IF VT100 THEN
        BEGIN
        Scroll_block;     Clear_block;
        WRITELN;
        IF FG_Mode THEN List_screen ('F','G');
        IF NOT FG_mode THEN List_screen ('T','F');
        END;
     IF NOT VT100 THEN
        BEGIN
        IF FG_mode THEN Type_list ('F','G');
        IF NOT FG_mode THEN Type_list ('T','F');
        END;
     END;   {List_test_set.}


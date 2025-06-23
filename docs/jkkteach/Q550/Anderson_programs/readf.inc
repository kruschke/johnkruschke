{Reads stimulus files in from disk.  Both an input (f) and an      }
{output (g) file are read, because some variants of these programs }
{are heteroassociative, and may have different f and g files.      }

PROCEDURE Read_file (Read_which_files: CHAR);
       VAR I, Number_of_items, Number_in_working_file: INTEGER;
           OK_to_read_file, Proceed: BOOLEAN;
           File_name: VARYING [10] OF CHAR;
           Working_file: FILE OF Stimulus;
           Working_set: ARRAY [1..Maximum_set_size] OF Stimulus;
           Which_file: CHAR;

        PROCEDURE Blank_working_set;
          VAR I: INTEGER;
          BEGIN
          FOR I:= 1 TO Maximum_set_size DO Blank_string (Working_set [I].Name);
          END;

        PROCEDURE Warnings;
          VAR Input_char: CHAR;
          BEGIN
          Input_char:= 'Y';
          IF Number_present_in_set (Which_file) > 0 THEN 
              BEGIN
              Erase_line;
              WRITE (Which_file:1,
                     ' set contains records which will be erased. Proceed? ');
              READLN (Input_char);
              END;
          IF Input_char IN ['Y','y'] THEN Proceed:=TRUE;
          END;

        PROCEDURE Read_working_file;
            VAR I: INTEGER;
                File_error: BOOLEAN;
            BEGIN
            Blank_working_set;
            CASE Which_file OF
                'F','f':  BEGIN  Blank_f_set;  File_name:= 'Ffile' END;
                'G','g':  BEGIN  Blank_g_set;  File_name:= 'Gfile' END;
                'T','t':  BEGIN  Blank_t_set;  File_name:= 'Tfile' END;
                END;
            OPEN  (Working_file, File_name, OLD, ERROR:= CONTINUE);
            IF STATUS (Working_file) = 0 
               THEN File_error:= FALSE ELSE File_error:= TRUE;
            IF NOT File_error THEN
               BEGIN
               RESET (Working_file);
               I:= 0;
               WHILE NOT (EOF (Working_file) OR (I = Maximum_set_size) )  DO
                 BEGIN
                 I:= I+1;
                 Working_set [I]:= Working_file^;
                 GET (Working_file);
                 END;
               Number_in_working_file := I;
               Bottom_line;
               WRITELN ('Number of stimuli in ',Which_file:1,
                     ' set was ', Number_in_working_file:2);
               CLOSE (Working_file);
               CASE Which_file OF
                 'F','f': FOR I:= 1 TO Maximum_set_size DO 
                                   F_set[I]:= Working_set [I];
                 'G','g': FOR I:= 1 TO Maximum_set_size DO
                                   G_set[I]:= Working_set [I];
                 'T','t': FOR I:= 1 TO Maximum_set_size DO
                                   T_set[I]:= Working_set [I];
                  END;
               END;

            {VMS specific error recovery.}

            IF File_error THEN BEGIN
                              Bottom_line;
                              WRITE ('Error reading ',Which_file:1,' file.');
                              IF STATUS (Working_file) = 3 
                                 THEN WRITELN (' FILE NOT FOUND.')
                                 ELSE WRITELN;
                              END;
            END;

        PROCEDURE Actually_read_the_file;
            BEGIN
            Bottom_line;
            IF OK_to_read_file THEN Warnings;  {May zap what's already there.}
            IF Proceed THEN Read_working_file ELSE WRITELN ('No files read.');
            END;

        BEGIN {Readfile.}
        Scroll_block; 
        FOR I:= 1 TO Maximum_set_size DO Blank_string (Working_set [I].Name);
        IF Read_which_files IN ['A','a','F','f','G','g','T','t'] 
          THEN OK_to_read_file:= TRUE ELSE OK_to_read_file:= FALSE; 
        IF NOT OK_to_read_file THEN
          BEGIN 
          Bottom_line; 
          WRITELN  ('Can only read F, G, or T Files.'); 
          Proceed:= FALSE 
          END;
        IF Read_which_files IN ['F','f','G','g','T','t'] THEN 
                            BEGIN
                            Which_file:= Read_which_files;
                            Actually_read_the_file;
                            END;
        IF Read_which_files IN ['A','a'] THEN
                            BEGIN
                            Which_file:= 'F'; Actually_read_the_file;
                            Which_file:= 'G'; Actually_read_the_file;
                            Which_file:= 'T'; Actually_read_the_file;
                            END;
        Restore_scrolling;
        END; {Readfile.}


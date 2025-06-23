{When stimulus files are created or modified, the results can be  }
{written to disk.                                                 }

PROCEDURE Write_file (Which_file: CHAR);
        VAR I, Number_in_set: INTEGER;
        File_name: VARYING [10] OF CHAR;
        Working_file: FILE OF Stimulus;
        BEGIN
        Bottom_line;
        CASE Which_file OF 
             'F','f': BEGIN 
                      File_name:= 'Ffile'; 
                      Number_in_set:= Number_present_in_set ('F') 
                      END;
             'G','g': BEGIN
                      File_name:= 'Gfile';
                      Number_in_set:= Number_present_in_set ('G')
                      END;
             'T','t': BEGIN
                      File_name:= 'Tfile';
                      Number_in_set:= Number_present_in_set ('T')
                      END;
             END;
        OPEN (Working_file, File_name, NEW);
        REWRITE (Working_file);
        WRITELN;
        Bottom_line;
        WRITE  ('Writing', Number_in_set:3,' stimuli to ', 
                 Which_file:1, ' file.');
        FOR I:= 1 TO Number_in_set DO
                BEGIN
                CASE Which_file OF
                     'F','f': Working_file^:= F_set [I];
                     'G','g': Working_file^:= G_set [I];
                     'T','t': Working_file^:= T_set [I];
                     END;
                PUT (Working_file);
                END;
        WRITELN;
        CLOSE (Working_file);
        END;

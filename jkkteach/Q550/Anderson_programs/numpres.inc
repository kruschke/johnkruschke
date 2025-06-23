{Some useful procedures for initialization and to tell how many}
{non-blank stimului are present in the various data files.     }

PROCEDURE Zero_vector (VAR V: VECTOR);
        VAR I: INTEGER;
        BEGIN
        FOR I:= 1 TO Dimensionality DO V[I]:= 0;
        END;
 
PROCEDURE Blank_string (VAR S: STRING);
       VAR I: INTEGER;   
       BEGIN
       FOR I:= 1 TO 60 DO S [I]:= CHR (32);
       END;

PROCEDURE Blank_f_set;
       VAR I: INTEGER;
       BEGIN
       FOR I:= 1 TO Maximum_set_size DO Blank_string (F_set [I].Name);
       END;

PROCEDURE Blank_g_set;
       VAR I: INTEGER;
       BEGIN
       FOR I:= 1 TO Maximum_set_size DO Blank_string (G_set [I].Name);
       END;

PROCEDURE Blank_t_set;
       VAR I: INTEGER;
       BEGIN
       FOR I:= 1 TO Maximum_set_size DO Blank_string (T_set [I].Name);
       END;

FUNCTION Number_present_in_set (Which_set: CHAR): INTEGER;

      VAR I, Number_of_bytes, Number_in_set: INTEGER;
          Test_string: STRING;
          Leave: BOOLEAN;
      
      FUNCTION All_blanks (S: String): BOOLEAN;
          VAR I: INTEGER;
          Found_character: BOOLEAN;
          BEGIN
          Found_character:= FALSE;
          FOR I:= 1 TO Number_of_bytes DO 
              IF S[I] <> CHR (32) THEN Found_character:= TRUE;
          All_blanks:= NOT Found_character;
          END;
          
      BEGIN
      Number_of_bytes:= Dimensionality DIV 8;
      I:= Maximum_set_size;
      Leave:= FALSE;

      REPEAT CASE Which_set OF
             'F','f': Test_string:= F_set [I].Name;
             'G','g': Test_string:= G_set [I].Name;
             'T','t': Test_string:= T_set [I].Name;
             END;

        IF NOT All_blanks (Test_string) THEN BEGIN Leave:= TRUE; 
                                             Number_in_set:= I
                                             END;
        I:= I - 1;

        IF I = 0 THEN BEGIN  Leave:= TRUE; Number_in_set:= 0 END;
      UNTIL Leave;

      Number_present_in_set:= Number_in_set;

      END;


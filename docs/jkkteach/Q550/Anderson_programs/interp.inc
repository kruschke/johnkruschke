{Takes a vector and interprets it as a string of characters.  If  }
{all the elements in a byte are above an interpretion threshold,  }
{(or below minus the threshold) then the character is printed.    }
{Otherwise, `_' is printed.                                       }

PROCEDURE Interpret (Threshold: Real; V: Vector; VAR Interpretation: String);
 
    TYPE    Byte = ARRAY [1..8] OF INTEGER;
 
            Ivector = ARRAY [1..Dimensionality] OF INTEGER;
                
    VAR  IV: Ivector;
          
    PROCEDURE Blank_string (VAR S: STRING);
        VAR I: INTEGER;   
        BEGIN
        FOR I:= 1 TO 60 DO S [I]:= CHR (32);
        END;
   
    PROCEDURE Make_Binary_Vector (V: Vector; VAR IV: Ivector);
        VAR J: INTEGER;
        BEGIN
        FOR J:= 1 TO Dimensionality DO
                BEGIN
                IV[J]:= 0;
                IF V[J] >=  ABS(Threshold) THEN IV[J]:= 1;
                IF V[J] <= -ABS(Threshold) THEN IV[J]:=-1;
                END;
        END;

    FUNCTION Count (B: Byte): INTEGER; {Counts zeros in byte.}
        VAR I,Sum: INTEGER;
        BEGIN
        Sum:= 0;
        FOR I:= 1 TO 7 DO IF B[I]=0 THEN Sum:= Sum +1; {Ignore parity bit.}
        Count:= Sum;
        END;
 
    FUNCTION Byte_Interpret (B: Byte): CHAR; 
        VAR I, Charnr: INTEGER;
        Print_char: CHAR;
        Ambiguous: BOOLEAN;
        BEGIN
          {First check to see if all byte elements + 1 or - 1.}
        IF Count (B) > 0 THEN Ambiguous:= TRUE ELSE Ambiguous:= FALSE;
          {Now convert to byte of zero and +1.}
        FOR I:= 1 TO 8 DO IF B[I]=-1 THEN B[I]:= 0; 
          {Convert to Char. number.}
        Charnr:= 64*B[7] + 32*B[6] + 16*B[5] + 8*B[4] + 4*B[3] + 2*B[2] + B[1];
          {Special cases.}
        IF (Charnr <  32) THEN Print_char := '#'    {Non-printing character. }
                          ELSE Print_char := CHR (Charnr);  {Print character.}
        IF (Charnr =   0) THEN Print_char := '_';   {Zero convention is '_'  }
        IF (Charnr = 127) THEN Print_char:= '_';    {Delete convention is '_'}
        IF Ambiguous THEN Print_char:= '_';         {Ambiguous character.    }
        Byte_Interpret:= Print_char;
        END;
 
    PROCEDURE Read_IVector_as_ASCII (IV: Ivector; VAR Interpretation: STRING);
        VAR J, Nr_of_bytes: INTEGER;
            B: BYTE;
        BEGIN
        Nr_of_bytes:= Dimensionality DIV 8;
        Blank_string (Interpretation);
        FOR J:= 0 TO (Nr_of_bytes-1) DO
                BEGIN                     {Form byte in correct order}
                B[8]:=IV [J*8+1];         {from vector values.       }
                B[7]:=IV [J*8+2];
                B[6]:=IV [J*8+3];
                B[5]:=IV [J*8+4];
                B[4]:=IV [J*8+5];
                B[3]:=IV [J*8+6];
                B[2]:=IV [J*8+7];
                B[1]:=IV [J*8+8];
                Interpretation [(J+1)]:= Byte_Interpret (B);
                END;
         END;
 
    BEGIN    {Interpret procedure}
    Make_Binary_Vector (V, IV);
    Read_IVector_as_ASCII (IV, Interpretation);
    END;     {Interpret procedure.}


{This long procedure makes stimulus files from character strings.   }
{It can also do some element by element manipulation and can add    }
{stimuli together, as well as allowing inspection of single elements}
{in the vectors.  These facilities are rarely used, but are provided}
{anyway.  The various options available in this procedure are       }
{discussed at length in the Manual.                                 }

PROCEDURE Make_stimulus;

    TYPE  Byte = ARRAY [1..8] OF INTEGER;

    VAR Nr_of_characters: INTEGER;
        Quit: BOOLEAN;
                
   PROCEDURE Showvals; 
   VAR Input_char: CHAR;
       Quit: BOOLEAN;
       Stim: STIMULUS;
       Stimulus_set: CHAR;
       Stimulus_number: INTEGER;
  
   PROCEDURE Write_box;
       BEGIN
       Clear_box;
       WRITELN ('Threshold       : ', Threshold: 8);
       WRITE   ('Current Stimulus: ');
       WRITELN (Stimulus_set:2, Stimulus_number:3);
       END;

   PROCEDURE Showvals_initialize;
       BEGIN
       Quit:= FALSE;
       Save_cursor;  
       Stim := F_set [1];   
       Stimulus_number := 1;  
       Stimulus_set := 'F';
       Write_box;
       END;
 
   PROCEDURE Display_stimulus;
	VAR I, Row_nr, Elements_per_line: INTEGER;
        Stim_interpretation: String;
	BEGIN
        Interpret (Threshold, Stim.Val, Stim_Interpretation);
        Write_box;
	WRITELN ('            Name: ', Stim.Name);
        WRITELN ('  Interpretation: ', Stim_interpretation);
        Clear_block; Scroll_block;
	Elements_per_line := 8;    {Single byte. Number of elements in a line.}
	FOR I:= 1 TO Dimensionality DO 
                BEGIN
                IF (I MOD Elements_per_line = 1) THEN
                         BEGIN
                         Row_nr:= 1 + I DIV Elements_per_line;
                         WRITE ( I:4);
                         WRITE (' ',Stim_interpretation [Row_nr], '  '); 
                         END;
                WRITE (Stim.Val [I]:8);
                IF (I MOD Elements_per_line = 0) 
                   THEN BEGIN WRITE ( I:4); WRITELN  END;
                END;
	END;

     PROCEDURE New_value;
        VAR Element_number: INTEGER;
            New_element_value: REAL;
        BEGIN
        Write_box;
        REPEAT WRITE  ('Which element   : '); READLN (Element_number);
        UNTIL Element_number IN [1..Dimensionality];
        WRITE ('Old Value       : ');  WRITELN (Stim.Val [Element_number]:8);
        WRITE ('New Value       : ');  READLN (New_element_value);
        Stim.Val [Element_number] := New_element_value; 
        CASE Stimulus_set OF
             'F','f': F_set [Stimulus_number]:= Stim;
             'G','g': G_set [Stimulus_number]:= Stim;
             'T','t': T_set [Stimulus_number]:= Stim;
             END;
        END;

     PROCEDURE Choose_stimulus;
        BEGIN
        Write_box;
        REPEAT
          WRITE   ('New Stimulus    : ');
          READLN  (Stimulus_set, Stimulus_number);
        UNTIL ((Stimulus_set IN ['f','F','g','G','t','T'])
          AND (Stimulus_number IN [1..Maximum_set_size]) );
        Write_box;
        CASE Stimulus_set OF
             'F','f': Stim:= F_set [Stimulus_number];
             'G','g': Stim:= G_set [Stimulus_number];
             'T','t': Stim:= T_set [Stimulus_number];
             END;
        END; 

     PROCEDURE Choose_action;
         BEGIN
         Bottom_line;
         IF FG_mode THEN WRITE ('FG') ELSE WRITE ('TF');
   WRITE ( ' Shows Values C)hoose D)ispl L)ist M)ode Q)uit T)hresh X)chng > ');
         READLN (Input_char);
         CASE Input_char OF 
              'C','c': Choose_stimulus;
              'D','d': Display_stimulus;
              'L','l': List_test_set;
              'M','m': FG_mode:= NOT FG_mode;
              'Q','q': Quit:= TRUE;
              'T','t': BEGIN 
                       Bottom_line;
                       WRITE ('New Threshold: '); READLN (Threshold);
                       Write_box END;
              'X','x': New_value;
              END; 
         END;

    BEGIN {Procedure Showvals.}
    Showvals_initialize;
    REPEAT Choose_action UNTIL Quit;
    Restore_cursor;
    END;  {Procedure Showvals.} 

    PROCEDURE Zero_Byte (VAR B: Byte);
       VAR I: INTEGER;
       BEGIN
       FOR I:= 8 DOWNTO 1 DO B[I]:= 0;
       END;

    PROCEDURE W (S: String);
       VAR I: INTEGER;
       BEGIN
       FOR I:= 1 to Nr_of_characters DO WRITE (S [I]);
       END;       

    PROCEDURE Blank_String (VAR S: String);
       VAR I: INTEGER;
       BEGIN
       FOR I:= 1 TO 60 DO S[I]:= ' ';
       END;

    PROCEDURE Zero_stimulus (VAR St: Stimulus);
       VAR I: INTEGER;
       BEGIN
       Blank_string (St.Name);
       FOR I:= 1 TO Dimensionality DO St.Val [I]:= 0;
       END;
 
    PROCEDURE Nr_to_Byte (Nr: INTEGER; VAR B: BYTE);
       VAR I, Power_of_2, Remainder, Parity: INTEGER;
       BEGIN
       IF Nr > 128 THEN WRITELN ('Too large. ASCII conversion fails.'      );
       IF Nr < 0   THEN WRITELN ('Negative number. ASCII conversion fails.');
       Remainder:= Nr;    Parity:= 0;     Power_of_2:= 256;
       FOR I:= 8 DOWNTO 1 DO {msb in B[8], lsb in B[1]}
              BEGIN
              Power_of_2:= Power_of_2 DIV 2;
              IF ( (Remainder - Power_of_2) <  0 ) THEN B[I]:= -1;
              IF ( (Remainder - Power_of_2) >= 0 ) THEN
                     BEGIN
                     B[I]:= 1;
                     Remainder:= Remainder - Power_of_2;
                     Parity:= Parity + 1;
                     END;
              END;
       IF ODD (Parity) THEN B[8]:= 1 ELSE B[8]:= -1;
       END;

     PROCEDURE Add_Byte_to_Vector (VAR V: VECTOR; I: INTEGER; B: BYTE);
       VAR J: INTEGER;
       BEGIN
       IF I > (Dimensionality DIV 8) THEN 
              WRITELN ('Addbyte failure.  I too big.');
       FOR J:= 1 TO 8 DO V[ (I-1)*8 + J ]:= B [9-J];
       END;
 
     PROCEDURE Edit_stimulus;
       VAR Read_string, Input_string: VARYING [132] OF CHAR;
           New_stimulus, Old_stimulus: Stimulus;
           I, Edit_nr: INTEGER;
           B: Byte;
           Edit_set: CHAR;
       BEGIN
       Bottom_line;
       Erase_line;
       REPEAT
          WRITE   ('Edit which stimulus (set, number) : ');
          READLN  (Edit_set, Edit_nr);
       UNTIL ((Edit_set IN ['f','F','g','G','t','T'])
          AND (Edit_nr IN [1..Maximum_set_size]));
       CASE Edit_set OF
          'F','f': Old_stimulus:= F_set [Edit_nr];
          'G','g': Old_stimulus:= G_set [Edit_nr];
          'T','t': Old_stimulus:= T_set [Edit_nr];
          END;
       Clear_box;  Scroll_box;
       Blank_string (New_stimulus.Name);
       WRITELN ('Edit    : ', Edit_set:1, Edit_nr:3);
       WRITE   ('Old     : ');         WRITELN  (Old_stimulus.Name);
       WRITE   ('New     : ');         READLN (Read_string);
       Input_String.Length:= Nr_of_Characters;
       FOR I:= 1 TO Nr_of_Characters DO Input_String [I]:= '_';
       IF Read_String.Length < Nr_of_Characters
          THEN FOR I:= 1 to Read_String.Length DO
               Input_String [I]:= Read_String [I];
       IF Read_String.Length >= Nr_of_Characters 
          THEN FOR I:= 1 to Nr_of_Characters DO
               Input_String [I]:= Read_String [I];
       FOR I:= 1 TO Nr_of_Characters DO
          BEGIN
          Nr_to_byte ( ORD (Input_String [I]), B);
          IF (Input_String [I] = '_') THEN Zero_byte (B); 
          Add_Byte_to_vector (New_stimulus.Val, I, B);
          New_stimulus.Name [I] := Input_String [I];
          END;
       CASE Edit_set OF
          'F','f': F_set [Edit_nr]:= New_stimulus;
          'G','g': G_set [Edit_nr]:= New_stimulus;
          'T','t': T_set [Edit_nr]:= New_stimulus;
          END;
       END;       

     PROCEDURE Replace;
       VAR Read_string, Input_string: VARYING [132] OF CHAR;
           New_stimulus: Stimulus;
           I, Replace_nr: INTEGER;
           B: Byte;
           Replace_set: CHAR;
       BEGIN
       Bottom_line;
       Erase_line;
       REPEAT
          WRITE   ('Replace which stimulus (set, number) : ');
          READLN  (Replace_set, Replace_nr);
       UNTIL ((Replace_set IN ['f','F','g','G','t','T'])
          AND (Replace_nr IN [1..Maximum_set_size]));
       Clear_box;  Scroll_box;
       Blank_string (New_stimulus.Name);
       WRITELN ('Replace : ', Replace_set:1, Replace_nr:3);
       WRITE   ('Template: ');          WRITELN  (Template);
       WRITE   ('New     : ');         READLN (Read_string);
       Input_String.Length:= Nr_of_Characters;
       FOR I:= 1 TO Nr_of_Characters DO Input_String [I]:= '_';
       IF Read_String.Length < Nr_of_Characters
          THEN FOR I:= 1 to Read_String.Length DO
               Input_String [I]:= Read_String [I];
       IF Read_String.Length >= Nr_of_Characters 
          THEN FOR I:= 1 to Nr_of_Characters DO
               Input_String [I]:= Read_String [I];
       FOR I:= 1 TO Nr_of_Characters DO
          BEGIN
          Nr_to_byte ( ORD (Input_String [I]), B);
          IF (Input_String [I] = '_') THEN Zero_byte (B); 
          Add_Byte_to_vector (New_stimulus.Val, I, B);
          New_stimulus.Name [I] := Input_String [I];
          END;
       CASE Replace_set OF
          'F','f': F_set [Replace_nr]:= New_stimulus;
          'G','g': G_set [Replace_nr]:= New_stimulus;
          'T','t': T_set [Replace_nr]:= New_stimulus;
          END;
       END;       
  
     {The default template is a string of digits indicating    }
     {place.  Individually constructed templates are sometimes }
     {useful.                                                  }


     PROCEDURE Make_Template;
       VAR      Model_char, Model_set: CHAR;
                I, Model_number: INTEGER;
                Read_Template,
                Input_String,
                Read_String: VARYING [60] OF CHAR; 
        BEGIN
        Clear_box;             Scroll_box;
        Template.Length:= Nr_of_Characters;
        FOR I:= 1 TO Nr_of_Characters DO Template[I]:= '_';
        WRITE   ('New stimulus template.  Use Model? Y/N : ');
        READLN (Model_char);
        IF Model_char IN ['Y','y'] 
           THEN BEGIN REPEAT
                       WRITE   ('Which stimulus as model (set, number)  : ');
                       READLN  (Model_set, Model_number);
                      UNTIL ((Model_set IN ['f','F','g','G','t','T'])
                         AND (Model_number IN [1..Maximum_set_size]));
 
                      WRITE ('          ');
                      CASE Model_set OF
                         'F','f': W (F_set [Model_number].Name);
                         'G','g': W (G_set [Model_number].Name);
                         'T','t': W (T_set [Model_number].Name);
                         END;
                END
           ELSE BEGIN
                WRITE ('          ');
                FOR I:= 1 TO Nr_of_Characters DO WRITE ((I MOD 10):1)
                END;
        WRITELN;
        WRITE ('Template: ');
        READLN (Read_Template);
        IF Read_Template.Length < Nr_of_Characters
            THEN FOR I:= 1 TO Read_Template.Length DO
                      Template [I]:=Read_Template [I];
        IF Read_Template.Length >= Nr_of_Characters
            THEN FOR I:= 1 to Nr_of_Characters DO
                      Template [I]:= Read_Template [I];
        END;

    {Sometimes it is convenient to sum stimuli together. }


    PROCEDURE Sum_stimuli;
       VAR I, Ones_digit, Tens_digit,
           To_number, From_number, How_many_stimuli: INTEGER;
           To_set, From_set: CHAR;
           Sum: Stimulus;
           Number_string: VARYING [2] OF CHAR;

           PROCEDURE Add_stimuli (S1, S2: Stimulus; VAR Sum: Stimulus);
               VAR I: INTEGER;
               BEGIN
               FOR I:= 1 TO Dimensionality 
                   DO Sum.Val [I]:= S1.Val [I] + S2.Val [I];
               END;

           PROCEDURE Divide_stimulus (D: Integer; VAR S: Stimulus);
               VAR I: INTEGER;
               BEGIN
               IF D <> 0 THEN FOR I:= 1 TO Dimensionality
                         DO S.Val [I]:= S.Val [I]/D;
               END;

       BEGIN
       Zero_stimulus (Sum);
       Sum.Name [1]:= 'S'; Sum.Name [2]:= 'u'; 
       Sum.Name [3]:= 'm'; Sum.Name [4]:= ' ';
       Bottom_line; Erase_line;

       REPEAT
          WRITE    ('How many stimuli? (Averages sum): ');  
          READLN   (How_many_stimuli);
       UNTIL (How_many_stimuli IN [1..Maximum_set_size]);
       IF NOT VT100 THEN WRITELN;

       FOR I:= 1 TO How_many_stimuli DO
               BEGIN
               Erase_line;

               REPEAT
                 WRITE   ('Add stimulus number ', I:2,
                          ' of', How_many_stimuli:3,
                          ' stimuli (set, number) : ');
                 READLN  (From_set, From_number);
               UNTIL ((From_set IN ['f','F','g','G','t','T'])
                       AND (From_number IN [1..Maximum_set_size]));
               IF NOT VT100 THEN WRITELN;
               CASE From_set OF
                    'F','f': Add_stimuli (Sum, F_set [From_number], Sum);
                    'G','g': Add_stimuli (Sum, G_set [From_number], Sum);
                    'T','t': Add_stimuli (Sum, T_set [From_number], Sum);
                    END;
               Tens_digit:= From_number DIV 10;
               Ones_digit:= From_number - Tens_digit*10;
               IF I < 14 THEN BEGIN
                         Sum.Name [4*I + 1] := From_set;
                         Sum.Name [4*I + 2] := CHR (48 + Tens_digit);
                         Sum.Name [4*I + 3] := CHR (48 + Ones_digit);
                         Sum.Name [4*I + 4] := ' ';  
                         END;
               END;
       Divide_stimulus (How_many_stimuli, Sum); 
       Erase_line;
       REPEAT WRITE   ('Copy to   (set, number): '); 
              READLN  (To_set, To_number);
       UNTIL ((To_set IN ['f','F','g','G','t','T'])
              AND (To_number IN [1..Maximum_set_size]));
       IF NOT VT100 THEN WRITELN;
       Erase_line;
       WRITELN ('Name of sum: ',Sum.Name);
       CASE To_set OF
            'F','f': F_set [To_number]:= Sum;
            'G','g': G_set [To_number]:= Sum;
            'T','t': T_set [To_number]:= Sum;
            END;
       END;

    PROCEDURE Change_stimulus_name;
       VAR Change_name_set: CHAR;
           I, Change_name_number, String_length: INTEGER;
           Old_name, New_name: STRING;
           Changed_name: VARYING [132] OF CHAR;
       BEGIN
       Bottom_line; Erase_line;
       WRITELN ('Change the name of a stimulus.');
       REPEAT WRITE   ('Change name of (set, number): '); 
              READLN  (Change_name_set, Change_name_number);
       UNTIL (Change_name_set IN ['f','F','g','G','t','T']) 
              AND (Change_name_number IN [1..Maximum_set_size]);

       CASE Change_name_set OF
              'F','f': Old_name:= F_set [Change_name_number].Name;
              'G','g': Old_name:= G_set [Change_name_number].Name;
              'T','t': Old_name:= T_set [Change_name_number].Name;
              END;

       Clear_box; Scroll_box;
       WRITE ('Template: ');    WRITELN (Template);
       WRITE ('Old Name: ');    WRITELN (Old_name);
       WRITE ('New Name: ');    READLN (Changed_name);
       Blank_string (New_name);
       IF Length(Changed_name) >= 60 THEN String_length:= 60
                                     ELSE String_length:= Length(Changed_name);
       FOR I:= 1 TO String_length DO New_name [I]:= Changed_name [I];
        
       CASE Change_name_set OF
              'F','f': F_set [Change_name_number].Name := New_name;
              'G','g': G_set [Change_name_number].Name := New_name;
              'T','t': T_set [Change_name_number].Name := New_name;
              END;
       END;


    PROCEDURE Copy_stimulus;
       VAR From_number, To_number: INTEGER;
           From_set, To_set: CHAR;
           Duplicate: Stimulus;
       BEGIN
       Bottom_line; Erase_line;
       WRITELN ('Copy a stimulus.');

       REPEAT WRITE   ('Copy from (set, number): '); 
              READLN  (From_set, From_number);
       UNTIL (From_set IN ['f','F','g','G','t','T']) 
              AND (From_number IN [1..Maximum_set_size]);

       REPEAT WRITE   ('Copy from ', From_set:1, From_number:3,
                       '.  Copy to   (set, number): '); 
              READLN  (To_set, To_number);
       UNTIL (To_set IN ['f','F','g','G','t','T'])
              AND (To_number IN [1..Maximum_set_size]);

       CASE From_set OF 
            'F','f': Duplicate:= F_set [From_number];
            'G','g': Duplicate:= G_set [From_number];
            'T','t': Duplicate:= T_set [From_number];
            END;

       CASE To_set OF
            'F','f': F_set [To_number]:= Duplicate;
            'G','g': G_set [To_number]:= Duplicate;
            'T','t': T_set [To_number]:= Duplicate;
            END;
       END;

    PROCEDURE Make_stimulus_command;
       VAR Command_string: STRING;
           Command_char, Which_set: CHAR;
           Replace_nr: INTEGER;
       BEGIN
       Quit:= FALSE;
       REPEAT
         Bottom_line;
         IF FG_mode     THEN WRITE ('FG ');
         IF NOT FG_mode THEN WRITE ('T  ');
         WRITE 
('A)dd C)opy E)dit I)ndiv. L)ist M)ode N)ame Q)uit R)epl. S)ave T)empl. > ');
         READLN (Command_char);
         Bottom_line; Erase_line;
         CASE Command_char OF
              'A','a' : Sum_stimuli;
              'C','c' : Copy_stimulus;
              'E','e' : Edit_stimulus;
              'I','i' : Showvals;              {Work with individual elements.}
              'M','m' : BEGIN WRITE ('Toggle Mode'); FG_mode:= NOT FG_mode END;
              'N','n' : Change_stimulus_name;
              'L','l' : List_test_set;
              'Q','q' : Quit:= TRUE; 
              'R','r' : Replace;
              'S','s' : BEGIN
                        Bottom_line;
                        WRITE  ('Write to which file F, G, or T? ');
                        READLN (Which_file);
                        Write_file (Which_file);
                        END;
              'T','t' : Make_template;
              END;
       UNTIL Quit;
       END; 
    
       BEGIN  {Make_stimulus.}
       Clear_box; Scroll_box;
       Nr_of_Characters:= Dimensionality DIV 8;
       REPEAT Make_stimulus_command UNTIL Quit;
       END;   {Make_stimulus.}


{This is the procedure that does all the work in the BSB model.}

PROCEDURE BSBProcedure;         {Brain-state-in-a-box iterations.}

    VAR I, Test_stimulus_nr, 
           Minimum_size,
           Delta_passes, 
           Start_nr_of_passes, 
           Finish_nr_of_passes, 
           Current_check    : INTEGER;
           
        Upper_Limit, 
            Lower_Limit,  
            Feedback_constant,  
            Decay_constant  : REAL; 
 
        Test_stimulus_set,
            Continue_char: CHAR;

        Starting_vector, Inp, Outp: Vector;
 
        Unchanged_original,
        Quit, 
        Restart: BOOLEAN;

   PROCEDURE BSBvals; 
        VAR Stim: STIMULUS;
            Stimulus_set: CHAR;
            Stimulus_number: INTEGER;
  
      PROCEDURE BSBvals_initialization;
        BEGIN
        CASE Test_stimulus_set OF
            'F','f': Stim:= F_set [Test_stimulus_nr];
            'G','g': Stim:= G_set [Test_stimulus_nr];
            'T','t': Stim:= T_set [Test_stimulus_nr];
            END;
        IF NOT Restart THEN Stim.Val:= Outp;
        END;
 
      PROCEDURE Display_stimulus;
 	 VAR I, Row_nr, Elements_per_line, 
            Unit_nr, Elements_per_unit, Truncated_value: INTEGER;
            Stim_interpretation: String;
            Sign_char, Value_char: CHAR;
	 BEGIN
         Interpret (Threshold, Stim.Val, Stim_Interpretation);
         Clear_block; Scroll_block;
	 WRITELN ('            Name: ', Stim.Name);
         WRITELN ('  Interpretation: ', Stim_interpretation);
         WRITELN;
         Elements_per_unit :=  8;  {One byte.  Basic reporting unit.}
	 Elements_per_line := 24;  {Three bytes. Number of elements in a line.}
	 FOR I:= 1 TO Dimensionality DO 
                BEGIN
                IF (I MOD Elements_per_unit = 1) THEN
                         BEGIN
                         Unit_nr:= 1 + I DIV Elements_per_unit;
                         WRITE ( I:6);
                         WRITE (' ',Stim_interpretation [Unit_nr], ' '); 
                         END;

                IF Stim.Val [I] > 0 THEN 
                     BEGIN
                     Sign_char := '+';
                     Truncated_value:= TRUNC (10*Stim.Val[I]/Upper_limit);
                     IF Truncated_value >= 10 THEN Value_char:= 'L' ELSE
                                  Value_char:= CHR (48 + Truncated_value);
                     END;

                IF Stim.Val [I] < 0 THEN 
                     BEGIN
                     Sign_char := '-';
                     Truncated_value:= TRUNC (ABS(10*Stim.Val[I]/Lower_limit));
                     IF Truncated_value >= 10 THEN Value_char:= 'L' ELSE
                                  Value_char:= CHR (48 + Truncated_value);
                     END;

                IF Stim.Val [I] = 0 THEN 
                     BEGIN
                     Sign_char := ' ';
                     Value_char:= '0';
                     END;

                WRITE (Sign_char:1, Value_char:1);
                IF (I MOD Elements_per_line = 0) 
                   THEN BEGIN WRITE ( I:4); WRITELN  END;
                END;
	 END;


         BEGIN {Procedure BSB_vals.}
         BSBvals_initialization;
         Display_stimulus;
         END;  {Procedure BSB_vals.} 


    PROCEDURE Zero_vector (VAR V: VECTOR);
        VAR I: INTEGER;
        BEGIN
        FOR I:= 1 TO Dimensionality DO V[I]:= 0;
        END;

    PROCEDURE Initial_BSB_Parameters;
      BEGIN
      Unchanged_original:= FALSE;
      FG_mode           := FALSE;
      Test_stimulus_set := 'T';
      Test_stimulus_nr  := 1;
      Delta_passes      := 16;            {One VT100 screen full.}
      Threshold         := 0.5;
      Restart           := TRUE;
      Quit              := FALSE;

      {BSB Computational Parameters.}

      Decay_constant    := 0.90;
      Feedback_constant := 0.20;
      Lower_limit       := -1.3;
      Upper_limit       :=  1.3;
      END;
        
   PROCEDURE Write_BSB_parameters;
       BEGIN
       Clear_box;  
       {First line.}
       WRITELN ('BSB>P)asses :', Delta_passes:4,
                '     U)Limit:', Upper_limit:8, 
                '  T)hreshold:', Threshold:8,
                '   Stim. #) :', Test_stimulus_set:2, Test_stimulus_nr:2);
       {Second line.}
       IF Neuron_file_present THEN
          BEGIN
          WRITE   ('Mx: Synapses:', Avg_number_of_synapses:4,
                   '   F)eedback:', Feedback_constant:8,
                   '      D)ecay:', Decay_constant:8);
          WRITELN;
          END;
       {Fourth line.}
       IF Restart THEN WRITE ('RESTART')
                  ELSE WRITE ('It:',Finish_nr_of_passes:4);
       IF Unchanged_original THEN WRITE ('  Add original stimulus.');
       WRITELN;
       END;

    PROCEDURE BSB_command;
       VAR BSB_string : STRING;
           I: INTEGER;
           Set_parameters: BOOLEAN;
       BEGIN
       Save_cursor;
       Set_parameters:= FALSE;  
       REPEAT 
        Write_BSB_parameters;
        Bottom_line;
        IF FG_mode THEN WRITE ('FG ') ELSE WRITE ('TF ');
        WRITE 
      ('BSB X)ecute C)hange L)ist R)estart V)als Q)uit > ');
        IF NOT VT100 THEN WRITELN;
        READLN (BSB_string);
        Bottom_line;  Erase_line;
        FOR I:= 1 TO LENGTH (BSB_string) DO
         CASE BSB_string [I] OF  

          'C','c': Make_stimulus;

          'D','d': BEGIN WRITE ('Trace Decay: '); 
                         READLN (Decay_constant);
                         END;
 
          'F','f': BEGIN WRITE ('Matrix Feedback: '); 
                         READLN (Feedback_constant);
                         END;

          'L','l': List_test_set;

          'M','m': FG_mode:= NOT FG_mode;

          'O','o': BEGIN
                   Unchanged_original:= NOT Unchanged_original;
                   IF Unchanged_original 
                      THEN WRITE ('Will add original stimulus to output.')
                      ELSE WRITE ('Input stimulus will be treated as data.');
                   END;

          'P','p': BEGIN WRITE ('Number of Passes: '); 
                         READLN (Delta_passes) END;

          'Q','q': Quit:= TRUE;

          'R','r': Restart:= TRUE;

          'T','t': BEGIN WRITE ('New threshold: '); READLN (Threshold) END;

          'U','u': BEGIN WRITE ('Upper Limit: '); READLN (Upper_limit); 
                         WRITE ('Lower Limit: '); READLN (Lower_limit) END;

          'V','v': BSBvals;

          'X','x': BEGIN WRITELN ('Xecute Iterations.'); 
                         Set_parameters:= TRUE END;

          '#'    : BEGIN REPEAT 
                           WRITE  ('Choose stimulus (Set, number) : '); 
                           READLN (Test_stimulus_set, Test_stimulus_nr);
                         UNTIL((Test_stimulus_set IN ['F','f','G','g','T','t'])
                           AND (Test_stimulus_nr IN [1..Maximum_set_size]) )
                   END;
                 END;
         UNTIL Set_parameters OR Quit;
       Restore_cursor;
       END;          
    
    PROCEDURE Limit_vector (VAR V: Vector);
        VAR I: INTEGER;
        BEGIN

        {The data input is added to the output of the iteration.}

        IF Unchanged_original THEN 
           FOR I:= 1 TO Dimensionality DO 
               V [I]:= V [I] + Starting_vector [I];

        {Clipping.}

        FOR I:= 1 TO Dimensionality DO
            BEGIN
            IF V [I] > Upper_limit THEN V [I]:= Upper_limit;
            IF V [I] < Lower_limit THEN V [I]:= Lower_limit;
            END;
        END;

    {Calculate does most of the computational work.  This procedure  }
    {should be in very fast vector hardware or assembly language.    }

    PROCEDURE Calculate (VAR F,O: Vector); {Computes output vector.}
        VAR I,J: INTEGER;
            Sum: REAL;

        BEGIN
        FOR I:= 1 TO Dimensionality DO
            BEGIN
            Sum:= 0;

            FOR J:= 1 TO Number_of_synapses [I] DO
              Sum:= Sum + Neurons [I].Synapses[J].Strength * 
                    F [Neurons[I].Synapses [J].From];

            O[I]:= Sum;
            END;
        END;

    {Useful for seeing how far a vector is from a corner.}

    FUNCTION Check_vector (V: Vector): INTEGER;  
        VAR I, Count_so_far: INTEGER;  {Returns number of limited elements.}
        BEGIN
        Count_so_far:= 0;
        FOR I:= 1 TO Dimensionality DO
            BEGIN
            IF V [I] >= Upper_limit THEN Count_so_far:= Count_so_far + 1;
            IF V [I] <= Lower_limit THEN Count_so_far:= Count_so_far + 1;
            END;
        Check_vector := Count_so_far;
        END;

    PROCEDURE Constant_times_Vector (C: Real; V_in: Vector; VAR V_out: Vector);
        VAR I: INTEGER;
        BEGIN
        FOR I:= 1 TO Dimensionality DO V_out [I]:= C * V_in [I];
        END;

    PROCEDURE Vector_plus_Vector (V1, V2: Vector; VAR Vector_Sum: Vector);
        VAR I: INTEGER;
        BEGIN
        FOR I:= 1 TO Dimensionality DO
            Vector_sum [I]:= V1 [I] + V2 [I];
        END;

    PROCEDURE W (S: String);
       VAR I, Nr_of_Characters: INTEGER;
       BEGIN
       Nr_of_Characters:= Dimensionality DIV 8;
       FOR I:= 1 TO Nr_of_Characters DO WRITE (S[I]);
       END;

{One iterative pass through the matrix.}

PROCEDURE One_pass (I: INTEGER; VAR V_in, V_out: Vector);
       VAR  DecayIx, Ax: Vector;
            Interpreted_Vector: String;

       BEGIN
       Calculate (V_in, Ax);

       {Result is feedback*A*x.}
       Constant_times_vector (Feedback_constant, Ax, Ax);

       {Previous state decays.}
       Constant_times_vector (Decay_constant,V_in,DecayIx);

       {Output is the sum of these two terms.}
       Vector_plus_vector (Ax, DecayIx, V_out);    

       {Will add original state if called for.}
       Limit_vector (V_out); 
       Current_check:= Check_vector (V_out);
       {Write output to file or screen.}
       Interpret (Threshold, V_out, Interpreted_vector);
       WRITE (I:6,'.  ');
         W(Interpreted_vector);
         WRITELN ('  Check: ', Current_check:3);
       END;

    PROCEDURE Restart_initialization;
       BEGIN
       Clear_block;  Scroll_block;
       Start_nr_of_passes:= 0;

       CASE Test_stimulus_set OF
            'F','f': Starting_vector:= F_set[Test_stimulus_nr].Val;
            'G','g': Starting_vector:= G_set[Test_stimulus_nr].Val;
            'T','t': Starting_vector:= T_set[Test_stimulus_nr].Val;
            END;

       Inp:= Starting_vector;
       Limit_vector (Inp);
       Restart:= FALSE;
       Clear_block; Scroll_block;
       END;

    PROCEDURE Do_iterations (Start, Finish: INTEGER);
       VAR I: INTEGER;
       BEGIN

       I:= Start;
       REPEAT One_pass (I, Inp, Outp);
              I:= I + 1;
              Inp:= Outp;     {New input for next iteration.}
       UNTIL (Current_check = Dimensionality) OR (I = (Finish + 1));

       END;

    BEGIN {BSB procedure.}
    Initial_BSB_parameters;
    REPEAT  BSB_command;
            IF Restart THEN Restart_initialization;
            Finish_nr_of_passes:= Start_nr_of_passes + Delta_passes;
            IF NOT Quit THEN
               BEGIN
               Do_iterations (Start_nr_of_passes+1,Finish_nr_of_passes);
               Start_nr_of_passes:= Finish_nr_of_passes;
               IF (Current_check = Dimensionality) 
                  THEN WRITELN ('>> Fully limited. Finished.');
               END;
    UNTIL Quit; 
    Restore_scrolling;
    WRITELN;
    END;  {BSB procedure.} 

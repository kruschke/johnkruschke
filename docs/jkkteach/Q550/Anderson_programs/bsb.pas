PROGRAM BSB (Input, Output, 
             F_file, G_file, T_file, Nfile);   {Data files.}

{Copyright 1994 James Anderson, Brown University.                       }
{This research was primarily supported by National Science              }
{Foundation Grants BNS-82-14728, BNS-85-18675 and BNS-90-23283          }
{to: James Anderson                                                     }
{    Department of Cognitive and Linguistic Sciences                    }
{    Box 1978                                                           }
{    Brown University, Providence, RI 02912.                            }
{                                                                       }
{    James_Anderson@brown.edu                                           }
{                                                                       }
{Please acknowledge these grants if you make use of these programs in   }
{published material.                                                    }
{                                                                       }
{A version of this program is used for the computer simulations in      }
{An Introduction to Neural Networks, by James A. Anderson, MIT Press.   }
{                                                                       }
{This program will run correctly on a VMS VAX.  Other Pascal            }
{compilers may require modification of the code.                        }


CONST Dimensionality = 200;   {The program is written so
                               the dimensionality can be increased
                               simply by changing this number.}
 
      Maximum_set_size = 100;

TYPE    Vector = ARRAY  [1..Dimensionality] OF REAL;

        String = PACKED ARRAY [1..60] OF CHAR;

        Stimulus = RECORD
                   Name: String;
                   Val: Vector;
                   END;

        Synapse = RECORD Strength: REAL;
                         From: INTEGER;
                         END;
    
        Neuron = RECORD Activity: REAL;
                        Synapses: ARRAY [1..Dimensionality] OF Synapse;
                        Neuron_output: REAL;
                        Learningp: REAL;
                        Neuron_Upper_limit: REAL;
                        Neuron_Lower_limit: REAL;
                        END;

                             
VAR     Neurons:        ARRAY [1..Dimensionality] OF Neuron;

        Number_in_test_file, 
             Avg_number_of_synapses,
             Seed, Real_it_number, 
             It_Number, Depth: INTEGER;

        Number_of_synapses   : ARRAY [1..Dimensionality] OF INTEGER;

        Threshold, 
             Upper_limit, 
             Lower_limit: REAL;

        F_file, G_file, T_file: FILE OF Stimulus;

        Template: VARYING [132] OF Char;

        Input_char, Which_file: CHAR;

        Neuron_file_Present,
             Exit, 
             FG_mode, 
             VT100            : BOOLEAN;

        Nfile                 : FILE OF Neuron;

        F_set, G_set, T_set   : ARRAY [0..Maximum_set_size] OF Stimulus;

        Command_String: VARYING [132] OF Char;

%INCLUDE 'VT100CTR.INC'

%INCLUDE 'NUMPRES.INC'
   
%INCLUDE 'INTERP.INC'

%INCLUDE 'LIST.INC'

%INCLUDE 'READF.INC'

%INCLUDE 'WRITEF.INC'

%INCLUDE 'MAKESTIM.INC'

%INCLUDE 'READNF.INC'

%INCLUDE 'BSBPROC.INC'

PROCEDURE Set_Threshold;
        BEGIN
        WRITE ('  Old threshold : ',Threshold: 10);
        WRITE ('  Set threshold : ');
        READLN (Threshold);
        END;


PROCEDURE File_initialize;
    BEGIN
    Clear_block;
    Top_of_block;
    WRITELN ('Initializing Files.'                             );
    WRITELN ('Reading neuron and stimulus files from disk.'    );
    WRITELN ('Reading F file.');
    Save_cursor; Read_file ('F');         Restore_cursor;
    WRITELN ('Reading G file.');
    Save_cursor; Read_file ('G');         Restore_cursor;
    WRITELN ('Reading T file.');
    Save_cursor; Read_file ('T');         Restore_cursor;
    WRITELN ('Reading neuron file (autoassociative).');
    Save_cursor; Read_Neuron_File;   Restore_cursor;
    END;

PROCEDURE Help_info;
 BEGIN
 WRITELN;
 Clear_box;
 Scroll_box;
 WRITELN ('BSB Neural Net Program. 10-94   B)SB.  C)hange. E)xit. H)elp.');
 WRITELN ('L)ist. M)ode. N)eurons. R)ead. S)ave. T)hreshold.  W)rite.  ');
 WRITELN ('Threshold: ',Threshold:8,
          '  F File: ',Number_present_in_set ('F'):4,
          '  G File: ',Number_present_in_set ('G'):4,
          '  T File: ',Number_present_in_set ('T'):4);
 IF Neuron_file_Present 
    THEN WRITE   ('Synapses : ', Avg_number_of_synapses: 4);
 IF NOT Neuron_file_Present THEN WRITE   ('NO NEURON FILE.');
 IF FG_mode     THEN WRITELN ('  Display FG.');
 IF NOT FG_mode THEN WRITELN ('  Display TF.');
 END;

PROCEDURE Do_option (Option: CHAR);
    BEGIN
    CASE Option OF
       'B','b': IF Neuron_file_present
                   THEN BSBProcedure ELSE WRITE ('No neuron file present.');
       'C','c': Make_stimulus;
       'E','e': Exit:= TRUE;
       'F','f': BEGIN
                Bottom_line;  Erase_line;
                WRITELN ('Reinitialize Files? Y/N ');
                READLN (Input_char);
                IF Input_char IN ['Y','y'] THEN File_initialize
                                      ELSE WRITELN ('No reinitialization.');
                END;
       'H','h': Help_info;
       'L','l': List_test_set;
       'M','m': FG_mode:= NOT FG_mode;
       'N','n': BEGIN
                Bottom_line;
                WRITE ('Read neuron file ');
                Read_neuron_file;
                END;
       'R','r': BEGIN
                Bottom_line;
                WRITE  ('Read which file F, G, T,  A)ll? ');
                READLN (Which_file);
                Read_file (Which_file);
                END;
       'S','s': BEGIN
                Bottom_line;
                WRITE  ('Store which file F, G, or T? ');
                READLN (Which_file);
                Write_file (Which_file);
                END;
       'T','t': Set_Threshold; 
     END;
    END;

PROCEDURE Get_command_string;
    VAR I: INTEGER;
    BEGIN
    Help_info;
    Bottom_line;
    WRITE ('C>'); 
    READLN (Command_string); 
    FOR I:=1 TO Length (Command_string) DO Do_option (Command_string [I]);
    WRITELN;
    END;

PROCEDURE Initialize;
        VAR I: INTEGER;
            VT100_Char: CHAR;
        BEGIN
        WRITE   ('VT100 Terminal? Y/N : ');         READLN (VT100_Char);
        IF VT100_Char IN ['Y','y'] THEN VT100:= TRUE ELSE VT100:= FALSE;
        Clear_screen;
        Blank_f_set;
        Blank_g_set;
        Blank_t_set;
        Threshold := 0.5;    
        Neuron_file_present:= FALSE;
        FG_mode:= FALSE;
        Exit:= False;
        Template.Length:= 60;
        FOR I:= 1 TO (Dimensionality DIV 8) DO     
                      Template [I]:= CHR (48 + I MOD 10);  {Make template.}
        END;

BEGIN {Main program}
Initialize;
File_initialize;
REPEAT Get_command_string UNTIL Exit;
Restore_scrolling;
Clear_screen;      {Tidy up for exit by restoring terminal to original.}
END. {main program}

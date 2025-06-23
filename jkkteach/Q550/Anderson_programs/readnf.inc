{Reads neuron file in from disk.  These files are composed of         }
{Pascal records of TYPE NEURON.    If the neurons are partially       }
{connected, then some synapses need not be used.  TYPE NEURON         }
{files store data as connection lists, so a partially connected       }
{system will compute faster than one that is fully connected.         }
{This is a useful technique on a VAX which does not vectorize.        }
{If these programs are run on many supercomputer or a machine with    }
{an array processor, more traditional matrix storage would be faster, }
{in spite of a number of zero entries.                                }
{Our experience has been that partial connectivity usually works      }
{better than full connectivity.  In a fully connected system, every   }
{element sees the same enviroment, which seems to problems            }
{with metastable and symmetric computational states.                  }
 

PROCEDURE Read_Neuron_File;
        VAR I, 
            Number_of_neurons: INTEGER;

    FUNCTION Found_Zero (N: Neuron): BOOLEAN;
           VAR J: INTEGER;
           Found: BOOLEAN;
           BEGIN
           Found:= FALSE;
           FOR J:= 1 TO Dimensionality DO
               IF N.Synapses [J].From = 0 THEN Found:= TRUE; 
           Found_Zero:= Found;
           END;

    FUNCTION Synapse_Number (N: Neuron): INTEGER;
           VAR First_Zero: INTEGER;
           BEGIN
           First_Zero := 0;

           IF Found_Zero (N)
              THEN REPEAT First_Zero:= First_Zero + 1 
                   UNTIL (N.Synapses [First_Zero].From = 0)
              ELSE First_Zero := Dimensionality + 1;

           Synapse_Number:= First_Zero - 1;           
           END;
    
    PROCEDURE Read_Nfile;
        VAR File_error: BOOLEAN;
        BEGIN
        OPEN (Nfile, 'Nfile', OLD, ERROR:= CONTINUE);

        IF STATUS (Nfile) = 0 
           THEN File_error:= FALSE ELSE File_error:= TRUE;

        IF NOT File_error THEN 
           BEGIN
           Neuron_file_present:= TRUE;
           RESET (Nfile);
           I:= 0;
           WHILE NOT EOF (Nfile) DO
                BEGIN
                I:= I+1;
                Neurons [I]:= Nfile^;
                GET (Nfile);
                END;
           Number_of_Neurons:= I; 
           WRITELN ('The neuron file contains ',
                     Number_of_Neurons:4,' neurons.');
           Erase_line;

           {Computes average number of synapses in neuron file.}

           FOR I:= 1 TO Dimensionality DO
               Number_of_synapses[I]:= Synapse_number (Neurons [I]);
           Avg_number_of_synapses:= 0;
           FOR I:= 1 TO Dimensionality DO
               Avg_number_of_synapses:= 
                   Number_of_synapses[I] + Avg_number_of_synapses;
           Avg_number_of_synapses:= 
               Avg_number_of_synapses DIV Dimensionality;
           WRITE   ('Average number of synapses in neuron file: '); 
           WRITELN (Avg_number_of_synapses:6);
           Erase_line;
           CLOSE (Nfile);
           END;

        {VMS Specific Error Handling.}

        IF File_error THEN BEGIN
                           Neuron_file_present:= FALSE;
                           WRITE ('Neuron file cannot be opened.');
                           IF STATUS (Nfile) = 3 
                              THEN WRITELN (' FILE NOT FOUND.')
                              ELSE WRITELN;
                           END;
        END;

        BEGIN      {Read_Neuron_File.}
        WRITELN;
        Scroll_block;
        Bottom_line;
        WRITELN ('The program is reading the neuron file.');
        Erase_line;
        WRITELN ('This is a file of TYPE NEURON.');
        Erase_line;
        Read_nfile;
        Restore_scrolling;
        WRITELN;
        END;       {Read_Neuron_File.}

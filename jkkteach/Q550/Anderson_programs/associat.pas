PROGRAM Associat (Input, Output, Ffile, Gfile, Nfile);

{Copyright James Anderson, Department of Psychology, Brown University.}
{This research was primarily supported by National Science            }
{Foundation Grants BNS-82-14728, BNS-85-18675 and BNS-90-23283        }
{to: James Anderson,  Box 1978                                        }
{    Department of Cognitive and Linguistic Sciences, Brown University}
{    Providence, RI 02912.                                            }
{    James_Anderson@brown.edu                                         }
{                                                                     }
{Please acknowledge these grants if you make use of these program     }
{in published material.                                               }
{                                                                     }
{Versions of these programs are used for the demonstrations in        }
{Chapters 15, 16, and 17 of "An Introduction to Neural Networks"      }
{by James A. Anderson, MIT Press                                      }
{                                                                     }
{These programs will run without modification on a VMS VAX.           }
{Other Pascal Compilers will probably require changes.                }
   
CONST   Number_of_neurons  = 200;

TYPE    Vector   = ARRAY [1..Number_of_neurons ] OF REAL;

	String   = PACKED ARRAY [1..60] OF CHAR;

	Stimulus = RECORD
		   Name: String;
		   Val : Vector;
		   END;

	Synapse  = RECORD Strength: REAL;
                          From: INTEGER;
                          END;
    
	Neuron   = RECORD Activity: REAL;
                          Synapses: ARRAY [1..Number_of_neurons ] OF Synapse;
                          Noutput: REAL;
                          Learningp: REAL;
                          Upperlimit: REAL;
                          Lowerlimit: REAL;
                          END;
                     
VAR     Neurons      : ARRAY [1..Number_of_neurons ] OF Neuron;

	O, Froms, Outp,
                Gout : Vector;
        Seed, 
          Number_of_synapses, 
          I, K, 
          Nr_in_f_set, Nr_in_g_set, 
          How_often, 
          Nr_of_stimuli, 
          Nr_to_learn : INTEGER;

	Ffile, Gfile  :FILE OF Stimulus;

        Use_nfile, 
           Correction, 
           Fully_connected: BOOLEAN;

	Nfile         : FILE OF Neuron;

	F_set, G_set  : ARRAY[0..100] OF Stimulus;

PROCEDURE Read_f_file;
	VAR I: INTEGER;
	BEGIN
	WRITELN;
	WRITELN ('The program is reading the FFILE.');
	WRITELN ('The dimensionality of the system is', Number_of_neurons :4);
	OPEN (Ffile, 'Ffile', OLD);
	RESET (Ffile);
	I:= 0;
	WHILE NOT EOF (Ffile) DO
		BEGIN
		I:= I+1;
		F_set[I]:= Ffile^;
		GET (Ffile);
		END;
	Nr_in_f_set:= I;
	WRITELN;
        CLOSE (Ffile);
	END;

{It is not necessary to have separate f and g sets in a strictly     }
{autoassociative system, but in other applications, the f and g sets }
{can be different.                                                   }

PROCEDURE Read_g_file;
	VAR I: INTEGER;
	BEGIN
	WRITELN;
	WRITELN ('The program is reading the GFILE.');
	OPEN (Gfile, 'Gfile', OLD);
	RESET (Gfile);
	I:= 0;
	WHILE NOT EOF (Gfile) DO
		BEGIN
		I:= I+1;
		G_set [I]:= Gfile^;
		GET (Gfile);
		END;
	Nr_in_g_set:= I;
	WRITELN;
	IF (Nr_in_g_set <> Nr_in_f_set) 
           THEN WRITELN ('WARNING! Nr. of Fs does not equal nr of Gs.');
	IF (Nr_in_g_set >= Nr_in_f_set) 
           THEN Nr_of_stimuli:= Nr_in_f_set;
	IF (Nr_in_g_set <  Nr_in_f_set) 
           THEN Nr_of_stimuli:= Nr_in_g_set;
        CLOSE (Gfile);
	END;

PROCEDURE Write_f_and_g;
        VAR I: INTEGER;
        BEGIN
        WRITELN;
        WRITELN ('F and G stimuli used.');
        FOR I:= 1 TO Nr_in_f_set DO
           BEGIN
           WRITELN;
           WRITELN (' F[',I:2,'] : ',F_set [I].Name);
           WRITELN (' G[',I:2,'] : ',G_set [I].Name);
           END;
        WRITELN;
        END;
 
FUNCTION MTH$RANDOM (VAR Seed: INTEGER): REAL; EXTERN;
 
FUNCTION Real_random: REAL;
        BEGIN
        Real_random:= MTH$RANDOM (Seed);
        END;

FUNCTION Vector_length (Dimensionality: INTEGER; V: Vector): REAL;
        VAR Sum_of_squares: REAL;
        I: INTEGER;
        BEGIN
        Sum_of_squares:= 0;
        FOR I:= 1 TO Dimensionality DO 
             Sum_of_squares:= V[I] * V[I] + Sum_of_squares;
        Vector_length:= SQRT (Sum_of_squares);
        END;
        
FUNCTION Inner_product (Dimensionality: INTEGER; A,B: Vector): REAL;
        VAR Sum_of_products: REAL;
        I: INTEGER;
        BEGIN
        Sum_of_products := 0;
        FOR I:= 1 TO Dimensionality DO
                Sum_of_products := Sum_of_products + A[I]*B[I];
        Inner_product:= Sum_of_products;
        END;

PROCEDURE Read_nfile;
	VAR I, Nr_of_neurons: INTEGER; 
	BEGIN
	WRITELN;
	WRITELN ('The program is reading the NFILE.');
	WRITELN ('This is a file of TYPE NEURON.');
	OPEN (Nfile, 'Nfile', OLD);
	RESET (Nfile);
	I:= 0;
	WHILE NOT EOF (Nfile) DO
		BEGIN
		I:= I+1;
		Neurons [I]:= Nfile^;
		GET (Nfile);
		END;
	Nr_of_neurons:= I;
	WRITELN ('NFILE contains ',Nr_of_neurons:4,' neurons.');
	IF Nr_of_neurons <> Number_of_neurons  THEN 
            WRITELN ('ERROR! Dimensionality does not agree with file size.');
	WRITELN;
        CLOSE (Nfile);
	END;
 
PROCEDURE Write_nfile;
	VAR I: INTEGER;
	BEGIN
	OPEN (Nfile, 'Nfile', NEW);
	REWRITE (Nfile);
	WRITELN;
	WRITELN ('Writing to neuron output file.');
	FOR I:= 1 TO Number_of_neurons  DO
		BEGIN
		Nfile^:= Neurons [I];
		PUT (Nfile);
		END;
	CLOSE (Nfile);
	END;
 
FUNCTION Check_froms (NR:INTEGER; Neu:Neuron):BOOLEAN;
        VAR I: INTEGER;
        Found: BOOLEAN;
        BEGIN
        Found:= FALSE;
        FOR I:= 1 TO Number_of_synapses DO
             IF Neu.Synapses [I].From = NR THEN Found:= TRUE;
        Check_froms:= Found;
        END;
 
PROCEDURE Setup;
	VAR I,J, Try: INTEGER;
        Try_again: BOOLEAN;
	BEGIN
        FOR I:=1 TO Number_of_neurons  DO
                BEGIN
                FOR J:= 1 TO Number_of_neurons  DO
                        BEGIN
                        Neurons [I].Synapses [J].Strength:= 0;
			Neurons [I].Synapses [J].From:=0;
			END;
		IF Fully_connected THEN FOR J:= 1 TO Number_of_synapses DO
	           Neurons [I].Synapses [J].From := 
                      1 + (I+J) MOD Number_of_synapses;

                IF NOT Fully_connected THEN
                   BEGIN
                   FOR J:= 1 TO Number_of_synapses DO
                        BEGIN
                        Try_again := TRUE;
                        WHILE Try_again DO 
                                BEGIN
                                Try:= TRUNC(Real_random * Number_of_neurons+1);
                                Try_again:= Check_froms (Try,Neurons [I]);
                                END;
                        Neurons [I].Synapses [J].From := Try;
                        END;
                   END;
                Neurons [I].Activity   := 0;
		Neurons [I].Learningp  := 1;
                Neurons [I].Noutput    := 0;
		Neurons [I].Upperlimit := 0;
                Neurons [I].Lowerlimit := 0;
                END;
        WRITELN ('Setup completed.');
	END;
 
PROCEDURE Initialize;
        VAR I,J,K: INTEGER;
        CH: CHAR;
        BEGIN
        WRITELN ('ASSOCIAT program.  October 28, 1994.' );
        WRITELN;
        Read_f_file;	Read_g_file; Write_f_and_g;

        WRITE ('Seed for RN generator           : ');   READLN (Seed);
        WRITELN;
	WRITE ('Number of associations to learn : ');	READLN (Nr_to_learn);
        WRITELN;
        WRITE ('Use CORRECTION procedure? Y or N: ');   READLN (CH);
        WRITELN;
        IF (CH='Y') OR (CH='y') THEN Correction:= TRUE ELSE Correction:= FALSE;
	WRITE ('Use old Nfile as start? Y or N  : ');	READLN (CH);        
        WRITELN;

        {Disk files of type NEU always have Number_of_neurons synapses.}

        IF ((CH='Y') OR (CH='y')) THEN
           Use_nfile:= TRUE ELSE Use_nfile:= FALSE; 

        IF Use_nfile THEN
           BEGIN
           Number_of_synapses:= Number_of_neurons;
           Read_nfile;
           END; 

        WRITE ('Number of synapses              : ');
        READLN (Number_of_synapses);
        WRITELN;
        IF ( (Number_of_synapses < Number_of_neurons) AND (NOT Use_nfile) )  
           THEN Fully_connected:= FALSE;

        {Full connectivity simply fills in the connections in order.}
        IF Number_of_synapses = Number_of_neurons THEN Fully_connected:= TRUE;

        {Connectivities over 80% may take a long time to connect the
         matrix because connections may not be repeated.}
        IF (Number_of_synapses > (4*Number_of_neurons  DIV 5))
           THEN WRITELN ('Warning!! May take a long time to set up matrix!');

	IF NOT Use_nfile THEN Setup;
        END;

{This procedure changes the synaptic weights.}
                        
PROCEDURE Memorize (F, G, O: Vector);
        VAR I,J: INTEGER;
	Gterm, LP: REAL;
        BEGIN

        {Guess at learning parameter, LP.             }
        {Increase for speed.  If LP is too large,     }
        {the system can become unstable.              }
        LP:=0.5/ SQR(Vector_length (Number_of_neurons ,F)); 

        FOR I:= 1 TO Number_of_neurons  DO 
                BEGIN
                {If Widrow-Hoff correction technique, then the error  }
                {is learned, otherwise, the associated output vector  }
                {is learned.                                          }

                IF Correction THEN Gterm:= (G[I]-O[I])   {Error term. }
                              ELSE Gterm:= G[I];         {Association.}

                FOR J:= 1 TO Number_of_synapses DO
                    Neurons [I].Synapses [J].Strength :=
                       LP * Gterm * F[Neurons [I].Synapses [J].From] +
                                      Neurons [I].Synapses [J].Strength;
                END;
        END;

{Matrix-vector product.}

PROCEDURE Calculate (VAR F,O: Vector);
        VAR I,J: INTEGER;
        Sum: REAL;
        BEGIN
        FOR I:= 1 TO Number_of_neurons  DO
            BEGIN
            Sum:= 0;
            FOR J:= 1 TO Number_of_synapses DO
              Sum := Sum + 
               Neurons[I].Synapses[J].Strength*F[Neurons[I].Synapses [J].From];
            O[I]:= Sum;
            END;
        END;

PROCEDURE Write_cosine (G, O: Vector);
	VAR LO, LG, Cos_between_OG: REAL;
        BEGIN
	LG:= Vector_length (Number_of_neurons, G);    
        LO:= Vector_length (Number_of_neurons, O);
	Cos_between_OG:= Inner_product (Number_of_neurons, O, G)/ (LO*LG);
	WRITE (Cos_between_OG:9);
	END;
 
BEGIN {Main program}
Initialize;
WRITELN;

{If there are a small number of stimuli, then each is presented exactly}
{once, in sequence. Effectively, this can be used to generate an       }
{outer product matrix if the correction (Widrow-Hoff) procedure is     }
{turned off.                                                           }

IF Nr_to_learn <= Nr_of_stimuli THEN 
       WRITELN ('Each stimulus presented exactly once.');
IF Nr_to_learn < Nr_of_stimuli THEN
       WRITELN ('Some stimuli not learned. Nr. to Learn = ',
                 Nr_to_learn:5, '   Nr. of Stimuli = ',Nr_of_stimuli:5);

{Does weight updating.}

FOR K:=1 TO Nr_to_learn DO
	BEGIN
	IF Nr_to_learn <= Nr_of_stimuli 
           THEN I:= K                                       {Learn in sequence.}
           ELSE I:= TRUNC (Real_Random*Nr_of_stimuli + 1);  {Learn random pair.}
	Calculate (F_set [I].Val, Gout);
	Memorize ( F_set [I].Val, G_set [I].Val, Gout);

        {Displays every 10th pair so progress can be monitored. }
        How_often:= 10;  
        IF (K MOD How_often = 0) THEN 
           BEGIN 
           WRITE (K:5,'  Nr: ',I:4); 
           WRITE ('   Cosine: ');
           Write_cosine (G_set [I].Val, Gout);
           WRITELN;
           END;
        END;
 
WRITELN;
WRITELN ('Accuracy of recall of input set.');
WRITELN;
{Gives recall accuracy for entire stimulus set for checking purposes.}
{Computes cosine between stored and retrieved association and also   }
{length of retrieved vector.                                         }

FOR I:= 1 TO Nr_of_stimuli DO
	BEGIN
	Calculate (F_set [I].Val, Outp);
	WRITELN;
	WRITELN (I:3,'  Name: ', G_set [I].Name);
	WRITE   ('  Cosine: ');
        Write_cosine (G_set [I].Val, Outp);
	WRITELN ('  Length: ', Vector_length (Number_of_neurons, Outp):9 );
	END;

Write_nfile;  {Write connections to output.}
END. {main program}

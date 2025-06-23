/********************************************************************

ALCOVE.c

Copyright (c) 1990 by John K. Kruschke

Permission to distribute and use this program for non-profit research
is hereby granted, provided that acknowledgment is made in any written
reports of research.

original edition: 14 August 1990
this edition:     17 April 1991

GENERAL INFO:
This version of ALCOVE is supposed to be a core version from which
other versions evolve.  This version does pattern-by-pattern
updates, and generates response probabilities for all output nodes
for each and every pattern presentation.  More features are discussed
in detail below.

DISCLAIMER:
I am not a professional programmer!  I'm completely self taught in C, 
and make no claims whatsoever regarding the efficiency or elegance of 
the code.  I do believe that the logic of the computations is correct, 
but if you find any bugs, please let me know.  This version compiles
without any complaints on a DECstation 3100 running Ultrix, using the
command 
  cc -O3 ALCOVE.c -lm -o ALCOVE
(the -O3 invokes the optimizer) but I don't know if it will compile 
on other machines.

FILES:
This program reads three other files that specify run parameters,
training (or probe) patterns, and the network architecture.
The user specifies the current "run_name", and the program then
looks for the three files "run_name.par", "run_name.pat", and
"run_name.net".  The response probabilities from each trial are 
written to the file "run_name.dat".  
Attention strengths for each trial are output to "run_name.att".
Information about the 
format of each file type can be found in the files
"ALCOVE.par", "ALCOVE.pat", "ALCOVE.net" and "ALCOVE.dat".
The final configuration of association weights, specificities, 
and attention strengths is dumped to the file "run_name.fin".


FLOWCHART:
The basic flow of processing in the program is very simple:
1. user enters run_name
2. read parameter file
3. read network architecture file
4. initialize
5. until patterns run out, do the following:
     read in pattern
     propagate activation
     write response probabilities to data file
     propagate error
     execute changes in network
6. end.

FEATURES (OR LACK OF FEATURES):

(i) Teacher values are specified in the pattern file as
one of three letters:
`T' = in this category 
`t' = not in this category
`n' = no teacher; i.e., don't care about this category.
The parameter file specifies what the teacher values should
be (e.g., T=+1, t=0), and specifies whether the teachers
are strict or humble.  Probe trials are implemented as patterns
with all teachers set to `n'.

(ii) Any metric power or activation power is allowed.

(iii) Attention capacity constraints and non-negativity
can be optionally imposed. However, in the present edition,
the two constraints cannot be imposed simultaneously.

(iv) Does not output any record of association weights, specificities,
or attention strengths during learning.  If you want such info, you
must write a modified version of the program.  Please name it something
else, and leave this primitive version intact!


*****************************************************************/
#include <stdio.h>
#include <math.h>
/* #include <stdlib.h> */

#define TRUE 1
#define FALSE 0
#define MAXINPUT 9
#define MAXHIDDEN 128
#define MAXOUTPUT 12

int strict, humble;
int attn_cap;
int attn_nonneg;

int trial;
int num_in, num_hid, num_out;
int pat_id;

double phi;
double lrate_spec;
double lrate_assoc;
double lrate_attn;
double init_spec;
double metricpower;
double activpower;
double in_teach, not_in_teach;

char runname[28];
char parfile[32];
char patfile[32];
char netfile[32];
char datfile[32];
char finfile[32];
char attfile[32];

FILE *parptr;
FILE *patptr;
FILE *netptr;
FILE *datptr;
FILE *finptr;
FILE *attptr;

struct out_node {
    char teach_code[2];
    double teach_val;
    double net;
    double act;
    double prob;
    double wt[MAXHIDDEN];
    double dwt[MAXHIDDEN];
    double delta;
};
struct out_node out[MAXOUTPUT];

struct hid_node {
    double dist[MAXINPUT];	/* |wt-act|^r for each dimension */
    double net;
    double spec;
    double dspec;
    double act;
    double wt[MAXINPUT];
    double delta;
};
struct hid_node hid[MAXHIDDEN];

struct in_node {
    double att;
    double datt;
    double pres;
    double act;
};
struct in_node in[MAXINPUT];

int more_patterns(void);
void get_run_name(void);
void read_parameters(void);
void read_network_architecture(void);
void initialize_learn_loop(void);
void read_pattern(void);
void propagate_activation(void);
void record_response(void);
void propagate_error(void);
void compute_change(void);
void execute_change(void);
void finalize_learn_loop(void);
void determine_teach_val(int k);
double max(double x, double y);
double min(double x, double y);


/******************* MAIN ***************************/


main()
{
    get_run_name();
    read_parameters();
    read_network_architecture();
    initialize_learn_loop();
    while (more_patterns()) {
	read_pattern();
	propagate_activation();
	record_response();
	propagate_error();
	compute_change();
	execute_change();
    }
    finalize_learn_loop();
}

/***************************************************/





void get_run_name(void)
{
    printf(" ALCOVE run name:  ");
    scanf("%s", runname);
    printf("\n");
    strcpy(parfile, runname);
    strcat(parfile, ".par");
    strcpy(patfile, runname);
    strcat(patfile, ".pat");
    strcpy(netfile, runname);
    strcat(netfile, ".net");
    strcpy(datfile, runname);
    strcat(datfile, ".dat");
    strcpy(finfile, runname);
    strcat(finfile, ".fin");
    strcpy(attfile, runname);
    strcat(attfile, ".att");
}

void read_parameters(void)
{
    parptr = fopen(parfile, "r");
    fscanf(parptr, " %d", &strict);
    if (strict == 1)
	humble = 0;
    else
	humble = 1;
    fscanf(parptr, " %lf %lf", &in_teach, &not_in_teach);
    fscanf(parptr, " %lf %lf %lf %lf %lf",
	   &phi, &lrate_assoc, &init_spec, &lrate_spec, &lrate_attn);
    fscanf(parptr, " %lf %lf", &metricpower, &activpower);
    fscanf(parptr, " %d %d", &attn_cap, &attn_nonneg);
    fclose(parptr);
    if (attn_cap && attn_nonneg) {
	printf(" ***** Currently, the attention capacity and *****\n");
	printf(" ***** non-negativity constraints cannot be  *****\n");
	printf(" ***** simultaneously imposed.               *****\n");
	exit();
    }
}

void read_network_architecture(void)
{
    int i, j;
    netptr = fopen(netfile, "r");
    fscanf(netptr, " %d %d %d", &num_in, &num_hid, &num_out);
    if (num_in > MAXINPUT) {
	printf(" ***** TOO MANY INPUT NODES *****\n");
	printf(" ***** current max=%d       *****\n", MAXINPUT);
	exit();
    }
    if (num_hid > MAXHIDDEN) {
	printf(" ***** TOO MANY HIDDEN NODES *****\n");
	printf(" ***** current max=%d        *****\n", MAXHIDDEN);
	exit();
    }
    if (num_out > MAXOUTPUT) {
	printf(" ***** TOO MANY OUTPUT NODES *****\n");
	printf(" ***** current max=%d        *****\n", MAXOUTPUT);
	exit();
    }
    for (j = 0; j < num_hid; j++) {
	for (i = 0; i < num_in; i++) {
	    fscanf(netptr, " %lf", &hid[j].wt[i]);
	}
    }
    fclose(netptr);
}

void initialize_learn_loop(void)
{
    int i, j, k;
    patptr = fopen(patfile, "r");
    datptr = fopen(datfile, "w");
    attptr = fopen(attfile, "w");
    for (j = 0; j < num_hid; j++) {
	hid[j].spec = init_spec;
    }
    for (i = 0; i < num_in; i++) {
	in[i].att = 1.0 / num_in;
    }
}

int more_patterns(void)
{
    return (fscanf(patptr, " %d", &pat_id) != EOF);
}

void read_pattern(void)
{
    int i, k;
    for (i = 0; i < num_in; i++) {
	fscanf(patptr, " %lf %lf", &in[i].pres, &in[i].act);
    }
    for (k = 0; k < num_out; k++) {
	fscanf(patptr, " %s", out[k].teach_code);
    }
}

void propagate_activation(void)
{
    int i, j, k;
    double denominator;

    for (j = 0; j < num_hid; j++) {
	hid[j].net = 0.0;
	for (i = 0; i < num_in; i++) {
	    hid[j].dist[i] = pow(fabs(hid[j].wt[i] - in[i].act), metricpower);
	    hid[j].net += in[i].pres * in[i].att * hid[j].dist[i];

	}
	hid[j].net = pow(hid[j].net, 1.0 / metricpower);
	hid[j].act = exp(-1.0 * hid[j].spec * pow(hid[j].net, activpower));
    }


    for (k = 0; k < num_out; k++) {
	out[k].net = 0.0;
	for (j = 0; j < num_hid; j++) {
	    out[k].net += out[k].wt[j] * hid[j].act;
	}
	out[k].act = out[k].net;
    }

    denominator = 0.0;
    for (k = 0; k < num_out; k++) {
	out[k].prob = exp(phi * out[k].act);
	denominator += out[k].prob;
    }
    for (k = 0; k < num_out; k++) {
	out[k].prob /= denominator;
    }
}

void record_response(void)
{
    int i, j, k;
    fprintf(datptr, " %d", pat_id);
    for (k = 0; k < num_out; k++) {
	fprintf(datptr, " %f", out[k].prob);
    }
    fprintf(datptr, "\n");

/*
   fprintf(datptr,"\n");
   for (j=0; j<num_hid; j++) {
   fprintf(datptr," %f",hid[j].act);
   }
   fprintf(datptr,"\n");
   for (j=0; j<num_hid; j++) {
   fprintf(datptr," %f",hid[j].spec);
   }
   fprintf(datptr,"\n");
   for (k=0; k<num_out; k++) {
   fprintf(datptr," %f", out[k].act);
   }
   fprintf(datptr,"\n");
 */

    fprintf(attptr, " %d", pat_id);
    for (i = 0; i < num_in; i++) {
	fprintf(attptr, " %14.11f", in[i].att);
    }
    fprintf(attptr, "\n");


}

void propagate_error(void)
{
    int j, k;
    void determine_teach_val(int k);

    for (k = 0; k < num_out; k++) {
	determine_teach_val(k);
	out[k].delta = out[k].teach_val - out[k].act;
    }
    for (j = 0; j < num_hid; j++) {
	hid[j].delta = 0.0;
	for (k = 0; k < num_out; k++) {
	    hid[j].delta += out[k].delta * out[k].wt[j];
	}
    }
}

void determine_teach_val(int k)
{
    double max(double x, double y);
    double min(double x, double y);

    if (strict) {
	if (strncmp(out[k].teach_code, "T", 1) == 0)
	    out[k].teach_val = in_teach;
	else if (strncmp(out[k].teach_code, "t", 1) == 0)
	    out[k].teach_val = not_in_teach;
	else if (strncmp(out[k].teach_code, "n", 1) == 0)
	    out[k].teach_val = out[k].act;
	else {
	    printf(" ***** INCORRECT TEACHER CODE(S) IN PATTERN FILE *****\n");
	    exit();
	}
    }
    if (humble) {
	if (strncmp(out[k].teach_code, "T", 1) == 0)
	    out[k].teach_val = max(in_teach, out[k].act);
	else if (strncmp(out[k].teach_code, "t", 1) == 0)
	    out[k].teach_val = min(not_in_teach, out[k].act);
	else if (strncmp(out[k].teach_code, "n", 1) == 0)
	    out[k].teach_val = out[k].act;
	else {
	    printf(" ***** INCORRECT TEACHER CODE(S) IN PATTERN FILE *****\n");
	    exit();
	}
    }
}

double max(double x, double y)
{
    if (x >= y)
	return (x);
    else
	return (y);
}

double min(double x, double y)
{
    if (x <= y)
	return (x);
    else
	return (y);
}

void compute_change(void)
{
    int i, j, k;
    double sum;

    for (k = 0; k < num_out; k++) {
	for (j = 0; j < num_hid; j++) {
	    out[k].dwt[j] = lrate_assoc * out[k].delta * hid[j].act;
	}
    }
    if (lrate_spec != 0.0) {
	for (j = 0; j < num_hid; j++) {
	    hid[j].dspec = (-1.0) * lrate_spec * hid[j].delta
		* hid[j].act * pow(hid[j].net, activpower);
	}
    }
    if (lrate_attn != 0.0) {
	for (i = 0; i < num_in; i++) {
	    if (in[i].pres != 0.0) {
		sum = 0.0;
		/* Edited 09 May 1995:
		   Conditional added to avoid pow(0.0,0.0) error
		   which occurs on some C compilers */
		if (activpower != metricpower) {
		    for (j = 0; j < num_hid; j++) {
			sum += hid[j].delta * hid[j].act * hid[j].spec
			    * (activpower / metricpower)
			    * pow(hid[j].net, (activpower - metricpower))
			    * in[i].pres * hid[j].dist[i];
		    }
		} else {
		    for (j = 0; j < num_hid; j++) {
			sum += hid[j].delta * hid[j].act * hid[j].spec
			    * in[i].pres * hid[j].dist[i];
		    }
		}
		in[i].datt = (-1.0) * lrate_attn * sum;
	    } else
		in[i].datt = 0.0;
	}
    }
}


void execute_change(void)
{
    int i, j, k;
    double datt_sum = 0.0;

    for (k = 0; k < num_out; k++) {
	for (j = 0; j < num_hid; j++) {
	    out[k].wt[j] += out[k].dwt[j];
	}
    }
    if (lrate_spec != 0.0) {
	for (j = 0; j < num_hid; j++) {
	    hid[j].spec += hid[j].dspec;
	}
    }
    if (lrate_attn != 0.0) {
	/* note: presently not correct if both attn_nonneg && attn_cap */
	if (attn_nonneg) {
	    for (i = 0; i < num_in; i++) {
		in[i].att += in[i].datt;
		if (in[i].att < 0.0)
		    in[i].att = 0.0;
	    }
	}
	if (attn_cap) {
	    for (i = 0; i < num_in; i++) {
		datt_sum += in[i].datt;
	    }
	    datt_sum /= num_in;
	    for (i = 0; i < num_in; i++) {
		in[i].att += (in[i].datt - datt_sum);
	    }
	}
	if (attn_cap == FALSE && attn_nonneg == FALSE) {
	    for (i = 0; i < num_in; i++) {
		in[i].att += in[i].datt;
	    }
	}
    }
}


void finalize_learn_loop(void)
{
    int i, j, k;
    fclose(patptr);
    fclose(datptr);
    fclose(attptr);
    finptr = fopen(finfile, "w");
    for (k = 0; k < num_out; k++) {
	for (j = 0; j < num_hid; j++) {
	    fprintf(finptr, " %14.9f\n", out[k].wt[j]);
	}
    }
    for (j = 0; j < num_hid; j++) {
	fprintf(finptr, " %14.9f\n", hid[j].spec);
    }
    for (i = 0; i < num_in; i++) {
	fprintf(finptr, " %14.9f\n", in[i].att);
    }
    fclose(finptr);
}


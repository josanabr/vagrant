#include "mpi.h"
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <unistd.h>
#include <time.h>
 
#define MAXVECT 10
#define MAXPROC 5
#define imprimirvector(v,n) printf("Mi vista (%d) del vector\n",myrank); for (i = 0 ; i < n; i++) printf("[%d: %d] ",myrank,v[i]); printf("\n");

int main(int argc, char *argv[])
{
    int myrank, worldsize;
    int i;
    int root;
    int vector[MAXVECT];
    int *rec_vector;
    char hostname[HOST_NAME_MAX + 1];

    gethostname(hostname, HOST_NAME_MAX + 1);
    srand(time(NULL));
    int choosen = (rand()%MAXPROC); 
    root = 0;
    // Escriba las lineas que permitan:
    //  (1) Inicializar el dominio MPI
    //  (2) Guardar en la variable 'worldsize' el numero de procesos 
    // involucrados en la ejecucion de esta app
    //  (3) Guardar el rango del proceso
    //
    // (1)
    // (2)
    // (3)

    rec_vector = (int*) malloc(sizeof(int) * MAXVECT/MAXPROC);
    for (i = 0; i < MAXVECT/MAXPROC; i++) {
      rec_vector[i] = (MAXVECT/MAXPROC) * myrank + i;
    }
    if (myrank == choosen) {
      imprimirvector(rec_vector,MAXVECT/MAXPROC);
    }
    // Escriba la linea que permite recoger los datos del vector con la 
    // instruccion MPI_Gather
    //
    // (4)
    if (myrank == root) {
      imprimirvector(vector,MAXVECT);
    }
    // Inserta la instruccion que termina el contexto de ejecucion de MPI
    //
    // (5)
    return 0;
}

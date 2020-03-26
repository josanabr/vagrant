#include "mpi.h"
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <unistd.h>
#include <time.h>
 
#define MAXVECT 10
#define MAXPROC 5
#define imprimirvector(v,n) printf("Mi vista (%d) del vector\n",myrank); for (i = 0 ; i < n; i++) printf("[%d: %d] ",myrank,v[i]);

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
    rec_vector = (int*) malloc(sizeof(int) * MAXVECT/MAXPROC);
    root = 0;
    printf("choosen %d\n", choosen);
    // Escriba las lineas que permitan:
    //  (1) Inicializar el dominio MPI
    //  (2) Guardar en la variable 'worldsize' el numero de procesos 
    // involucrados en la ejecucion de esta app
    //  (3) Guardar el rango del proceso
    //
    // (1)

    // (2)

    // (3)


    if (myrank == choosen) {
      imprimirvector(vector,MAXVECT);
    }
    if (myrank == 0) { // proceso con rango 0 inicializara el vector
      for (i = 0; i < MAXVECT; i++)
        vector[i] = i;
    }
    // Escriba la linea que permite distribuir el vector con la instruccion
    // MPI_Scatter. Use la variable 'rec_vector' para recibir los datos.
    //
    // (4)

    //
    if (myrank == choosen) {
      imprimirvector(rec_vector,MAXVECT/MAXPROC);
    }
    // Inserta la instruccion que termina el contexto de ejecucion de MPI
    //
    // (5)

    return 0;
}

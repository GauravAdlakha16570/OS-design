#include "types.h"
#include "stat.h"
#include "user.h"
#include "mmu.h"
#include "fcntl.h"
#include "x86.h"

static int targetcaptures;
static int sem_index;
static int count;
int winnerflag;


void *capturetheflag(void * arg){ //thread must enter critical region to get a flag cap
    int tid = *(int*)arg;
    int numcaptures = 0;

    while(numcaptures < targetcaptures){
        sleep(2);
        semaphore_wait(sem_index, 1);
        if(winnerflag){
            printf(1, "Thread %d finished with ", tid);
            printf(1, "%d captures.\n", numcaptures);
            semaphore_signal(sem_index, 1);
            exit();
        }
        numcaptures++;
        
        printf(1, "Thread %d has captured the flag!", tid);
        printf(1, "It has %d captures\n", numcaptures);
        semaphore_signal(sem_index, 1);


        
    }
    winnerflag = 1;
    printf(1, "Thread %d won!\n", tid);
    exit();

}

int main (int argc, char *argv[]){

    if (argc < 2 || argc > 3){
        printf(1, "Enter # of Threads and # of Captures to win\n");
        exit();
    }
    else if (argc == 2){
        targetcaptures = 10; //default is 10 if user doesnt provide one
    }
    else if (argc == 3){
        targetcaptures = atoi(argv[2]);
    }

    int numthreads = atoi(argv[1]);
    sem_index = semaphore_init(1);
    count = 1;
    winnerflag = 0;

    void *stacks[numthreads];
    int *args[numthreads];

    for(int i = 0; i < numthreads; i++){ //allocate stacks and args

        stacks[i] = (void*)malloc(2*PGSIZE);
        if((uint)stacks[i] % PGSIZE){ //check if mem is page aligned
            stacks[i] = stacks[i] + (PGSIZE - (uint)stacks[i] % PGSIZE); //adjusts where the stack is so its page aligned
        }

        args[i] = (int*)malloc(sizeof(int)); //allocate mem for the arguments
    }

    for (int i = 0; i < numthreads; i++){
        *args[i] = i;
        clone(&capturetheflag, stacks[i], args[i]);
    }

    for (int i = 0; i < numthreads; i++){

        join();
    }

    exit();

}
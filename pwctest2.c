#include "types.h"
#include "stat.h"
#include "user.h"
#include "mmu.h"
#include "fcntl.h"
#include "x86.h"

int global;
int flag;
int sem_index;
int num_threads;

//Final result should be 4

void *add(void *arg){
    
    if (flag){
        semaphore_wait(sem_index, 2); //needs to be 2 to run
    }
    //printf(1, "Add\n");
    global = global + 8; //Should be step 3 with semaphore
    printf(1, "Add: Global = %d\n", global);

    if (flag){
        semaphore_signal(sem_index, 3); //allows divide to now run
    }
    exit();
}

void *multiply(void *arg){
    
    if (flag){
        semaphore_wait(sem_index, 1); //should always go in if its initialized
    }
    //printf(1, "Multiply\n");
    global = global * 4; //Should be step 2 with semaphore
    printf(1, "Multiply: Global = %d\n", global);

    if (flag){
        semaphore_signal(sem_index, 2); //allows add to now run
    }
    exit();
}

void *sub(void *arg){
    
    if (flag){
        semaphore_wait(sem_index, 4); //wait till divide has signaled
    }
    //printf(1, "Subtract\n");
    global = global - 4; //Should be step 5 with semaphore
    printf(1, "Subtract: Global = %d\n", global);

    if (flag){
        semaphore_signal(sem_index, 1); //resets it to 1
    }
    exit();
}

void *divide(void *arg){
    
    if (flag){
        semaphore_wait(sem_index, 3); //wait till after add has signaled
    }
    //printf(1, "Divide\n");
    global = global / 6; //Should be step 4 with semaphore
    printf(1, "Divide: Global = %d\n", global);

    if (flag){
        semaphore_signal(sem_index, 4); //allow subtract to run
    }
    exit();
}


int main(int argc, char *argv[]){

    if(argc < 2 || argc > 2){
        printf(1, "Needs 1 argument\n 0: Without Semaphore \n 1: With Semaphore\n");
        printf(1, "Please try again\n");
        exit();
    } else if (atoi(argv[1]) == 0){
        flag = 0;
    } else if (atoi(argv[1]) == 1){
        flag = 1;
    } else{
        printf(1, "Argument must be either 0 or 1\n");
        exit();
    }

    num_threads = 4;
    global = 10; //this is the first step in calculating 10

    void *stacks[num_threads];

    
    //create the stacks for all the threads
    for(int i = 0; i < num_threads; i++){
        stacks[i] = (void*)malloc(2*PGSIZE);
        if((uint)stacks[i] % PGSIZE){ //check if mem is page aligned
            stacks[i] = stacks[i] + (PGSIZE - (uint)stacks[i] % PGSIZE); //adjusts where the stack is so its page aligned
        }
    }

    sem_index = semaphore_init(1);

    clone(&add, stacks[0], 0);
    clone(&sub, stacks[1], 0);
    clone(&multiply, stacks[2], 0);
    clone(&divide, stacks[3], 0);

    for (int i = 0; i < num_threads; i++){
        join();
    }

    semaphore_close(sem_index); //reset the semaphore

    printf(1, "Parent: Global Final Value is %d\n", global);

    exit();
}
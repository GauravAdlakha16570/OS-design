#include "types.h"
#include "stat.h"
#include "user.h"
#include "mmu.h"
#include "fcntl.h"
#include "x86.h"

int global;

//This test has the parent and the child executing operations on global var
//The semaphore limits the order they can execute their operations
//Correct order:
//1: global = 4
//2: global = global + 1
//3: global = global * 2
//4: global = global + 5
//5: Final value should be 15


void *child(void *arg){
    printf(1, "Child: starting\n");
    int index = *(int*)arg;
    //printf(1, "Sem Index: %d\n", index);

    global++; //adds 1 to global

    printf(1, "Child: signaling the parent with resource of 2\n");
    semaphore_signal(index, 1); //adds one to the resource pool so parent can run

    semaphore_wait(index, 3); //waits until parent adds 3 resources
    printf(1, "Child: Resource is 3, child is executing\n");

    global = global + 5;

    printf(1, "Child: Signaling the parent with resource of 4\n");
    semaphore_signal(index, 4); //adds 4 so parent can run

    exit();
}

int main(int argc, char *argv[]){

    int sem_index = semaphore_init(1); //sets the initial available resources to 1
    printf(1, "Global initial value is 4\n");
    printf(1, "Parent: begin \n");

    global = 4;

    void *stack = (void*)malloc(PGSIZE*2);
    if((uint)stack % PGSIZE){
        stack = stack + (PGSIZE - (uint)stack % PGSIZE); //page aligns the stack
    }

    int *arg = (int*)malloc(sizeof(int));

    *arg = sem_index;

    clone(&child, stack, (void*)arg);

    semaphore_wait(sem_index, 2); //it needs the resources value to be 2

    printf(1, "Parent: Resource is 2, parent is executing\n");

    global = global*2; //doubles the shared value

    printf(1, "Parent: signaling the child with resource of 3\n");
    semaphore_signal(sem_index, 3);

    semaphore_wait(sem_index, 4);

    printf(1, "Parent: Resource is 4, parent is executing\n");

    printf(1, "Global Value: %d\n", global);

    printf(1, "Parent: end\n");

    exit();
}
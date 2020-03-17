#include "types.h"
#include "stat.h"
#include "user.h"
#include "mmu.h"
#include "fcntl.h"
#include "x86.h"
 
int num_threads = 3;

 

 void *testfunc(void *arg) {

     int num = *(int*)arg;
	 
     if (num == 0){
         sleep(1000);
     }
     else if (num == 1){
         sleep(100);
     }
     else if (num == 2){
         sleep(500);
     }

     
     printf(1, "Thread %d exitting\n", num);

	 exit();
 }
 
 
 
int
main(void)
{
	void *stacks[num_threads];
    int *args[num_threads];

    for (int i = 0; i < num_threads; i++) {
        stacks[i] = (void*)malloc(2*PGSIZE); //allocate a stack for each thread
        if((uint)stacks[i] % PGSIZE){ //check if mem is page aligned
            stacks[i] = stacks[i] + (PGSIZE - (uint)stacks[i] % PGSIZE); //adjusts where the stack is so its page aligned
        }

        args[i] = (int*)malloc(4); //each argument gets a spot in memory
        if (!args[i]) {
            printf(1, "main: could not allocate args");
            exit();
        }

        *args[i] = i;
    }

    printf(1, "main: running with %d threads.\n", num_threads);

    //Time to make the threads
    int tid = 0;

    for (int i = 0; i < num_threads; i++) {
        tid = clone(&testfunc, stacks[i], args[i]);
        //sleep(100);
        printf(1, "main: created thread with tid: %d\n", tid);
    }

    //Time to wait for all of them to finish
    

    for (int i = 0; i < num_threads; i++) {
        printf(1, "starting join\n");
        tid = join();
        printf(1, "thread %d joined\n", tid);
    }

    printf(1, "main: all threads joined\n");
	

  exit();
}

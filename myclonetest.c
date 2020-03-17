#include "types.h"
#include "stat.h"
#include "user.h"
 
 int arr[20];
 int i = 0;
 int someint = 0;
 int j = 0;
 
 int stack[4096] __attribute__ ((aligned (4096)));
 void *somefunc(void *param) {
	 int num = (int)param;
	 num += 1;
	 
	someint += arr[j];
	j++;
	/* else if (i < 15 ) {
		 for (j = 10; j < 15; j++) {
			 someint += arr[j];
			 printf(1, "x is at %p\n", x);
		 }
	 }
	 else if (i < 20 ) {
		 for (j = 15; j < 20; j++) {
			 someint += arr[j];
			 printf(1, "x is at %p\n", x);
		 }
	 }*/
	 
	 exit();
 }
 
 
 
int
main(void)
{
	for (i = 0; i < 20; i++) {
		arr[i] = i;
		printf(1, "arr at i is %d\n", i);
		
	}
	int tid = 0;
  	int numb = 0;
  	for (i = 0; i < 20; i++) {
		 tid = clone(&somefunc, (void*)stack, (void*)numb);
		 //printf(1, "tid = %d\n", tid);
		 sleep(100);
		 printf(1, "x is at %d\n", someint);
		 
}
printf(1, "tid = %d\n", tid);

//printf(1, "tid = %d\n", tid);

  /*printf(1, "tid = %d\n", tid);
  
   printf(1, "Stack is at %p\n", stack);
  // int tid = fork();
  int tid = clone(&somefunc, (void*)stack, (void*)numb);

  if (tid < 0) {
    printf(2, "error!\n");
  } else if (tid == 0) {
    // child
    for(;;) {
      x++;
      sleep(100);
    }
  } else {
    // parent
    for(;;) {
      printf(1, "x = %d\n", x);
      sleep(100);
    }
  }
  
  int tid = clone(&somefunc, (void*)stack, (void*)numb);
  if (tid == 0) {
	  printf(1, "this is the thread process. My pid is %d and my parent's id is %d.\n", getpid(), tid);
  }
  else {
	  printf(1, "this is the parent process. My pid is %d and my parent's id is %d.\n", getpid(), tid);
  }*/ 
  exit();
}

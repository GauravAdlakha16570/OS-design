#include "types.h"
#include "stat.h"
#include "user.h"
#include "mmu.h"
#include "fcntl.h"
#include "x86.h"


int global = 1;
int param = 69;
volatile uint newfd = 0;

void assert(int expression){
    if (!expression){
        printf(1, "Assertion incorrect");
        exit();
    }
}

void *testfunc1(void *arg){
    assert(global == 1);
    global = 6;
    exit();
}

void test1(){
    //int ppid = getpid();
    printf(1, "1) Clone Test: Shared Address Space\n");
    void *stack = (void*)malloc(PGSIZE*2);
    if((uint)stack % PGSIZE){
        stack = stack + (PGSIZE - (uint)stack % PGSIZE); //page aligns the stack
    }

    int tid = clone(&testfunc1, stack, 0);
    assert(tid > 0);
    while(global != 6);
    printf(1, "Test Passed\n");
    exit();
}

void *testfunc2(void *arg){
    int temp = *(int*)arg;
    //printf(1, "temp: %d\n", temp);
    *(int*)arg = 1;
    global = temp;
    //printf(1, "global: %d\n", global);
    exit();
}

void test2(){
    void *stack = (void*)malloc(PGSIZE*2);
    if((uint)stack % PGSIZE){
        stack = stack + (PGSIZE - (uint)stack % PGSIZE);
    }

    clone(&testfunc2, stack, (void*)&param);
    //assert(tid > 0);
    while(global != 69){
        
        sleep(10); //this while loop has to do something or else it never is true, weird
    }

    printf(1, "Test Passed\n");
    exit();
}

void *testfunc3(void *arg){
    assert(write(3, "hello\n", 6) == 6);
    xchg(&newfd, open("tmp2", O_WRONLY | O_CREATE));
    exit();
}

void test3(){
    
    void *stack = (void*)malloc(PGSIZE*2);
    if((uint)stack % PGSIZE){
        stack = stack + (PGSIZE - (uint)stack % PGSIZE);
    }

    int fd = open("tmp", O_WRONLY | O_CREATE);
    assert(fd == 3);
    //printf(1, "fd: %d\n", fd);
    clone(&testfunc3, stack, 0);

    while(!newfd);
    assert(write(newfd, "goodbye\n",8) == -1);
    printf(1, "Test Passed\n");
    exit();
}

void *testfunc4(void *arg){
    exit();
}

void test4(){
    
    void *stack = (void*)malloc(PGSIZE*2);
    if((uint)stack % PGSIZE == 0){ // creates a not page aligned stack
        stack = stack + 4;
    }

    assert(clone(&testfunc4, stack, 0) == -1);

    
    
    printf(1, "Test Passed\n");
    exit();
}

int
main(int argc, char *argv[]){

    

    if (*argv[1] == '1'){
        //printf(1, "1) Clone Test: Shared Address Space\n");
        test1();
    } else if (*argv[1] == '2'){
        printf(1, "2) Clone Test: Pass One Argument\n");
        test2();
    } else if (*argv[1] == '3'){
        printf(1, "3) Clone Test: Copy file descriptors, but doesn't share\n");
        test3();
    } else if (*argv[1] == '4'){
        printf(1, "4) Clone Test: Bad stack argument\n");
        test4();
    } else {
        printf(1, "Not a valid test number\n");
    }

    exit();
}
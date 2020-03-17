#include "uthread.h"

extern void uthread_switch(void); //assembly function

void
uthread_init(void){

    curr_t = &threads[0];
    curr_t->state = RUNNING;
}

int
uthread_create(void (*func)()){

    struct uthread *i;
    int j = 0;

    for (i = threads; i < threads + MAX_THREADS; i++){
        if (i->state == FREE){
            //found one
            break;
        }
        else {
            j++;
        }
    }

    i->sp = (int)(i->stack + STACK_SIZE);
    i->sp = i->sp - 4;
    *(int*)(i->sp) = (int)func; //push function pointer to stack
    i->sp = i->sp - 32;
    i->state = RUNNABLE;

    return j;
}

static void
uthread_schedule(void){

    struct uthread *i;
    next_t = 0; //reset next thread

    for (i = threads; i < threads + MAX_THREADS; i++){
        if (i->state == RUNNABLE && i != curr_t){
            next_t = i;
            break;
        }
    }

    if (i >= threads + MAX_THREADS && curr_t->state == RUNNABLE){
        next_t = curr_t;
    }

    if (next_t == 0){
        printf(1, "thread schedule: no runnable threads\n");
        exit();
    }

    if (curr_t != next_t){
        next_t->state = RUNNING;
        uthread_switch();
    } else {
        next_t = 0;
    }
}

void
uthread_yield(void){

    curr_t->state = RUNNABLE;
    uthread_schedule();
}

void
uthread_exit(void){
    curr_t->state = FREE;
    uthread_schedule();
}

static void 
testfunc(void){
    
    int i;
    printf(1, "testfunc running\n");
    for (i = 0; i < 50; i++){
        printf(1, "my thread 0x%x\n", (int)curr_t);
        uthread_yield();
    }
    printf(1, "testfunc: exit\n");
    uthread_exit();
}

int
main(void){

    uthread_init();
    for(int i = 0; i < 4; i++){
        uthread_create(testfunc);
    }
    uthread_schedule();
    exit();
}
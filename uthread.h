#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "fcntl.h"
#include "syscall.h"
#include "traps.h"

#define FREE        0x0
#define RUNNING     0x1
#define RUNNABLE    0x2

#define MAX_THREADS 3
#define STACK_SIZE 8192 //2 pages
struct uthread {
    int sp;
    void *stack[STACK_SIZE];
    int state;
    //int tid;
};


static struct uthread threads[MAX_THREADS];
struct uthread *curr_t;
struct uthread *next_t;

_uthread:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    printf(1, "testfunc: exit\n");
    uthread_exit();
}

int
main(void){
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
    curr_t->state = RUNNING;
   7:	b8 01 00 00 00       	mov    $0x1,%eax
   c:	ba 04 00 00 00       	mov    $0x4,%edx
main(void){
  11:	ff 71 fc             	pushl  -0x4(%ecx)
  14:	55                   	push   %ebp
  15:	89 e5                	mov    %esp,%ebp
  17:	57                   	push   %edi
  18:	56                   	push   %esi
  19:	53                   	push   %ebx
  1a:	51                   	push   %ecx
    for (i = threads; i < threads + MAX_THREADS; i++){
  1b:	be f8 8d 01 00       	mov    $0x18df8,%esi
  20:	b9 40 01 00 00       	mov    $0x140,%ecx
  25:	bb 00 0e 02 00       	mov    $0x20e00,%ebx
main(void){
  2a:	83 ec 08             	sub    $0x8,%esp
        if (i->state == FREE){
  2d:	85 c0                	test   %eax,%eax
    curr_t = &threads[0];
  2f:	c7 05 0c 0e 02 00 e0 	movl   $0xde0,0x20e0c
  36:	0d 00 00 
    curr_t->state = RUNNING;
  39:	c7 05 e4 8d 00 00 01 	movl   $0x1,0x8de4
  40:	00 00 00 
        if (i->state == FREE){
  43:	74 48                	je     8d <main+0x8d>
  45:	a1 ec 0d 01 00       	mov    0x10dec,%eax
  4a:	85 c0                	test   %eax,%eax
  4c:	74 54                	je     a2 <main+0xa2>
  4e:	8b 3d f4 8d 01 00    	mov    0x18df4,%edi
  54:	85 ff                	test   %edi,%edi
  56:	74 51                	je     a9 <main+0xa9>
    for (i = threads; i < threads + MAX_THREADS; i++){
  58:	a1 fc 0d 02 00       	mov    0x20dfc,%eax
  5d:	85 c0                	test   %eax,%eax
  5f:	89 d8                	mov    %ebx,%eax
  61:	0f 44 c6             	cmove  %esi,%eax
    i->sp = i->sp - 4;
  64:	8d b8 00 80 00 00    	lea    0x8000(%eax),%edi
    *(int*)(i->sp) = (int)func; //push function pointer to stack
  6a:	89 88 00 80 00 00    	mov    %ecx,0x8000(%eax)
    i->state = RUNNABLE;
  70:	c7 80 04 80 00 00 02 	movl   $0x2,0x8004(%eax)
  77:	00 00 00 
    i->sp = i->sp - 4;
  7a:	89 38                	mov    %edi,(%eax)
    i->sp = i->sp - 32;
  7c:	83 28 20             	subl   $0x20,(%eax)

    uthread_init();
    for(int i = 0; i < 4; i++){
  7f:	83 ea 01             	sub    $0x1,%edx
  82:	74 14                	je     98 <main+0x98>
  84:	a1 e4 8d 00 00       	mov    0x8de4,%eax
        if (i->state == FREE){
  89:	85 c0                	test   %eax,%eax
  8b:	75 b8                	jne    45 <main+0x45>
    for (i = threads; i < threads + MAX_THREADS; i++){
  8d:	b8 e0 0d 00 00       	mov    $0xde0,%eax
  92:	eb d0                	jmp    64 <main+0x64>
  94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        uthread_create(testfunc);
    }
    uthread_schedule();
  98:	e8 13 00 00 00       	call   b0 <uthread_schedule>
    exit();
  9d:	e8 80 04 00 00       	call   522 <exit>
    for (i = threads; i < threads + MAX_THREADS; i++){
  a2:	b8 e8 8d 00 00       	mov    $0x8de8,%eax
  a7:	eb bb                	jmp    64 <main+0x64>
  a9:	b8 f0 0d 01 00       	mov    $0x10df0,%eax
  ae:	eb b4                	jmp    64 <main+0x64>

000000b0 <uthread_schedule>:
        if (i->state == RUNNABLE && i != curr_t){
  b0:	8b 15 0c 0e 02 00    	mov    0x20e0c,%edx
    next_t = 0; //reset next thread
  b6:	c7 05 10 0e 02 00 00 	movl   $0x0,0x20e10
  bd:	00 00 00 
    for (i = threads; i < threads + MAX_THREADS; i++){
  c0:	b8 e0 0d 00 00       	mov    $0xde0,%eax
        if (i->state == RUNNABLE && i != curr_t){
  c5:	83 b8 04 80 00 00 02 	cmpl   $0x2,0x8004(%eax)
  cc:	74 22                	je     f0 <uthread_schedule+0x40>
    for (i = threads; i < threads + MAX_THREADS; i++){
  ce:	05 08 80 00 00       	add    $0x8008,%eax
  d3:	3d 00 0e 02 00       	cmp    $0x20e00,%eax
  d8:	75 eb                	jne    c5 <uthread_schedule+0x15>
    if (i >= threads + MAX_THREADS && curr_t->state == RUNNABLE){
  da:	83 ba 04 80 00 00 02 	cmpl   $0x2,0x8004(%edx)
  e1:	75 43                	jne    126 <uthread_schedule+0x76>
        next_t = 0;
  e3:	c7 05 10 0e 02 00 00 	movl   $0x0,0x20e10
  ea:	00 00 00 
  ed:	c3                   	ret    
  ee:	66 90                	xchg   %ax,%ax
        if (i->state == RUNNABLE && i != curr_t){
  f0:	39 c2                	cmp    %eax,%edx
  f2:	74 da                	je     ce <uthread_schedule+0x1e>
    if (i >= threads + MAX_THREADS && curr_t->state == RUNNABLE){
  f4:	3d 00 0e 02 00       	cmp    $0x20e00,%eax
            next_t = i;
  f9:	a3 10 0e 02 00       	mov    %eax,0x20e10
    if (i >= threads + MAX_THREADS && curr_t->state == RUNNABLE){
  fe:	73 13                	jae    113 <uthread_schedule+0x63>
    if (next_t == 0){
 100:	85 c0                	test   %eax,%eax
 102:	74 22                	je     126 <uthread_schedule+0x76>
        next_t->state = RUNNING;
 104:	c7 80 04 80 00 00 01 	movl   $0x1,0x8004(%eax)
 10b:	00 00 00 
        uthread_switch();
 10e:	e9 95 01 00 00       	jmp    2a8 <uthread_switch>
    if (i >= threads + MAX_THREADS && curr_t->state == RUNNABLE){
 113:	83 ba 04 80 00 00 02 	cmpl   $0x2,0x8004(%edx)
 11a:	75 e4                	jne    100 <uthread_schedule+0x50>
    if (next_t == 0){
 11c:	85 d2                	test   %edx,%edx
        next_t = curr_t;
 11e:	89 15 10 0e 02 00    	mov    %edx,0x20e10
    if (next_t == 0){
 124:	75 bd                	jne    e3 <uthread_schedule+0x33>
uthread_schedule(void){
 126:	55                   	push   %ebp
 127:	89 e5                	mov    %esp,%ebp
 129:	83 ec 10             	sub    $0x10,%esp
        printf(1, "thread schedule: no runnable threads\n");
 12c:	68 f8 09 00 00       	push   $0x9f8
 131:	6a 01                	push   $0x1
 133:	e8 68 05 00 00       	call   6a0 <printf>
        exit();
 138:	e8 e5 03 00 00       	call   522 <exit>
 13d:	8d 76 00             	lea    0x0(%esi),%esi

00000140 <testfunc>:
testfunc(void){
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	53                   	push   %ebx
    printf(1, "testfunc running\n");
 144:	bb 32 00 00 00       	mov    $0x32,%ebx
testfunc(void){
 149:	83 ec 0c             	sub    $0xc,%esp
    printf(1, "testfunc running\n");
 14c:	68 20 0a 00 00       	push   $0xa20
 151:	6a 01                	push   $0x1
 153:	e8 48 05 00 00       	call   6a0 <printf>
 158:	83 c4 10             	add    $0x10,%esp
 15b:	90                   	nop
 15c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf(1, "my thread 0x%x\n", (int)curr_t);
 160:	83 ec 04             	sub    $0x4,%esp
 163:	ff 35 0c 0e 02 00    	pushl  0x20e0c
 169:	68 32 0a 00 00       	push   $0xa32
 16e:	6a 01                	push   $0x1
 170:	e8 2b 05 00 00       	call   6a0 <printf>
    curr_t->state = RUNNABLE;
 175:	a1 0c 0e 02 00       	mov    0x20e0c,%eax
 17a:	c7 80 04 80 00 00 02 	movl   $0x2,0x8004(%eax)
 181:	00 00 00 
    uthread_schedule();
 184:	e8 27 ff ff ff       	call   b0 <uthread_schedule>
    for (i = 0; i < 50; i++){
 189:	83 c4 10             	add    $0x10,%esp
 18c:	83 eb 01             	sub    $0x1,%ebx
 18f:	75 cf                	jne    160 <testfunc+0x20>
    printf(1, "testfunc: exit\n");
 191:	83 ec 08             	sub    $0x8,%esp
 194:	68 42 0a 00 00       	push   $0xa42
 199:	6a 01                	push   $0x1
 19b:	e8 00 05 00 00       	call   6a0 <printf>
    curr_t->state = FREE;
 1a0:	a1 0c 0e 02 00       	mov    0x20e0c,%eax
    uthread_schedule();
 1a5:	83 c4 10             	add    $0x10,%esp
    curr_t->state = FREE;
 1a8:	c7 80 04 80 00 00 00 	movl   $0x0,0x8004(%eax)
 1af:	00 00 00 
}
 1b2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1b5:	c9                   	leave  
    uthread_schedule();
 1b6:	e9 f5 fe ff ff       	jmp    b0 <uthread_schedule>
 1bb:	90                   	nop
 1bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001c0 <uthread_init>:
uthread_init(void){
 1c0:	55                   	push   %ebp
    curr_t = &threads[0];
 1c1:	c7 05 0c 0e 02 00 e0 	movl   $0xde0,0x20e0c
 1c8:	0d 00 00 
    curr_t->state = RUNNING;
 1cb:	c7 05 e4 8d 00 00 01 	movl   $0x1,0x8de4
 1d2:	00 00 00 
uthread_init(void){
 1d5:	89 e5                	mov    %esp,%ebp
}
 1d7:	5d                   	pop    %ebp
 1d8:	c3                   	ret    
 1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001e0 <uthread_create>:
        if (i->state == FREE){
 1e0:	a1 e4 8d 00 00       	mov    0x8de4,%eax
uthread_create(void (*func)()){
 1e5:	55                   	push   %ebp
 1e6:	89 e5                	mov    %esp,%ebp
        if (i->state == FREE){
 1e8:	85 c0                	test   %eax,%eax
 1ea:	74 54                	je     240 <uthread_create+0x60>
 1ec:	a1 ec 0d 01 00       	mov    0x10dec,%eax
 1f1:	85 c0                	test   %eax,%eax
 1f3:	74 5b                	je     250 <uthread_create+0x70>
 1f5:	8b 0d f4 8d 01 00    	mov    0x18df4,%ecx
 1fb:	85 c9                	test   %ecx,%ecx
 1fd:	74 61                	je     260 <uthread_create+0x80>
            j++;
 1ff:	83 3d fc 0d 02 00 01 	cmpl   $0x1,0x20dfc
 206:	8b 15 fc 0d 02 00    	mov    0x20dfc,%edx
 20c:	b9 00 0e 02 00       	mov    $0x20e00,%ecx
 211:	19 c0                	sbb    %eax,%eax
 213:	83 c0 04             	add    $0x4,%eax
 216:	85 d2                	test   %edx,%edx
 218:	ba f8 8d 01 00       	mov    $0x18df8,%edx
 21d:	0f 45 d1             	cmovne %ecx,%edx
    i->sp = i->sp - 4;
 220:	8d 8a 00 80 00 00    	lea    0x8000(%edx),%ecx
    i->state = RUNNABLE;
 226:	c7 82 04 80 00 00 02 	movl   $0x2,0x8004(%edx)
 22d:	00 00 00 
    i->sp = i->sp - 4;
 230:	89 0a                	mov    %ecx,(%edx)
    *(int*)(i->sp) = (int)func; //push function pointer to stack
 232:	8b 4d 08             	mov    0x8(%ebp),%ecx
    i->sp = i->sp - 32;
 235:	83 2a 20             	subl   $0x20,(%edx)
    *(int*)(i->sp) = (int)func; //push function pointer to stack
 238:	89 8a 00 80 00 00    	mov    %ecx,0x8000(%edx)
}
 23e:	5d                   	pop    %ebp
 23f:	c3                   	ret    
    for (i = threads; i < threads + MAX_THREADS; i++){
 240:	ba e0 0d 00 00       	mov    $0xde0,%edx
 245:	eb d9                	jmp    220 <uthread_create+0x40>
 247:	89 f6                	mov    %esi,%esi
 249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
            j++;
 250:	b8 01 00 00 00       	mov    $0x1,%eax
    for (i = threads; i < threads + MAX_THREADS; i++){
 255:	ba e8 8d 00 00       	mov    $0x8de8,%edx
 25a:	eb c4                	jmp    220 <uthread_create+0x40>
 25c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            j++;
 260:	b8 02 00 00 00       	mov    $0x2,%eax
    for (i = threads; i < threads + MAX_THREADS; i++){
 265:	ba f0 0d 01 00       	mov    $0x10df0,%edx
 26a:	eb b4                	jmp    220 <uthread_create+0x40>
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000270 <uthread_yield>:
    curr_t->state = RUNNABLE;
 270:	a1 0c 0e 02 00       	mov    0x20e0c,%eax
uthread_yield(void){
 275:	55                   	push   %ebp
 276:	89 e5                	mov    %esp,%ebp
    curr_t->state = RUNNABLE;
 278:	c7 80 04 80 00 00 02 	movl   $0x2,0x8004(%eax)
 27f:	00 00 00 
}
 282:	5d                   	pop    %ebp
    uthread_schedule();
 283:	e9 28 fe ff ff       	jmp    b0 <uthread_schedule>
 288:	90                   	nop
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000290 <uthread_exit>:
    curr_t->state = FREE;
 290:	a1 0c 0e 02 00       	mov    0x20e0c,%eax
uthread_exit(void){
 295:	55                   	push   %ebp
 296:	89 e5                	mov    %esp,%ebp
    curr_t->state = FREE;
 298:	c7 80 04 80 00 00 00 	movl   $0x0,0x8004(%eax)
 29f:	00 00 00 
}
 2a2:	5d                   	pop    %ebp
    uthread_schedule();
 2a3:	e9 08 fe ff ff       	jmp    b0 <uthread_schedule>

000002a8 <uthread_switch>:
.text
	.globl uthread_switch
uthread_switch:
	/* Save all register to curr->stack*/
	pushal
 2a8:	60                   	pusha  

	/* Save curr->sp */
	movl curr_t, %eax
 2a9:	a1 0c 0e 02 00       	mov    0x20e0c,%eax
	movl %esp, (%eax)
 2ae:	89 20                	mov    %esp,(%eax)

	/* Switch to next_t stack */
	movl next_t, %eax
 2b0:	a1 10 0e 02 00       	mov    0x20e10,%eax
	movl (%eax), %esp
 2b5:	8b 20                	mov    (%eax),%esp

	/* Set curr_t to next_t */
	movl %eax, curr_t
 2b7:	a3 0c 0e 02 00       	mov    %eax,0x20e0c

	/* Restore next_thread's register state */
	popal
 2bc:	61                   	popa   

	/* Set next_thread to 0 */
	movl $0, next_t
 2bd:	c7 05 10 0e 02 00 00 	movl   $0x0,0x20e10
 2c4:	00 00 00 

	/* After `popal`, %esp now points to return address. Pop it and jump. */
 2c7:	c3                   	ret    
 2c8:	66 90                	xchg   %ax,%ax
 2ca:	66 90                	xchg   %ax,%ax
 2cc:	66 90                	xchg   %ax,%ax
 2ce:	66 90                	xchg   %ax,%ax

000002d0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	53                   	push   %ebx
 2d4:	8b 45 08             	mov    0x8(%ebp),%eax
 2d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2da:	89 c2                	mov    %eax,%edx
 2dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2e0:	83 c1 01             	add    $0x1,%ecx
 2e3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 2e7:	83 c2 01             	add    $0x1,%edx
 2ea:	84 db                	test   %bl,%bl
 2ec:	88 5a ff             	mov    %bl,-0x1(%edx)
 2ef:	75 ef                	jne    2e0 <strcpy+0x10>
    ;
  return os;
}
 2f1:	5b                   	pop    %ebx
 2f2:	5d                   	pop    %ebp
 2f3:	c3                   	ret    
 2f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000300 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	53                   	push   %ebx
 304:	8b 55 08             	mov    0x8(%ebp),%edx
 307:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 30a:	0f b6 02             	movzbl (%edx),%eax
 30d:	0f b6 19             	movzbl (%ecx),%ebx
 310:	84 c0                	test   %al,%al
 312:	75 1c                	jne    330 <strcmp+0x30>
 314:	eb 2a                	jmp    340 <strcmp+0x40>
 316:	8d 76 00             	lea    0x0(%esi),%esi
 319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 320:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 323:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 326:	83 c1 01             	add    $0x1,%ecx
 329:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 32c:	84 c0                	test   %al,%al
 32e:	74 10                	je     340 <strcmp+0x40>
 330:	38 d8                	cmp    %bl,%al
 332:	74 ec                	je     320 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 334:	29 d8                	sub    %ebx,%eax
}
 336:	5b                   	pop    %ebx
 337:	5d                   	pop    %ebp
 338:	c3                   	ret    
 339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 340:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 342:	29 d8                	sub    %ebx,%eax
}
 344:	5b                   	pop    %ebx
 345:	5d                   	pop    %ebp
 346:	c3                   	ret    
 347:	89 f6                	mov    %esi,%esi
 349:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000350 <strlen>:

uint
strlen(const char *s)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 356:	80 39 00             	cmpb   $0x0,(%ecx)
 359:	74 15                	je     370 <strlen+0x20>
 35b:	31 d2                	xor    %edx,%edx
 35d:	8d 76 00             	lea    0x0(%esi),%esi
 360:	83 c2 01             	add    $0x1,%edx
 363:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 367:	89 d0                	mov    %edx,%eax
 369:	75 f5                	jne    360 <strlen+0x10>
    ;
  return n;
}
 36b:	5d                   	pop    %ebp
 36c:	c3                   	ret    
 36d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 370:	31 c0                	xor    %eax,%eax
}
 372:	5d                   	pop    %ebp
 373:	c3                   	ret    
 374:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 37a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000380 <memset>:

void*
memset(void *dst, int c, uint n)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	57                   	push   %edi
 384:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 387:	8b 4d 10             	mov    0x10(%ebp),%ecx
 38a:	8b 45 0c             	mov    0xc(%ebp),%eax
 38d:	89 d7                	mov    %edx,%edi
 38f:	fc                   	cld    
 390:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 392:	89 d0                	mov    %edx,%eax
 394:	5f                   	pop    %edi
 395:	5d                   	pop    %ebp
 396:	c3                   	ret    
 397:	89 f6                	mov    %esi,%esi
 399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003a0 <strchr>:

char*
strchr(const char *s, char c)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	53                   	push   %ebx
 3a4:	8b 45 08             	mov    0x8(%ebp),%eax
 3a7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 3aa:	0f b6 10             	movzbl (%eax),%edx
 3ad:	84 d2                	test   %dl,%dl
 3af:	74 1d                	je     3ce <strchr+0x2e>
    if(*s == c)
 3b1:	38 d3                	cmp    %dl,%bl
 3b3:	89 d9                	mov    %ebx,%ecx
 3b5:	75 0d                	jne    3c4 <strchr+0x24>
 3b7:	eb 17                	jmp    3d0 <strchr+0x30>
 3b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3c0:	38 ca                	cmp    %cl,%dl
 3c2:	74 0c                	je     3d0 <strchr+0x30>
  for(; *s; s++)
 3c4:	83 c0 01             	add    $0x1,%eax
 3c7:	0f b6 10             	movzbl (%eax),%edx
 3ca:	84 d2                	test   %dl,%dl
 3cc:	75 f2                	jne    3c0 <strchr+0x20>
      return (char*)s;
  return 0;
 3ce:	31 c0                	xor    %eax,%eax
}
 3d0:	5b                   	pop    %ebx
 3d1:	5d                   	pop    %ebp
 3d2:	c3                   	ret    
 3d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003e0 <gets>:

char*
gets(char *buf, int max)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	56                   	push   %esi
 3e5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3e6:	31 f6                	xor    %esi,%esi
 3e8:	89 f3                	mov    %esi,%ebx
{
 3ea:	83 ec 1c             	sub    $0x1c,%esp
 3ed:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 3f0:	eb 2f                	jmp    421 <gets+0x41>
 3f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 3f8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3fb:	83 ec 04             	sub    $0x4,%esp
 3fe:	6a 01                	push   $0x1
 400:	50                   	push   %eax
 401:	6a 00                	push   $0x0
 403:	e8 32 01 00 00       	call   53a <read>
    if(cc < 1)
 408:	83 c4 10             	add    $0x10,%esp
 40b:	85 c0                	test   %eax,%eax
 40d:	7e 1c                	jle    42b <gets+0x4b>
      break;
    buf[i++] = c;
 40f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 413:	83 c7 01             	add    $0x1,%edi
 416:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 419:	3c 0a                	cmp    $0xa,%al
 41b:	74 23                	je     440 <gets+0x60>
 41d:	3c 0d                	cmp    $0xd,%al
 41f:	74 1f                	je     440 <gets+0x60>
  for(i=0; i+1 < max; ){
 421:	83 c3 01             	add    $0x1,%ebx
 424:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 427:	89 fe                	mov    %edi,%esi
 429:	7c cd                	jl     3f8 <gets+0x18>
 42b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 42d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 430:	c6 03 00             	movb   $0x0,(%ebx)
}
 433:	8d 65 f4             	lea    -0xc(%ebp),%esp
 436:	5b                   	pop    %ebx
 437:	5e                   	pop    %esi
 438:	5f                   	pop    %edi
 439:	5d                   	pop    %ebp
 43a:	c3                   	ret    
 43b:	90                   	nop
 43c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 440:	8b 75 08             	mov    0x8(%ebp),%esi
 443:	8b 45 08             	mov    0x8(%ebp),%eax
 446:	01 de                	add    %ebx,%esi
 448:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 44a:	c6 03 00             	movb   $0x0,(%ebx)
}
 44d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 450:	5b                   	pop    %ebx
 451:	5e                   	pop    %esi
 452:	5f                   	pop    %edi
 453:	5d                   	pop    %ebp
 454:	c3                   	ret    
 455:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000460 <stat>:

int
stat(const char *n, struct stat *st)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	56                   	push   %esi
 464:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 465:	83 ec 08             	sub    $0x8,%esp
 468:	6a 00                	push   $0x0
 46a:	ff 75 08             	pushl  0x8(%ebp)
 46d:	e8 f0 00 00 00       	call   562 <open>
  if(fd < 0)
 472:	83 c4 10             	add    $0x10,%esp
 475:	85 c0                	test   %eax,%eax
 477:	78 27                	js     4a0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 479:	83 ec 08             	sub    $0x8,%esp
 47c:	ff 75 0c             	pushl  0xc(%ebp)
 47f:	89 c3                	mov    %eax,%ebx
 481:	50                   	push   %eax
 482:	e8 f3 00 00 00       	call   57a <fstat>
  close(fd);
 487:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 48a:	89 c6                	mov    %eax,%esi
  close(fd);
 48c:	e8 b9 00 00 00       	call   54a <close>
  return r;
 491:	83 c4 10             	add    $0x10,%esp
}
 494:	8d 65 f8             	lea    -0x8(%ebp),%esp
 497:	89 f0                	mov    %esi,%eax
 499:	5b                   	pop    %ebx
 49a:	5e                   	pop    %esi
 49b:	5d                   	pop    %ebp
 49c:	c3                   	ret    
 49d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 4a0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4a5:	eb ed                	jmp    494 <stat+0x34>
 4a7:	89 f6                	mov    %esi,%esi
 4a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004b0 <atoi>:

int
atoi(const char *s)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	53                   	push   %ebx
 4b4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4b7:	0f be 11             	movsbl (%ecx),%edx
 4ba:	8d 42 d0             	lea    -0x30(%edx),%eax
 4bd:	3c 09                	cmp    $0x9,%al
  n = 0;
 4bf:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 4c4:	77 1f                	ja     4e5 <atoi+0x35>
 4c6:	8d 76 00             	lea    0x0(%esi),%esi
 4c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 4d0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 4d3:	83 c1 01             	add    $0x1,%ecx
 4d6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 4da:	0f be 11             	movsbl (%ecx),%edx
 4dd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 4e0:	80 fb 09             	cmp    $0x9,%bl
 4e3:	76 eb                	jbe    4d0 <atoi+0x20>
  return n;
}
 4e5:	5b                   	pop    %ebx
 4e6:	5d                   	pop    %ebp
 4e7:	c3                   	ret    
 4e8:	90                   	nop
 4e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004f0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	56                   	push   %esi
 4f4:	53                   	push   %ebx
 4f5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4f8:	8b 45 08             	mov    0x8(%ebp),%eax
 4fb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4fe:	85 db                	test   %ebx,%ebx
 500:	7e 14                	jle    516 <memmove+0x26>
 502:	31 d2                	xor    %edx,%edx
 504:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 508:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 50c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 50f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 512:	39 d3                	cmp    %edx,%ebx
 514:	75 f2                	jne    508 <memmove+0x18>
  return vdst;
}
 516:	5b                   	pop    %ebx
 517:	5e                   	pop    %esi
 518:	5d                   	pop    %ebp
 519:	c3                   	ret    

0000051a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 51a:	b8 01 00 00 00       	mov    $0x1,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <exit>:
SYSCALL(exit)
 522:	b8 02 00 00 00       	mov    $0x2,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <wait>:
SYSCALL(wait)
 52a:	b8 03 00 00 00       	mov    $0x3,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <pipe>:
SYSCALL(pipe)
 532:	b8 04 00 00 00       	mov    $0x4,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <read>:
SYSCALL(read)
 53a:	b8 05 00 00 00       	mov    $0x5,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <write>:
SYSCALL(write)
 542:	b8 10 00 00 00       	mov    $0x10,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <close>:
SYSCALL(close)
 54a:	b8 15 00 00 00       	mov    $0x15,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <kill>:
SYSCALL(kill)
 552:	b8 06 00 00 00       	mov    $0x6,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <exec>:
SYSCALL(exec)
 55a:	b8 07 00 00 00       	mov    $0x7,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <open>:
SYSCALL(open)
 562:	b8 0f 00 00 00       	mov    $0xf,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <mknod>:
SYSCALL(mknod)
 56a:	b8 11 00 00 00       	mov    $0x11,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <unlink>:
SYSCALL(unlink)
 572:	b8 12 00 00 00       	mov    $0x12,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <fstat>:
SYSCALL(fstat)
 57a:	b8 08 00 00 00       	mov    $0x8,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <link>:
SYSCALL(link)
 582:	b8 13 00 00 00       	mov    $0x13,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <mkdir>:
SYSCALL(mkdir)
 58a:	b8 14 00 00 00       	mov    $0x14,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <chdir>:
SYSCALL(chdir)
 592:	b8 09 00 00 00       	mov    $0x9,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <dup>:
SYSCALL(dup)
 59a:	b8 0a 00 00 00       	mov    $0xa,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <getpid>:
SYSCALL(getpid)
 5a2:	b8 0b 00 00 00       	mov    $0xb,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <sbrk>:
SYSCALL(sbrk)
 5aa:	b8 0c 00 00 00       	mov    $0xc,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <sleep>:
SYSCALL(sleep)
 5b2:	b8 0d 00 00 00       	mov    $0xd,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <uptime>:
SYSCALL(uptime)
 5ba:	b8 0e 00 00 00       	mov    $0xe,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <clone>:
SYSCALL(clone)
 5c2:	b8 16 00 00 00       	mov    $0x16,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <join>:
SYSCALL(join) 
 5ca:	b8 17 00 00 00       	mov    $0x17,%eax
 5cf:	cd 40                	int    $0x40
 5d1:	c3                   	ret    

000005d2 <semaphore_init>:
SYSCALL(semaphore_init)
 5d2:	b8 18 00 00 00       	mov    $0x18,%eax
 5d7:	cd 40                	int    $0x40
 5d9:	c3                   	ret    

000005da <semaphore_wait>:
SYSCALL(semaphore_wait)
 5da:	b8 19 00 00 00       	mov    $0x19,%eax
 5df:	cd 40                	int    $0x40
 5e1:	c3                   	ret    

000005e2 <semaphore_signal>:
SYSCALL(semaphore_signal)
 5e2:	b8 1a 00 00 00       	mov    $0x1a,%eax
 5e7:	cd 40                	int    $0x40
 5e9:	c3                   	ret    

000005ea <semaphore_close>:
SYSCALL(semaphore_close)
 5ea:	b8 1b 00 00 00       	mov    $0x1b,%eax
 5ef:	cd 40                	int    $0x40
 5f1:	c3                   	ret    
 5f2:	66 90                	xchg   %ax,%ax
 5f4:	66 90                	xchg   %ax,%ax
 5f6:	66 90                	xchg   %ax,%ax
 5f8:	66 90                	xchg   %ax,%ax
 5fa:	66 90                	xchg   %ax,%ax
 5fc:	66 90                	xchg   %ax,%ax
 5fe:	66 90                	xchg   %ax,%ax

00000600 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	57                   	push   %edi
 604:	56                   	push   %esi
 605:	53                   	push   %ebx
 606:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 609:	85 d2                	test   %edx,%edx
{
 60b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 60e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 610:	79 76                	jns    688 <printint+0x88>
 612:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 616:	74 70                	je     688 <printint+0x88>
    x = -xx;
 618:	f7 d8                	neg    %eax
    neg = 1;
 61a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 621:	31 f6                	xor    %esi,%esi
 623:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 626:	eb 0a                	jmp    632 <printint+0x32>
 628:	90                   	nop
 629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 630:	89 fe                	mov    %edi,%esi
 632:	31 d2                	xor    %edx,%edx
 634:	8d 7e 01             	lea    0x1(%esi),%edi
 637:	f7 f1                	div    %ecx
 639:	0f b6 92 5c 0a 00 00 	movzbl 0xa5c(%edx),%edx
  }while((x /= base) != 0);
 640:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 642:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 645:	75 e9                	jne    630 <printint+0x30>
  if(neg)
 647:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 64a:	85 c0                	test   %eax,%eax
 64c:	74 08                	je     656 <printint+0x56>
    buf[i++] = '-';
 64e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 653:	8d 7e 02             	lea    0x2(%esi),%edi
 656:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 65a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 65d:	8d 76 00             	lea    0x0(%esi),%esi
 660:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 663:	83 ec 04             	sub    $0x4,%esp
 666:	83 ee 01             	sub    $0x1,%esi
 669:	6a 01                	push   $0x1
 66b:	53                   	push   %ebx
 66c:	57                   	push   %edi
 66d:	88 45 d7             	mov    %al,-0x29(%ebp)
 670:	e8 cd fe ff ff       	call   542 <write>

  while(--i >= 0)
 675:	83 c4 10             	add    $0x10,%esp
 678:	39 de                	cmp    %ebx,%esi
 67a:	75 e4                	jne    660 <printint+0x60>
    putc(fd, buf[i]);
}
 67c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 67f:	5b                   	pop    %ebx
 680:	5e                   	pop    %esi
 681:	5f                   	pop    %edi
 682:	5d                   	pop    %ebp
 683:	c3                   	ret    
 684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 688:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 68f:	eb 90                	jmp    621 <printint+0x21>
 691:	eb 0d                	jmp    6a0 <printf>
 693:	90                   	nop
 694:	90                   	nop
 695:	90                   	nop
 696:	90                   	nop
 697:	90                   	nop
 698:	90                   	nop
 699:	90                   	nop
 69a:	90                   	nop
 69b:	90                   	nop
 69c:	90                   	nop
 69d:	90                   	nop
 69e:	90                   	nop
 69f:	90                   	nop

000006a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	57                   	push   %edi
 6a4:	56                   	push   %esi
 6a5:	53                   	push   %ebx
 6a6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6a9:	8b 75 0c             	mov    0xc(%ebp),%esi
 6ac:	0f b6 1e             	movzbl (%esi),%ebx
 6af:	84 db                	test   %bl,%bl
 6b1:	0f 84 b3 00 00 00    	je     76a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 6b7:	8d 45 10             	lea    0x10(%ebp),%eax
 6ba:	83 c6 01             	add    $0x1,%esi
  state = 0;
 6bd:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 6bf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 6c2:	eb 2f                	jmp    6f3 <printf+0x53>
 6c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 6c8:	83 f8 25             	cmp    $0x25,%eax
 6cb:	0f 84 a7 00 00 00    	je     778 <printf+0xd8>
  write(fd, &c, 1);
 6d1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 6d4:	83 ec 04             	sub    $0x4,%esp
 6d7:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 6da:	6a 01                	push   $0x1
 6dc:	50                   	push   %eax
 6dd:	ff 75 08             	pushl  0x8(%ebp)
 6e0:	e8 5d fe ff ff       	call   542 <write>
 6e5:	83 c4 10             	add    $0x10,%esp
 6e8:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 6eb:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 6ef:	84 db                	test   %bl,%bl
 6f1:	74 77                	je     76a <printf+0xca>
    if(state == 0){
 6f3:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 6f5:	0f be cb             	movsbl %bl,%ecx
 6f8:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 6fb:	74 cb                	je     6c8 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 6fd:	83 ff 25             	cmp    $0x25,%edi
 700:	75 e6                	jne    6e8 <printf+0x48>
      if(c == 'd'){
 702:	83 f8 64             	cmp    $0x64,%eax
 705:	0f 84 05 01 00 00    	je     810 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 70b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 711:	83 f9 70             	cmp    $0x70,%ecx
 714:	74 72                	je     788 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 716:	83 f8 73             	cmp    $0x73,%eax
 719:	0f 84 99 00 00 00    	je     7b8 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 71f:	83 f8 63             	cmp    $0x63,%eax
 722:	0f 84 08 01 00 00    	je     830 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 728:	83 f8 25             	cmp    $0x25,%eax
 72b:	0f 84 ef 00 00 00    	je     820 <printf+0x180>
  write(fd, &c, 1);
 731:	8d 45 e7             	lea    -0x19(%ebp),%eax
 734:	83 ec 04             	sub    $0x4,%esp
 737:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 73b:	6a 01                	push   $0x1
 73d:	50                   	push   %eax
 73e:	ff 75 08             	pushl  0x8(%ebp)
 741:	e8 fc fd ff ff       	call   542 <write>
 746:	83 c4 0c             	add    $0xc,%esp
 749:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 74c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 74f:	6a 01                	push   $0x1
 751:	50                   	push   %eax
 752:	ff 75 08             	pushl  0x8(%ebp)
 755:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 758:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 75a:	e8 e3 fd ff ff       	call   542 <write>
  for(i = 0; fmt[i]; i++){
 75f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 763:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 766:	84 db                	test   %bl,%bl
 768:	75 89                	jne    6f3 <printf+0x53>
    }
  }
}
 76a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 76d:	5b                   	pop    %ebx
 76e:	5e                   	pop    %esi
 76f:	5f                   	pop    %edi
 770:	5d                   	pop    %ebp
 771:	c3                   	ret    
 772:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 778:	bf 25 00 00 00       	mov    $0x25,%edi
 77d:	e9 66 ff ff ff       	jmp    6e8 <printf+0x48>
 782:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 788:	83 ec 0c             	sub    $0xc,%esp
 78b:	b9 10 00 00 00       	mov    $0x10,%ecx
 790:	6a 00                	push   $0x0
 792:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 795:	8b 45 08             	mov    0x8(%ebp),%eax
 798:	8b 17                	mov    (%edi),%edx
 79a:	e8 61 fe ff ff       	call   600 <printint>
        ap++;
 79f:	89 f8                	mov    %edi,%eax
 7a1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7a4:	31 ff                	xor    %edi,%edi
        ap++;
 7a6:	83 c0 04             	add    $0x4,%eax
 7a9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 7ac:	e9 37 ff ff ff       	jmp    6e8 <printf+0x48>
 7b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 7b8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 7bb:	8b 08                	mov    (%eax),%ecx
        ap++;
 7bd:	83 c0 04             	add    $0x4,%eax
 7c0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 7c3:	85 c9                	test   %ecx,%ecx
 7c5:	0f 84 8e 00 00 00    	je     859 <printf+0x1b9>
        while(*s != 0){
 7cb:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 7ce:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 7d0:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 7d2:	84 c0                	test   %al,%al
 7d4:	0f 84 0e ff ff ff    	je     6e8 <printf+0x48>
 7da:	89 75 d0             	mov    %esi,-0x30(%ebp)
 7dd:	89 de                	mov    %ebx,%esi
 7df:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7e2:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 7e5:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 7e8:	83 ec 04             	sub    $0x4,%esp
          s++;
 7eb:	83 c6 01             	add    $0x1,%esi
 7ee:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 7f1:	6a 01                	push   $0x1
 7f3:	57                   	push   %edi
 7f4:	53                   	push   %ebx
 7f5:	e8 48 fd ff ff       	call   542 <write>
        while(*s != 0){
 7fa:	0f b6 06             	movzbl (%esi),%eax
 7fd:	83 c4 10             	add    $0x10,%esp
 800:	84 c0                	test   %al,%al
 802:	75 e4                	jne    7e8 <printf+0x148>
 804:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 807:	31 ff                	xor    %edi,%edi
 809:	e9 da fe ff ff       	jmp    6e8 <printf+0x48>
 80e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 810:	83 ec 0c             	sub    $0xc,%esp
 813:	b9 0a 00 00 00       	mov    $0xa,%ecx
 818:	6a 01                	push   $0x1
 81a:	e9 73 ff ff ff       	jmp    792 <printf+0xf2>
 81f:	90                   	nop
  write(fd, &c, 1);
 820:	83 ec 04             	sub    $0x4,%esp
 823:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 826:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 829:	6a 01                	push   $0x1
 82b:	e9 21 ff ff ff       	jmp    751 <printf+0xb1>
        putc(fd, *ap);
 830:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 833:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 836:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 838:	6a 01                	push   $0x1
        ap++;
 83a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 83d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 840:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 843:	50                   	push   %eax
 844:	ff 75 08             	pushl  0x8(%ebp)
 847:	e8 f6 fc ff ff       	call   542 <write>
        ap++;
 84c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 84f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 852:	31 ff                	xor    %edi,%edi
 854:	e9 8f fe ff ff       	jmp    6e8 <printf+0x48>
          s = "(null)";
 859:	bb 52 0a 00 00       	mov    $0xa52,%ebx
        while(*s != 0){
 85e:	b8 28 00 00 00       	mov    $0x28,%eax
 863:	e9 72 ff ff ff       	jmp    7da <printf+0x13a>
 868:	66 90                	xchg   %ax,%ax
 86a:	66 90                	xchg   %ax,%ax
 86c:	66 90                	xchg   %ax,%ax
 86e:	66 90                	xchg   %ax,%ax

00000870 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 870:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 871:	a1 00 0e 02 00       	mov    0x20e00,%eax
{
 876:	89 e5                	mov    %esp,%ebp
 878:	57                   	push   %edi
 879:	56                   	push   %esi
 87a:	53                   	push   %ebx
 87b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 87e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 881:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 888:	39 c8                	cmp    %ecx,%eax
 88a:	8b 10                	mov    (%eax),%edx
 88c:	73 32                	jae    8c0 <free+0x50>
 88e:	39 d1                	cmp    %edx,%ecx
 890:	72 04                	jb     896 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 892:	39 d0                	cmp    %edx,%eax
 894:	72 32                	jb     8c8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 896:	8b 73 fc             	mov    -0x4(%ebx),%esi
 899:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 89c:	39 fa                	cmp    %edi,%edx
 89e:	74 30                	je     8d0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8a0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8a3:	8b 50 04             	mov    0x4(%eax),%edx
 8a6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8a9:	39 f1                	cmp    %esi,%ecx
 8ab:	74 3a                	je     8e7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8ad:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8af:	a3 00 0e 02 00       	mov    %eax,0x20e00
}
 8b4:	5b                   	pop    %ebx
 8b5:	5e                   	pop    %esi
 8b6:	5f                   	pop    %edi
 8b7:	5d                   	pop    %ebp
 8b8:	c3                   	ret    
 8b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8c0:	39 d0                	cmp    %edx,%eax
 8c2:	72 04                	jb     8c8 <free+0x58>
 8c4:	39 d1                	cmp    %edx,%ecx
 8c6:	72 ce                	jb     896 <free+0x26>
{
 8c8:	89 d0                	mov    %edx,%eax
 8ca:	eb bc                	jmp    888 <free+0x18>
 8cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 8d0:	03 72 04             	add    0x4(%edx),%esi
 8d3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8d6:	8b 10                	mov    (%eax),%edx
 8d8:	8b 12                	mov    (%edx),%edx
 8da:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8dd:	8b 50 04             	mov    0x4(%eax),%edx
 8e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8e3:	39 f1                	cmp    %esi,%ecx
 8e5:	75 c6                	jne    8ad <free+0x3d>
    p->s.size += bp->s.size;
 8e7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 8ea:	a3 00 0e 02 00       	mov    %eax,0x20e00
    p->s.size += bp->s.size;
 8ef:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8f2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8f5:	89 10                	mov    %edx,(%eax)
}
 8f7:	5b                   	pop    %ebx
 8f8:	5e                   	pop    %esi
 8f9:	5f                   	pop    %edi
 8fa:	5d                   	pop    %ebp
 8fb:	c3                   	ret    
 8fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000900 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 900:	55                   	push   %ebp
 901:	89 e5                	mov    %esp,%ebp
 903:	57                   	push   %edi
 904:	56                   	push   %esi
 905:	53                   	push   %ebx
 906:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 909:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 90c:	8b 15 00 0e 02 00    	mov    0x20e00,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 912:	8d 78 07             	lea    0x7(%eax),%edi
 915:	c1 ef 03             	shr    $0x3,%edi
 918:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 91b:	85 d2                	test   %edx,%edx
 91d:	0f 84 9d 00 00 00    	je     9c0 <malloc+0xc0>
 923:	8b 02                	mov    (%edx),%eax
 925:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 928:	39 cf                	cmp    %ecx,%edi
 92a:	76 6c                	jbe    998 <malloc+0x98>
 92c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 932:	bb 00 10 00 00       	mov    $0x1000,%ebx
 937:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 93a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 941:	eb 0e                	jmp    951 <malloc+0x51>
 943:	90                   	nop
 944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 948:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 94a:	8b 48 04             	mov    0x4(%eax),%ecx
 94d:	39 f9                	cmp    %edi,%ecx
 94f:	73 47                	jae    998 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 951:	39 05 00 0e 02 00    	cmp    %eax,0x20e00
 957:	89 c2                	mov    %eax,%edx
 959:	75 ed                	jne    948 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 95b:	83 ec 0c             	sub    $0xc,%esp
 95e:	56                   	push   %esi
 95f:	e8 46 fc ff ff       	call   5aa <sbrk>
  if(p == (char*)-1)
 964:	83 c4 10             	add    $0x10,%esp
 967:	83 f8 ff             	cmp    $0xffffffff,%eax
 96a:	74 1c                	je     988 <malloc+0x88>
  hp->s.size = nu;
 96c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 96f:	83 ec 0c             	sub    $0xc,%esp
 972:	83 c0 08             	add    $0x8,%eax
 975:	50                   	push   %eax
 976:	e8 f5 fe ff ff       	call   870 <free>
  return freep;
 97b:	8b 15 00 0e 02 00    	mov    0x20e00,%edx
      if((p = morecore(nunits)) == 0)
 981:	83 c4 10             	add    $0x10,%esp
 984:	85 d2                	test   %edx,%edx
 986:	75 c0                	jne    948 <malloc+0x48>
        return 0;
  }
}
 988:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 98b:	31 c0                	xor    %eax,%eax
}
 98d:	5b                   	pop    %ebx
 98e:	5e                   	pop    %esi
 98f:	5f                   	pop    %edi
 990:	5d                   	pop    %ebp
 991:	c3                   	ret    
 992:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 998:	39 cf                	cmp    %ecx,%edi
 99a:	74 54                	je     9f0 <malloc+0xf0>
        p->s.size -= nunits;
 99c:	29 f9                	sub    %edi,%ecx
 99e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 9a1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 9a4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 9a7:	89 15 00 0e 02 00    	mov    %edx,0x20e00
}
 9ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 9b0:	83 c0 08             	add    $0x8,%eax
}
 9b3:	5b                   	pop    %ebx
 9b4:	5e                   	pop    %esi
 9b5:	5f                   	pop    %edi
 9b6:	5d                   	pop    %ebp
 9b7:	c3                   	ret    
 9b8:	90                   	nop
 9b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 9c0:	c7 05 00 0e 02 00 04 	movl   $0x20e04,0x20e00
 9c7:	0e 02 00 
 9ca:	c7 05 04 0e 02 00 04 	movl   $0x20e04,0x20e04
 9d1:	0e 02 00 
    base.s.size = 0;
 9d4:	b8 04 0e 02 00       	mov    $0x20e04,%eax
 9d9:	c7 05 08 0e 02 00 00 	movl   $0x0,0x20e08
 9e0:	00 00 00 
 9e3:	e9 44 ff ff ff       	jmp    92c <malloc+0x2c>
 9e8:	90                   	nop
 9e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 9f0:	8b 08                	mov    (%eax),%ecx
 9f2:	89 0a                	mov    %ecx,(%edx)
 9f4:	eb b1                	jmp    9a7 <malloc+0xa7>

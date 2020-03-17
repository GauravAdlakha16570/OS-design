
_clonetests:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    printf(1, "Test Passed\n");
    exit();
}

int
main(int argc, char *argv[]){
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  11:	8b 41 04             	mov    0x4(%ecx),%eax

    

    if (*argv[1] == '1'){
  14:	8b 40 04             	mov    0x4(%eax),%eax
  17:	0f b6 00             	movzbl (%eax),%eax
  1a:	3c 31                	cmp    $0x31,%al
  1c:	74 1f                	je     3d <main+0x3d>
        //printf(1, "1) Clone Test: Shared Address Space\n");
        test1();
    } else if (*argv[1] == '2'){
  1e:	3c 32                	cmp    $0x32,%al
  20:	74 33                	je     55 <main+0x55>
        printf(1, "2) Clone Test: Pass One Argument\n");
        test2();
    } else if (*argv[1] == '3'){
  22:	3c 33                	cmp    $0x33,%al
  24:	74 42                	je     68 <main+0x68>
        printf(1, "3) Clone Test: Copy file descriptors, but doesn't share\n");
        test3();
    } else if (*argv[1] == '4'){
  26:	3c 34                	cmp    $0x34,%al
  28:	74 18                	je     42 <main+0x42>
        printf(1, "4) Clone Test: Bad stack argument\n");
        test4();
    } else {
        printf(1, "Not a valid test number\n");
  2a:	50                   	push   %eax
  2b:	50                   	push   %eax
  2c:	68 92 0a 00 00       	push   $0xa92
  31:	6a 01                	push   $0x1
  33:	e8 c8 06 00 00       	call   700 <printf>
    }

    exit();
  38:	e8 45 05 00 00       	call   582 <exit>
        test1();
  3d:	e8 1e 01 00 00       	call   160 <test1>
        printf(1, "4) Clone Test: Bad stack argument\n");
  42:	52                   	push   %edx
  43:	52                   	push   %edx
  44:	68 34 0b 00 00       	push   $0xb34
  49:	6a 01                	push   $0x1
  4b:	e8 b0 06 00 00       	call   700 <printf>
        test4();
  50:	e8 8b 02 00 00       	call   2e0 <test4>
        printf(1, "2) Clone Test: Pass One Argument\n");
  55:	50                   	push   %eax
  56:	50                   	push   %eax
  57:	68 d4 0a 00 00       	push   $0xad4
  5c:	6a 01                	push   $0x1
  5e:	e8 9d 06 00 00       	call   700 <printf>
        test2();
  63:	e8 68 01 00 00       	call   1d0 <test2>
        printf(1, "3) Clone Test: Copy file descriptors, but doesn't share\n");
  68:	51                   	push   %ecx
  69:	51                   	push   %ecx
  6a:	68 f8 0a 00 00       	push   $0xaf8
  6f:	6a 01                	push   $0x1
  71:	e8 8a 06 00 00       	call   700 <printf>
        test3();
  76:	e8 d5 01 00 00       	call   250 <test3>
  7b:	66 90                	xchg   %ax,%ax
  7d:	66 90                	xchg   %ax,%ax
  7f:	90                   	nop

00000080 <testfunc2>:
void *testfunc2(void *arg){
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	83 ec 08             	sub    $0x8,%esp
  86:	8b 45 08             	mov    0x8(%ebp),%eax
    int temp = *(int*)arg;
  89:	8b 10                	mov    (%eax),%edx
    *(int*)arg = 1;
  8b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    global = temp;
  91:	89 15 28 0f 00 00    	mov    %edx,0xf28
    exit();
  97:	e8 e6 04 00 00       	call   582 <exit>
  9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000a0 <testfunc4>:
void *testfunc4(void *arg){
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	83 ec 08             	sub    $0x8,%esp
    exit();
  a6:	e8 d7 04 00 00       	call   582 <exit>
  ab:	90                   	nop
  ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000b0 <assert.part.0>:
void assert(int expression){
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	83 ec 10             	sub    $0x10,%esp
        printf(1, "Assertion incorrect");
  b6:	68 58 0a 00 00       	push   $0xa58
  bb:	6a 01                	push   $0x1
  bd:	e8 3e 06 00 00       	call   700 <printf>
        exit();
  c2:	e8 bb 04 00 00       	call   582 <exit>
  c7:	89 f6                	mov    %esi,%esi
  c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000d0 <testfunc1>:
void *testfunc1(void *arg){
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	83 ec 08             	sub    $0x8,%esp
    if (!expression){
  d6:	83 3d 28 0f 00 00 01 	cmpl   $0x1,0xf28
  dd:	74 05                	je     e4 <testfunc1+0x14>
  df:	e8 cc ff ff ff       	call   b0 <assert.part.0>
    global = 6;
  e4:	c7 05 28 0f 00 00 06 	movl   $0x6,0xf28
  eb:	00 00 00 
    exit();
  ee:	e8 8f 04 00 00       	call   582 <exit>
  f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000100 <testfunc3>:
void *testfunc3(void *arg){
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	83 ec 0c             	sub    $0xc,%esp
    assert(write(3, "hello\n", 6) == 6);
 106:	6a 06                	push   $0x6
 108:	68 6c 0a 00 00       	push   $0xa6c
 10d:	6a 03                	push   $0x3
 10f:	e8 8e 04 00 00       	call   5a2 <write>
    if (!expression){
 114:	83 c4 10             	add    $0x10,%esp
 117:	83 f8 06             	cmp    $0x6,%eax
 11a:	74 05                	je     121 <testfunc3+0x21>
 11c:	e8 8f ff ff ff       	call   b0 <assert.part.0>
    xchg(&newfd, open("tmp2", O_WRONLY | O_CREATE));
 121:	50                   	push   %eax
 122:	50                   	push   %eax
 123:	68 01 02 00 00       	push   $0x201
 128:	68 73 0a 00 00       	push   $0xa73
 12d:	e8 90 04 00 00       	call   5c2 <open>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 132:	f0 87 05 2c 0f 00 00 	lock xchg %eax,0xf2c
    exit();
 139:	e8 44 04 00 00       	call   582 <exit>
 13e:	66 90                	xchg   %ax,%ax

00000140 <assert>:
void assert(int expression){
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	83 ec 08             	sub    $0x8,%esp
    if (!expression){
 146:	8b 45 08             	mov    0x8(%ebp),%eax
 149:	85 c0                	test   %eax,%eax
 14b:	74 02                	je     14f <assert+0xf>
}
 14d:	c9                   	leave  
 14e:	c3                   	ret    
 14f:	e8 5c ff ff ff       	call   b0 <assert.part.0>
 154:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 15a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000160 <test1>:
void test1(){
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	83 ec 10             	sub    $0x10,%esp
    printf(1, "1) Clone Test: Shared Address Space\n");
 166:	68 ac 0a 00 00       	push   $0xaac
 16b:	6a 01                	push   $0x1
 16d:	e8 8e 05 00 00       	call   700 <printf>
    void *stack = (void*)malloc(PGSIZE*2);
 172:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 179:	e8 e2 07 00 00       	call   960 <malloc>
    if((uint)stack % PGSIZE){
 17e:	89 c2                	mov    %eax,%edx
 180:	83 c4 10             	add    $0x10,%esp
 183:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 189:	74 07                	je     192 <test1+0x32>
        stack = stack + (PGSIZE - (uint)stack % PGSIZE); //page aligns the stack
 18b:	29 d0                	sub    %edx,%eax
 18d:	05 00 10 00 00       	add    $0x1000,%eax
    int tid = clone(&testfunc1, stack, 0);
 192:	83 ec 04             	sub    $0x4,%esp
 195:	6a 00                	push   $0x0
 197:	50                   	push   %eax
 198:	68 d0 00 00 00       	push   $0xd0
 19d:	e8 80 04 00 00       	call   622 <clone>
    if (!expression){
 1a2:	83 c4 10             	add    $0x10,%esp
 1a5:	85 c0                	test   %eax,%eax
    while(global != 6);
 1a7:	8b 15 28 0f 00 00    	mov    0xf28,%edx
    if (!expression){
 1ad:	7e 1a                	jle    1c9 <test1+0x69>
 1af:	90                   	nop
    while(global != 6);
 1b0:	83 fa 06             	cmp    $0x6,%edx
 1b3:	75 fb                	jne    1b0 <test1+0x50>
    printf(1, "Test Passed\n");
 1b5:	83 ec 08             	sub    $0x8,%esp
 1b8:	68 78 0a 00 00       	push   $0xa78
 1bd:	6a 01                	push   $0x1
 1bf:	e8 3c 05 00 00       	call   700 <printf>
    exit();
 1c4:	e8 b9 03 00 00       	call   582 <exit>
 1c9:	e8 e2 fe ff ff       	call   b0 <assert.part.0>
 1ce:	66 90                	xchg   %ax,%ax

000001d0 <test2>:
void test2(){
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	83 ec 14             	sub    $0x14,%esp
    void *stack = (void*)malloc(PGSIZE*2);
 1d6:	68 00 20 00 00       	push   $0x2000
 1db:	e8 80 07 00 00       	call   960 <malloc>
    if((uint)stack % PGSIZE){
 1e0:	89 c2                	mov    %eax,%edx
 1e2:	83 c4 10             	add    $0x10,%esp
 1e5:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 1eb:	74 07                	je     1f4 <test2+0x24>
        stack = stack + (PGSIZE - (uint)stack % PGSIZE);
 1ed:	29 d0                	sub    %edx,%eax
 1ef:	05 00 10 00 00       	add    $0x1000,%eax
    clone(&testfunc2, stack, (void*)&param);
 1f4:	83 ec 04             	sub    $0x4,%esp
 1f7:	68 24 0f 00 00       	push   $0xf24
 1fc:	50                   	push   %eax
 1fd:	68 80 00 00 00       	push   $0x80
 202:	e8 1b 04 00 00       	call   622 <clone>
    while(global != 69){
 207:	83 c4 10             	add    $0x10,%esp
 20a:	83 3d 28 0f 00 00 45 	cmpl   $0x45,0xf28
 211:	74 1b                	je     22e <test2+0x5e>
 213:	90                   	nop
 214:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        sleep(10); //this while loop has to do something or else it never is true, weird
 218:	83 ec 0c             	sub    $0xc,%esp
 21b:	6a 0a                	push   $0xa
 21d:	e8 f0 03 00 00       	call   612 <sleep>
    while(global != 69){
 222:	83 c4 10             	add    $0x10,%esp
 225:	83 3d 28 0f 00 00 45 	cmpl   $0x45,0xf28
 22c:	75 ea                	jne    218 <test2+0x48>
    printf(1, "Test Passed\n");
 22e:	83 ec 08             	sub    $0x8,%esp
 231:	68 78 0a 00 00       	push   $0xa78
 236:	6a 01                	push   $0x1
 238:	e8 c3 04 00 00       	call   700 <printf>
    exit();
 23d:	e8 40 03 00 00       	call   582 <exit>
 242:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000250 <test3>:
void test3(){
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	53                   	push   %ebx
 254:	83 ec 10             	sub    $0x10,%esp
    void *stack = (void*)malloc(PGSIZE*2);
 257:	68 00 20 00 00       	push   $0x2000
 25c:	e8 ff 06 00 00       	call   960 <malloc>
    if((uint)stack % PGSIZE){
 261:	83 c4 10             	add    $0x10,%esp
    void *stack = (void*)malloc(PGSIZE*2);
 264:	89 c3                	mov    %eax,%ebx
    if((uint)stack % PGSIZE){
 266:	25 ff 0f 00 00       	and    $0xfff,%eax
 26b:	74 08                	je     275 <test3+0x25>
        stack = stack + (PGSIZE - (uint)stack % PGSIZE);
 26d:	29 c3                	sub    %eax,%ebx
 26f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    int fd = open("tmp", O_WRONLY | O_CREATE);
 275:	83 ec 08             	sub    $0x8,%esp
 278:	68 01 02 00 00       	push   $0x201
 27d:	68 85 0a 00 00       	push   $0xa85
 282:	e8 3b 03 00 00       	call   5c2 <open>
    if (!expression){
 287:	83 c4 10             	add    $0x10,%esp
 28a:	83 f8 03             	cmp    $0x3,%eax
 28d:	74 05                	je     294 <test3+0x44>
 28f:	e8 1c fe ff ff       	call   b0 <assert.part.0>
    clone(&testfunc3, stack, 0);
 294:	51                   	push   %ecx
 295:	6a 00                	push   $0x0
 297:	53                   	push   %ebx
 298:	68 00 01 00 00       	push   $0x100
 29d:	e8 80 03 00 00       	call   622 <clone>
    while(!newfd);
 2a2:	83 c4 10             	add    $0x10,%esp
 2a5:	8d 76 00             	lea    0x0(%esi),%esi
 2a8:	a1 2c 0f 00 00       	mov    0xf2c,%eax
 2ad:	85 c0                	test   %eax,%eax
 2af:	74 f7                	je     2a8 <test3+0x58>
    assert(write(newfd, "goodbye\n",8) == -1);
 2b1:	a1 2c 0f 00 00       	mov    0xf2c,%eax
 2b6:	52                   	push   %edx
 2b7:	6a 08                	push   $0x8
 2b9:	68 89 0a 00 00       	push   $0xa89
 2be:	50                   	push   %eax
 2bf:	e8 de 02 00 00       	call   5a2 <write>
    if (!expression){
 2c4:	83 c4 10             	add    $0x10,%esp
 2c7:	83 c0 01             	add    $0x1,%eax
 2ca:	75 c3                	jne    28f <test3+0x3f>
    printf(1, "Test Passed\n");
 2cc:	50                   	push   %eax
 2cd:	50                   	push   %eax
 2ce:	68 78 0a 00 00       	push   $0xa78
 2d3:	6a 01                	push   $0x1
 2d5:	e8 26 04 00 00       	call   700 <printf>
    exit();
 2da:	e8 a3 02 00 00       	call   582 <exit>
 2df:	90                   	nop

000002e0 <test4>:
void test4(){
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	83 ec 14             	sub    $0x14,%esp
    void *stack = (void*)malloc(PGSIZE*2);
 2e6:	68 00 20 00 00       	push   $0x2000
 2eb:	e8 70 06 00 00       	call   960 <malloc>
        stack = stack + 4;
 2f0:	8d 50 04             	lea    0x4(%eax),%edx
    if((uint)stack % PGSIZE == 0){ // creates a not page aligned stack
 2f3:	83 c4 0c             	add    $0xc,%esp
        stack = stack + 4;
 2f6:	a9 ff 0f 00 00       	test   $0xfff,%eax
    assert(clone(&testfunc4, stack, 0) == -1);
 2fb:	6a 00                	push   $0x0
        stack = stack + 4;
 2fd:	0f 44 c2             	cmove  %edx,%eax
    assert(clone(&testfunc4, stack, 0) == -1);
 300:	50                   	push   %eax
 301:	68 a0 00 00 00       	push   $0xa0
 306:	e8 17 03 00 00       	call   622 <clone>
    if (!expression){
 30b:	83 c4 10             	add    $0x10,%esp
 30e:	83 f8 ff             	cmp    $0xffffffff,%eax
 311:	74 05                	je     318 <test4+0x38>
 313:	e8 98 fd ff ff       	call   b0 <assert.part.0>
    printf(1, "Test Passed\n");
 318:	50                   	push   %eax
 319:	50                   	push   %eax
 31a:	68 78 0a 00 00       	push   $0xa78
 31f:	6a 01                	push   $0x1
 321:	e8 da 03 00 00       	call   700 <printf>
    exit();
 326:	e8 57 02 00 00       	call   582 <exit>
 32b:	66 90                	xchg   %ax,%ax
 32d:	66 90                	xchg   %ax,%ax
 32f:	90                   	nop

00000330 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	53                   	push   %ebx
 334:	8b 45 08             	mov    0x8(%ebp),%eax
 337:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 33a:	89 c2                	mov    %eax,%edx
 33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 340:	83 c1 01             	add    $0x1,%ecx
 343:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 347:	83 c2 01             	add    $0x1,%edx
 34a:	84 db                	test   %bl,%bl
 34c:	88 5a ff             	mov    %bl,-0x1(%edx)
 34f:	75 ef                	jne    340 <strcpy+0x10>
    ;
  return os;
}
 351:	5b                   	pop    %ebx
 352:	5d                   	pop    %ebp
 353:	c3                   	ret    
 354:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 35a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000360 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
 364:	8b 55 08             	mov    0x8(%ebp),%edx
 367:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 36a:	0f b6 02             	movzbl (%edx),%eax
 36d:	0f b6 19             	movzbl (%ecx),%ebx
 370:	84 c0                	test   %al,%al
 372:	75 1c                	jne    390 <strcmp+0x30>
 374:	eb 2a                	jmp    3a0 <strcmp+0x40>
 376:	8d 76 00             	lea    0x0(%esi),%esi
 379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 380:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 383:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 386:	83 c1 01             	add    $0x1,%ecx
 389:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 38c:	84 c0                	test   %al,%al
 38e:	74 10                	je     3a0 <strcmp+0x40>
 390:	38 d8                	cmp    %bl,%al
 392:	74 ec                	je     380 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 394:	29 d8                	sub    %ebx,%eax
}
 396:	5b                   	pop    %ebx
 397:	5d                   	pop    %ebp
 398:	c3                   	ret    
 399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3a0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 3a2:	29 d8                	sub    %ebx,%eax
}
 3a4:	5b                   	pop    %ebx
 3a5:	5d                   	pop    %ebp
 3a6:	c3                   	ret    
 3a7:	89 f6                	mov    %esi,%esi
 3a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003b0 <strlen>:

uint
strlen(const char *s)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3b6:	80 39 00             	cmpb   $0x0,(%ecx)
 3b9:	74 15                	je     3d0 <strlen+0x20>
 3bb:	31 d2                	xor    %edx,%edx
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
 3c0:	83 c2 01             	add    $0x1,%edx
 3c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 3c7:	89 d0                	mov    %edx,%eax
 3c9:	75 f5                	jne    3c0 <strlen+0x10>
    ;
  return n;
}
 3cb:	5d                   	pop    %ebp
 3cc:	c3                   	ret    
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 3d0:	31 c0                	xor    %eax,%eax
}
 3d2:	5d                   	pop    %ebp
 3d3:	c3                   	ret    
 3d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000003e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("cld; rep stosb" :
 3e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ed:	89 d7                	mov    %edx,%edi
 3ef:	fc                   	cld    
 3f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3f2:	89 d0                	mov    %edx,%eax
 3f4:	5f                   	pop    %edi
 3f5:	5d                   	pop    %ebp
 3f6:	c3                   	ret    
 3f7:	89 f6                	mov    %esi,%esi
 3f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000400 <strchr>:

char*
strchr(const char *s, char c)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	53                   	push   %ebx
 404:	8b 45 08             	mov    0x8(%ebp),%eax
 407:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 40a:	0f b6 10             	movzbl (%eax),%edx
 40d:	84 d2                	test   %dl,%dl
 40f:	74 1d                	je     42e <strchr+0x2e>
    if(*s == c)
 411:	38 d3                	cmp    %dl,%bl
 413:	89 d9                	mov    %ebx,%ecx
 415:	75 0d                	jne    424 <strchr+0x24>
 417:	eb 17                	jmp    430 <strchr+0x30>
 419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 420:	38 ca                	cmp    %cl,%dl
 422:	74 0c                	je     430 <strchr+0x30>
  for(; *s; s++)
 424:	83 c0 01             	add    $0x1,%eax
 427:	0f b6 10             	movzbl (%eax),%edx
 42a:	84 d2                	test   %dl,%dl
 42c:	75 f2                	jne    420 <strchr+0x20>
      return (char*)s;
  return 0;
 42e:	31 c0                	xor    %eax,%eax
}
 430:	5b                   	pop    %ebx
 431:	5d                   	pop    %ebp
 432:	c3                   	ret    
 433:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000440 <gets>:

char*
gets(char *buf, int max)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	56                   	push   %esi
 445:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 446:	31 f6                	xor    %esi,%esi
 448:	89 f3                	mov    %esi,%ebx
{
 44a:	83 ec 1c             	sub    $0x1c,%esp
 44d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 450:	eb 2f                	jmp    481 <gets+0x41>
 452:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 458:	8d 45 e7             	lea    -0x19(%ebp),%eax
 45b:	83 ec 04             	sub    $0x4,%esp
 45e:	6a 01                	push   $0x1
 460:	50                   	push   %eax
 461:	6a 00                	push   $0x0
 463:	e8 32 01 00 00       	call   59a <read>
    if(cc < 1)
 468:	83 c4 10             	add    $0x10,%esp
 46b:	85 c0                	test   %eax,%eax
 46d:	7e 1c                	jle    48b <gets+0x4b>
      break;
    buf[i++] = c;
 46f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 473:	83 c7 01             	add    $0x1,%edi
 476:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 479:	3c 0a                	cmp    $0xa,%al
 47b:	74 23                	je     4a0 <gets+0x60>
 47d:	3c 0d                	cmp    $0xd,%al
 47f:	74 1f                	je     4a0 <gets+0x60>
  for(i=0; i+1 < max; ){
 481:	83 c3 01             	add    $0x1,%ebx
 484:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 487:	89 fe                	mov    %edi,%esi
 489:	7c cd                	jl     458 <gets+0x18>
 48b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 48d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 490:	c6 03 00             	movb   $0x0,(%ebx)
}
 493:	8d 65 f4             	lea    -0xc(%ebp),%esp
 496:	5b                   	pop    %ebx
 497:	5e                   	pop    %esi
 498:	5f                   	pop    %edi
 499:	5d                   	pop    %ebp
 49a:	c3                   	ret    
 49b:	90                   	nop
 49c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4a0:	8b 75 08             	mov    0x8(%ebp),%esi
 4a3:	8b 45 08             	mov    0x8(%ebp),%eax
 4a6:	01 de                	add    %ebx,%esi
 4a8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 4aa:	c6 03 00             	movb   $0x0,(%ebx)
}
 4ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4b0:	5b                   	pop    %ebx
 4b1:	5e                   	pop    %esi
 4b2:	5f                   	pop    %edi
 4b3:	5d                   	pop    %ebp
 4b4:	c3                   	ret    
 4b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004c0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	56                   	push   %esi
 4c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4c5:	83 ec 08             	sub    $0x8,%esp
 4c8:	6a 00                	push   $0x0
 4ca:	ff 75 08             	pushl  0x8(%ebp)
 4cd:	e8 f0 00 00 00       	call   5c2 <open>
  if(fd < 0)
 4d2:	83 c4 10             	add    $0x10,%esp
 4d5:	85 c0                	test   %eax,%eax
 4d7:	78 27                	js     500 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 4d9:	83 ec 08             	sub    $0x8,%esp
 4dc:	ff 75 0c             	pushl  0xc(%ebp)
 4df:	89 c3                	mov    %eax,%ebx
 4e1:	50                   	push   %eax
 4e2:	e8 f3 00 00 00       	call   5da <fstat>
  close(fd);
 4e7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 4ea:	89 c6                	mov    %eax,%esi
  close(fd);
 4ec:	e8 b9 00 00 00       	call   5aa <close>
  return r;
 4f1:	83 c4 10             	add    $0x10,%esp
}
 4f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4f7:	89 f0                	mov    %esi,%eax
 4f9:	5b                   	pop    %ebx
 4fa:	5e                   	pop    %esi
 4fb:	5d                   	pop    %ebp
 4fc:	c3                   	ret    
 4fd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 500:	be ff ff ff ff       	mov    $0xffffffff,%esi
 505:	eb ed                	jmp    4f4 <stat+0x34>
 507:	89 f6                	mov    %esi,%esi
 509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000510 <atoi>:

int
atoi(const char *s)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	53                   	push   %ebx
 514:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 517:	0f be 11             	movsbl (%ecx),%edx
 51a:	8d 42 d0             	lea    -0x30(%edx),%eax
 51d:	3c 09                	cmp    $0x9,%al
  n = 0;
 51f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 524:	77 1f                	ja     545 <atoi+0x35>
 526:	8d 76 00             	lea    0x0(%esi),%esi
 529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 530:	8d 04 80             	lea    (%eax,%eax,4),%eax
 533:	83 c1 01             	add    $0x1,%ecx
 536:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 53a:	0f be 11             	movsbl (%ecx),%edx
 53d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 540:	80 fb 09             	cmp    $0x9,%bl
 543:	76 eb                	jbe    530 <atoi+0x20>
  return n;
}
 545:	5b                   	pop    %ebx
 546:	5d                   	pop    %ebp
 547:	c3                   	ret    
 548:	90                   	nop
 549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000550 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	56                   	push   %esi
 554:	53                   	push   %ebx
 555:	8b 5d 10             	mov    0x10(%ebp),%ebx
 558:	8b 45 08             	mov    0x8(%ebp),%eax
 55b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 55e:	85 db                	test   %ebx,%ebx
 560:	7e 14                	jle    576 <memmove+0x26>
 562:	31 d2                	xor    %edx,%edx
 564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 568:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 56c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 56f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 572:	39 d3                	cmp    %edx,%ebx
 574:	75 f2                	jne    568 <memmove+0x18>
  return vdst;
}
 576:	5b                   	pop    %ebx
 577:	5e                   	pop    %esi
 578:	5d                   	pop    %ebp
 579:	c3                   	ret    

0000057a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 57a:	b8 01 00 00 00       	mov    $0x1,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <exit>:
SYSCALL(exit)
 582:	b8 02 00 00 00       	mov    $0x2,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <wait>:
SYSCALL(wait)
 58a:	b8 03 00 00 00       	mov    $0x3,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <pipe>:
SYSCALL(pipe)
 592:	b8 04 00 00 00       	mov    $0x4,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <read>:
SYSCALL(read)
 59a:	b8 05 00 00 00       	mov    $0x5,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <write>:
SYSCALL(write)
 5a2:	b8 10 00 00 00       	mov    $0x10,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <close>:
SYSCALL(close)
 5aa:	b8 15 00 00 00       	mov    $0x15,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <kill>:
SYSCALL(kill)
 5b2:	b8 06 00 00 00       	mov    $0x6,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <exec>:
SYSCALL(exec)
 5ba:	b8 07 00 00 00       	mov    $0x7,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <open>:
SYSCALL(open)
 5c2:	b8 0f 00 00 00       	mov    $0xf,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <mknod>:
SYSCALL(mknod)
 5ca:	b8 11 00 00 00       	mov    $0x11,%eax
 5cf:	cd 40                	int    $0x40
 5d1:	c3                   	ret    

000005d2 <unlink>:
SYSCALL(unlink)
 5d2:	b8 12 00 00 00       	mov    $0x12,%eax
 5d7:	cd 40                	int    $0x40
 5d9:	c3                   	ret    

000005da <fstat>:
SYSCALL(fstat)
 5da:	b8 08 00 00 00       	mov    $0x8,%eax
 5df:	cd 40                	int    $0x40
 5e1:	c3                   	ret    

000005e2 <link>:
SYSCALL(link)
 5e2:	b8 13 00 00 00       	mov    $0x13,%eax
 5e7:	cd 40                	int    $0x40
 5e9:	c3                   	ret    

000005ea <mkdir>:
SYSCALL(mkdir)
 5ea:	b8 14 00 00 00       	mov    $0x14,%eax
 5ef:	cd 40                	int    $0x40
 5f1:	c3                   	ret    

000005f2 <chdir>:
SYSCALL(chdir)
 5f2:	b8 09 00 00 00       	mov    $0x9,%eax
 5f7:	cd 40                	int    $0x40
 5f9:	c3                   	ret    

000005fa <dup>:
SYSCALL(dup)
 5fa:	b8 0a 00 00 00       	mov    $0xa,%eax
 5ff:	cd 40                	int    $0x40
 601:	c3                   	ret    

00000602 <getpid>:
SYSCALL(getpid)
 602:	b8 0b 00 00 00       	mov    $0xb,%eax
 607:	cd 40                	int    $0x40
 609:	c3                   	ret    

0000060a <sbrk>:
SYSCALL(sbrk)
 60a:	b8 0c 00 00 00       	mov    $0xc,%eax
 60f:	cd 40                	int    $0x40
 611:	c3                   	ret    

00000612 <sleep>:
SYSCALL(sleep)
 612:	b8 0d 00 00 00       	mov    $0xd,%eax
 617:	cd 40                	int    $0x40
 619:	c3                   	ret    

0000061a <uptime>:
SYSCALL(uptime)
 61a:	b8 0e 00 00 00       	mov    $0xe,%eax
 61f:	cd 40                	int    $0x40
 621:	c3                   	ret    

00000622 <clone>:
SYSCALL(clone)
 622:	b8 16 00 00 00       	mov    $0x16,%eax
 627:	cd 40                	int    $0x40
 629:	c3                   	ret    

0000062a <join>:
SYSCALL(join) 
 62a:	b8 17 00 00 00       	mov    $0x17,%eax
 62f:	cd 40                	int    $0x40
 631:	c3                   	ret    

00000632 <semaphore_init>:
SYSCALL(semaphore_init)
 632:	b8 18 00 00 00       	mov    $0x18,%eax
 637:	cd 40                	int    $0x40
 639:	c3                   	ret    

0000063a <semaphore_wait>:
SYSCALL(semaphore_wait)
 63a:	b8 19 00 00 00       	mov    $0x19,%eax
 63f:	cd 40                	int    $0x40
 641:	c3                   	ret    

00000642 <semaphore_signal>:
SYSCALL(semaphore_signal)
 642:	b8 1a 00 00 00       	mov    $0x1a,%eax
 647:	cd 40                	int    $0x40
 649:	c3                   	ret    

0000064a <semaphore_close>:
SYSCALL(semaphore_close)
 64a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 64f:	cd 40                	int    $0x40
 651:	c3                   	ret    
 652:	66 90                	xchg   %ax,%ax
 654:	66 90                	xchg   %ax,%ax
 656:	66 90                	xchg   %ax,%ax
 658:	66 90                	xchg   %ax,%ax
 65a:	66 90                	xchg   %ax,%ax
 65c:	66 90                	xchg   %ax,%ax
 65e:	66 90                	xchg   %ax,%ax

00000660 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	57                   	push   %edi
 664:	56                   	push   %esi
 665:	53                   	push   %ebx
 666:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 669:	85 d2                	test   %edx,%edx
{
 66b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 66e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 670:	79 76                	jns    6e8 <printint+0x88>
 672:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 676:	74 70                	je     6e8 <printint+0x88>
    x = -xx;
 678:	f7 d8                	neg    %eax
    neg = 1;
 67a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 681:	31 f6                	xor    %esi,%esi
 683:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 686:	eb 0a                	jmp    692 <printint+0x32>
 688:	90                   	nop
 689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 690:	89 fe                	mov    %edi,%esi
 692:	31 d2                	xor    %edx,%edx
 694:	8d 7e 01             	lea    0x1(%esi),%edi
 697:	f7 f1                	div    %ecx
 699:	0f b6 92 60 0b 00 00 	movzbl 0xb60(%edx),%edx
  }while((x /= base) != 0);
 6a0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 6a2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 6a5:	75 e9                	jne    690 <printint+0x30>
  if(neg)
 6a7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 6aa:	85 c0                	test   %eax,%eax
 6ac:	74 08                	je     6b6 <printint+0x56>
    buf[i++] = '-';
 6ae:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 6b3:	8d 7e 02             	lea    0x2(%esi),%edi
 6b6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 6ba:	8b 7d c0             	mov    -0x40(%ebp),%edi
 6bd:	8d 76 00             	lea    0x0(%esi),%esi
 6c0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 6c3:	83 ec 04             	sub    $0x4,%esp
 6c6:	83 ee 01             	sub    $0x1,%esi
 6c9:	6a 01                	push   $0x1
 6cb:	53                   	push   %ebx
 6cc:	57                   	push   %edi
 6cd:	88 45 d7             	mov    %al,-0x29(%ebp)
 6d0:	e8 cd fe ff ff       	call   5a2 <write>

  while(--i >= 0)
 6d5:	83 c4 10             	add    $0x10,%esp
 6d8:	39 de                	cmp    %ebx,%esi
 6da:	75 e4                	jne    6c0 <printint+0x60>
    putc(fd, buf[i]);
}
 6dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6df:	5b                   	pop    %ebx
 6e0:	5e                   	pop    %esi
 6e1:	5f                   	pop    %edi
 6e2:	5d                   	pop    %ebp
 6e3:	c3                   	ret    
 6e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 6e8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 6ef:	eb 90                	jmp    681 <printint+0x21>
 6f1:	eb 0d                	jmp    700 <printf>
 6f3:	90                   	nop
 6f4:	90                   	nop
 6f5:	90                   	nop
 6f6:	90                   	nop
 6f7:	90                   	nop
 6f8:	90                   	nop
 6f9:	90                   	nop
 6fa:	90                   	nop
 6fb:	90                   	nop
 6fc:	90                   	nop
 6fd:	90                   	nop
 6fe:	90                   	nop
 6ff:	90                   	nop

00000700 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
 706:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 709:	8b 75 0c             	mov    0xc(%ebp),%esi
 70c:	0f b6 1e             	movzbl (%esi),%ebx
 70f:	84 db                	test   %bl,%bl
 711:	0f 84 b3 00 00 00    	je     7ca <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 717:	8d 45 10             	lea    0x10(%ebp),%eax
 71a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 71d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 71f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 722:	eb 2f                	jmp    753 <printf+0x53>
 724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 728:	83 f8 25             	cmp    $0x25,%eax
 72b:	0f 84 a7 00 00 00    	je     7d8 <printf+0xd8>
  write(fd, &c, 1);
 731:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 734:	83 ec 04             	sub    $0x4,%esp
 737:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 73a:	6a 01                	push   $0x1
 73c:	50                   	push   %eax
 73d:	ff 75 08             	pushl  0x8(%ebp)
 740:	e8 5d fe ff ff       	call   5a2 <write>
 745:	83 c4 10             	add    $0x10,%esp
 748:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 74b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 74f:	84 db                	test   %bl,%bl
 751:	74 77                	je     7ca <printf+0xca>
    if(state == 0){
 753:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 755:	0f be cb             	movsbl %bl,%ecx
 758:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 75b:	74 cb                	je     728 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 75d:	83 ff 25             	cmp    $0x25,%edi
 760:	75 e6                	jne    748 <printf+0x48>
      if(c == 'd'){
 762:	83 f8 64             	cmp    $0x64,%eax
 765:	0f 84 05 01 00 00    	je     870 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 76b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 771:	83 f9 70             	cmp    $0x70,%ecx
 774:	74 72                	je     7e8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 776:	83 f8 73             	cmp    $0x73,%eax
 779:	0f 84 99 00 00 00    	je     818 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 77f:	83 f8 63             	cmp    $0x63,%eax
 782:	0f 84 08 01 00 00    	je     890 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 788:	83 f8 25             	cmp    $0x25,%eax
 78b:	0f 84 ef 00 00 00    	je     880 <printf+0x180>
  write(fd, &c, 1);
 791:	8d 45 e7             	lea    -0x19(%ebp),%eax
 794:	83 ec 04             	sub    $0x4,%esp
 797:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 79b:	6a 01                	push   $0x1
 79d:	50                   	push   %eax
 79e:	ff 75 08             	pushl  0x8(%ebp)
 7a1:	e8 fc fd ff ff       	call   5a2 <write>
 7a6:	83 c4 0c             	add    $0xc,%esp
 7a9:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 7ac:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 7af:	6a 01                	push   $0x1
 7b1:	50                   	push   %eax
 7b2:	ff 75 08             	pushl  0x8(%ebp)
 7b5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7b8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 7ba:	e8 e3 fd ff ff       	call   5a2 <write>
  for(i = 0; fmt[i]; i++){
 7bf:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 7c3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 7c6:	84 db                	test   %bl,%bl
 7c8:	75 89                	jne    753 <printf+0x53>
    }
  }
}
 7ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7cd:	5b                   	pop    %ebx
 7ce:	5e                   	pop    %esi
 7cf:	5f                   	pop    %edi
 7d0:	5d                   	pop    %ebp
 7d1:	c3                   	ret    
 7d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 7d8:	bf 25 00 00 00       	mov    $0x25,%edi
 7dd:	e9 66 ff ff ff       	jmp    748 <printf+0x48>
 7e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 7e8:	83 ec 0c             	sub    $0xc,%esp
 7eb:	b9 10 00 00 00       	mov    $0x10,%ecx
 7f0:	6a 00                	push   $0x0
 7f2:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 7f5:	8b 45 08             	mov    0x8(%ebp),%eax
 7f8:	8b 17                	mov    (%edi),%edx
 7fa:	e8 61 fe ff ff       	call   660 <printint>
        ap++;
 7ff:	89 f8                	mov    %edi,%eax
 801:	83 c4 10             	add    $0x10,%esp
      state = 0;
 804:	31 ff                	xor    %edi,%edi
        ap++;
 806:	83 c0 04             	add    $0x4,%eax
 809:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 80c:	e9 37 ff ff ff       	jmp    748 <printf+0x48>
 811:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 818:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 81b:	8b 08                	mov    (%eax),%ecx
        ap++;
 81d:	83 c0 04             	add    $0x4,%eax
 820:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 823:	85 c9                	test   %ecx,%ecx
 825:	0f 84 8e 00 00 00    	je     8b9 <printf+0x1b9>
        while(*s != 0){
 82b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 82e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 830:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 832:	84 c0                	test   %al,%al
 834:	0f 84 0e ff ff ff    	je     748 <printf+0x48>
 83a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 83d:	89 de                	mov    %ebx,%esi
 83f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 842:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 845:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 848:	83 ec 04             	sub    $0x4,%esp
          s++;
 84b:	83 c6 01             	add    $0x1,%esi
 84e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 851:	6a 01                	push   $0x1
 853:	57                   	push   %edi
 854:	53                   	push   %ebx
 855:	e8 48 fd ff ff       	call   5a2 <write>
        while(*s != 0){
 85a:	0f b6 06             	movzbl (%esi),%eax
 85d:	83 c4 10             	add    $0x10,%esp
 860:	84 c0                	test   %al,%al
 862:	75 e4                	jne    848 <printf+0x148>
 864:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 867:	31 ff                	xor    %edi,%edi
 869:	e9 da fe ff ff       	jmp    748 <printf+0x48>
 86e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 870:	83 ec 0c             	sub    $0xc,%esp
 873:	b9 0a 00 00 00       	mov    $0xa,%ecx
 878:	6a 01                	push   $0x1
 87a:	e9 73 ff ff ff       	jmp    7f2 <printf+0xf2>
 87f:	90                   	nop
  write(fd, &c, 1);
 880:	83 ec 04             	sub    $0x4,%esp
 883:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 886:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 889:	6a 01                	push   $0x1
 88b:	e9 21 ff ff ff       	jmp    7b1 <printf+0xb1>
        putc(fd, *ap);
 890:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 893:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 896:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 898:	6a 01                	push   $0x1
        ap++;
 89a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 89d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 8a0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 8a3:	50                   	push   %eax
 8a4:	ff 75 08             	pushl  0x8(%ebp)
 8a7:	e8 f6 fc ff ff       	call   5a2 <write>
        ap++;
 8ac:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 8af:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8b2:	31 ff                	xor    %edi,%edi
 8b4:	e9 8f fe ff ff       	jmp    748 <printf+0x48>
          s = "(null)";
 8b9:	bb 58 0b 00 00       	mov    $0xb58,%ebx
        while(*s != 0){
 8be:	b8 28 00 00 00       	mov    $0x28,%eax
 8c3:	e9 72 ff ff ff       	jmp    83a <printf+0x13a>
 8c8:	66 90                	xchg   %ax,%ax
 8ca:	66 90                	xchg   %ax,%ax
 8cc:	66 90                	xchg   %ax,%ax
 8ce:	66 90                	xchg   %ax,%ax

000008d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8d1:	a1 30 0f 00 00       	mov    0xf30,%eax
{
 8d6:	89 e5                	mov    %esp,%ebp
 8d8:	57                   	push   %edi
 8d9:	56                   	push   %esi
 8da:	53                   	push   %ebx
 8db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 8de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 8e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8e8:	39 c8                	cmp    %ecx,%eax
 8ea:	8b 10                	mov    (%eax),%edx
 8ec:	73 32                	jae    920 <free+0x50>
 8ee:	39 d1                	cmp    %edx,%ecx
 8f0:	72 04                	jb     8f6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8f2:	39 d0                	cmp    %edx,%eax
 8f4:	72 32                	jb     928 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8f6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8f9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8fc:	39 fa                	cmp    %edi,%edx
 8fe:	74 30                	je     930 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 900:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 903:	8b 50 04             	mov    0x4(%eax),%edx
 906:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 909:	39 f1                	cmp    %esi,%ecx
 90b:	74 3a                	je     947 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 90d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 90f:	a3 30 0f 00 00       	mov    %eax,0xf30
}
 914:	5b                   	pop    %ebx
 915:	5e                   	pop    %esi
 916:	5f                   	pop    %edi
 917:	5d                   	pop    %ebp
 918:	c3                   	ret    
 919:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 920:	39 d0                	cmp    %edx,%eax
 922:	72 04                	jb     928 <free+0x58>
 924:	39 d1                	cmp    %edx,%ecx
 926:	72 ce                	jb     8f6 <free+0x26>
{
 928:	89 d0                	mov    %edx,%eax
 92a:	eb bc                	jmp    8e8 <free+0x18>
 92c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 930:	03 72 04             	add    0x4(%edx),%esi
 933:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 936:	8b 10                	mov    (%eax),%edx
 938:	8b 12                	mov    (%edx),%edx
 93a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 93d:	8b 50 04             	mov    0x4(%eax),%edx
 940:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 943:	39 f1                	cmp    %esi,%ecx
 945:	75 c6                	jne    90d <free+0x3d>
    p->s.size += bp->s.size;
 947:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 94a:	a3 30 0f 00 00       	mov    %eax,0xf30
    p->s.size += bp->s.size;
 94f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 952:	8b 53 f8             	mov    -0x8(%ebx),%edx
 955:	89 10                	mov    %edx,(%eax)
}
 957:	5b                   	pop    %ebx
 958:	5e                   	pop    %esi
 959:	5f                   	pop    %edi
 95a:	5d                   	pop    %ebp
 95b:	c3                   	ret    
 95c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000960 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 960:	55                   	push   %ebp
 961:	89 e5                	mov    %esp,%ebp
 963:	57                   	push   %edi
 964:	56                   	push   %esi
 965:	53                   	push   %ebx
 966:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 969:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 96c:	8b 15 30 0f 00 00    	mov    0xf30,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 972:	8d 78 07             	lea    0x7(%eax),%edi
 975:	c1 ef 03             	shr    $0x3,%edi
 978:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 97b:	85 d2                	test   %edx,%edx
 97d:	0f 84 9d 00 00 00    	je     a20 <malloc+0xc0>
 983:	8b 02                	mov    (%edx),%eax
 985:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 988:	39 cf                	cmp    %ecx,%edi
 98a:	76 6c                	jbe    9f8 <malloc+0x98>
 98c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 992:	bb 00 10 00 00       	mov    $0x1000,%ebx
 997:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 99a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 9a1:	eb 0e                	jmp    9b1 <malloc+0x51>
 9a3:	90                   	nop
 9a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 9aa:	8b 48 04             	mov    0x4(%eax),%ecx
 9ad:	39 f9                	cmp    %edi,%ecx
 9af:	73 47                	jae    9f8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9b1:	39 05 30 0f 00 00    	cmp    %eax,0xf30
 9b7:	89 c2                	mov    %eax,%edx
 9b9:	75 ed                	jne    9a8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 9bb:	83 ec 0c             	sub    $0xc,%esp
 9be:	56                   	push   %esi
 9bf:	e8 46 fc ff ff       	call   60a <sbrk>
  if(p == (char*)-1)
 9c4:	83 c4 10             	add    $0x10,%esp
 9c7:	83 f8 ff             	cmp    $0xffffffff,%eax
 9ca:	74 1c                	je     9e8 <malloc+0x88>
  hp->s.size = nu;
 9cc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9cf:	83 ec 0c             	sub    $0xc,%esp
 9d2:	83 c0 08             	add    $0x8,%eax
 9d5:	50                   	push   %eax
 9d6:	e8 f5 fe ff ff       	call   8d0 <free>
  return freep;
 9db:	8b 15 30 0f 00 00    	mov    0xf30,%edx
      if((p = morecore(nunits)) == 0)
 9e1:	83 c4 10             	add    $0x10,%esp
 9e4:	85 d2                	test   %edx,%edx
 9e6:	75 c0                	jne    9a8 <malloc+0x48>
        return 0;
  }
}
 9e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 9eb:	31 c0                	xor    %eax,%eax
}
 9ed:	5b                   	pop    %ebx
 9ee:	5e                   	pop    %esi
 9ef:	5f                   	pop    %edi
 9f0:	5d                   	pop    %ebp
 9f1:	c3                   	ret    
 9f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 9f8:	39 cf                	cmp    %ecx,%edi
 9fa:	74 54                	je     a50 <malloc+0xf0>
        p->s.size -= nunits;
 9fc:	29 f9                	sub    %edi,%ecx
 9fe:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a01:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a04:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 a07:	89 15 30 0f 00 00    	mov    %edx,0xf30
}
 a0d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 a10:	83 c0 08             	add    $0x8,%eax
}
 a13:	5b                   	pop    %ebx
 a14:	5e                   	pop    %esi
 a15:	5f                   	pop    %edi
 a16:	5d                   	pop    %ebp
 a17:	c3                   	ret    
 a18:	90                   	nop
 a19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 a20:	c7 05 30 0f 00 00 34 	movl   $0xf34,0xf30
 a27:	0f 00 00 
 a2a:	c7 05 34 0f 00 00 34 	movl   $0xf34,0xf34
 a31:	0f 00 00 
    base.s.size = 0;
 a34:	b8 34 0f 00 00       	mov    $0xf34,%eax
 a39:	c7 05 38 0f 00 00 00 	movl   $0x0,0xf38
 a40:	00 00 00 
 a43:	e9 44 ff ff ff       	jmp    98c <malloc+0x2c>
 a48:	90                   	nop
 a49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 a50:	8b 08                	mov    (%eax),%ecx
 a52:	89 0a                	mov    %ecx,(%edx)
 a54:	eb b1                	jmp    a07 <malloc+0xa7>

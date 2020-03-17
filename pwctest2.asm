
_pwctest2:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    }
    exit();
}


int main(int argc, char *argv[]){
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	83 ec 1c             	sub    $0x1c,%esp

    if(argc < 2 || argc > 2){
  13:	83 39 02             	cmpl   $0x2,(%ecx)
int main(int argc, char *argv[]){
  16:	8b 59 04             	mov    0x4(%ecx),%ebx
    if(argc < 2 || argc > 2){
  19:	74 21                	je     3c <main+0x3c>
        printf(1, "Needs 1 argument\n 0: Without Semaphore \n 1: With Semaphore\n");
  1b:	52                   	push   %edx
  1c:	52                   	push   %edx
  1d:	68 f0 0a 00 00       	push   $0xaf0
  22:	6a 01                	push   $0x1
  24:	e8 07 07 00 00       	call   730 <printf>
        printf(1, "Please try again\n");
  29:	59                   	pop    %ecx
  2a:	5b                   	pop    %ebx
  2b:	68 dd 0a 00 00       	push   $0xadd
  30:	6a 01                	push   $0x1
  32:	e8 f9 06 00 00       	call   730 <printf>
        exit();
  37:	e8 76 05 00 00       	call   5b2 <exit>
    } else if (atoi(argv[1]) == 0){
  3c:	83 ec 0c             	sub    $0xc,%esp
  3f:	ff 73 04             	pushl  0x4(%ebx)
  42:	e8 f9 04 00 00       	call   540 <atoi>
  47:	83 c4 10             	add    $0x10,%esp
  4a:	85 c0                	test   %eax,%eax
  4c:	0f 85 fe 00 00 00    	jne    150 <main+0x150>
        flag = 0;
  52:	c7 05 a4 0e 00 00 00 	movl   $0x0,0xea4
  59:	00 00 00 
    } else{
        printf(1, "Argument must be either 0 or 1\n");
        exit();
    }

    num_threads = 4;
  5c:	c7 05 a0 0e 00 00 04 	movl   $0x4,0xea0
  63:	00 00 00 
    global = 10; //this is the first step in calculating 10
  66:	c7 05 a8 0e 00 00 0a 	movl   $0xa,0xea8
  6d:	00 00 00 

    void *stacks[num_threads];

    
    //create the stacks for all the threads
    for(int i = 0; i < num_threads; i++){
  70:	31 f6                	xor    %esi,%esi
        stacks[i] = (void*)malloc(2*PGSIZE);
        if((uint)stacks[i] % PGSIZE){ //check if mem is page aligned
            stacks[i] = stacks[i] + (PGSIZE - (uint)stacks[i] % PGSIZE); //adjusts where the stack is so its page aligned
  72:	bb 00 10 00 00       	mov    $0x1000,%ebx
  77:	89 f6                	mov    %esi,%esi
  79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        stacks[i] = (void*)malloc(2*PGSIZE);
  80:	83 ec 0c             	sub    $0xc,%esp
  83:	68 00 20 00 00       	push   $0x2000
  88:	e8 03 09 00 00       	call   990 <malloc>
        if((uint)stacks[i] % PGSIZE){ //check if mem is page aligned
  8d:	89 c2                	mov    %eax,%edx
  8f:	83 c4 10             	add    $0x10,%esp
  92:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  98:	74 06                	je     a0 <main+0xa0>
            stacks[i] = stacks[i] + (PGSIZE - (uint)stacks[i] % PGSIZE); //adjusts where the stack is so its page aligned
  9a:	89 d9                	mov    %ebx,%ecx
  9c:	29 d1                	sub    %edx,%ecx
  9e:	01 c8                	add    %ecx,%eax
  a0:	89 44 b5 d8          	mov    %eax,-0x28(%ebp,%esi,4)
    for(int i = 0; i < num_threads; i++){
  a4:	83 c6 01             	add    $0x1,%esi
  a7:	39 35 a0 0e 00 00    	cmp    %esi,0xea0
  ad:	7f d1                	jg     80 <main+0x80>
        }
    }

    sem_index = semaphore_init(1);
  af:	83 ec 0c             	sub    $0xc,%esp
  b2:	6a 01                	push   $0x1
  b4:	e8 a9 05 00 00       	call   662 <semaphore_init>

    clone(&add, stacks[0], 0);
  b9:	83 c4 0c             	add    $0xc,%esp
    sem_index = semaphore_init(1);
  bc:	a3 ac 0e 00 00       	mov    %eax,0xeac
    clone(&add, stacks[0], 0);
  c1:	6a 00                	push   $0x0
  c3:	ff 75 d8             	pushl  -0x28(%ebp)
  c6:	68 90 01 00 00       	push   $0x190
  cb:	e8 82 05 00 00       	call   652 <clone>
    clone(&sub, stacks[1], 0);
  d0:	83 c4 0c             	add    $0xc,%esp
  d3:	6a 00                	push   $0x0
  d5:	ff 75 dc             	pushl  -0x24(%ebp)
  d8:	68 70 02 00 00       	push   $0x270
  dd:	e8 70 05 00 00       	call   652 <clone>
    clone(&multiply, stacks[2], 0);
  e2:	83 c4 0c             	add    $0xc,%esp
  e5:	6a 00                	push   $0x0
  e7:	ff 75 e0             	pushl  -0x20(%ebp)
  ea:	68 00 02 00 00       	push   $0x200
  ef:	e8 5e 05 00 00       	call   652 <clone>
    clone(&divide, stacks[3], 0);
  f4:	83 c4 0c             	add    $0xc,%esp
  f7:	6a 00                	push   $0x0
  f9:	ff 75 e4             	pushl  -0x1c(%ebp)
  fc:	68 e0 02 00 00       	push   $0x2e0
 101:	e8 4c 05 00 00       	call   652 <clone>

    for (int i = 0; i < num_threads; i++){
 106:	83 c4 10             	add    $0x10,%esp
 109:	83 3d a0 0e 00 00 00 	cmpl   $0x0,0xea0
 110:	7e 16                	jle    128 <main+0x128>
 112:	31 db                	xor    %ebx,%ebx
 114:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        join();
 118:	e8 3d 05 00 00       	call   65a <join>
    for (int i = 0; i < num_threads; i++){
 11d:	83 c3 01             	add    $0x1,%ebx
 120:	39 1d a0 0e 00 00    	cmp    %ebx,0xea0
 126:	7f f0                	jg     118 <main+0x118>
    }

    semaphore_close(sem_index); //reset the semaphore
 128:	83 ec 0c             	sub    $0xc,%esp
 12b:	ff 35 ac 0e 00 00    	pushl  0xeac
 131:	e8 44 05 00 00       	call   67a <semaphore_close>

    printf(1, "Parent: Global Final Value is %d\n", global);
 136:	83 c4 0c             	add    $0xc,%esp
 139:	ff 35 a8 0e 00 00    	pushl  0xea8
 13f:	68 4c 0b 00 00       	push   $0xb4c
 144:	6a 01                	push   $0x1
 146:	e8 e5 05 00 00       	call   730 <printf>

    exit();
 14b:	e8 62 04 00 00       	call   5b2 <exit>
    } else if (atoi(argv[1]) == 1){
 150:	83 ec 0c             	sub    $0xc,%esp
 153:	ff 73 04             	pushl  0x4(%ebx)
 156:	e8 e5 03 00 00       	call   540 <atoi>
 15b:	83 c4 10             	add    $0x10,%esp
 15e:	83 e8 01             	sub    $0x1,%eax
 161:	75 0f                	jne    172 <main+0x172>
        flag = 1;
 163:	c7 05 a4 0e 00 00 01 	movl   $0x1,0xea4
 16a:	00 00 00 
 16d:	e9 ea fe ff ff       	jmp    5c <main+0x5c>
        printf(1, "Argument must be either 0 or 1\n");
 172:	50                   	push   %eax
 173:	50                   	push   %eax
 174:	68 2c 0b 00 00       	push   $0xb2c
 179:	6a 01                	push   $0x1
 17b:	e8 b0 05 00 00       	call   730 <printf>
        exit();
 180:	e8 2d 04 00 00       	call   5b2 <exit>
 185:	66 90                	xchg   %ax,%ax
 187:	66 90                	xchg   %ax,%ax
 189:	66 90                	xchg   %ax,%ax
 18b:	66 90                	xchg   %ax,%ax
 18d:	66 90                	xchg   %ax,%ax
 18f:	90                   	nop

00000190 <add>:
void *add(void *arg){
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	83 ec 08             	sub    $0x8,%esp
    if (flag){
 196:	a1 a4 0e 00 00       	mov    0xea4,%eax
 19b:	85 c0                	test   %eax,%eax
 19d:	75 2f                	jne    1ce <add+0x3e>
    global = global + 8; //Should be step 3 with semaphore
 19f:	a1 a8 0e 00 00       	mov    0xea8,%eax
    printf(1, "Add: Global = %d\n", global);
 1a4:	83 ec 04             	sub    $0x4,%esp
    global = global + 8; //Should be step 3 with semaphore
 1a7:	83 c0 08             	add    $0x8,%eax
    printf(1, "Add: Global = %d\n", global);
 1aa:	50                   	push   %eax
 1ab:	68 88 0a 00 00       	push   $0xa88
 1b0:	6a 01                	push   $0x1
    global = global + 8; //Should be step 3 with semaphore
 1b2:	a3 a8 0e 00 00       	mov    %eax,0xea8
    printf(1, "Add: Global = %d\n", global);
 1b7:	e8 74 05 00 00       	call   730 <printf>
    if (flag){
 1bc:	8b 15 a4 0e 00 00    	mov    0xea4,%edx
 1c2:	83 c4 10             	add    $0x10,%esp
 1c5:	85 d2                	test   %edx,%edx
 1c7:	75 19                	jne    1e2 <add+0x52>
    exit();
 1c9:	e8 e4 03 00 00       	call   5b2 <exit>
        semaphore_wait(sem_index, 2); //needs to be 2 to run
 1ce:	51                   	push   %ecx
 1cf:	51                   	push   %ecx
 1d0:	6a 02                	push   $0x2
 1d2:	ff 35 ac 0e 00 00    	pushl  0xeac
 1d8:	e8 8d 04 00 00       	call   66a <semaphore_wait>
 1dd:	83 c4 10             	add    $0x10,%esp
 1e0:	eb bd                	jmp    19f <add+0xf>
        semaphore_signal(sem_index, 3); //allows divide to now run
 1e2:	50                   	push   %eax
 1e3:	50                   	push   %eax
 1e4:	6a 03                	push   $0x3
 1e6:	ff 35 ac 0e 00 00    	pushl  0xeac
 1ec:	e8 81 04 00 00       	call   672 <semaphore_signal>
 1f1:	83 c4 10             	add    $0x10,%esp
 1f4:	eb d3                	jmp    1c9 <add+0x39>
 1f6:	8d 76 00             	lea    0x0(%esi),%esi
 1f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000200 <multiply>:
void *multiply(void *arg){
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	83 ec 08             	sub    $0x8,%esp
    if (flag){
 206:	a1 a4 0e 00 00       	mov    0xea4,%eax
 20b:	85 c0                	test   %eax,%eax
 20d:	75 2f                	jne    23e <multiply+0x3e>
    global = global * 4; //Should be step 2 with semaphore
 20f:	a1 a8 0e 00 00       	mov    0xea8,%eax
    printf(1, "Multiply: Global = %d\n", global);
 214:	83 ec 04             	sub    $0x4,%esp
    global = global * 4; //Should be step 2 with semaphore
 217:	c1 e0 02             	shl    $0x2,%eax
    printf(1, "Multiply: Global = %d\n", global);
 21a:	50                   	push   %eax
 21b:	68 9a 0a 00 00       	push   $0xa9a
 220:	6a 01                	push   $0x1
    global = global * 4; //Should be step 2 with semaphore
 222:	a3 a8 0e 00 00       	mov    %eax,0xea8
    printf(1, "Multiply: Global = %d\n", global);
 227:	e8 04 05 00 00       	call   730 <printf>
    if (flag){
 22c:	8b 15 a4 0e 00 00    	mov    0xea4,%edx
 232:	83 c4 10             	add    $0x10,%esp
 235:	85 d2                	test   %edx,%edx
 237:	75 19                	jne    252 <multiply+0x52>
    exit();
 239:	e8 74 03 00 00       	call   5b2 <exit>
        semaphore_wait(sem_index, 1); //should always go in if its initialized
 23e:	51                   	push   %ecx
 23f:	51                   	push   %ecx
 240:	6a 01                	push   $0x1
 242:	ff 35 ac 0e 00 00    	pushl  0xeac
 248:	e8 1d 04 00 00       	call   66a <semaphore_wait>
 24d:	83 c4 10             	add    $0x10,%esp
 250:	eb bd                	jmp    20f <multiply+0xf>
        semaphore_signal(sem_index, 2); //allows add to now run
 252:	50                   	push   %eax
 253:	50                   	push   %eax
 254:	6a 02                	push   $0x2
 256:	ff 35 ac 0e 00 00    	pushl  0xeac
 25c:	e8 11 04 00 00       	call   672 <semaphore_signal>
 261:	83 c4 10             	add    $0x10,%esp
 264:	eb d3                	jmp    239 <multiply+0x39>
 266:	8d 76 00             	lea    0x0(%esi),%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000270 <sub>:
void *sub(void *arg){
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	83 ec 08             	sub    $0x8,%esp
    if (flag){
 276:	a1 a4 0e 00 00       	mov    0xea4,%eax
 27b:	85 c0                	test   %eax,%eax
 27d:	75 2f                	jne    2ae <sub+0x3e>
    global = global - 4; //Should be step 5 with semaphore
 27f:	a1 a8 0e 00 00       	mov    0xea8,%eax
    printf(1, "Subtract: Global = %d\n", global);
 284:	83 ec 04             	sub    $0x4,%esp
    global = global - 4; //Should be step 5 with semaphore
 287:	83 e8 04             	sub    $0x4,%eax
    printf(1, "Subtract: Global = %d\n", global);
 28a:	50                   	push   %eax
 28b:	68 b1 0a 00 00       	push   $0xab1
 290:	6a 01                	push   $0x1
    global = global - 4; //Should be step 5 with semaphore
 292:	a3 a8 0e 00 00       	mov    %eax,0xea8
    printf(1, "Subtract: Global = %d\n", global);
 297:	e8 94 04 00 00       	call   730 <printf>
    if (flag){
 29c:	8b 15 a4 0e 00 00    	mov    0xea4,%edx
 2a2:	83 c4 10             	add    $0x10,%esp
 2a5:	85 d2                	test   %edx,%edx
 2a7:	75 19                	jne    2c2 <sub+0x52>
    exit();
 2a9:	e8 04 03 00 00       	call   5b2 <exit>
        semaphore_wait(sem_index, 4); //wait till divide has signaled
 2ae:	51                   	push   %ecx
 2af:	51                   	push   %ecx
 2b0:	6a 04                	push   $0x4
 2b2:	ff 35 ac 0e 00 00    	pushl  0xeac
 2b8:	e8 ad 03 00 00       	call   66a <semaphore_wait>
 2bd:	83 c4 10             	add    $0x10,%esp
 2c0:	eb bd                	jmp    27f <sub+0xf>
        semaphore_signal(sem_index, 1); //resets it to 1
 2c2:	50                   	push   %eax
 2c3:	50                   	push   %eax
 2c4:	6a 01                	push   $0x1
 2c6:	ff 35 ac 0e 00 00    	pushl  0xeac
 2cc:	e8 a1 03 00 00       	call   672 <semaphore_signal>
 2d1:	83 c4 10             	add    $0x10,%esp
 2d4:	eb d3                	jmp    2a9 <sub+0x39>
 2d6:	8d 76 00             	lea    0x0(%esi),%esi
 2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002e0 <divide>:
void *divide(void *arg){
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	83 ec 08             	sub    $0x8,%esp
    if (flag){
 2e6:	a1 a4 0e 00 00       	mov    0xea4,%eax
 2eb:	85 c0                	test   %eax,%eax
 2ed:	75 3c                	jne    32b <divide+0x4b>
    global = global / 6; //Should be step 4 with semaphore
 2ef:	8b 0d a8 0e 00 00    	mov    0xea8,%ecx
 2f5:	ba ab aa aa 2a       	mov    $0x2aaaaaab,%edx
    printf(1, "Divide: Global = %d\n", global);
 2fa:	83 ec 04             	sub    $0x4,%esp
    global = global / 6; //Should be step 4 with semaphore
 2fd:	89 c8                	mov    %ecx,%eax
 2ff:	c1 f9 1f             	sar    $0x1f,%ecx
 302:	f7 ea                	imul   %edx
 304:	29 ca                	sub    %ecx,%edx
    printf(1, "Divide: Global = %d\n", global);
 306:	52                   	push   %edx
 307:	68 c8 0a 00 00       	push   $0xac8
 30c:	6a 01                	push   $0x1
    global = global / 6; //Should be step 4 with semaphore
 30e:	89 15 a8 0e 00 00    	mov    %edx,0xea8
    printf(1, "Divide: Global = %d\n", global);
 314:	e8 17 04 00 00       	call   730 <printf>
    if (flag){
 319:	8b 15 a4 0e 00 00    	mov    0xea4,%edx
 31f:	83 c4 10             	add    $0x10,%esp
 322:	85 d2                	test   %edx,%edx
 324:	75 19                	jne    33f <divide+0x5f>
    exit();
 326:	e8 87 02 00 00       	call   5b2 <exit>
        semaphore_wait(sem_index, 3); //wait till after add has signaled
 32b:	51                   	push   %ecx
 32c:	51                   	push   %ecx
 32d:	6a 03                	push   $0x3
 32f:	ff 35 ac 0e 00 00    	pushl  0xeac
 335:	e8 30 03 00 00       	call   66a <semaphore_wait>
 33a:	83 c4 10             	add    $0x10,%esp
 33d:	eb b0                	jmp    2ef <divide+0xf>
        semaphore_signal(sem_index, 4); //allow subtract to run
 33f:	50                   	push   %eax
 340:	50                   	push   %eax
 341:	6a 04                	push   $0x4
 343:	ff 35 ac 0e 00 00    	pushl  0xeac
 349:	e8 24 03 00 00       	call   672 <semaphore_signal>
 34e:	83 c4 10             	add    $0x10,%esp
 351:	eb d3                	jmp    326 <divide+0x46>
 353:	66 90                	xchg   %ax,%ax
 355:	66 90                	xchg   %ax,%ax
 357:	66 90                	xchg   %ax,%ax
 359:	66 90                	xchg   %ax,%ax
 35b:	66 90                	xchg   %ax,%ax
 35d:	66 90                	xchg   %ax,%ax
 35f:	90                   	nop

00000360 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
 364:	8b 45 08             	mov    0x8(%ebp),%eax
 367:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 36a:	89 c2                	mov    %eax,%edx
 36c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 370:	83 c1 01             	add    $0x1,%ecx
 373:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 377:	83 c2 01             	add    $0x1,%edx
 37a:	84 db                	test   %bl,%bl
 37c:	88 5a ff             	mov    %bl,-0x1(%edx)
 37f:	75 ef                	jne    370 <strcpy+0x10>
    ;
  return os;
}
 381:	5b                   	pop    %ebx
 382:	5d                   	pop    %ebp
 383:	c3                   	ret    
 384:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 38a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000390 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	53                   	push   %ebx
 394:	8b 55 08             	mov    0x8(%ebp),%edx
 397:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 39a:	0f b6 02             	movzbl (%edx),%eax
 39d:	0f b6 19             	movzbl (%ecx),%ebx
 3a0:	84 c0                	test   %al,%al
 3a2:	75 1c                	jne    3c0 <strcmp+0x30>
 3a4:	eb 2a                	jmp    3d0 <strcmp+0x40>
 3a6:	8d 76 00             	lea    0x0(%esi),%esi
 3a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 3b0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3b3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 3b6:	83 c1 01             	add    $0x1,%ecx
 3b9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 3bc:	84 c0                	test   %al,%al
 3be:	74 10                	je     3d0 <strcmp+0x40>
 3c0:	38 d8                	cmp    %bl,%al
 3c2:	74 ec                	je     3b0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 3c4:	29 d8                	sub    %ebx,%eax
}
 3c6:	5b                   	pop    %ebx
 3c7:	5d                   	pop    %ebp
 3c8:	c3                   	ret    
 3c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3d0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 3d2:	29 d8                	sub    %ebx,%eax
}
 3d4:	5b                   	pop    %ebx
 3d5:	5d                   	pop    %ebp
 3d6:	c3                   	ret    
 3d7:	89 f6                	mov    %esi,%esi
 3d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003e0 <strlen>:

uint
strlen(const char *s)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3e6:	80 39 00             	cmpb   $0x0,(%ecx)
 3e9:	74 15                	je     400 <strlen+0x20>
 3eb:	31 d2                	xor    %edx,%edx
 3ed:	8d 76 00             	lea    0x0(%esi),%esi
 3f0:	83 c2 01             	add    $0x1,%edx
 3f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 3f7:	89 d0                	mov    %edx,%eax
 3f9:	75 f5                	jne    3f0 <strlen+0x10>
    ;
  return n;
}
 3fb:	5d                   	pop    %ebp
 3fc:	c3                   	ret    
 3fd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 400:	31 c0                	xor    %eax,%eax
}
 402:	5d                   	pop    %ebp
 403:	c3                   	ret    
 404:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 40a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000410 <memset>:

void*
memset(void *dst, int c, uint n)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 417:	8b 4d 10             	mov    0x10(%ebp),%ecx
 41a:	8b 45 0c             	mov    0xc(%ebp),%eax
 41d:	89 d7                	mov    %edx,%edi
 41f:	fc                   	cld    
 420:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 422:	89 d0                	mov    %edx,%eax
 424:	5f                   	pop    %edi
 425:	5d                   	pop    %ebp
 426:	c3                   	ret    
 427:	89 f6                	mov    %esi,%esi
 429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000430 <strchr>:

char*
strchr(const char *s, char c)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	53                   	push   %ebx
 434:	8b 45 08             	mov    0x8(%ebp),%eax
 437:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 43a:	0f b6 10             	movzbl (%eax),%edx
 43d:	84 d2                	test   %dl,%dl
 43f:	74 1d                	je     45e <strchr+0x2e>
    if(*s == c)
 441:	38 d3                	cmp    %dl,%bl
 443:	89 d9                	mov    %ebx,%ecx
 445:	75 0d                	jne    454 <strchr+0x24>
 447:	eb 17                	jmp    460 <strchr+0x30>
 449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 450:	38 ca                	cmp    %cl,%dl
 452:	74 0c                	je     460 <strchr+0x30>
  for(; *s; s++)
 454:	83 c0 01             	add    $0x1,%eax
 457:	0f b6 10             	movzbl (%eax),%edx
 45a:	84 d2                	test   %dl,%dl
 45c:	75 f2                	jne    450 <strchr+0x20>
      return (char*)s;
  return 0;
 45e:	31 c0                	xor    %eax,%eax
}
 460:	5b                   	pop    %ebx
 461:	5d                   	pop    %ebp
 462:	c3                   	ret    
 463:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000470 <gets>:

char*
gets(char *buf, int max)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	57                   	push   %edi
 474:	56                   	push   %esi
 475:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 476:	31 f6                	xor    %esi,%esi
 478:	89 f3                	mov    %esi,%ebx
{
 47a:	83 ec 1c             	sub    $0x1c,%esp
 47d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 480:	eb 2f                	jmp    4b1 <gets+0x41>
 482:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 488:	8d 45 e7             	lea    -0x19(%ebp),%eax
 48b:	83 ec 04             	sub    $0x4,%esp
 48e:	6a 01                	push   $0x1
 490:	50                   	push   %eax
 491:	6a 00                	push   $0x0
 493:	e8 32 01 00 00       	call   5ca <read>
    if(cc < 1)
 498:	83 c4 10             	add    $0x10,%esp
 49b:	85 c0                	test   %eax,%eax
 49d:	7e 1c                	jle    4bb <gets+0x4b>
      break;
    buf[i++] = c;
 49f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4a3:	83 c7 01             	add    $0x1,%edi
 4a6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 4a9:	3c 0a                	cmp    $0xa,%al
 4ab:	74 23                	je     4d0 <gets+0x60>
 4ad:	3c 0d                	cmp    $0xd,%al
 4af:	74 1f                	je     4d0 <gets+0x60>
  for(i=0; i+1 < max; ){
 4b1:	83 c3 01             	add    $0x1,%ebx
 4b4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4b7:	89 fe                	mov    %edi,%esi
 4b9:	7c cd                	jl     488 <gets+0x18>
 4bb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 4bd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 4c0:	c6 03 00             	movb   $0x0,(%ebx)
}
 4c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4c6:	5b                   	pop    %ebx
 4c7:	5e                   	pop    %esi
 4c8:	5f                   	pop    %edi
 4c9:	5d                   	pop    %ebp
 4ca:	c3                   	ret    
 4cb:	90                   	nop
 4cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4d0:	8b 75 08             	mov    0x8(%ebp),%esi
 4d3:	8b 45 08             	mov    0x8(%ebp),%eax
 4d6:	01 de                	add    %ebx,%esi
 4d8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 4da:	c6 03 00             	movb   $0x0,(%ebx)
}
 4dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4e0:	5b                   	pop    %ebx
 4e1:	5e                   	pop    %esi
 4e2:	5f                   	pop    %edi
 4e3:	5d                   	pop    %ebp
 4e4:	c3                   	ret    
 4e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	56                   	push   %esi
 4f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4f5:	83 ec 08             	sub    $0x8,%esp
 4f8:	6a 00                	push   $0x0
 4fa:	ff 75 08             	pushl  0x8(%ebp)
 4fd:	e8 f0 00 00 00       	call   5f2 <open>
  if(fd < 0)
 502:	83 c4 10             	add    $0x10,%esp
 505:	85 c0                	test   %eax,%eax
 507:	78 27                	js     530 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 509:	83 ec 08             	sub    $0x8,%esp
 50c:	ff 75 0c             	pushl  0xc(%ebp)
 50f:	89 c3                	mov    %eax,%ebx
 511:	50                   	push   %eax
 512:	e8 f3 00 00 00       	call   60a <fstat>
  close(fd);
 517:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 51a:	89 c6                	mov    %eax,%esi
  close(fd);
 51c:	e8 b9 00 00 00       	call   5da <close>
  return r;
 521:	83 c4 10             	add    $0x10,%esp
}
 524:	8d 65 f8             	lea    -0x8(%ebp),%esp
 527:	89 f0                	mov    %esi,%eax
 529:	5b                   	pop    %ebx
 52a:	5e                   	pop    %esi
 52b:	5d                   	pop    %ebp
 52c:	c3                   	ret    
 52d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 530:	be ff ff ff ff       	mov    $0xffffffff,%esi
 535:	eb ed                	jmp    524 <stat+0x34>
 537:	89 f6                	mov    %esi,%esi
 539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000540 <atoi>:

int
atoi(const char *s)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	53                   	push   %ebx
 544:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 547:	0f be 11             	movsbl (%ecx),%edx
 54a:	8d 42 d0             	lea    -0x30(%edx),%eax
 54d:	3c 09                	cmp    $0x9,%al
  n = 0;
 54f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 554:	77 1f                	ja     575 <atoi+0x35>
 556:	8d 76 00             	lea    0x0(%esi),%esi
 559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 560:	8d 04 80             	lea    (%eax,%eax,4),%eax
 563:	83 c1 01             	add    $0x1,%ecx
 566:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 56a:	0f be 11             	movsbl (%ecx),%edx
 56d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 570:	80 fb 09             	cmp    $0x9,%bl
 573:	76 eb                	jbe    560 <atoi+0x20>
  return n;
}
 575:	5b                   	pop    %ebx
 576:	5d                   	pop    %ebp
 577:	c3                   	ret    
 578:	90                   	nop
 579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000580 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	56                   	push   %esi
 584:	53                   	push   %ebx
 585:	8b 5d 10             	mov    0x10(%ebp),%ebx
 588:	8b 45 08             	mov    0x8(%ebp),%eax
 58b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 58e:	85 db                	test   %ebx,%ebx
 590:	7e 14                	jle    5a6 <memmove+0x26>
 592:	31 d2                	xor    %edx,%edx
 594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 598:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 59c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 59f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 5a2:	39 d3                	cmp    %edx,%ebx
 5a4:	75 f2                	jne    598 <memmove+0x18>
  return vdst;
}
 5a6:	5b                   	pop    %ebx
 5a7:	5e                   	pop    %esi
 5a8:	5d                   	pop    %ebp
 5a9:	c3                   	ret    

000005aa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5aa:	b8 01 00 00 00       	mov    $0x1,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <exit>:
SYSCALL(exit)
 5b2:	b8 02 00 00 00       	mov    $0x2,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <wait>:
SYSCALL(wait)
 5ba:	b8 03 00 00 00       	mov    $0x3,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <pipe>:
SYSCALL(pipe)
 5c2:	b8 04 00 00 00       	mov    $0x4,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <read>:
SYSCALL(read)
 5ca:	b8 05 00 00 00       	mov    $0x5,%eax
 5cf:	cd 40                	int    $0x40
 5d1:	c3                   	ret    

000005d2 <write>:
SYSCALL(write)
 5d2:	b8 10 00 00 00       	mov    $0x10,%eax
 5d7:	cd 40                	int    $0x40
 5d9:	c3                   	ret    

000005da <close>:
SYSCALL(close)
 5da:	b8 15 00 00 00       	mov    $0x15,%eax
 5df:	cd 40                	int    $0x40
 5e1:	c3                   	ret    

000005e2 <kill>:
SYSCALL(kill)
 5e2:	b8 06 00 00 00       	mov    $0x6,%eax
 5e7:	cd 40                	int    $0x40
 5e9:	c3                   	ret    

000005ea <exec>:
SYSCALL(exec)
 5ea:	b8 07 00 00 00       	mov    $0x7,%eax
 5ef:	cd 40                	int    $0x40
 5f1:	c3                   	ret    

000005f2 <open>:
SYSCALL(open)
 5f2:	b8 0f 00 00 00       	mov    $0xf,%eax
 5f7:	cd 40                	int    $0x40
 5f9:	c3                   	ret    

000005fa <mknod>:
SYSCALL(mknod)
 5fa:	b8 11 00 00 00       	mov    $0x11,%eax
 5ff:	cd 40                	int    $0x40
 601:	c3                   	ret    

00000602 <unlink>:
SYSCALL(unlink)
 602:	b8 12 00 00 00       	mov    $0x12,%eax
 607:	cd 40                	int    $0x40
 609:	c3                   	ret    

0000060a <fstat>:
SYSCALL(fstat)
 60a:	b8 08 00 00 00       	mov    $0x8,%eax
 60f:	cd 40                	int    $0x40
 611:	c3                   	ret    

00000612 <link>:
SYSCALL(link)
 612:	b8 13 00 00 00       	mov    $0x13,%eax
 617:	cd 40                	int    $0x40
 619:	c3                   	ret    

0000061a <mkdir>:
SYSCALL(mkdir)
 61a:	b8 14 00 00 00       	mov    $0x14,%eax
 61f:	cd 40                	int    $0x40
 621:	c3                   	ret    

00000622 <chdir>:
SYSCALL(chdir)
 622:	b8 09 00 00 00       	mov    $0x9,%eax
 627:	cd 40                	int    $0x40
 629:	c3                   	ret    

0000062a <dup>:
SYSCALL(dup)
 62a:	b8 0a 00 00 00       	mov    $0xa,%eax
 62f:	cd 40                	int    $0x40
 631:	c3                   	ret    

00000632 <getpid>:
SYSCALL(getpid)
 632:	b8 0b 00 00 00       	mov    $0xb,%eax
 637:	cd 40                	int    $0x40
 639:	c3                   	ret    

0000063a <sbrk>:
SYSCALL(sbrk)
 63a:	b8 0c 00 00 00       	mov    $0xc,%eax
 63f:	cd 40                	int    $0x40
 641:	c3                   	ret    

00000642 <sleep>:
SYSCALL(sleep)
 642:	b8 0d 00 00 00       	mov    $0xd,%eax
 647:	cd 40                	int    $0x40
 649:	c3                   	ret    

0000064a <uptime>:
SYSCALL(uptime)
 64a:	b8 0e 00 00 00       	mov    $0xe,%eax
 64f:	cd 40                	int    $0x40
 651:	c3                   	ret    

00000652 <clone>:
SYSCALL(clone)
 652:	b8 16 00 00 00       	mov    $0x16,%eax
 657:	cd 40                	int    $0x40
 659:	c3                   	ret    

0000065a <join>:
SYSCALL(join) 
 65a:	b8 17 00 00 00       	mov    $0x17,%eax
 65f:	cd 40                	int    $0x40
 661:	c3                   	ret    

00000662 <semaphore_init>:
SYSCALL(semaphore_init)
 662:	b8 18 00 00 00       	mov    $0x18,%eax
 667:	cd 40                	int    $0x40
 669:	c3                   	ret    

0000066a <semaphore_wait>:
SYSCALL(semaphore_wait)
 66a:	b8 19 00 00 00       	mov    $0x19,%eax
 66f:	cd 40                	int    $0x40
 671:	c3                   	ret    

00000672 <semaphore_signal>:
SYSCALL(semaphore_signal)
 672:	b8 1a 00 00 00       	mov    $0x1a,%eax
 677:	cd 40                	int    $0x40
 679:	c3                   	ret    

0000067a <semaphore_close>:
SYSCALL(semaphore_close)
 67a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 67f:	cd 40                	int    $0x40
 681:	c3                   	ret    
 682:	66 90                	xchg   %ax,%ax
 684:	66 90                	xchg   %ax,%ax
 686:	66 90                	xchg   %ax,%ax
 688:	66 90                	xchg   %ax,%ax
 68a:	66 90                	xchg   %ax,%ax
 68c:	66 90                	xchg   %ax,%ax
 68e:	66 90                	xchg   %ax,%ax

00000690 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	57                   	push   %edi
 694:	56                   	push   %esi
 695:	53                   	push   %ebx
 696:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 699:	85 d2                	test   %edx,%edx
{
 69b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 69e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 6a0:	79 76                	jns    718 <printint+0x88>
 6a2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 6a6:	74 70                	je     718 <printint+0x88>
    x = -xx;
 6a8:	f7 d8                	neg    %eax
    neg = 1;
 6aa:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6b1:	31 f6                	xor    %esi,%esi
 6b3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 6b6:	eb 0a                	jmp    6c2 <printint+0x32>
 6b8:	90                   	nop
 6b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 6c0:	89 fe                	mov    %edi,%esi
 6c2:	31 d2                	xor    %edx,%edx
 6c4:	8d 7e 01             	lea    0x1(%esi),%edi
 6c7:	f7 f1                	div    %ecx
 6c9:	0f b6 92 78 0b 00 00 	movzbl 0xb78(%edx),%edx
  }while((x /= base) != 0);
 6d0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 6d2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 6d5:	75 e9                	jne    6c0 <printint+0x30>
  if(neg)
 6d7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 6da:	85 c0                	test   %eax,%eax
 6dc:	74 08                	je     6e6 <printint+0x56>
    buf[i++] = '-';
 6de:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 6e3:	8d 7e 02             	lea    0x2(%esi),%edi
 6e6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 6ea:	8b 7d c0             	mov    -0x40(%ebp),%edi
 6ed:	8d 76 00             	lea    0x0(%esi),%esi
 6f0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 6f3:	83 ec 04             	sub    $0x4,%esp
 6f6:	83 ee 01             	sub    $0x1,%esi
 6f9:	6a 01                	push   $0x1
 6fb:	53                   	push   %ebx
 6fc:	57                   	push   %edi
 6fd:	88 45 d7             	mov    %al,-0x29(%ebp)
 700:	e8 cd fe ff ff       	call   5d2 <write>

  while(--i >= 0)
 705:	83 c4 10             	add    $0x10,%esp
 708:	39 de                	cmp    %ebx,%esi
 70a:	75 e4                	jne    6f0 <printint+0x60>
    putc(fd, buf[i]);
}
 70c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 70f:	5b                   	pop    %ebx
 710:	5e                   	pop    %esi
 711:	5f                   	pop    %edi
 712:	5d                   	pop    %ebp
 713:	c3                   	ret    
 714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 718:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 71f:	eb 90                	jmp    6b1 <printint+0x21>
 721:	eb 0d                	jmp    730 <printf>
 723:	90                   	nop
 724:	90                   	nop
 725:	90                   	nop
 726:	90                   	nop
 727:	90                   	nop
 728:	90                   	nop
 729:	90                   	nop
 72a:	90                   	nop
 72b:	90                   	nop
 72c:	90                   	nop
 72d:	90                   	nop
 72e:	90                   	nop
 72f:	90                   	nop

00000730 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	57                   	push   %edi
 734:	56                   	push   %esi
 735:	53                   	push   %ebx
 736:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 739:	8b 75 0c             	mov    0xc(%ebp),%esi
 73c:	0f b6 1e             	movzbl (%esi),%ebx
 73f:	84 db                	test   %bl,%bl
 741:	0f 84 b3 00 00 00    	je     7fa <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 747:	8d 45 10             	lea    0x10(%ebp),%eax
 74a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 74d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 74f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 752:	eb 2f                	jmp    783 <printf+0x53>
 754:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 758:	83 f8 25             	cmp    $0x25,%eax
 75b:	0f 84 a7 00 00 00    	je     808 <printf+0xd8>
  write(fd, &c, 1);
 761:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 764:	83 ec 04             	sub    $0x4,%esp
 767:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 76a:	6a 01                	push   $0x1
 76c:	50                   	push   %eax
 76d:	ff 75 08             	pushl  0x8(%ebp)
 770:	e8 5d fe ff ff       	call   5d2 <write>
 775:	83 c4 10             	add    $0x10,%esp
 778:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 77b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 77f:	84 db                	test   %bl,%bl
 781:	74 77                	je     7fa <printf+0xca>
    if(state == 0){
 783:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 785:	0f be cb             	movsbl %bl,%ecx
 788:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 78b:	74 cb                	je     758 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 78d:	83 ff 25             	cmp    $0x25,%edi
 790:	75 e6                	jne    778 <printf+0x48>
      if(c == 'd'){
 792:	83 f8 64             	cmp    $0x64,%eax
 795:	0f 84 05 01 00 00    	je     8a0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 79b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 7a1:	83 f9 70             	cmp    $0x70,%ecx
 7a4:	74 72                	je     818 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 7a6:	83 f8 73             	cmp    $0x73,%eax
 7a9:	0f 84 99 00 00 00    	je     848 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7af:	83 f8 63             	cmp    $0x63,%eax
 7b2:	0f 84 08 01 00 00    	je     8c0 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 7b8:	83 f8 25             	cmp    $0x25,%eax
 7bb:	0f 84 ef 00 00 00    	je     8b0 <printf+0x180>
  write(fd, &c, 1);
 7c1:	8d 45 e7             	lea    -0x19(%ebp),%eax
 7c4:	83 ec 04             	sub    $0x4,%esp
 7c7:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 7cb:	6a 01                	push   $0x1
 7cd:	50                   	push   %eax
 7ce:	ff 75 08             	pushl  0x8(%ebp)
 7d1:	e8 fc fd ff ff       	call   5d2 <write>
 7d6:	83 c4 0c             	add    $0xc,%esp
 7d9:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 7dc:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 7df:	6a 01                	push   $0x1
 7e1:	50                   	push   %eax
 7e2:	ff 75 08             	pushl  0x8(%ebp)
 7e5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7e8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 7ea:	e8 e3 fd ff ff       	call   5d2 <write>
  for(i = 0; fmt[i]; i++){
 7ef:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 7f3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 7f6:	84 db                	test   %bl,%bl
 7f8:	75 89                	jne    783 <printf+0x53>
    }
  }
}
 7fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7fd:	5b                   	pop    %ebx
 7fe:	5e                   	pop    %esi
 7ff:	5f                   	pop    %edi
 800:	5d                   	pop    %ebp
 801:	c3                   	ret    
 802:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 808:	bf 25 00 00 00       	mov    $0x25,%edi
 80d:	e9 66 ff ff ff       	jmp    778 <printf+0x48>
 812:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 818:	83 ec 0c             	sub    $0xc,%esp
 81b:	b9 10 00 00 00       	mov    $0x10,%ecx
 820:	6a 00                	push   $0x0
 822:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 825:	8b 45 08             	mov    0x8(%ebp),%eax
 828:	8b 17                	mov    (%edi),%edx
 82a:	e8 61 fe ff ff       	call   690 <printint>
        ap++;
 82f:	89 f8                	mov    %edi,%eax
 831:	83 c4 10             	add    $0x10,%esp
      state = 0;
 834:	31 ff                	xor    %edi,%edi
        ap++;
 836:	83 c0 04             	add    $0x4,%eax
 839:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 83c:	e9 37 ff ff ff       	jmp    778 <printf+0x48>
 841:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 848:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 84b:	8b 08                	mov    (%eax),%ecx
        ap++;
 84d:	83 c0 04             	add    $0x4,%eax
 850:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 853:	85 c9                	test   %ecx,%ecx
 855:	0f 84 8e 00 00 00    	je     8e9 <printf+0x1b9>
        while(*s != 0){
 85b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 85e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 860:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 862:	84 c0                	test   %al,%al
 864:	0f 84 0e ff ff ff    	je     778 <printf+0x48>
 86a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 86d:	89 de                	mov    %ebx,%esi
 86f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 872:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 875:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 878:	83 ec 04             	sub    $0x4,%esp
          s++;
 87b:	83 c6 01             	add    $0x1,%esi
 87e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 881:	6a 01                	push   $0x1
 883:	57                   	push   %edi
 884:	53                   	push   %ebx
 885:	e8 48 fd ff ff       	call   5d2 <write>
        while(*s != 0){
 88a:	0f b6 06             	movzbl (%esi),%eax
 88d:	83 c4 10             	add    $0x10,%esp
 890:	84 c0                	test   %al,%al
 892:	75 e4                	jne    878 <printf+0x148>
 894:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 897:	31 ff                	xor    %edi,%edi
 899:	e9 da fe ff ff       	jmp    778 <printf+0x48>
 89e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 8a0:	83 ec 0c             	sub    $0xc,%esp
 8a3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8a8:	6a 01                	push   $0x1
 8aa:	e9 73 ff ff ff       	jmp    822 <printf+0xf2>
 8af:	90                   	nop
  write(fd, &c, 1);
 8b0:	83 ec 04             	sub    $0x4,%esp
 8b3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 8b6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 8b9:	6a 01                	push   $0x1
 8bb:	e9 21 ff ff ff       	jmp    7e1 <printf+0xb1>
        putc(fd, *ap);
 8c0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 8c3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 8c6:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 8c8:	6a 01                	push   $0x1
        ap++;
 8ca:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 8cd:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 8d0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 8d3:	50                   	push   %eax
 8d4:	ff 75 08             	pushl  0x8(%ebp)
 8d7:	e8 f6 fc ff ff       	call   5d2 <write>
        ap++;
 8dc:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 8df:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8e2:	31 ff                	xor    %edi,%edi
 8e4:	e9 8f fe ff ff       	jmp    778 <printf+0x48>
          s = "(null)";
 8e9:	bb 70 0b 00 00       	mov    $0xb70,%ebx
        while(*s != 0){
 8ee:	b8 28 00 00 00       	mov    $0x28,%eax
 8f3:	e9 72 ff ff ff       	jmp    86a <printf+0x13a>
 8f8:	66 90                	xchg   %ax,%ax
 8fa:	66 90                	xchg   %ax,%ax
 8fc:	66 90                	xchg   %ax,%ax
 8fe:	66 90                	xchg   %ax,%ax

00000900 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 900:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 901:	a1 94 0e 00 00       	mov    0xe94,%eax
{
 906:	89 e5                	mov    %esp,%ebp
 908:	57                   	push   %edi
 909:	56                   	push   %esi
 90a:	53                   	push   %ebx
 90b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 90e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 911:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 918:	39 c8                	cmp    %ecx,%eax
 91a:	8b 10                	mov    (%eax),%edx
 91c:	73 32                	jae    950 <free+0x50>
 91e:	39 d1                	cmp    %edx,%ecx
 920:	72 04                	jb     926 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 922:	39 d0                	cmp    %edx,%eax
 924:	72 32                	jb     958 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 926:	8b 73 fc             	mov    -0x4(%ebx),%esi
 929:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 92c:	39 fa                	cmp    %edi,%edx
 92e:	74 30                	je     960 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 930:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 933:	8b 50 04             	mov    0x4(%eax),%edx
 936:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 939:	39 f1                	cmp    %esi,%ecx
 93b:	74 3a                	je     977 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 93d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 93f:	a3 94 0e 00 00       	mov    %eax,0xe94
}
 944:	5b                   	pop    %ebx
 945:	5e                   	pop    %esi
 946:	5f                   	pop    %edi
 947:	5d                   	pop    %ebp
 948:	c3                   	ret    
 949:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 950:	39 d0                	cmp    %edx,%eax
 952:	72 04                	jb     958 <free+0x58>
 954:	39 d1                	cmp    %edx,%ecx
 956:	72 ce                	jb     926 <free+0x26>
{
 958:	89 d0                	mov    %edx,%eax
 95a:	eb bc                	jmp    918 <free+0x18>
 95c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 960:	03 72 04             	add    0x4(%edx),%esi
 963:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 966:	8b 10                	mov    (%eax),%edx
 968:	8b 12                	mov    (%edx),%edx
 96a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 96d:	8b 50 04             	mov    0x4(%eax),%edx
 970:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 973:	39 f1                	cmp    %esi,%ecx
 975:	75 c6                	jne    93d <free+0x3d>
    p->s.size += bp->s.size;
 977:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 97a:	a3 94 0e 00 00       	mov    %eax,0xe94
    p->s.size += bp->s.size;
 97f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 982:	8b 53 f8             	mov    -0x8(%ebx),%edx
 985:	89 10                	mov    %edx,(%eax)
}
 987:	5b                   	pop    %ebx
 988:	5e                   	pop    %esi
 989:	5f                   	pop    %edi
 98a:	5d                   	pop    %ebp
 98b:	c3                   	ret    
 98c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000990 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
 993:	57                   	push   %edi
 994:	56                   	push   %esi
 995:	53                   	push   %ebx
 996:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 999:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 99c:	8b 15 94 0e 00 00    	mov    0xe94,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9a2:	8d 78 07             	lea    0x7(%eax),%edi
 9a5:	c1 ef 03             	shr    $0x3,%edi
 9a8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 9ab:	85 d2                	test   %edx,%edx
 9ad:	0f 84 9d 00 00 00    	je     a50 <malloc+0xc0>
 9b3:	8b 02                	mov    (%edx),%eax
 9b5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 9b8:	39 cf                	cmp    %ecx,%edi
 9ba:	76 6c                	jbe    a28 <malloc+0x98>
 9bc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 9c2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 9c7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 9ca:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 9d1:	eb 0e                	jmp    9e1 <malloc+0x51>
 9d3:	90                   	nop
 9d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9d8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 9da:	8b 48 04             	mov    0x4(%eax),%ecx
 9dd:	39 f9                	cmp    %edi,%ecx
 9df:	73 47                	jae    a28 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9e1:	39 05 94 0e 00 00    	cmp    %eax,0xe94
 9e7:	89 c2                	mov    %eax,%edx
 9e9:	75 ed                	jne    9d8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 9eb:	83 ec 0c             	sub    $0xc,%esp
 9ee:	56                   	push   %esi
 9ef:	e8 46 fc ff ff       	call   63a <sbrk>
  if(p == (char*)-1)
 9f4:	83 c4 10             	add    $0x10,%esp
 9f7:	83 f8 ff             	cmp    $0xffffffff,%eax
 9fa:	74 1c                	je     a18 <malloc+0x88>
  hp->s.size = nu;
 9fc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9ff:	83 ec 0c             	sub    $0xc,%esp
 a02:	83 c0 08             	add    $0x8,%eax
 a05:	50                   	push   %eax
 a06:	e8 f5 fe ff ff       	call   900 <free>
  return freep;
 a0b:	8b 15 94 0e 00 00    	mov    0xe94,%edx
      if((p = morecore(nunits)) == 0)
 a11:	83 c4 10             	add    $0x10,%esp
 a14:	85 d2                	test   %edx,%edx
 a16:	75 c0                	jne    9d8 <malloc+0x48>
        return 0;
  }
}
 a18:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 a1b:	31 c0                	xor    %eax,%eax
}
 a1d:	5b                   	pop    %ebx
 a1e:	5e                   	pop    %esi
 a1f:	5f                   	pop    %edi
 a20:	5d                   	pop    %ebp
 a21:	c3                   	ret    
 a22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 a28:	39 cf                	cmp    %ecx,%edi
 a2a:	74 54                	je     a80 <malloc+0xf0>
        p->s.size -= nunits;
 a2c:	29 f9                	sub    %edi,%ecx
 a2e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a31:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a34:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 a37:	89 15 94 0e 00 00    	mov    %edx,0xe94
}
 a3d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 a40:	83 c0 08             	add    $0x8,%eax
}
 a43:	5b                   	pop    %ebx
 a44:	5e                   	pop    %esi
 a45:	5f                   	pop    %edi
 a46:	5d                   	pop    %ebp
 a47:	c3                   	ret    
 a48:	90                   	nop
 a49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 a50:	c7 05 94 0e 00 00 98 	movl   $0xe98,0xe94
 a57:	0e 00 00 
 a5a:	c7 05 98 0e 00 00 98 	movl   $0xe98,0xe98
 a61:	0e 00 00 
    base.s.size = 0;
 a64:	b8 98 0e 00 00       	mov    $0xe98,%eax
 a69:	c7 05 9c 0e 00 00 00 	movl   $0x0,0xe9c
 a70:	00 00 00 
 a73:	e9 44 ff ff ff       	jmp    9bc <malloc+0x2c>
 a78:	90                   	nop
 a79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 a80:	8b 08                	mov    (%eax),%ecx
 a82:	89 0a                	mov    %ecx,(%edx)
 a84:	eb b1                	jmp    a37 <malloc+0xa7>

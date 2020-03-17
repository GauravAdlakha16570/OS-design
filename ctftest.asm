
_ctftest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    printf(1, "Thread %d won!\n", tid);
    exit();

}

int main (int argc, char *argv[]){
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 01                	mov    (%ecx),%eax
  16:	8b 59 04             	mov    0x4(%ecx),%ebx

    if (argc < 2 || argc > 3){
  19:	8d 50 fe             	lea    -0x2(%eax),%edx
  1c:	83 fa 01             	cmp    $0x1,%edx
  1f:	0f 87 fc 00 00 00    	ja     121 <main+0x121>
        printf(1, "Enter # of Threads and # of Captures to win\n");
        exit();
    }
    else if (argc == 2){
  25:	83 f8 02             	cmp    $0x2,%eax
  28:	0f 84 06 01 00 00    	je     134 <main+0x134>
        targetcaptures = 10; //default is 10 if user doesnt provide one
    }
    else if (argc == 3){
        targetcaptures = atoi(argv[2]);
  2e:	83 ec 0c             	sub    $0xc,%esp
  31:	ff 73 08             	pushl  0x8(%ebx)
  34:	e8 d7 03 00 00       	call   410 <atoi>
  39:	83 c4 10             	add    $0x10,%esp
  3c:	a3 d4 0c 00 00       	mov    %eax,0xcd4
    }

    int numthreads = atoi(argv[1]);
  41:	83 ec 0c             	sub    $0xc,%esp
  44:	ff 73 04             	pushl  0x4(%ebx)
  47:	e8 c4 03 00 00       	call   410 <atoi>
  4c:	89 c7                	mov    %eax,%edi
    sem_index = semaphore_init(1);
  4e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    int numthreads = atoi(argv[1]);
  55:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    sem_index = semaphore_init(1);
  58:	e8 d5 04 00 00       	call   532 <semaphore_init>
  5d:	a3 d0 0c 00 00       	mov    %eax,0xcd0
    count = 1;
    winnerflag = 0;

    void *stacks[numthreads];
  62:	8d 04 bd 12 00 00 00 	lea    0x12(,%edi,4),%eax
  69:	83 c4 10             	add    $0x10,%esp
  6c:	89 fa                	mov    %edi,%edx
    winnerflag = 0;
  6e:	c7 05 e4 0c 00 00 00 	movl   $0x0,0xce4
  75:	00 00 00 
    void *stacks[numthreads];
  78:	83 e0 f0             	and    $0xfffffff0,%eax
  7b:	29 c4                	sub    %eax,%esp
  7d:	89 e6                	mov    %esp,%esi
    int *args[numthreads];
  7f:	29 c4                	sub    %eax,%esp

    for(int i = 0; i < numthreads; i++){ //allocate stacks and args
  81:	85 d2                	test   %edx,%edx
    int *args[numthreads];
  83:	89 e7                	mov    %esp,%edi
    for(int i = 0; i < numthreads; i++){ //allocate stacks and args
  85:	0f 8e 91 00 00 00    	jle    11c <main+0x11c>
  8b:	31 db                	xor    %ebx,%ebx
  8d:	8d 76 00             	lea    0x0(%esi),%esi

        stacks[i] = (void*)malloc(2*PGSIZE);
  90:	83 ec 0c             	sub    $0xc,%esp
  93:	68 00 20 00 00       	push   $0x2000
  98:	e8 c3 07 00 00       	call   860 <malloc>
        if((uint)stacks[i] % PGSIZE){ //check if mem is page aligned
  9d:	89 c1                	mov    %eax,%ecx
  9f:	83 c4 10             	add    $0x10,%esp
  a2:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
  a8:	74 09                	je     b3 <main+0xb3>
            stacks[i] = stacks[i] + (PGSIZE - (uint)stacks[i] % PGSIZE); //adjusts where the stack is so its page aligned
  aa:	ba 00 10 00 00       	mov    $0x1000,%edx
  af:	29 ca                	sub    %ecx,%edx
  b1:	01 d0                	add    %edx,%eax
        }

        args[i] = (int*)malloc(sizeof(int)); //allocate mem for the arguments
  b3:	83 ec 0c             	sub    $0xc,%esp
            stacks[i] = stacks[i] + (PGSIZE - (uint)stacks[i] % PGSIZE); //adjusts where the stack is so its page aligned
  b6:	89 04 9e             	mov    %eax,(%esi,%ebx,4)
        args[i] = (int*)malloc(sizeof(int)); //allocate mem for the arguments
  b9:	6a 04                	push   $0x4
  bb:	e8 a0 07 00 00       	call   860 <malloc>
    for(int i = 0; i < numthreads; i++){ //allocate stacks and args
  c0:	83 c4 10             	add    $0x10,%esp
        args[i] = (int*)malloc(sizeof(int)); //allocate mem for the arguments
  c3:	89 04 9f             	mov    %eax,(%edi,%ebx,4)
    for(int i = 0; i < numthreads; i++){ //allocate stacks and args
  c6:	83 c3 01             	add    $0x1,%ebx
  c9:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
  cc:	75 c2                	jne    90 <main+0x90>
    }

    for (int i = 0; i < numthreads; i++){
  ce:	31 d2                	xor    %edx,%edx
  d0:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
  d3:	89 fb                	mov    %edi,%ebx
  d5:	89 f7                	mov    %esi,%edi
  d7:	89 d6                	mov    %edx,%esi
  d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        *args[i] = i;
  e0:	8b 04 b3             	mov    (%ebx,%esi,4),%eax
        clone(&capturetheflag, stacks[i], args[i]);
  e3:	83 ec 04             	sub    $0x4,%esp
        *args[i] = i;
  e6:	89 30                	mov    %esi,(%eax)
        clone(&capturetheflag, stacks[i], args[i]);
  e8:	50                   	push   %eax
  e9:	ff 34 b7             	pushl  (%edi,%esi,4)
  ec:	68 50 01 00 00       	push   $0x150
    for (int i = 0; i < numthreads; i++){
  f1:	83 c6 01             	add    $0x1,%esi
        clone(&capturetheflag, stacks[i], args[i]);
  f4:	e8 29 04 00 00       	call   522 <clone>
    for (int i = 0; i < numthreads; i++){
  f9:	83 c4 10             	add    $0x10,%esp
  fc:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
  ff:	75 df                	jne    e0 <main+0xe0>
 101:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
 104:	31 f6                	xor    %esi,%esi
 106:	8d 76 00             	lea    0x0(%esi),%esi
 109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    }

    for (int i = 0; i < numthreads; i++){
 110:	83 c6 01             	add    $0x1,%esi

        join();
 113:	e8 12 04 00 00       	call   52a <join>
    for (int i = 0; i < numthreads; i++){
 118:	39 de                	cmp    %ebx,%esi
 11a:	75 f4                	jne    110 <main+0x110>
    }

    exit();
 11c:	e8 61 03 00 00       	call   482 <exit>
        printf(1, "Enter # of Threads and # of Captures to win\n");
 121:	50                   	push   %eax
 122:	50                   	push   %eax
 123:	68 c8 09 00 00       	push   $0x9c8
 128:	6a 01                	push   $0x1
 12a:	e8 d1 04 00 00       	call   600 <printf>
        exit();
 12f:	e8 4e 03 00 00       	call   482 <exit>
        targetcaptures = 10; //default is 10 if user doesnt provide one
 134:	c7 05 d4 0c 00 00 0a 	movl   $0xa,0xcd4
 13b:	00 00 00 
 13e:	e9 fe fe ff ff       	jmp    41 <main+0x41>
 143:	66 90                	xchg   %ax,%ax
 145:	66 90                	xchg   %ax,%ax
 147:	66 90                	xchg   %ax,%ax
 149:	66 90                	xchg   %ax,%ax
 14b:	66 90                	xchg   %ax,%ax
 14d:	66 90                	xchg   %ax,%ax
 14f:	90                   	nop

00000150 <capturetheflag>:
void *capturetheflag(void * arg){ //thread must enter critical region to get a flag cap
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	56                   	push   %esi
 154:	53                   	push   %ebx
    int tid = *(int*)arg;
 155:	8b 45 08             	mov    0x8(%ebp),%eax
 158:	8b 30                	mov    (%eax),%esi
    while(numcaptures < targetcaptures){
 15a:	a1 d4 0c 00 00       	mov    0xcd4,%eax
 15f:	85 c0                	test   %eax,%eax
 161:	0f 8e 9d 00 00 00    	jle    204 <capturetheflag+0xb4>
    int numcaptures = 0;
 167:	31 db                	xor    %ebx,%ebx
 169:	eb 42                	jmp    1ad <capturetheflag+0x5d>
 16b:	90                   	nop
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf(1, "Thread %d has captured the flag!", tid);
 170:	83 ec 04             	sub    $0x4,%esp
        numcaptures++;
 173:	83 c3 01             	add    $0x1,%ebx
        printf(1, "Thread %d has captured the flag!", tid);
 176:	56                   	push   %esi
 177:	68 a4 09 00 00       	push   $0x9a4
 17c:	6a 01                	push   $0x1
 17e:	e8 7d 04 00 00       	call   600 <printf>
        printf(1, "It has %d captures\n", numcaptures);
 183:	83 c4 0c             	add    $0xc,%esp
 186:	53                   	push   %ebx
 187:	68 7f 09 00 00       	push   $0x97f
 18c:	6a 01                	push   $0x1
 18e:	e8 6d 04 00 00       	call   600 <printf>
        semaphore_signal(sem_index, 1);
 193:	5a                   	pop    %edx
 194:	59                   	pop    %ecx
 195:	6a 01                	push   $0x1
 197:	ff 35 d0 0c 00 00    	pushl  0xcd0
 19d:	e8 a0 03 00 00       	call   542 <semaphore_signal>
    while(numcaptures < targetcaptures){
 1a2:	83 c4 10             	add    $0x10,%esp
 1a5:	39 1d d4 0c 00 00    	cmp    %ebx,0xcd4
 1ab:	7e 57                	jle    204 <capturetheflag+0xb4>
        sleep(2);
 1ad:	83 ec 0c             	sub    $0xc,%esp
 1b0:	6a 02                	push   $0x2
 1b2:	e8 5b 03 00 00       	call   512 <sleep>
        semaphore_wait(sem_index, 1);
 1b7:	59                   	pop    %ecx
 1b8:	58                   	pop    %eax
 1b9:	6a 01                	push   $0x1
 1bb:	ff 35 d0 0c 00 00    	pushl  0xcd0
 1c1:	e8 74 03 00 00       	call   53a <semaphore_wait>
        if(winnerflag){
 1c6:	a1 e4 0c 00 00       	mov    0xce4,%eax
 1cb:	83 c4 10             	add    $0x10,%esp
 1ce:	85 c0                	test   %eax,%eax
 1d0:	74 9e                	je     170 <capturetheflag+0x20>
            printf(1, "Thread %d finished with ", tid);
 1d2:	50                   	push   %eax
 1d3:	56                   	push   %esi
 1d4:	68 58 09 00 00       	push   $0x958
 1d9:	6a 01                	push   $0x1
 1db:	e8 20 04 00 00       	call   600 <printf>
            printf(1, "%d captures.\n", numcaptures);
 1e0:	83 c4 0c             	add    $0xc,%esp
 1e3:	53                   	push   %ebx
 1e4:	68 71 09 00 00       	push   $0x971
 1e9:	6a 01                	push   $0x1
 1eb:	e8 10 04 00 00       	call   600 <printf>
            semaphore_signal(sem_index, 1);
 1f0:	58                   	pop    %eax
 1f1:	5a                   	pop    %edx
 1f2:	6a 01                	push   $0x1
 1f4:	ff 35 d0 0c 00 00    	pushl  0xcd0
 1fa:	e8 43 03 00 00       	call   542 <semaphore_signal>
            exit();
 1ff:	e8 7e 02 00 00       	call   482 <exit>
    printf(1, "Thread %d won!\n", tid);
 204:	50                   	push   %eax
 205:	56                   	push   %esi
 206:	68 93 09 00 00       	push   $0x993
 20b:	6a 01                	push   $0x1
    winnerflag = 1;
 20d:	c7 05 e4 0c 00 00 01 	movl   $0x1,0xce4
 214:	00 00 00 
    printf(1, "Thread %d won!\n", tid);
 217:	e8 e4 03 00 00       	call   600 <printf>
    exit();
 21c:	e8 61 02 00 00       	call   482 <exit>
 221:	66 90                	xchg   %ax,%ax
 223:	66 90                	xchg   %ax,%ax
 225:	66 90                	xchg   %ax,%ax
 227:	66 90                	xchg   %ax,%ax
 229:	66 90                	xchg   %ax,%ax
 22b:	66 90                	xchg   %ax,%ax
 22d:	66 90                	xchg   %ax,%ax
 22f:	90                   	nop

00000230 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	53                   	push   %ebx
 234:	8b 45 08             	mov    0x8(%ebp),%eax
 237:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 23a:	89 c2                	mov    %eax,%edx
 23c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 240:	83 c1 01             	add    $0x1,%ecx
 243:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 247:	83 c2 01             	add    $0x1,%edx
 24a:	84 db                	test   %bl,%bl
 24c:	88 5a ff             	mov    %bl,-0x1(%edx)
 24f:	75 ef                	jne    240 <strcpy+0x10>
    ;
  return os;
}
 251:	5b                   	pop    %ebx
 252:	5d                   	pop    %ebp
 253:	c3                   	ret    
 254:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 25a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000260 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	53                   	push   %ebx
 264:	8b 55 08             	mov    0x8(%ebp),%edx
 267:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 26a:	0f b6 02             	movzbl (%edx),%eax
 26d:	0f b6 19             	movzbl (%ecx),%ebx
 270:	84 c0                	test   %al,%al
 272:	75 1c                	jne    290 <strcmp+0x30>
 274:	eb 2a                	jmp    2a0 <strcmp+0x40>
 276:	8d 76 00             	lea    0x0(%esi),%esi
 279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 280:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 283:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 286:	83 c1 01             	add    $0x1,%ecx
 289:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 28c:	84 c0                	test   %al,%al
 28e:	74 10                	je     2a0 <strcmp+0x40>
 290:	38 d8                	cmp    %bl,%al
 292:	74 ec                	je     280 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 294:	29 d8                	sub    %ebx,%eax
}
 296:	5b                   	pop    %ebx
 297:	5d                   	pop    %ebp
 298:	c3                   	ret    
 299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2a0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 2a2:	29 d8                	sub    %ebx,%eax
}
 2a4:	5b                   	pop    %ebx
 2a5:	5d                   	pop    %ebp
 2a6:	c3                   	ret    
 2a7:	89 f6                	mov    %esi,%esi
 2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002b0 <strlen>:

uint
strlen(const char *s)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2b6:	80 39 00             	cmpb   $0x0,(%ecx)
 2b9:	74 15                	je     2d0 <strlen+0x20>
 2bb:	31 d2                	xor    %edx,%edx
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
 2c0:	83 c2 01             	add    $0x1,%edx
 2c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 2c7:	89 d0                	mov    %edx,%eax
 2c9:	75 f5                	jne    2c0 <strlen+0x10>
    ;
  return n;
}
 2cb:	5d                   	pop    %ebp
 2cc:	c3                   	ret    
 2cd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 2d0:	31 c0                	xor    %eax,%eax
}
 2d2:	5d                   	pop    %ebp
 2d3:	c3                   	ret    
 2d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000002e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	57                   	push   %edi
 2e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ed:	89 d7                	mov    %edx,%edi
 2ef:	fc                   	cld    
 2f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2f2:	89 d0                	mov    %edx,%eax
 2f4:	5f                   	pop    %edi
 2f5:	5d                   	pop    %ebp
 2f6:	c3                   	ret    
 2f7:	89 f6                	mov    %esi,%esi
 2f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000300 <strchr>:

char*
strchr(const char *s, char c)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	53                   	push   %ebx
 304:	8b 45 08             	mov    0x8(%ebp),%eax
 307:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 30a:	0f b6 10             	movzbl (%eax),%edx
 30d:	84 d2                	test   %dl,%dl
 30f:	74 1d                	je     32e <strchr+0x2e>
    if(*s == c)
 311:	38 d3                	cmp    %dl,%bl
 313:	89 d9                	mov    %ebx,%ecx
 315:	75 0d                	jne    324 <strchr+0x24>
 317:	eb 17                	jmp    330 <strchr+0x30>
 319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 320:	38 ca                	cmp    %cl,%dl
 322:	74 0c                	je     330 <strchr+0x30>
  for(; *s; s++)
 324:	83 c0 01             	add    $0x1,%eax
 327:	0f b6 10             	movzbl (%eax),%edx
 32a:	84 d2                	test   %dl,%dl
 32c:	75 f2                	jne    320 <strchr+0x20>
      return (char*)s;
  return 0;
 32e:	31 c0                	xor    %eax,%eax
}
 330:	5b                   	pop    %ebx
 331:	5d                   	pop    %ebp
 332:	c3                   	ret    
 333:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000340 <gets>:

char*
gets(char *buf, int max)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	57                   	push   %edi
 344:	56                   	push   %esi
 345:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 346:	31 f6                	xor    %esi,%esi
 348:	89 f3                	mov    %esi,%ebx
{
 34a:	83 ec 1c             	sub    $0x1c,%esp
 34d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 350:	eb 2f                	jmp    381 <gets+0x41>
 352:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 358:	8d 45 e7             	lea    -0x19(%ebp),%eax
 35b:	83 ec 04             	sub    $0x4,%esp
 35e:	6a 01                	push   $0x1
 360:	50                   	push   %eax
 361:	6a 00                	push   $0x0
 363:	e8 32 01 00 00       	call   49a <read>
    if(cc < 1)
 368:	83 c4 10             	add    $0x10,%esp
 36b:	85 c0                	test   %eax,%eax
 36d:	7e 1c                	jle    38b <gets+0x4b>
      break;
    buf[i++] = c;
 36f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 373:	83 c7 01             	add    $0x1,%edi
 376:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 379:	3c 0a                	cmp    $0xa,%al
 37b:	74 23                	je     3a0 <gets+0x60>
 37d:	3c 0d                	cmp    $0xd,%al
 37f:	74 1f                	je     3a0 <gets+0x60>
  for(i=0; i+1 < max; ){
 381:	83 c3 01             	add    $0x1,%ebx
 384:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 387:	89 fe                	mov    %edi,%esi
 389:	7c cd                	jl     358 <gets+0x18>
 38b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 38d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 390:	c6 03 00             	movb   $0x0,(%ebx)
}
 393:	8d 65 f4             	lea    -0xc(%ebp),%esp
 396:	5b                   	pop    %ebx
 397:	5e                   	pop    %esi
 398:	5f                   	pop    %edi
 399:	5d                   	pop    %ebp
 39a:	c3                   	ret    
 39b:	90                   	nop
 39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3a0:	8b 75 08             	mov    0x8(%ebp),%esi
 3a3:	8b 45 08             	mov    0x8(%ebp),%eax
 3a6:	01 de                	add    %ebx,%esi
 3a8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 3aa:	c6 03 00             	movb   $0x0,(%ebx)
}
 3ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3b0:	5b                   	pop    %ebx
 3b1:	5e                   	pop    %esi
 3b2:	5f                   	pop    %edi
 3b3:	5d                   	pop    %ebp
 3b4:	c3                   	ret    
 3b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003c0 <stat>:

int
stat(const char *n, struct stat *st)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	56                   	push   %esi
 3c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3c5:	83 ec 08             	sub    $0x8,%esp
 3c8:	6a 00                	push   $0x0
 3ca:	ff 75 08             	pushl  0x8(%ebp)
 3cd:	e8 f0 00 00 00       	call   4c2 <open>
  if(fd < 0)
 3d2:	83 c4 10             	add    $0x10,%esp
 3d5:	85 c0                	test   %eax,%eax
 3d7:	78 27                	js     400 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 3d9:	83 ec 08             	sub    $0x8,%esp
 3dc:	ff 75 0c             	pushl  0xc(%ebp)
 3df:	89 c3                	mov    %eax,%ebx
 3e1:	50                   	push   %eax
 3e2:	e8 f3 00 00 00       	call   4da <fstat>
  close(fd);
 3e7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 3ea:	89 c6                	mov    %eax,%esi
  close(fd);
 3ec:	e8 b9 00 00 00       	call   4aa <close>
  return r;
 3f1:	83 c4 10             	add    $0x10,%esp
}
 3f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3f7:	89 f0                	mov    %esi,%eax
 3f9:	5b                   	pop    %ebx
 3fa:	5e                   	pop    %esi
 3fb:	5d                   	pop    %ebp
 3fc:	c3                   	ret    
 3fd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 400:	be ff ff ff ff       	mov    $0xffffffff,%esi
 405:	eb ed                	jmp    3f4 <stat+0x34>
 407:	89 f6                	mov    %esi,%esi
 409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000410 <atoi>:

int
atoi(const char *s)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	53                   	push   %ebx
 414:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 417:	0f be 11             	movsbl (%ecx),%edx
 41a:	8d 42 d0             	lea    -0x30(%edx),%eax
 41d:	3c 09                	cmp    $0x9,%al
  n = 0;
 41f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 424:	77 1f                	ja     445 <atoi+0x35>
 426:	8d 76 00             	lea    0x0(%esi),%esi
 429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 430:	8d 04 80             	lea    (%eax,%eax,4),%eax
 433:	83 c1 01             	add    $0x1,%ecx
 436:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 43a:	0f be 11             	movsbl (%ecx),%edx
 43d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 440:	80 fb 09             	cmp    $0x9,%bl
 443:	76 eb                	jbe    430 <atoi+0x20>
  return n;
}
 445:	5b                   	pop    %ebx
 446:	5d                   	pop    %ebp
 447:	c3                   	ret    
 448:	90                   	nop
 449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000450 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	56                   	push   %esi
 454:	53                   	push   %ebx
 455:	8b 5d 10             	mov    0x10(%ebp),%ebx
 458:	8b 45 08             	mov    0x8(%ebp),%eax
 45b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 45e:	85 db                	test   %ebx,%ebx
 460:	7e 14                	jle    476 <memmove+0x26>
 462:	31 d2                	xor    %edx,%edx
 464:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 468:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 46c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 46f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 472:	39 d3                	cmp    %edx,%ebx
 474:	75 f2                	jne    468 <memmove+0x18>
  return vdst;
}
 476:	5b                   	pop    %ebx
 477:	5e                   	pop    %esi
 478:	5d                   	pop    %ebp
 479:	c3                   	ret    

0000047a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 47a:	b8 01 00 00 00       	mov    $0x1,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <exit>:
SYSCALL(exit)
 482:	b8 02 00 00 00       	mov    $0x2,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <wait>:
SYSCALL(wait)
 48a:	b8 03 00 00 00       	mov    $0x3,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <pipe>:
SYSCALL(pipe)
 492:	b8 04 00 00 00       	mov    $0x4,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <read>:
SYSCALL(read)
 49a:	b8 05 00 00 00       	mov    $0x5,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <write>:
SYSCALL(write)
 4a2:	b8 10 00 00 00       	mov    $0x10,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <close>:
SYSCALL(close)
 4aa:	b8 15 00 00 00       	mov    $0x15,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <kill>:
SYSCALL(kill)
 4b2:	b8 06 00 00 00       	mov    $0x6,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <exec>:
SYSCALL(exec)
 4ba:	b8 07 00 00 00       	mov    $0x7,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <open>:
SYSCALL(open)
 4c2:	b8 0f 00 00 00       	mov    $0xf,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <mknod>:
SYSCALL(mknod)
 4ca:	b8 11 00 00 00       	mov    $0x11,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <unlink>:
SYSCALL(unlink)
 4d2:	b8 12 00 00 00       	mov    $0x12,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <fstat>:
SYSCALL(fstat)
 4da:	b8 08 00 00 00       	mov    $0x8,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <link>:
SYSCALL(link)
 4e2:	b8 13 00 00 00       	mov    $0x13,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <mkdir>:
SYSCALL(mkdir)
 4ea:	b8 14 00 00 00       	mov    $0x14,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <chdir>:
SYSCALL(chdir)
 4f2:	b8 09 00 00 00       	mov    $0x9,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <dup>:
SYSCALL(dup)
 4fa:	b8 0a 00 00 00       	mov    $0xa,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <getpid>:
SYSCALL(getpid)
 502:	b8 0b 00 00 00       	mov    $0xb,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <sbrk>:
SYSCALL(sbrk)
 50a:	b8 0c 00 00 00       	mov    $0xc,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <sleep>:
SYSCALL(sleep)
 512:	b8 0d 00 00 00       	mov    $0xd,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <uptime>:
SYSCALL(uptime)
 51a:	b8 0e 00 00 00       	mov    $0xe,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <clone>:
SYSCALL(clone)
 522:	b8 16 00 00 00       	mov    $0x16,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <join>:
SYSCALL(join) 
 52a:	b8 17 00 00 00       	mov    $0x17,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <semaphore_init>:
SYSCALL(semaphore_init)
 532:	b8 18 00 00 00       	mov    $0x18,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <semaphore_wait>:
SYSCALL(semaphore_wait)
 53a:	b8 19 00 00 00       	mov    $0x19,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <semaphore_signal>:
SYSCALL(semaphore_signal)
 542:	b8 1a 00 00 00       	mov    $0x1a,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <semaphore_close>:
SYSCALL(semaphore_close)
 54a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    
 552:	66 90                	xchg   %ax,%ax
 554:	66 90                	xchg   %ax,%ax
 556:	66 90                	xchg   %ax,%ax
 558:	66 90                	xchg   %ax,%ax
 55a:	66 90                	xchg   %ax,%ax
 55c:	66 90                	xchg   %ax,%ax
 55e:	66 90                	xchg   %ax,%ax

00000560 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	56                   	push   %esi
 565:	53                   	push   %ebx
 566:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 569:	85 d2                	test   %edx,%edx
{
 56b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 56e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 570:	79 76                	jns    5e8 <printint+0x88>
 572:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 576:	74 70                	je     5e8 <printint+0x88>
    x = -xx;
 578:	f7 d8                	neg    %eax
    neg = 1;
 57a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 581:	31 f6                	xor    %esi,%esi
 583:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 586:	eb 0a                	jmp    592 <printint+0x32>
 588:	90                   	nop
 589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 590:	89 fe                	mov    %edi,%esi
 592:	31 d2                	xor    %edx,%edx
 594:	8d 7e 01             	lea    0x1(%esi),%edi
 597:	f7 f1                	div    %ecx
 599:	0f b6 92 00 0a 00 00 	movzbl 0xa00(%edx),%edx
  }while((x /= base) != 0);
 5a0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 5a2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 5a5:	75 e9                	jne    590 <printint+0x30>
  if(neg)
 5a7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 5aa:	85 c0                	test   %eax,%eax
 5ac:	74 08                	je     5b6 <printint+0x56>
    buf[i++] = '-';
 5ae:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 5b3:	8d 7e 02             	lea    0x2(%esi),%edi
 5b6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 5ba:	8b 7d c0             	mov    -0x40(%ebp),%edi
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
 5c0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 5c3:	83 ec 04             	sub    $0x4,%esp
 5c6:	83 ee 01             	sub    $0x1,%esi
 5c9:	6a 01                	push   $0x1
 5cb:	53                   	push   %ebx
 5cc:	57                   	push   %edi
 5cd:	88 45 d7             	mov    %al,-0x29(%ebp)
 5d0:	e8 cd fe ff ff       	call   4a2 <write>

  while(--i >= 0)
 5d5:	83 c4 10             	add    $0x10,%esp
 5d8:	39 de                	cmp    %ebx,%esi
 5da:	75 e4                	jne    5c0 <printint+0x60>
    putc(fd, buf[i]);
}
 5dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5df:	5b                   	pop    %ebx
 5e0:	5e                   	pop    %esi
 5e1:	5f                   	pop    %edi
 5e2:	5d                   	pop    %ebp
 5e3:	c3                   	ret    
 5e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5e8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 5ef:	eb 90                	jmp    581 <printint+0x21>
 5f1:	eb 0d                	jmp    600 <printf>
 5f3:	90                   	nop
 5f4:	90                   	nop
 5f5:	90                   	nop
 5f6:	90                   	nop
 5f7:	90                   	nop
 5f8:	90                   	nop
 5f9:	90                   	nop
 5fa:	90                   	nop
 5fb:	90                   	nop
 5fc:	90                   	nop
 5fd:	90                   	nop
 5fe:	90                   	nop
 5ff:	90                   	nop

00000600 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	57                   	push   %edi
 604:	56                   	push   %esi
 605:	53                   	push   %ebx
 606:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 609:	8b 75 0c             	mov    0xc(%ebp),%esi
 60c:	0f b6 1e             	movzbl (%esi),%ebx
 60f:	84 db                	test   %bl,%bl
 611:	0f 84 b3 00 00 00    	je     6ca <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 617:	8d 45 10             	lea    0x10(%ebp),%eax
 61a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 61d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 61f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 622:	eb 2f                	jmp    653 <printf+0x53>
 624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 628:	83 f8 25             	cmp    $0x25,%eax
 62b:	0f 84 a7 00 00 00    	je     6d8 <printf+0xd8>
  write(fd, &c, 1);
 631:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 634:	83 ec 04             	sub    $0x4,%esp
 637:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 63a:	6a 01                	push   $0x1
 63c:	50                   	push   %eax
 63d:	ff 75 08             	pushl  0x8(%ebp)
 640:	e8 5d fe ff ff       	call   4a2 <write>
 645:	83 c4 10             	add    $0x10,%esp
 648:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 64b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 64f:	84 db                	test   %bl,%bl
 651:	74 77                	je     6ca <printf+0xca>
    if(state == 0){
 653:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 655:	0f be cb             	movsbl %bl,%ecx
 658:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 65b:	74 cb                	je     628 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 65d:	83 ff 25             	cmp    $0x25,%edi
 660:	75 e6                	jne    648 <printf+0x48>
      if(c == 'd'){
 662:	83 f8 64             	cmp    $0x64,%eax
 665:	0f 84 05 01 00 00    	je     770 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 66b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 671:	83 f9 70             	cmp    $0x70,%ecx
 674:	74 72                	je     6e8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 676:	83 f8 73             	cmp    $0x73,%eax
 679:	0f 84 99 00 00 00    	je     718 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 67f:	83 f8 63             	cmp    $0x63,%eax
 682:	0f 84 08 01 00 00    	je     790 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 688:	83 f8 25             	cmp    $0x25,%eax
 68b:	0f 84 ef 00 00 00    	je     780 <printf+0x180>
  write(fd, &c, 1);
 691:	8d 45 e7             	lea    -0x19(%ebp),%eax
 694:	83 ec 04             	sub    $0x4,%esp
 697:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 69b:	6a 01                	push   $0x1
 69d:	50                   	push   %eax
 69e:	ff 75 08             	pushl  0x8(%ebp)
 6a1:	e8 fc fd ff ff       	call   4a2 <write>
 6a6:	83 c4 0c             	add    $0xc,%esp
 6a9:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 6ac:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 6af:	6a 01                	push   $0x1
 6b1:	50                   	push   %eax
 6b2:	ff 75 08             	pushl  0x8(%ebp)
 6b5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6b8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 6ba:	e8 e3 fd ff ff       	call   4a2 <write>
  for(i = 0; fmt[i]; i++){
 6bf:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 6c3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 6c6:	84 db                	test   %bl,%bl
 6c8:	75 89                	jne    653 <printf+0x53>
    }
  }
}
 6ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6cd:	5b                   	pop    %ebx
 6ce:	5e                   	pop    %esi
 6cf:	5f                   	pop    %edi
 6d0:	5d                   	pop    %ebp
 6d1:	c3                   	ret    
 6d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 6d8:	bf 25 00 00 00       	mov    $0x25,%edi
 6dd:	e9 66 ff ff ff       	jmp    648 <printf+0x48>
 6e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 6e8:	83 ec 0c             	sub    $0xc,%esp
 6eb:	b9 10 00 00 00       	mov    $0x10,%ecx
 6f0:	6a 00                	push   $0x0
 6f2:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 6f5:	8b 45 08             	mov    0x8(%ebp),%eax
 6f8:	8b 17                	mov    (%edi),%edx
 6fa:	e8 61 fe ff ff       	call   560 <printint>
        ap++;
 6ff:	89 f8                	mov    %edi,%eax
 701:	83 c4 10             	add    $0x10,%esp
      state = 0;
 704:	31 ff                	xor    %edi,%edi
        ap++;
 706:	83 c0 04             	add    $0x4,%eax
 709:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 70c:	e9 37 ff ff ff       	jmp    648 <printf+0x48>
 711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 718:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 71b:	8b 08                	mov    (%eax),%ecx
        ap++;
 71d:	83 c0 04             	add    $0x4,%eax
 720:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 723:	85 c9                	test   %ecx,%ecx
 725:	0f 84 8e 00 00 00    	je     7b9 <printf+0x1b9>
        while(*s != 0){
 72b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 72e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 730:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 732:	84 c0                	test   %al,%al
 734:	0f 84 0e ff ff ff    	je     648 <printf+0x48>
 73a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 73d:	89 de                	mov    %ebx,%esi
 73f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 742:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 745:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 748:	83 ec 04             	sub    $0x4,%esp
          s++;
 74b:	83 c6 01             	add    $0x1,%esi
 74e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 751:	6a 01                	push   $0x1
 753:	57                   	push   %edi
 754:	53                   	push   %ebx
 755:	e8 48 fd ff ff       	call   4a2 <write>
        while(*s != 0){
 75a:	0f b6 06             	movzbl (%esi),%eax
 75d:	83 c4 10             	add    $0x10,%esp
 760:	84 c0                	test   %al,%al
 762:	75 e4                	jne    748 <printf+0x148>
 764:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 767:	31 ff                	xor    %edi,%edi
 769:	e9 da fe ff ff       	jmp    648 <printf+0x48>
 76e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 770:	83 ec 0c             	sub    $0xc,%esp
 773:	b9 0a 00 00 00       	mov    $0xa,%ecx
 778:	6a 01                	push   $0x1
 77a:	e9 73 ff ff ff       	jmp    6f2 <printf+0xf2>
 77f:	90                   	nop
  write(fd, &c, 1);
 780:	83 ec 04             	sub    $0x4,%esp
 783:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 786:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 789:	6a 01                	push   $0x1
 78b:	e9 21 ff ff ff       	jmp    6b1 <printf+0xb1>
        putc(fd, *ap);
 790:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 793:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 796:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 798:	6a 01                	push   $0x1
        ap++;
 79a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 79d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 7a0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 7a3:	50                   	push   %eax
 7a4:	ff 75 08             	pushl  0x8(%ebp)
 7a7:	e8 f6 fc ff ff       	call   4a2 <write>
        ap++;
 7ac:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 7af:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7b2:	31 ff                	xor    %edi,%edi
 7b4:	e9 8f fe ff ff       	jmp    648 <printf+0x48>
          s = "(null)";
 7b9:	bb f8 09 00 00       	mov    $0x9f8,%ebx
        while(*s != 0){
 7be:	b8 28 00 00 00       	mov    $0x28,%eax
 7c3:	e9 72 ff ff ff       	jmp    73a <printf+0x13a>
 7c8:	66 90                	xchg   %ax,%ax
 7ca:	66 90                	xchg   %ax,%ax
 7cc:	66 90                	xchg   %ax,%ax
 7ce:	66 90                	xchg   %ax,%ax

000007d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d1:	a1 d8 0c 00 00       	mov    0xcd8,%eax
{
 7d6:	89 e5                	mov    %esp,%ebp
 7d8:	57                   	push   %edi
 7d9:	56                   	push   %esi
 7da:	53                   	push   %ebx
 7db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 7de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 7e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e8:	39 c8                	cmp    %ecx,%eax
 7ea:	8b 10                	mov    (%eax),%edx
 7ec:	73 32                	jae    820 <free+0x50>
 7ee:	39 d1                	cmp    %edx,%ecx
 7f0:	72 04                	jb     7f6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7f2:	39 d0                	cmp    %edx,%eax
 7f4:	72 32                	jb     828 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7f6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7f9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7fc:	39 fa                	cmp    %edi,%edx
 7fe:	74 30                	je     830 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 800:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 803:	8b 50 04             	mov    0x4(%eax),%edx
 806:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 809:	39 f1                	cmp    %esi,%ecx
 80b:	74 3a                	je     847 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 80d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 80f:	a3 d8 0c 00 00       	mov    %eax,0xcd8
}
 814:	5b                   	pop    %ebx
 815:	5e                   	pop    %esi
 816:	5f                   	pop    %edi
 817:	5d                   	pop    %ebp
 818:	c3                   	ret    
 819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 820:	39 d0                	cmp    %edx,%eax
 822:	72 04                	jb     828 <free+0x58>
 824:	39 d1                	cmp    %edx,%ecx
 826:	72 ce                	jb     7f6 <free+0x26>
{
 828:	89 d0                	mov    %edx,%eax
 82a:	eb bc                	jmp    7e8 <free+0x18>
 82c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 830:	03 72 04             	add    0x4(%edx),%esi
 833:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 836:	8b 10                	mov    (%eax),%edx
 838:	8b 12                	mov    (%edx),%edx
 83a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 83d:	8b 50 04             	mov    0x4(%eax),%edx
 840:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 843:	39 f1                	cmp    %esi,%ecx
 845:	75 c6                	jne    80d <free+0x3d>
    p->s.size += bp->s.size;
 847:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 84a:	a3 d8 0c 00 00       	mov    %eax,0xcd8
    p->s.size += bp->s.size;
 84f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 852:	8b 53 f8             	mov    -0x8(%ebx),%edx
 855:	89 10                	mov    %edx,(%eax)
}
 857:	5b                   	pop    %ebx
 858:	5e                   	pop    %esi
 859:	5f                   	pop    %edi
 85a:	5d                   	pop    %ebp
 85b:	c3                   	ret    
 85c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000860 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 860:	55                   	push   %ebp
 861:	89 e5                	mov    %esp,%ebp
 863:	57                   	push   %edi
 864:	56                   	push   %esi
 865:	53                   	push   %ebx
 866:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 869:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 86c:	8b 15 d8 0c 00 00    	mov    0xcd8,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 872:	8d 78 07             	lea    0x7(%eax),%edi
 875:	c1 ef 03             	shr    $0x3,%edi
 878:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 87b:	85 d2                	test   %edx,%edx
 87d:	0f 84 9d 00 00 00    	je     920 <malloc+0xc0>
 883:	8b 02                	mov    (%edx),%eax
 885:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 888:	39 cf                	cmp    %ecx,%edi
 88a:	76 6c                	jbe    8f8 <malloc+0x98>
 88c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 892:	bb 00 10 00 00       	mov    $0x1000,%ebx
 897:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 89a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 8a1:	eb 0e                	jmp    8b1 <malloc+0x51>
 8a3:	90                   	nop
 8a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 8aa:	8b 48 04             	mov    0x4(%eax),%ecx
 8ad:	39 f9                	cmp    %edi,%ecx
 8af:	73 47                	jae    8f8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8b1:	39 05 d8 0c 00 00    	cmp    %eax,0xcd8
 8b7:	89 c2                	mov    %eax,%edx
 8b9:	75 ed                	jne    8a8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 8bb:	83 ec 0c             	sub    $0xc,%esp
 8be:	56                   	push   %esi
 8bf:	e8 46 fc ff ff       	call   50a <sbrk>
  if(p == (char*)-1)
 8c4:	83 c4 10             	add    $0x10,%esp
 8c7:	83 f8 ff             	cmp    $0xffffffff,%eax
 8ca:	74 1c                	je     8e8 <malloc+0x88>
  hp->s.size = nu;
 8cc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8cf:	83 ec 0c             	sub    $0xc,%esp
 8d2:	83 c0 08             	add    $0x8,%eax
 8d5:	50                   	push   %eax
 8d6:	e8 f5 fe ff ff       	call   7d0 <free>
  return freep;
 8db:	8b 15 d8 0c 00 00    	mov    0xcd8,%edx
      if((p = morecore(nunits)) == 0)
 8e1:	83 c4 10             	add    $0x10,%esp
 8e4:	85 d2                	test   %edx,%edx
 8e6:	75 c0                	jne    8a8 <malloc+0x48>
        return 0;
  }
}
 8e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8eb:	31 c0                	xor    %eax,%eax
}
 8ed:	5b                   	pop    %ebx
 8ee:	5e                   	pop    %esi
 8ef:	5f                   	pop    %edi
 8f0:	5d                   	pop    %ebp
 8f1:	c3                   	ret    
 8f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8f8:	39 cf                	cmp    %ecx,%edi
 8fa:	74 54                	je     950 <malloc+0xf0>
        p->s.size -= nunits;
 8fc:	29 f9                	sub    %edi,%ecx
 8fe:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 901:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 904:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 907:	89 15 d8 0c 00 00    	mov    %edx,0xcd8
}
 90d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 910:	83 c0 08             	add    $0x8,%eax
}
 913:	5b                   	pop    %ebx
 914:	5e                   	pop    %esi
 915:	5f                   	pop    %edi
 916:	5d                   	pop    %ebp
 917:	c3                   	ret    
 918:	90                   	nop
 919:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 920:	c7 05 d8 0c 00 00 dc 	movl   $0xcdc,0xcd8
 927:	0c 00 00 
 92a:	c7 05 dc 0c 00 00 dc 	movl   $0xcdc,0xcdc
 931:	0c 00 00 
    base.s.size = 0;
 934:	b8 dc 0c 00 00       	mov    $0xcdc,%eax
 939:	c7 05 e0 0c 00 00 00 	movl   $0x0,0xce0
 940:	00 00 00 
 943:	e9 44 ff ff ff       	jmp    88c <malloc+0x2c>
 948:	90                   	nop
 949:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 950:	8b 08                	mov    (%eax),%ecx
 952:	89 0a                	mov    %ecx,(%edx)
 954:	eb b1                	jmp    907 <malloc+0xa7>


_semaphoretest:     file format elf32-i386


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
  11:	83 ec 24             	sub    $0x24,%esp
  14:	8b 59 04             	mov    0x4(%ecx),%ebx

    int numthreads = atoi(argv[1]);
  17:	ff 73 04             	pushl  0x4(%ebx)
  1a:	e8 b1 03 00 00       	call   3d0 <atoi>
  1f:	89 c7                	mov    %eax,%edi
  21:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    targetcaptures = atoi(argv[2]);
  24:	58                   	pop    %eax
  25:	ff 73 08             	pushl  0x8(%ebx)
  28:	e8 a3 03 00 00       	call   3d0 <atoi>
    sem_index = semaphore_init(1);
  2d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    targetcaptures = atoi(argv[2]);
  34:	a3 64 0c 00 00       	mov    %eax,0xc64
    sem_index = semaphore_init(1);
  39:	e8 b4 04 00 00       	call   4f2 <semaphore_init>
  3e:	a3 60 0c 00 00       	mov    %eax,0xc60
    count = 1;
    winnerflag = 0;

    void *stacks[numthreads];
  43:	8d 04 bd 12 00 00 00 	lea    0x12(,%edi,4),%eax
  4a:	83 c4 10             	add    $0x10,%esp
    winnerflag = 0;
  4d:	c7 05 74 0c 00 00 00 	movl   $0x0,0xc74
  54:	00 00 00 
    void *stacks[numthreads];
  57:	83 e0 f0             	and    $0xfffffff0,%eax
  5a:	29 c4                	sub    %eax,%esp
  5c:	89 e6                	mov    %esp,%esi
    int *args[numthreads];
  5e:	29 c4                	sub    %eax,%esp

    for(int i = 0; i < numthreads; i++){ //allocate stacks and args
  60:	85 ff                	test   %edi,%edi
  62:	0f 8e 94 00 00 00    	jle    fc <main+0xfc>
  68:	89 e7                	mov    %esp,%edi
  6a:	31 db                	xor    %ebx,%ebx
  6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

        stacks[i] = (void*)malloc(2*PGSIZE);
  70:	83 ec 0c             	sub    $0xc,%esp
  73:	68 00 20 00 00       	push   $0x2000
  78:	e8 a3 07 00 00       	call   820 <malloc>
        if((uint)stacks[i] % PGSIZE){ //check if mem is page aligned
  7d:	89 c1                	mov    %eax,%ecx
  7f:	83 c4 10             	add    $0x10,%esp
  82:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
  88:	74 09                	je     93 <main+0x93>
            stacks[i] = stacks[i] + (PGSIZE - (uint)stacks[i] % PGSIZE); //adjusts where the stack is so its page aligned
  8a:	ba 00 10 00 00       	mov    $0x1000,%edx
  8f:	29 ca                	sub    %ecx,%edx
  91:	01 d0                	add    %edx,%eax
        }

        args[i] = (int*)malloc(sizeof(int)); //allocate mem for the arguments
  93:	83 ec 0c             	sub    $0xc,%esp
            stacks[i] = stacks[i] + (PGSIZE - (uint)stacks[i] % PGSIZE); //adjusts where the stack is so its page aligned
  96:	89 04 9e             	mov    %eax,(%esi,%ebx,4)
        args[i] = (int*)malloc(sizeof(int)); //allocate mem for the arguments
  99:	6a 04                	push   $0x4
  9b:	e8 80 07 00 00       	call   820 <malloc>
    for(int i = 0; i < numthreads; i++){ //allocate stacks and args
  a0:	83 c4 10             	add    $0x10,%esp
        args[i] = (int*)malloc(sizeof(int)); //allocate mem for the arguments
  a3:	89 04 9f             	mov    %eax,(%edi,%ebx,4)
    for(int i = 0; i < numthreads; i++){ //allocate stacks and args
  a6:	83 c3 01             	add    $0x1,%ebx
  a9:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
  ac:	75 c2                	jne    70 <main+0x70>
    }

    for (int i = 0; i < numthreads; i++){
  ae:	31 d2                	xor    %edx,%edx
  b0:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
  b3:	89 fb                	mov    %edi,%ebx
  b5:	89 f7                	mov    %esi,%edi
  b7:	89 d6                	mov    %edx,%esi
  b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        *args[i] = i;
  c0:	8b 04 b3             	mov    (%ebx,%esi,4),%eax
        clone(&capturetheflag, stacks[i], args[i]);
  c3:	83 ec 04             	sub    $0x4,%esp
        *args[i] = i;
  c6:	89 30                	mov    %esi,(%eax)
        clone(&capturetheflag, stacks[i], args[i]);
  c8:	50                   	push   %eax
  c9:	ff 34 b7             	pushl  (%edi,%esi,4)
  cc:	68 10 01 00 00       	push   $0x110
    for (int i = 0; i < numthreads; i++){
  d1:	83 c6 01             	add    $0x1,%esi
        clone(&capturetheflag, stacks[i], args[i]);
  d4:	e8 09 04 00 00       	call   4e2 <clone>
    for (int i = 0; i < numthreads; i++){
  d9:	83 c4 10             	add    $0x10,%esp
  dc:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
  df:	75 df                	jne    c0 <main+0xc0>
  e1:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
  e4:	31 f6                	xor    %esi,%esi
  e6:	8d 76 00             	lea    0x0(%esi),%esi
  e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    }

    for (int i = 0; i < numthreads; i++){
  f0:	83 c6 01             	add    $0x1,%esi

        join();
  f3:	e8 f2 03 00 00       	call   4ea <join>
    for (int i = 0; i < numthreads; i++){
  f8:	39 de                	cmp    %ebx,%esi
  fa:	75 f4                	jne    f0 <main+0xf0>
    }

    exit();
  fc:	e8 41 03 00 00       	call   442 <exit>
 101:	66 90                	xchg   %ax,%ax
 103:	66 90                	xchg   %ax,%ax
 105:	66 90                	xchg   %ax,%ax
 107:	66 90                	xchg   %ax,%ax
 109:	66 90                	xchg   %ax,%ax
 10b:	66 90                	xchg   %ax,%ax
 10d:	66 90                	xchg   %ax,%ax
 10f:	90                   	nop

00000110 <capturetheflag>:
void *capturetheflag(void * arg){
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	56                   	push   %esi
 114:	53                   	push   %ebx
    int tid = *(int*)arg;
 115:	8b 45 08             	mov    0x8(%ebp),%eax
 118:	8b 30                	mov    (%eax),%esi
    while(numcaptures < targetcaptures){
 11a:	a1 64 0c 00 00       	mov    0xc64,%eax
 11f:	85 c0                	test   %eax,%eax
 121:	0f 8e 9d 00 00 00    	jle    1c4 <capturetheflag+0xb4>
    int numcaptures = 0;
 127:	31 db                	xor    %ebx,%ebx
 129:	eb 42                	jmp    16d <capturetheflag+0x5d>
 12b:	90                   	nop
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf(1, "Thread %d has captured the flag!", tid);
 130:	83 ec 04             	sub    $0x4,%esp
        numcaptures++;
 133:	83 c3 01             	add    $0x1,%ebx
        printf(1, "Thread %d has captured the flag!", tid);
 136:	56                   	push   %esi
 137:	68 64 09 00 00       	push   $0x964
 13c:	6a 01                	push   $0x1
 13e:	e8 7d 04 00 00       	call   5c0 <printf>
        printf(1, "It has %d captures\n", numcaptures);
 143:	83 c4 0c             	add    $0xc,%esp
 146:	53                   	push   %ebx
 147:	68 3f 09 00 00       	push   $0x93f
 14c:	6a 01                	push   $0x1
 14e:	e8 6d 04 00 00       	call   5c0 <printf>
        semaphore_signal(sem_index, 1);
 153:	5a                   	pop    %edx
 154:	59                   	pop    %ecx
 155:	6a 01                	push   $0x1
 157:	ff 35 60 0c 00 00    	pushl  0xc60
 15d:	e8 a0 03 00 00       	call   502 <semaphore_signal>
    while(numcaptures < targetcaptures){
 162:	83 c4 10             	add    $0x10,%esp
 165:	39 1d 64 0c 00 00    	cmp    %ebx,0xc64
 16b:	7e 57                	jle    1c4 <capturetheflag+0xb4>
        sleep(10);
 16d:	83 ec 0c             	sub    $0xc,%esp
 170:	6a 0a                	push   $0xa
 172:	e8 5b 03 00 00       	call   4d2 <sleep>
        semaphore_wait(sem_index, 1);
 177:	59                   	pop    %ecx
 178:	58                   	pop    %eax
 179:	6a 01                	push   $0x1
 17b:	ff 35 60 0c 00 00    	pushl  0xc60
 181:	e8 74 03 00 00       	call   4fa <semaphore_wait>
        if(winnerflag){
 186:	a1 74 0c 00 00       	mov    0xc74,%eax
 18b:	83 c4 10             	add    $0x10,%esp
 18e:	85 c0                	test   %eax,%eax
 190:	74 9e                	je     130 <capturetheflag+0x20>
            printf(1, "Thread %d finished with ", tid);
 192:	50                   	push   %eax
 193:	56                   	push   %esi
 194:	68 18 09 00 00       	push   $0x918
 199:	6a 01                	push   $0x1
 19b:	e8 20 04 00 00       	call   5c0 <printf>
            printf(1, "%d captures.\n", numcaptures);
 1a0:	83 c4 0c             	add    $0xc,%esp
 1a3:	53                   	push   %ebx
 1a4:	68 31 09 00 00       	push   $0x931
 1a9:	6a 01                	push   $0x1
 1ab:	e8 10 04 00 00       	call   5c0 <printf>
            semaphore_signal(sem_index, 1);
 1b0:	58                   	pop    %eax
 1b1:	5a                   	pop    %edx
 1b2:	6a 01                	push   $0x1
 1b4:	ff 35 60 0c 00 00    	pushl  0xc60
 1ba:	e8 43 03 00 00       	call   502 <semaphore_signal>
            exit();
 1bf:	e8 7e 02 00 00       	call   442 <exit>
    printf(1, "Thread %d won!\n", tid);
 1c4:	50                   	push   %eax
 1c5:	56                   	push   %esi
 1c6:	68 53 09 00 00       	push   $0x953
 1cb:	6a 01                	push   $0x1
    winnerflag = 1;
 1cd:	c7 05 74 0c 00 00 01 	movl   $0x1,0xc74
 1d4:	00 00 00 
    printf(1, "Thread %d won!\n", tid);
 1d7:	e8 e4 03 00 00       	call   5c0 <printf>
    exit();
 1dc:	e8 61 02 00 00       	call   442 <exit>
 1e1:	66 90                	xchg   %ax,%ax
 1e3:	66 90                	xchg   %ax,%ax
 1e5:	66 90                	xchg   %ax,%ax
 1e7:	66 90                	xchg   %ax,%ax
 1e9:	66 90                	xchg   %ax,%ax
 1eb:	66 90                	xchg   %ax,%ax
 1ed:	66 90                	xchg   %ax,%ax
 1ef:	90                   	nop

000001f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	53                   	push   %ebx
 1f4:	8b 45 08             	mov    0x8(%ebp),%eax
 1f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1fa:	89 c2                	mov    %eax,%edx
 1fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 200:	83 c1 01             	add    $0x1,%ecx
 203:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 207:	83 c2 01             	add    $0x1,%edx
 20a:	84 db                	test   %bl,%bl
 20c:	88 5a ff             	mov    %bl,-0x1(%edx)
 20f:	75 ef                	jne    200 <strcpy+0x10>
    ;
  return os;
}
 211:	5b                   	pop    %ebx
 212:	5d                   	pop    %ebp
 213:	c3                   	ret    
 214:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 21a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000220 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	53                   	push   %ebx
 224:	8b 55 08             	mov    0x8(%ebp),%edx
 227:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 22a:	0f b6 02             	movzbl (%edx),%eax
 22d:	0f b6 19             	movzbl (%ecx),%ebx
 230:	84 c0                	test   %al,%al
 232:	75 1c                	jne    250 <strcmp+0x30>
 234:	eb 2a                	jmp    260 <strcmp+0x40>
 236:	8d 76 00             	lea    0x0(%esi),%esi
 239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 240:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 243:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 246:	83 c1 01             	add    $0x1,%ecx
 249:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 24c:	84 c0                	test   %al,%al
 24e:	74 10                	je     260 <strcmp+0x40>
 250:	38 d8                	cmp    %bl,%al
 252:	74 ec                	je     240 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 254:	29 d8                	sub    %ebx,%eax
}
 256:	5b                   	pop    %ebx
 257:	5d                   	pop    %ebp
 258:	c3                   	ret    
 259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 260:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 262:	29 d8                	sub    %ebx,%eax
}
 264:	5b                   	pop    %ebx
 265:	5d                   	pop    %ebp
 266:	c3                   	ret    
 267:	89 f6                	mov    %esi,%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000270 <strlen>:

uint
strlen(const char *s)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 276:	80 39 00             	cmpb   $0x0,(%ecx)
 279:	74 15                	je     290 <strlen+0x20>
 27b:	31 d2                	xor    %edx,%edx
 27d:	8d 76 00             	lea    0x0(%esi),%esi
 280:	83 c2 01             	add    $0x1,%edx
 283:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 287:	89 d0                	mov    %edx,%eax
 289:	75 f5                	jne    280 <strlen+0x10>
    ;
  return n;
}
 28b:	5d                   	pop    %ebp
 28c:	c3                   	ret    
 28d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 290:	31 c0                	xor    %eax,%eax
}
 292:	5d                   	pop    %ebp
 293:	c3                   	ret    
 294:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 29a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000002a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ad:	89 d7                	mov    %edx,%edi
 2af:	fc                   	cld    
 2b0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2b2:	89 d0                	mov    %edx,%eax
 2b4:	5f                   	pop    %edi
 2b5:	5d                   	pop    %ebp
 2b6:	c3                   	ret    
 2b7:	89 f6                	mov    %esi,%esi
 2b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002c0 <strchr>:

char*
strchr(const char *s, char c)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	53                   	push   %ebx
 2c4:	8b 45 08             	mov    0x8(%ebp),%eax
 2c7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 2ca:	0f b6 10             	movzbl (%eax),%edx
 2cd:	84 d2                	test   %dl,%dl
 2cf:	74 1d                	je     2ee <strchr+0x2e>
    if(*s == c)
 2d1:	38 d3                	cmp    %dl,%bl
 2d3:	89 d9                	mov    %ebx,%ecx
 2d5:	75 0d                	jne    2e4 <strchr+0x24>
 2d7:	eb 17                	jmp    2f0 <strchr+0x30>
 2d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2e0:	38 ca                	cmp    %cl,%dl
 2e2:	74 0c                	je     2f0 <strchr+0x30>
  for(; *s; s++)
 2e4:	83 c0 01             	add    $0x1,%eax
 2e7:	0f b6 10             	movzbl (%eax),%edx
 2ea:	84 d2                	test   %dl,%dl
 2ec:	75 f2                	jne    2e0 <strchr+0x20>
      return (char*)s;
  return 0;
 2ee:	31 c0                	xor    %eax,%eax
}
 2f0:	5b                   	pop    %ebx
 2f1:	5d                   	pop    %ebp
 2f2:	c3                   	ret    
 2f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000300 <gets>:

char*
gets(char *buf, int max)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	57                   	push   %edi
 304:	56                   	push   %esi
 305:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 306:	31 f6                	xor    %esi,%esi
 308:	89 f3                	mov    %esi,%ebx
{
 30a:	83 ec 1c             	sub    $0x1c,%esp
 30d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 310:	eb 2f                	jmp    341 <gets+0x41>
 312:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 318:	8d 45 e7             	lea    -0x19(%ebp),%eax
 31b:	83 ec 04             	sub    $0x4,%esp
 31e:	6a 01                	push   $0x1
 320:	50                   	push   %eax
 321:	6a 00                	push   $0x0
 323:	e8 32 01 00 00       	call   45a <read>
    if(cc < 1)
 328:	83 c4 10             	add    $0x10,%esp
 32b:	85 c0                	test   %eax,%eax
 32d:	7e 1c                	jle    34b <gets+0x4b>
      break;
    buf[i++] = c;
 32f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 333:	83 c7 01             	add    $0x1,%edi
 336:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 339:	3c 0a                	cmp    $0xa,%al
 33b:	74 23                	je     360 <gets+0x60>
 33d:	3c 0d                	cmp    $0xd,%al
 33f:	74 1f                	je     360 <gets+0x60>
  for(i=0; i+1 < max; ){
 341:	83 c3 01             	add    $0x1,%ebx
 344:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 347:	89 fe                	mov    %edi,%esi
 349:	7c cd                	jl     318 <gets+0x18>
 34b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 34d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 350:	c6 03 00             	movb   $0x0,(%ebx)
}
 353:	8d 65 f4             	lea    -0xc(%ebp),%esp
 356:	5b                   	pop    %ebx
 357:	5e                   	pop    %esi
 358:	5f                   	pop    %edi
 359:	5d                   	pop    %ebp
 35a:	c3                   	ret    
 35b:	90                   	nop
 35c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 360:	8b 75 08             	mov    0x8(%ebp),%esi
 363:	8b 45 08             	mov    0x8(%ebp),%eax
 366:	01 de                	add    %ebx,%esi
 368:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 36a:	c6 03 00             	movb   $0x0,(%ebx)
}
 36d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 370:	5b                   	pop    %ebx
 371:	5e                   	pop    %esi
 372:	5f                   	pop    %edi
 373:	5d                   	pop    %ebp
 374:	c3                   	ret    
 375:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000380 <stat>:

int
stat(const char *n, struct stat *st)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	56                   	push   %esi
 384:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 385:	83 ec 08             	sub    $0x8,%esp
 388:	6a 00                	push   $0x0
 38a:	ff 75 08             	pushl  0x8(%ebp)
 38d:	e8 f0 00 00 00       	call   482 <open>
  if(fd < 0)
 392:	83 c4 10             	add    $0x10,%esp
 395:	85 c0                	test   %eax,%eax
 397:	78 27                	js     3c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 399:	83 ec 08             	sub    $0x8,%esp
 39c:	ff 75 0c             	pushl  0xc(%ebp)
 39f:	89 c3                	mov    %eax,%ebx
 3a1:	50                   	push   %eax
 3a2:	e8 f3 00 00 00       	call   49a <fstat>
  close(fd);
 3a7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 3aa:	89 c6                	mov    %eax,%esi
  close(fd);
 3ac:	e8 b9 00 00 00       	call   46a <close>
  return r;
 3b1:	83 c4 10             	add    $0x10,%esp
}
 3b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3b7:	89 f0                	mov    %esi,%eax
 3b9:	5b                   	pop    %ebx
 3ba:	5e                   	pop    %esi
 3bb:	5d                   	pop    %ebp
 3bc:	c3                   	ret    
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 3c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3c5:	eb ed                	jmp    3b4 <stat+0x34>
 3c7:	89 f6                	mov    %esi,%esi
 3c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003d0 <atoi>:

int
atoi(const char *s)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	53                   	push   %ebx
 3d4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3d7:	0f be 11             	movsbl (%ecx),%edx
 3da:	8d 42 d0             	lea    -0x30(%edx),%eax
 3dd:	3c 09                	cmp    $0x9,%al
  n = 0;
 3df:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 3e4:	77 1f                	ja     405 <atoi+0x35>
 3e6:	8d 76 00             	lea    0x0(%esi),%esi
 3e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 3f0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 3f3:	83 c1 01             	add    $0x1,%ecx
 3f6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 3fa:	0f be 11             	movsbl (%ecx),%edx
 3fd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 400:	80 fb 09             	cmp    $0x9,%bl
 403:	76 eb                	jbe    3f0 <atoi+0x20>
  return n;
}
 405:	5b                   	pop    %ebx
 406:	5d                   	pop    %ebp
 407:	c3                   	ret    
 408:	90                   	nop
 409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000410 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	56                   	push   %esi
 414:	53                   	push   %ebx
 415:	8b 5d 10             	mov    0x10(%ebp),%ebx
 418:	8b 45 08             	mov    0x8(%ebp),%eax
 41b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 41e:	85 db                	test   %ebx,%ebx
 420:	7e 14                	jle    436 <memmove+0x26>
 422:	31 d2                	xor    %edx,%edx
 424:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 428:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 42c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 42f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 432:	39 d3                	cmp    %edx,%ebx
 434:	75 f2                	jne    428 <memmove+0x18>
  return vdst;
}
 436:	5b                   	pop    %ebx
 437:	5e                   	pop    %esi
 438:	5d                   	pop    %ebp
 439:	c3                   	ret    

0000043a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 43a:	b8 01 00 00 00       	mov    $0x1,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <exit>:
SYSCALL(exit)
 442:	b8 02 00 00 00       	mov    $0x2,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <wait>:
SYSCALL(wait)
 44a:	b8 03 00 00 00       	mov    $0x3,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <pipe>:
SYSCALL(pipe)
 452:	b8 04 00 00 00       	mov    $0x4,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <read>:
SYSCALL(read)
 45a:	b8 05 00 00 00       	mov    $0x5,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <write>:
SYSCALL(write)
 462:	b8 10 00 00 00       	mov    $0x10,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <close>:
SYSCALL(close)
 46a:	b8 15 00 00 00       	mov    $0x15,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <kill>:
SYSCALL(kill)
 472:	b8 06 00 00 00       	mov    $0x6,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <exec>:
SYSCALL(exec)
 47a:	b8 07 00 00 00       	mov    $0x7,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <open>:
SYSCALL(open)
 482:	b8 0f 00 00 00       	mov    $0xf,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <mknod>:
SYSCALL(mknod)
 48a:	b8 11 00 00 00       	mov    $0x11,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <unlink>:
SYSCALL(unlink)
 492:	b8 12 00 00 00       	mov    $0x12,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <fstat>:
SYSCALL(fstat)
 49a:	b8 08 00 00 00       	mov    $0x8,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <link>:
SYSCALL(link)
 4a2:	b8 13 00 00 00       	mov    $0x13,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <mkdir>:
SYSCALL(mkdir)
 4aa:	b8 14 00 00 00       	mov    $0x14,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <chdir>:
SYSCALL(chdir)
 4b2:	b8 09 00 00 00       	mov    $0x9,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <dup>:
SYSCALL(dup)
 4ba:	b8 0a 00 00 00       	mov    $0xa,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <getpid>:
SYSCALL(getpid)
 4c2:	b8 0b 00 00 00       	mov    $0xb,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <sbrk>:
SYSCALL(sbrk)
 4ca:	b8 0c 00 00 00       	mov    $0xc,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <sleep>:
SYSCALL(sleep)
 4d2:	b8 0d 00 00 00       	mov    $0xd,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <uptime>:
SYSCALL(uptime)
 4da:	b8 0e 00 00 00       	mov    $0xe,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <clone>:
SYSCALL(clone)
 4e2:	b8 16 00 00 00       	mov    $0x16,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <join>:
SYSCALL(join) 
 4ea:	b8 17 00 00 00       	mov    $0x17,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <semaphore_init>:
SYSCALL(semaphore_init)
 4f2:	b8 18 00 00 00       	mov    $0x18,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <semaphore_wait>:
SYSCALL(semaphore_wait)
 4fa:	b8 19 00 00 00       	mov    $0x19,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <semaphore_signal>:
SYSCALL(semaphore_signal)
 502:	b8 1a 00 00 00       	mov    $0x1a,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <semaphore_close>:
SYSCALL(semaphore_close)
 50a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    
 512:	66 90                	xchg   %ax,%ax
 514:	66 90                	xchg   %ax,%ax
 516:	66 90                	xchg   %ax,%ax
 518:	66 90                	xchg   %ax,%ax
 51a:	66 90                	xchg   %ax,%ax
 51c:	66 90                	xchg   %ax,%ax
 51e:	66 90                	xchg   %ax,%ax

00000520 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	57                   	push   %edi
 524:	56                   	push   %esi
 525:	53                   	push   %ebx
 526:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 529:	85 d2                	test   %edx,%edx
{
 52b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 52e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 530:	79 76                	jns    5a8 <printint+0x88>
 532:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 536:	74 70                	je     5a8 <printint+0x88>
    x = -xx;
 538:	f7 d8                	neg    %eax
    neg = 1;
 53a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 541:	31 f6                	xor    %esi,%esi
 543:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 546:	eb 0a                	jmp    552 <printint+0x32>
 548:	90                   	nop
 549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 550:	89 fe                	mov    %edi,%esi
 552:	31 d2                	xor    %edx,%edx
 554:	8d 7e 01             	lea    0x1(%esi),%edi
 557:	f7 f1                	div    %ecx
 559:	0f b6 92 90 09 00 00 	movzbl 0x990(%edx),%edx
  }while((x /= base) != 0);
 560:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 562:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 565:	75 e9                	jne    550 <printint+0x30>
  if(neg)
 567:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 56a:	85 c0                	test   %eax,%eax
 56c:	74 08                	je     576 <printint+0x56>
    buf[i++] = '-';
 56e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 573:	8d 7e 02             	lea    0x2(%esi),%edi
 576:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 57a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 57d:	8d 76 00             	lea    0x0(%esi),%esi
 580:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 583:	83 ec 04             	sub    $0x4,%esp
 586:	83 ee 01             	sub    $0x1,%esi
 589:	6a 01                	push   $0x1
 58b:	53                   	push   %ebx
 58c:	57                   	push   %edi
 58d:	88 45 d7             	mov    %al,-0x29(%ebp)
 590:	e8 cd fe ff ff       	call   462 <write>

  while(--i >= 0)
 595:	83 c4 10             	add    $0x10,%esp
 598:	39 de                	cmp    %ebx,%esi
 59a:	75 e4                	jne    580 <printint+0x60>
    putc(fd, buf[i]);
}
 59c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 59f:	5b                   	pop    %ebx
 5a0:	5e                   	pop    %esi
 5a1:	5f                   	pop    %edi
 5a2:	5d                   	pop    %ebp
 5a3:	c3                   	ret    
 5a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5a8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 5af:	eb 90                	jmp    541 <printint+0x21>
 5b1:	eb 0d                	jmp    5c0 <printf>
 5b3:	90                   	nop
 5b4:	90                   	nop
 5b5:	90                   	nop
 5b6:	90                   	nop
 5b7:	90                   	nop
 5b8:	90                   	nop
 5b9:	90                   	nop
 5ba:	90                   	nop
 5bb:	90                   	nop
 5bc:	90                   	nop
 5bd:	90                   	nop
 5be:	90                   	nop
 5bf:	90                   	nop

000005c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	57                   	push   %edi
 5c4:	56                   	push   %esi
 5c5:	53                   	push   %ebx
 5c6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5c9:	8b 75 0c             	mov    0xc(%ebp),%esi
 5cc:	0f b6 1e             	movzbl (%esi),%ebx
 5cf:	84 db                	test   %bl,%bl
 5d1:	0f 84 b3 00 00 00    	je     68a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 5d7:	8d 45 10             	lea    0x10(%ebp),%eax
 5da:	83 c6 01             	add    $0x1,%esi
  state = 0;
 5dd:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 5df:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 5e2:	eb 2f                	jmp    613 <printf+0x53>
 5e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 5e8:	83 f8 25             	cmp    $0x25,%eax
 5eb:	0f 84 a7 00 00 00    	je     698 <printf+0xd8>
  write(fd, &c, 1);
 5f1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 5f4:	83 ec 04             	sub    $0x4,%esp
 5f7:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 5fa:	6a 01                	push   $0x1
 5fc:	50                   	push   %eax
 5fd:	ff 75 08             	pushl  0x8(%ebp)
 600:	e8 5d fe ff ff       	call   462 <write>
 605:	83 c4 10             	add    $0x10,%esp
 608:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 60b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 60f:	84 db                	test   %bl,%bl
 611:	74 77                	je     68a <printf+0xca>
    if(state == 0){
 613:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 615:	0f be cb             	movsbl %bl,%ecx
 618:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 61b:	74 cb                	je     5e8 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 61d:	83 ff 25             	cmp    $0x25,%edi
 620:	75 e6                	jne    608 <printf+0x48>
      if(c == 'd'){
 622:	83 f8 64             	cmp    $0x64,%eax
 625:	0f 84 05 01 00 00    	je     730 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 62b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 631:	83 f9 70             	cmp    $0x70,%ecx
 634:	74 72                	je     6a8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 636:	83 f8 73             	cmp    $0x73,%eax
 639:	0f 84 99 00 00 00    	je     6d8 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 63f:	83 f8 63             	cmp    $0x63,%eax
 642:	0f 84 08 01 00 00    	je     750 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 648:	83 f8 25             	cmp    $0x25,%eax
 64b:	0f 84 ef 00 00 00    	je     740 <printf+0x180>
  write(fd, &c, 1);
 651:	8d 45 e7             	lea    -0x19(%ebp),%eax
 654:	83 ec 04             	sub    $0x4,%esp
 657:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 65b:	6a 01                	push   $0x1
 65d:	50                   	push   %eax
 65e:	ff 75 08             	pushl  0x8(%ebp)
 661:	e8 fc fd ff ff       	call   462 <write>
 666:	83 c4 0c             	add    $0xc,%esp
 669:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 66c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 66f:	6a 01                	push   $0x1
 671:	50                   	push   %eax
 672:	ff 75 08             	pushl  0x8(%ebp)
 675:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 678:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 67a:	e8 e3 fd ff ff       	call   462 <write>
  for(i = 0; fmt[i]; i++){
 67f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 683:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 686:	84 db                	test   %bl,%bl
 688:	75 89                	jne    613 <printf+0x53>
    }
  }
}
 68a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 68d:	5b                   	pop    %ebx
 68e:	5e                   	pop    %esi
 68f:	5f                   	pop    %edi
 690:	5d                   	pop    %ebp
 691:	c3                   	ret    
 692:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 698:	bf 25 00 00 00       	mov    $0x25,%edi
 69d:	e9 66 ff ff ff       	jmp    608 <printf+0x48>
 6a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 6a8:	83 ec 0c             	sub    $0xc,%esp
 6ab:	b9 10 00 00 00       	mov    $0x10,%ecx
 6b0:	6a 00                	push   $0x0
 6b2:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 6b5:	8b 45 08             	mov    0x8(%ebp),%eax
 6b8:	8b 17                	mov    (%edi),%edx
 6ba:	e8 61 fe ff ff       	call   520 <printint>
        ap++;
 6bf:	89 f8                	mov    %edi,%eax
 6c1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6c4:	31 ff                	xor    %edi,%edi
        ap++;
 6c6:	83 c0 04             	add    $0x4,%eax
 6c9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 6cc:	e9 37 ff ff ff       	jmp    608 <printf+0x48>
 6d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 6d8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 6db:	8b 08                	mov    (%eax),%ecx
        ap++;
 6dd:	83 c0 04             	add    $0x4,%eax
 6e0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 6e3:	85 c9                	test   %ecx,%ecx
 6e5:	0f 84 8e 00 00 00    	je     779 <printf+0x1b9>
        while(*s != 0){
 6eb:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 6ee:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 6f0:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 6f2:	84 c0                	test   %al,%al
 6f4:	0f 84 0e ff ff ff    	je     608 <printf+0x48>
 6fa:	89 75 d0             	mov    %esi,-0x30(%ebp)
 6fd:	89 de                	mov    %ebx,%esi
 6ff:	8b 5d 08             	mov    0x8(%ebp),%ebx
 702:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 705:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 708:	83 ec 04             	sub    $0x4,%esp
          s++;
 70b:	83 c6 01             	add    $0x1,%esi
 70e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 711:	6a 01                	push   $0x1
 713:	57                   	push   %edi
 714:	53                   	push   %ebx
 715:	e8 48 fd ff ff       	call   462 <write>
        while(*s != 0){
 71a:	0f b6 06             	movzbl (%esi),%eax
 71d:	83 c4 10             	add    $0x10,%esp
 720:	84 c0                	test   %al,%al
 722:	75 e4                	jne    708 <printf+0x148>
 724:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 727:	31 ff                	xor    %edi,%edi
 729:	e9 da fe ff ff       	jmp    608 <printf+0x48>
 72e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 730:	83 ec 0c             	sub    $0xc,%esp
 733:	b9 0a 00 00 00       	mov    $0xa,%ecx
 738:	6a 01                	push   $0x1
 73a:	e9 73 ff ff ff       	jmp    6b2 <printf+0xf2>
 73f:	90                   	nop
  write(fd, &c, 1);
 740:	83 ec 04             	sub    $0x4,%esp
 743:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 746:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 749:	6a 01                	push   $0x1
 74b:	e9 21 ff ff ff       	jmp    671 <printf+0xb1>
        putc(fd, *ap);
 750:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 753:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 756:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 758:	6a 01                	push   $0x1
        ap++;
 75a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 75d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 760:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 763:	50                   	push   %eax
 764:	ff 75 08             	pushl  0x8(%ebp)
 767:	e8 f6 fc ff ff       	call   462 <write>
        ap++;
 76c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 76f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 772:	31 ff                	xor    %edi,%edi
 774:	e9 8f fe ff ff       	jmp    608 <printf+0x48>
          s = "(null)";
 779:	bb 88 09 00 00       	mov    $0x988,%ebx
        while(*s != 0){
 77e:	b8 28 00 00 00       	mov    $0x28,%eax
 783:	e9 72 ff ff ff       	jmp    6fa <printf+0x13a>
 788:	66 90                	xchg   %ax,%ax
 78a:	66 90                	xchg   %ax,%ax
 78c:	66 90                	xchg   %ax,%ax
 78e:	66 90                	xchg   %ax,%ax

00000790 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 790:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 791:	a1 68 0c 00 00       	mov    0xc68,%eax
{
 796:	89 e5                	mov    %esp,%ebp
 798:	57                   	push   %edi
 799:	56                   	push   %esi
 79a:	53                   	push   %ebx
 79b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 79e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 7a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a8:	39 c8                	cmp    %ecx,%eax
 7aa:	8b 10                	mov    (%eax),%edx
 7ac:	73 32                	jae    7e0 <free+0x50>
 7ae:	39 d1                	cmp    %edx,%ecx
 7b0:	72 04                	jb     7b6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b2:	39 d0                	cmp    %edx,%eax
 7b4:	72 32                	jb     7e8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7b6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7b9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7bc:	39 fa                	cmp    %edi,%edx
 7be:	74 30                	je     7f0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7c0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7c3:	8b 50 04             	mov    0x4(%eax),%edx
 7c6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7c9:	39 f1                	cmp    %esi,%ecx
 7cb:	74 3a                	je     807 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7cd:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7cf:	a3 68 0c 00 00       	mov    %eax,0xc68
}
 7d4:	5b                   	pop    %ebx
 7d5:	5e                   	pop    %esi
 7d6:	5f                   	pop    %edi
 7d7:	5d                   	pop    %ebp
 7d8:	c3                   	ret    
 7d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7e0:	39 d0                	cmp    %edx,%eax
 7e2:	72 04                	jb     7e8 <free+0x58>
 7e4:	39 d1                	cmp    %edx,%ecx
 7e6:	72 ce                	jb     7b6 <free+0x26>
{
 7e8:	89 d0                	mov    %edx,%eax
 7ea:	eb bc                	jmp    7a8 <free+0x18>
 7ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 7f0:	03 72 04             	add    0x4(%edx),%esi
 7f3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7f6:	8b 10                	mov    (%eax),%edx
 7f8:	8b 12                	mov    (%edx),%edx
 7fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7fd:	8b 50 04             	mov    0x4(%eax),%edx
 800:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 803:	39 f1                	cmp    %esi,%ecx
 805:	75 c6                	jne    7cd <free+0x3d>
    p->s.size += bp->s.size;
 807:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 80a:	a3 68 0c 00 00       	mov    %eax,0xc68
    p->s.size += bp->s.size;
 80f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 812:	8b 53 f8             	mov    -0x8(%ebx),%edx
 815:	89 10                	mov    %edx,(%eax)
}
 817:	5b                   	pop    %ebx
 818:	5e                   	pop    %esi
 819:	5f                   	pop    %edi
 81a:	5d                   	pop    %ebp
 81b:	c3                   	ret    
 81c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000820 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 820:	55                   	push   %ebp
 821:	89 e5                	mov    %esp,%ebp
 823:	57                   	push   %edi
 824:	56                   	push   %esi
 825:	53                   	push   %ebx
 826:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 829:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 82c:	8b 15 68 0c 00 00    	mov    0xc68,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 832:	8d 78 07             	lea    0x7(%eax),%edi
 835:	c1 ef 03             	shr    $0x3,%edi
 838:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 83b:	85 d2                	test   %edx,%edx
 83d:	0f 84 9d 00 00 00    	je     8e0 <malloc+0xc0>
 843:	8b 02                	mov    (%edx),%eax
 845:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 848:	39 cf                	cmp    %ecx,%edi
 84a:	76 6c                	jbe    8b8 <malloc+0x98>
 84c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 852:	bb 00 10 00 00       	mov    $0x1000,%ebx
 857:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 85a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 861:	eb 0e                	jmp    871 <malloc+0x51>
 863:	90                   	nop
 864:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 868:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 86a:	8b 48 04             	mov    0x4(%eax),%ecx
 86d:	39 f9                	cmp    %edi,%ecx
 86f:	73 47                	jae    8b8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 871:	39 05 68 0c 00 00    	cmp    %eax,0xc68
 877:	89 c2                	mov    %eax,%edx
 879:	75 ed                	jne    868 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 87b:	83 ec 0c             	sub    $0xc,%esp
 87e:	56                   	push   %esi
 87f:	e8 46 fc ff ff       	call   4ca <sbrk>
  if(p == (char*)-1)
 884:	83 c4 10             	add    $0x10,%esp
 887:	83 f8 ff             	cmp    $0xffffffff,%eax
 88a:	74 1c                	je     8a8 <malloc+0x88>
  hp->s.size = nu;
 88c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 88f:	83 ec 0c             	sub    $0xc,%esp
 892:	83 c0 08             	add    $0x8,%eax
 895:	50                   	push   %eax
 896:	e8 f5 fe ff ff       	call   790 <free>
  return freep;
 89b:	8b 15 68 0c 00 00    	mov    0xc68,%edx
      if((p = morecore(nunits)) == 0)
 8a1:	83 c4 10             	add    $0x10,%esp
 8a4:	85 d2                	test   %edx,%edx
 8a6:	75 c0                	jne    868 <malloc+0x48>
        return 0;
  }
}
 8a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8ab:	31 c0                	xor    %eax,%eax
}
 8ad:	5b                   	pop    %ebx
 8ae:	5e                   	pop    %esi
 8af:	5f                   	pop    %edi
 8b0:	5d                   	pop    %ebp
 8b1:	c3                   	ret    
 8b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8b8:	39 cf                	cmp    %ecx,%edi
 8ba:	74 54                	je     910 <malloc+0xf0>
        p->s.size -= nunits;
 8bc:	29 f9                	sub    %edi,%ecx
 8be:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8c1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8c4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 8c7:	89 15 68 0c 00 00    	mov    %edx,0xc68
}
 8cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8d0:	83 c0 08             	add    $0x8,%eax
}
 8d3:	5b                   	pop    %ebx
 8d4:	5e                   	pop    %esi
 8d5:	5f                   	pop    %edi
 8d6:	5d                   	pop    %ebp
 8d7:	c3                   	ret    
 8d8:	90                   	nop
 8d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 8e0:	c7 05 68 0c 00 00 6c 	movl   $0xc6c,0xc68
 8e7:	0c 00 00 
 8ea:	c7 05 6c 0c 00 00 6c 	movl   $0xc6c,0xc6c
 8f1:	0c 00 00 
    base.s.size = 0;
 8f4:	b8 6c 0c 00 00       	mov    $0xc6c,%eax
 8f9:	c7 05 70 0c 00 00 00 	movl   $0x0,0xc70
 900:	00 00 00 
 903:	e9 44 ff ff ff       	jmp    84c <malloc+0x2c>
 908:	90                   	nop
 909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 910:	8b 08                	mov    (%eax),%ecx
 912:	89 0a                	mov    %ecx,(%edx)
 914:	eb b1                	jmp    8c7 <malloc+0xa7>

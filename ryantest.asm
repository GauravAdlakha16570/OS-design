
_ryantest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
 
 
 
int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 08             	sub    $0x8,%esp
	void *stacks[num_threads];
  14:	a1 60 0c 00 00       	mov    0xc60,%eax
  19:	8d 14 85 12 00 00 00 	lea    0x12(,%eax,4),%edx
  20:	83 e2 f0             	and    $0xfffffff0,%edx
  23:	29 d4                	sub    %edx,%esp
  25:	89 e6                	mov    %esp,%esi
    int *args[num_threads];
  27:	29 d4                	sub    %edx,%esp

    for (int i = 0; i < num_threads; i++) {
  29:	85 c0                	test   %eax,%eax
    int *args[num_threads];
  2b:	89 e7                	mov    %esp,%edi
    for (int i = 0; i < num_threads; i++) {
  2d:	7e 59                	jle    88 <main+0x88>
  2f:	31 db                	xor    %ebx,%ebx
  31:	eb 2b                	jmp    5e <main+0x5e>
  33:	90                   	nop
  34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        if (!stacks[i]) {
            printf(1, "main: could not allocate stacks");
            exit();
        }

        args[i] = (int*)malloc(4); //each argument gets a spot in memory
  38:	83 ec 0c             	sub    $0xc,%esp
  3b:	6a 04                	push   $0x4
  3d:	e8 7e 07 00 00       	call   7c0 <malloc>
        if (!args[i]) {
  42:	83 c4 10             	add    $0x10,%esp
  45:	85 c0                	test   %eax,%eax
        args[i] = (int*)malloc(4); //each argument gets a spot in memory
  47:	89 04 9f             	mov    %eax,(%edi,%ebx,4)
        if (!args[i]) {
  4a:	0f 84 d5 00 00 00    	je     125 <main+0x125>
            printf(1, "main: could not allocate args");
            exit();
        }

        *args[i] = i;
  50:	89 18                	mov    %ebx,(%eax)
    for (int i = 0; i < num_threads; i++) {
  52:	a1 60 0c 00 00       	mov    0xc60,%eax
  57:	83 c3 01             	add    $0x1,%ebx
  5a:	39 d8                	cmp    %ebx,%eax
  5c:	7e 2a                	jle    88 <main+0x88>
        stacks[i] = (void*)malloc(4096); //allocate a stack for each thread
  5e:	83 ec 0c             	sub    $0xc,%esp
  61:	68 00 10 00 00       	push   $0x1000
  66:	e8 55 07 00 00       	call   7c0 <malloc>
        if (!stacks[i]) {
  6b:	83 c4 10             	add    $0x10,%esp
  6e:	85 c0                	test   %eax,%eax
        stacks[i] = (void*)malloc(4096); //allocate a stack for each thread
  70:	89 04 9e             	mov    %eax,(%esi,%ebx,4)
        if (!stacks[i]) {
  73:	75 c3                	jne    38 <main+0x38>
            printf(1, "main: could not allocate stacks");
  75:	53                   	push   %ebx
  76:	53                   	push   %ebx
  77:	68 28 09 00 00       	push   $0x928
  7c:	6a 01                	push   $0x1
  7e:	e8 dd 04 00 00       	call   560 <printf>
            exit();
  83:	e8 7a 03 00 00       	call   402 <exit>
    }

    printf(1, "main: running with %d threads.\n", num_threads);
  88:	52                   	push   %edx
  89:	50                   	push   %eax
  8a:	68 48 09 00 00       	push   $0x948
  8f:	6a 01                	push   $0x1
  91:	e8 ca 04 00 00       	call   560 <printf>

    //Time to make the threads
    int tid = 0;

    for (int i = 0; i < num_threads; i++) {
  96:	83 c4 10             	add    $0x10,%esp
  99:	83 3d 60 0c 00 00 00 	cmpl   $0x0,0xc60
  a0:	7e 70                	jle    112 <main+0x112>
  a2:	31 db                	xor    %ebx,%ebx
  a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        tid = clone(&testfunc, stacks[i], args[i]);
  a8:	83 ec 04             	sub    $0x4,%esp
  ab:	ff 34 9f             	pushl  (%edi,%ebx,4)
  ae:	ff 34 9e             	pushl  (%esi,%ebx,4)
  b1:	68 40 01 00 00       	push   $0x140
    for (int i = 0; i < num_threads; i++) {
  b6:	83 c3 01             	add    $0x1,%ebx
        tid = clone(&testfunc, stacks[i], args[i]);
  b9:	e8 e4 03 00 00       	call   4a2 <clone>
        //sleep(100);
        printf(1, "main: created thread with tid: %d\n", tid);
  be:	83 c4 0c             	add    $0xc,%esp
  c1:	50                   	push   %eax
  c2:	68 68 09 00 00       	push   $0x968
  c7:	6a 01                	push   $0x1
  c9:	e8 92 04 00 00       	call   560 <printf>
    for (int i = 0; i < num_threads; i++) {
  ce:	a1 60 0c 00 00       	mov    0xc60,%eax
  d3:	83 c4 10             	add    $0x10,%esp
  d6:	39 d8                	cmp    %ebx,%eax
  d8:	7f ce                	jg     a8 <main+0xa8>
    }

    //Time to wait for all of them to finish
    

    for (int i = 0; i < num_threads; i++) {
  da:	85 c0                	test   %eax,%eax
  dc:	7e 34                	jle    112 <main+0x112>
  de:	31 db                	xor    %ebx,%ebx
        printf(1, "starting join\n");
  e0:	83 ec 08             	sub    $0x8,%esp
    for (int i = 0; i < num_threads; i++) {
  e3:	83 c3 01             	add    $0x1,%ebx
        printf(1, "starting join\n");
  e6:	68 ea 08 00 00       	push   $0x8ea
  eb:	6a 01                	push   $0x1
  ed:	e8 6e 04 00 00       	call   560 <printf>
        tid = join();
  f2:	e8 b3 03 00 00       	call   4aa <join>
        printf(1, "thread %d joined\n", tid);
  f7:	83 c4 0c             	add    $0xc,%esp
  fa:	50                   	push   %eax
  fb:	68 f9 08 00 00       	push   $0x8f9
 100:	6a 01                	push   $0x1
 102:	e8 59 04 00 00       	call   560 <printf>
    for (int i = 0; i < num_threads; i++) {
 107:	83 c4 10             	add    $0x10,%esp
 10a:	39 1d 60 0c 00 00    	cmp    %ebx,0xc60
 110:	7f ce                	jg     e0 <main+0xe0>
    }

    printf(1, "main: all threads joined\n");
 112:	50                   	push   %eax
 113:	50                   	push   %eax
 114:	68 0b 09 00 00       	push   $0x90b
 119:	6a 01                	push   $0x1
 11b:	e8 40 04 00 00       	call   560 <printf>
	

  exit();
 120:	e8 dd 02 00 00       	call   402 <exit>
            printf(1, "main: could not allocate args");
 125:	51                   	push   %ecx
 126:	51                   	push   %ecx
 127:	68 cc 08 00 00       	push   $0x8cc
 12c:	6a 01                	push   $0x1
 12e:	e8 2d 04 00 00       	call   560 <printf>
            exit();
 133:	e8 ca 02 00 00       	call   402 <exit>
 138:	66 90                	xchg   %ax,%ax
 13a:	66 90                	xchg   %ax,%ax
 13c:	66 90                	xchg   %ax,%ax
 13e:	66 90                	xchg   %ax,%ax

00000140 <testfunc>:
 void *testfunc(void *arg) {
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	53                   	push   %ebx
 144:	83 ec 04             	sub    $0x4,%esp
     int num = *(int*)arg;
 147:	8b 45 08             	mov    0x8(%ebp),%eax
 14a:	8b 18                	mov    (%eax),%ebx
     if (num == 0){
 14c:	85 db                	test   %ebx,%ebx
 14e:	74 1f                	je     16f <testfunc+0x2f>
     else if (num == 1){
 150:	83 fb 01             	cmp    $0x1,%ebx
 153:	74 3e                	je     193 <testfunc+0x53>
     else if (num == 2){
 155:	83 fb 02             	cmp    $0x2,%ebx
 158:	74 27                	je     181 <testfunc+0x41>
     printf(1, "Thread %d exitting\n", num);
 15a:	83 ec 04             	sub    $0x4,%esp
 15d:	53                   	push   %ebx
 15e:	68 b8 08 00 00       	push   $0x8b8
 163:	6a 01                	push   $0x1
 165:	e8 f6 03 00 00       	call   560 <printf>
	 exit();
 16a:	e8 93 02 00 00       	call   402 <exit>
         sleep(1000);
 16f:	83 ec 0c             	sub    $0xc,%esp
 172:	68 e8 03 00 00       	push   $0x3e8
 177:	e8 16 03 00 00       	call   492 <sleep>
 17c:	83 c4 10             	add    $0x10,%esp
 17f:	eb d9                	jmp    15a <testfunc+0x1a>
         sleep(500);
 181:	83 ec 0c             	sub    $0xc,%esp
 184:	68 f4 01 00 00       	push   $0x1f4
 189:	e8 04 03 00 00       	call   492 <sleep>
 18e:	83 c4 10             	add    $0x10,%esp
 191:	eb c7                	jmp    15a <testfunc+0x1a>
         sleep(100);
 193:	83 ec 0c             	sub    $0xc,%esp
 196:	6a 64                	push   $0x64
 198:	e8 f5 02 00 00       	call   492 <sleep>
 19d:	83 c4 10             	add    $0x10,%esp
 1a0:	eb b8                	jmp    15a <testfunc+0x1a>
 1a2:	66 90                	xchg   %ax,%ax
 1a4:	66 90                	xchg   %ax,%ax
 1a6:	66 90                	xchg   %ax,%ax
 1a8:	66 90                	xchg   %ax,%ax
 1aa:	66 90                	xchg   %ax,%ax
 1ac:	66 90                	xchg   %ax,%ax
 1ae:	66 90                	xchg   %ax,%ax

000001b0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	53                   	push   %ebx
 1b4:	8b 45 08             	mov    0x8(%ebp),%eax
 1b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1ba:	89 c2                	mov    %eax,%edx
 1bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1c0:	83 c1 01             	add    $0x1,%ecx
 1c3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 1c7:	83 c2 01             	add    $0x1,%edx
 1ca:	84 db                	test   %bl,%bl
 1cc:	88 5a ff             	mov    %bl,-0x1(%edx)
 1cf:	75 ef                	jne    1c0 <strcpy+0x10>
    ;
  return os;
}
 1d1:	5b                   	pop    %ebx
 1d2:	5d                   	pop    %ebp
 1d3:	c3                   	ret    
 1d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	53                   	push   %ebx
 1e4:	8b 55 08             	mov    0x8(%ebp),%edx
 1e7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1ea:	0f b6 02             	movzbl (%edx),%eax
 1ed:	0f b6 19             	movzbl (%ecx),%ebx
 1f0:	84 c0                	test   %al,%al
 1f2:	75 1c                	jne    210 <strcmp+0x30>
 1f4:	eb 2a                	jmp    220 <strcmp+0x40>
 1f6:	8d 76 00             	lea    0x0(%esi),%esi
 1f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 200:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 203:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 206:	83 c1 01             	add    $0x1,%ecx
 209:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 20c:	84 c0                	test   %al,%al
 20e:	74 10                	je     220 <strcmp+0x40>
 210:	38 d8                	cmp    %bl,%al
 212:	74 ec                	je     200 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 214:	29 d8                	sub    %ebx,%eax
}
 216:	5b                   	pop    %ebx
 217:	5d                   	pop    %ebp
 218:	c3                   	ret    
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 220:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 222:	29 d8                	sub    %ebx,%eax
}
 224:	5b                   	pop    %ebx
 225:	5d                   	pop    %ebp
 226:	c3                   	ret    
 227:	89 f6                	mov    %esi,%esi
 229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000230 <strlen>:

uint
strlen(const char *s)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 236:	80 39 00             	cmpb   $0x0,(%ecx)
 239:	74 15                	je     250 <strlen+0x20>
 23b:	31 d2                	xor    %edx,%edx
 23d:	8d 76 00             	lea    0x0(%esi),%esi
 240:	83 c2 01             	add    $0x1,%edx
 243:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 247:	89 d0                	mov    %edx,%eax
 249:	75 f5                	jne    240 <strlen+0x10>
    ;
  return n;
}
 24b:	5d                   	pop    %ebp
 24c:	c3                   	ret    
 24d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 250:	31 c0                	xor    %eax,%eax
}
 252:	5d                   	pop    %ebp
 253:	c3                   	ret    
 254:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 25a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000260 <memset>:

void*
memset(void *dst, int c, uint n)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	57                   	push   %edi
 264:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 267:	8b 4d 10             	mov    0x10(%ebp),%ecx
 26a:	8b 45 0c             	mov    0xc(%ebp),%eax
 26d:	89 d7                	mov    %edx,%edi
 26f:	fc                   	cld    
 270:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 272:	89 d0                	mov    %edx,%eax
 274:	5f                   	pop    %edi
 275:	5d                   	pop    %ebp
 276:	c3                   	ret    
 277:	89 f6                	mov    %esi,%esi
 279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000280 <strchr>:

char*
strchr(const char *s, char c)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	53                   	push   %ebx
 284:	8b 45 08             	mov    0x8(%ebp),%eax
 287:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 28a:	0f b6 10             	movzbl (%eax),%edx
 28d:	84 d2                	test   %dl,%dl
 28f:	74 1d                	je     2ae <strchr+0x2e>
    if(*s == c)
 291:	38 d3                	cmp    %dl,%bl
 293:	89 d9                	mov    %ebx,%ecx
 295:	75 0d                	jne    2a4 <strchr+0x24>
 297:	eb 17                	jmp    2b0 <strchr+0x30>
 299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2a0:	38 ca                	cmp    %cl,%dl
 2a2:	74 0c                	je     2b0 <strchr+0x30>
  for(; *s; s++)
 2a4:	83 c0 01             	add    $0x1,%eax
 2a7:	0f b6 10             	movzbl (%eax),%edx
 2aa:	84 d2                	test   %dl,%dl
 2ac:	75 f2                	jne    2a0 <strchr+0x20>
      return (char*)s;
  return 0;
 2ae:	31 c0                	xor    %eax,%eax
}
 2b0:	5b                   	pop    %ebx
 2b1:	5d                   	pop    %ebp
 2b2:	c3                   	ret    
 2b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002c0 <gets>:

char*
gets(char *buf, int max)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	57                   	push   %edi
 2c4:	56                   	push   %esi
 2c5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2c6:	31 f6                	xor    %esi,%esi
 2c8:	89 f3                	mov    %esi,%ebx
{
 2ca:	83 ec 1c             	sub    $0x1c,%esp
 2cd:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 2d0:	eb 2f                	jmp    301 <gets+0x41>
 2d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 2d8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2db:	83 ec 04             	sub    $0x4,%esp
 2de:	6a 01                	push   $0x1
 2e0:	50                   	push   %eax
 2e1:	6a 00                	push   $0x0
 2e3:	e8 32 01 00 00       	call   41a <read>
    if(cc < 1)
 2e8:	83 c4 10             	add    $0x10,%esp
 2eb:	85 c0                	test   %eax,%eax
 2ed:	7e 1c                	jle    30b <gets+0x4b>
      break;
    buf[i++] = c;
 2ef:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2f3:	83 c7 01             	add    $0x1,%edi
 2f6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 2f9:	3c 0a                	cmp    $0xa,%al
 2fb:	74 23                	je     320 <gets+0x60>
 2fd:	3c 0d                	cmp    $0xd,%al
 2ff:	74 1f                	je     320 <gets+0x60>
  for(i=0; i+1 < max; ){
 301:	83 c3 01             	add    $0x1,%ebx
 304:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 307:	89 fe                	mov    %edi,%esi
 309:	7c cd                	jl     2d8 <gets+0x18>
 30b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 30d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 310:	c6 03 00             	movb   $0x0,(%ebx)
}
 313:	8d 65 f4             	lea    -0xc(%ebp),%esp
 316:	5b                   	pop    %ebx
 317:	5e                   	pop    %esi
 318:	5f                   	pop    %edi
 319:	5d                   	pop    %ebp
 31a:	c3                   	ret    
 31b:	90                   	nop
 31c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 320:	8b 75 08             	mov    0x8(%ebp),%esi
 323:	8b 45 08             	mov    0x8(%ebp),%eax
 326:	01 de                	add    %ebx,%esi
 328:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 32a:	c6 03 00             	movb   $0x0,(%ebx)
}
 32d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 330:	5b                   	pop    %ebx
 331:	5e                   	pop    %esi
 332:	5f                   	pop    %edi
 333:	5d                   	pop    %ebp
 334:	c3                   	ret    
 335:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000340 <stat>:

int
stat(const char *n, struct stat *st)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	56                   	push   %esi
 344:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 345:	83 ec 08             	sub    $0x8,%esp
 348:	6a 00                	push   $0x0
 34a:	ff 75 08             	pushl  0x8(%ebp)
 34d:	e8 f0 00 00 00       	call   442 <open>
  if(fd < 0)
 352:	83 c4 10             	add    $0x10,%esp
 355:	85 c0                	test   %eax,%eax
 357:	78 27                	js     380 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 359:	83 ec 08             	sub    $0x8,%esp
 35c:	ff 75 0c             	pushl  0xc(%ebp)
 35f:	89 c3                	mov    %eax,%ebx
 361:	50                   	push   %eax
 362:	e8 f3 00 00 00       	call   45a <fstat>
  close(fd);
 367:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 36a:	89 c6                	mov    %eax,%esi
  close(fd);
 36c:	e8 b9 00 00 00       	call   42a <close>
  return r;
 371:	83 c4 10             	add    $0x10,%esp
}
 374:	8d 65 f8             	lea    -0x8(%ebp),%esp
 377:	89 f0                	mov    %esi,%eax
 379:	5b                   	pop    %ebx
 37a:	5e                   	pop    %esi
 37b:	5d                   	pop    %ebp
 37c:	c3                   	ret    
 37d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 380:	be ff ff ff ff       	mov    $0xffffffff,%esi
 385:	eb ed                	jmp    374 <stat+0x34>
 387:	89 f6                	mov    %esi,%esi
 389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000390 <atoi>:

int
atoi(const char *s)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	53                   	push   %ebx
 394:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 397:	0f be 11             	movsbl (%ecx),%edx
 39a:	8d 42 d0             	lea    -0x30(%edx),%eax
 39d:	3c 09                	cmp    $0x9,%al
  n = 0;
 39f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 3a4:	77 1f                	ja     3c5 <atoi+0x35>
 3a6:	8d 76 00             	lea    0x0(%esi),%esi
 3a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 3b0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 3b3:	83 c1 01             	add    $0x1,%ecx
 3b6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 3ba:	0f be 11             	movsbl (%ecx),%edx
 3bd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 3c0:	80 fb 09             	cmp    $0x9,%bl
 3c3:	76 eb                	jbe    3b0 <atoi+0x20>
  return n;
}
 3c5:	5b                   	pop    %ebx
 3c6:	5d                   	pop    %ebp
 3c7:	c3                   	ret    
 3c8:	90                   	nop
 3c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	56                   	push   %esi
 3d4:	53                   	push   %ebx
 3d5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3d8:	8b 45 08             	mov    0x8(%ebp),%eax
 3db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3de:	85 db                	test   %ebx,%ebx
 3e0:	7e 14                	jle    3f6 <memmove+0x26>
 3e2:	31 d2                	xor    %edx,%edx
 3e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 3e8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 3ec:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 3ef:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 3f2:	39 d3                	cmp    %edx,%ebx
 3f4:	75 f2                	jne    3e8 <memmove+0x18>
  return vdst;
}
 3f6:	5b                   	pop    %ebx
 3f7:	5e                   	pop    %esi
 3f8:	5d                   	pop    %ebp
 3f9:	c3                   	ret    

000003fa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3fa:	b8 01 00 00 00       	mov    $0x1,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <exit>:
SYSCALL(exit)
 402:	b8 02 00 00 00       	mov    $0x2,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <wait>:
SYSCALL(wait)
 40a:	b8 03 00 00 00       	mov    $0x3,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <pipe>:
SYSCALL(pipe)
 412:	b8 04 00 00 00       	mov    $0x4,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <read>:
SYSCALL(read)
 41a:	b8 05 00 00 00       	mov    $0x5,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <write>:
SYSCALL(write)
 422:	b8 10 00 00 00       	mov    $0x10,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <close>:
SYSCALL(close)
 42a:	b8 15 00 00 00       	mov    $0x15,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <kill>:
SYSCALL(kill)
 432:	b8 06 00 00 00       	mov    $0x6,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <exec>:
SYSCALL(exec)
 43a:	b8 07 00 00 00       	mov    $0x7,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <open>:
SYSCALL(open)
 442:	b8 0f 00 00 00       	mov    $0xf,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <mknod>:
SYSCALL(mknod)
 44a:	b8 11 00 00 00       	mov    $0x11,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <unlink>:
SYSCALL(unlink)
 452:	b8 12 00 00 00       	mov    $0x12,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <fstat>:
SYSCALL(fstat)
 45a:	b8 08 00 00 00       	mov    $0x8,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <link>:
SYSCALL(link)
 462:	b8 13 00 00 00       	mov    $0x13,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <mkdir>:
SYSCALL(mkdir)
 46a:	b8 14 00 00 00       	mov    $0x14,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <chdir>:
SYSCALL(chdir)
 472:	b8 09 00 00 00       	mov    $0x9,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <dup>:
SYSCALL(dup)
 47a:	b8 0a 00 00 00       	mov    $0xa,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <getpid>:
SYSCALL(getpid)
 482:	b8 0b 00 00 00       	mov    $0xb,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <sbrk>:
SYSCALL(sbrk)
 48a:	b8 0c 00 00 00       	mov    $0xc,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <sleep>:
SYSCALL(sleep)
 492:	b8 0d 00 00 00       	mov    $0xd,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <uptime>:
SYSCALL(uptime)
 49a:	b8 0e 00 00 00       	mov    $0xe,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <clone>:
SYSCALL(clone)
 4a2:	b8 16 00 00 00       	mov    $0x16,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <join>:
SYSCALL(join)  
 4aa:	b8 17 00 00 00       	mov    $0x17,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    
 4b2:	66 90                	xchg   %ax,%ax
 4b4:	66 90                	xchg   %ax,%ax
 4b6:	66 90                	xchg   %ax,%ax
 4b8:	66 90                	xchg   %ax,%ax
 4ba:	66 90                	xchg   %ax,%ax
 4bc:	66 90                	xchg   %ax,%ax
 4be:	66 90                	xchg   %ax,%ax

000004c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	57                   	push   %edi
 4c4:	56                   	push   %esi
 4c5:	53                   	push   %ebx
 4c6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4c9:	85 d2                	test   %edx,%edx
{
 4cb:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 4ce:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 4d0:	79 76                	jns    548 <printint+0x88>
 4d2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4d6:	74 70                	je     548 <printint+0x88>
    x = -xx;
 4d8:	f7 d8                	neg    %eax
    neg = 1;
 4da:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4e1:	31 f6                	xor    %esi,%esi
 4e3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 4e6:	eb 0a                	jmp    4f2 <printint+0x32>
 4e8:	90                   	nop
 4e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 4f0:	89 fe                	mov    %edi,%esi
 4f2:	31 d2                	xor    %edx,%edx
 4f4:	8d 7e 01             	lea    0x1(%esi),%edi
 4f7:	f7 f1                	div    %ecx
 4f9:	0f b6 92 94 09 00 00 	movzbl 0x994(%edx),%edx
  }while((x /= base) != 0);
 500:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 502:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 505:	75 e9                	jne    4f0 <printint+0x30>
  if(neg)
 507:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 50a:	85 c0                	test   %eax,%eax
 50c:	74 08                	je     516 <printint+0x56>
    buf[i++] = '-';
 50e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 513:	8d 7e 02             	lea    0x2(%esi),%edi
 516:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 51a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 51d:	8d 76 00             	lea    0x0(%esi),%esi
 520:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 523:	83 ec 04             	sub    $0x4,%esp
 526:	83 ee 01             	sub    $0x1,%esi
 529:	6a 01                	push   $0x1
 52b:	53                   	push   %ebx
 52c:	57                   	push   %edi
 52d:	88 45 d7             	mov    %al,-0x29(%ebp)
 530:	e8 ed fe ff ff       	call   422 <write>

  while(--i >= 0)
 535:	83 c4 10             	add    $0x10,%esp
 538:	39 de                	cmp    %ebx,%esi
 53a:	75 e4                	jne    520 <printint+0x60>
    putc(fd, buf[i]);
}
 53c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 53f:	5b                   	pop    %ebx
 540:	5e                   	pop    %esi
 541:	5f                   	pop    %edi
 542:	5d                   	pop    %ebp
 543:	c3                   	ret    
 544:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 548:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 54f:	eb 90                	jmp    4e1 <printint+0x21>
 551:	eb 0d                	jmp    560 <printf>
 553:	90                   	nop
 554:	90                   	nop
 555:	90                   	nop
 556:	90                   	nop
 557:	90                   	nop
 558:	90                   	nop
 559:	90                   	nop
 55a:	90                   	nop
 55b:	90                   	nop
 55c:	90                   	nop
 55d:	90                   	nop
 55e:	90                   	nop
 55f:	90                   	nop

00000560 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	56                   	push   %esi
 565:	53                   	push   %ebx
 566:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 569:	8b 75 0c             	mov    0xc(%ebp),%esi
 56c:	0f b6 1e             	movzbl (%esi),%ebx
 56f:	84 db                	test   %bl,%bl
 571:	0f 84 b3 00 00 00    	je     62a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 577:	8d 45 10             	lea    0x10(%ebp),%eax
 57a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 57d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 57f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 582:	eb 2f                	jmp    5b3 <printf+0x53>
 584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 588:	83 f8 25             	cmp    $0x25,%eax
 58b:	0f 84 a7 00 00 00    	je     638 <printf+0xd8>
  write(fd, &c, 1);
 591:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 594:	83 ec 04             	sub    $0x4,%esp
 597:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 59a:	6a 01                	push   $0x1
 59c:	50                   	push   %eax
 59d:	ff 75 08             	pushl  0x8(%ebp)
 5a0:	e8 7d fe ff ff       	call   422 <write>
 5a5:	83 c4 10             	add    $0x10,%esp
 5a8:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 5ab:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 5af:	84 db                	test   %bl,%bl
 5b1:	74 77                	je     62a <printf+0xca>
    if(state == 0){
 5b3:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 5b5:	0f be cb             	movsbl %bl,%ecx
 5b8:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5bb:	74 cb                	je     588 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5bd:	83 ff 25             	cmp    $0x25,%edi
 5c0:	75 e6                	jne    5a8 <printf+0x48>
      if(c == 'd'){
 5c2:	83 f8 64             	cmp    $0x64,%eax
 5c5:	0f 84 05 01 00 00    	je     6d0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5cb:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 5d1:	83 f9 70             	cmp    $0x70,%ecx
 5d4:	74 72                	je     648 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5d6:	83 f8 73             	cmp    $0x73,%eax
 5d9:	0f 84 99 00 00 00    	je     678 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5df:	83 f8 63             	cmp    $0x63,%eax
 5e2:	0f 84 08 01 00 00    	je     6f0 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5e8:	83 f8 25             	cmp    $0x25,%eax
 5eb:	0f 84 ef 00 00 00    	je     6e0 <printf+0x180>
  write(fd, &c, 1);
 5f1:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5f4:	83 ec 04             	sub    $0x4,%esp
 5f7:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5fb:	6a 01                	push   $0x1
 5fd:	50                   	push   %eax
 5fe:	ff 75 08             	pushl  0x8(%ebp)
 601:	e8 1c fe ff ff       	call   422 <write>
 606:	83 c4 0c             	add    $0xc,%esp
 609:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 60c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 60f:	6a 01                	push   $0x1
 611:	50                   	push   %eax
 612:	ff 75 08             	pushl  0x8(%ebp)
 615:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 618:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 61a:	e8 03 fe ff ff       	call   422 <write>
  for(i = 0; fmt[i]; i++){
 61f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 623:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 626:	84 db                	test   %bl,%bl
 628:	75 89                	jne    5b3 <printf+0x53>
    }
  }
}
 62a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 62d:	5b                   	pop    %ebx
 62e:	5e                   	pop    %esi
 62f:	5f                   	pop    %edi
 630:	5d                   	pop    %ebp
 631:	c3                   	ret    
 632:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 638:	bf 25 00 00 00       	mov    $0x25,%edi
 63d:	e9 66 ff ff ff       	jmp    5a8 <printf+0x48>
 642:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 648:	83 ec 0c             	sub    $0xc,%esp
 64b:	b9 10 00 00 00       	mov    $0x10,%ecx
 650:	6a 00                	push   $0x0
 652:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 655:	8b 45 08             	mov    0x8(%ebp),%eax
 658:	8b 17                	mov    (%edi),%edx
 65a:	e8 61 fe ff ff       	call   4c0 <printint>
        ap++;
 65f:	89 f8                	mov    %edi,%eax
 661:	83 c4 10             	add    $0x10,%esp
      state = 0;
 664:	31 ff                	xor    %edi,%edi
        ap++;
 666:	83 c0 04             	add    $0x4,%eax
 669:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 66c:	e9 37 ff ff ff       	jmp    5a8 <printf+0x48>
 671:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 678:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 67b:	8b 08                	mov    (%eax),%ecx
        ap++;
 67d:	83 c0 04             	add    $0x4,%eax
 680:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 683:	85 c9                	test   %ecx,%ecx
 685:	0f 84 8e 00 00 00    	je     719 <printf+0x1b9>
        while(*s != 0){
 68b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 68e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 690:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 692:	84 c0                	test   %al,%al
 694:	0f 84 0e ff ff ff    	je     5a8 <printf+0x48>
 69a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 69d:	89 de                	mov    %ebx,%esi
 69f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6a2:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 6a5:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6a8:	83 ec 04             	sub    $0x4,%esp
          s++;
 6ab:	83 c6 01             	add    $0x1,%esi
 6ae:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 6b1:	6a 01                	push   $0x1
 6b3:	57                   	push   %edi
 6b4:	53                   	push   %ebx
 6b5:	e8 68 fd ff ff       	call   422 <write>
        while(*s != 0){
 6ba:	0f b6 06             	movzbl (%esi),%eax
 6bd:	83 c4 10             	add    $0x10,%esp
 6c0:	84 c0                	test   %al,%al
 6c2:	75 e4                	jne    6a8 <printf+0x148>
 6c4:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 6c7:	31 ff                	xor    %edi,%edi
 6c9:	e9 da fe ff ff       	jmp    5a8 <printf+0x48>
 6ce:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 6d0:	83 ec 0c             	sub    $0xc,%esp
 6d3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6d8:	6a 01                	push   $0x1
 6da:	e9 73 ff ff ff       	jmp    652 <printf+0xf2>
 6df:	90                   	nop
  write(fd, &c, 1);
 6e0:	83 ec 04             	sub    $0x4,%esp
 6e3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 6e6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 6e9:	6a 01                	push   $0x1
 6eb:	e9 21 ff ff ff       	jmp    611 <printf+0xb1>
        putc(fd, *ap);
 6f0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 6f3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 6f6:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 6f8:	6a 01                	push   $0x1
        ap++;
 6fa:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 6fd:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 700:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 703:	50                   	push   %eax
 704:	ff 75 08             	pushl  0x8(%ebp)
 707:	e8 16 fd ff ff       	call   422 <write>
        ap++;
 70c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 70f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 712:	31 ff                	xor    %edi,%edi
 714:	e9 8f fe ff ff       	jmp    5a8 <printf+0x48>
          s = "(null)";
 719:	bb 8c 09 00 00       	mov    $0x98c,%ebx
        while(*s != 0){
 71e:	b8 28 00 00 00       	mov    $0x28,%eax
 723:	e9 72 ff ff ff       	jmp    69a <printf+0x13a>
 728:	66 90                	xchg   %ax,%ax
 72a:	66 90                	xchg   %ax,%ax
 72c:	66 90                	xchg   %ax,%ax
 72e:	66 90                	xchg   %ax,%ax

00000730 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 730:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 731:	a1 64 0c 00 00       	mov    0xc64,%eax
{
 736:	89 e5                	mov    %esp,%ebp
 738:	57                   	push   %edi
 739:	56                   	push   %esi
 73a:	53                   	push   %ebx
 73b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 73e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 741:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 748:	39 c8                	cmp    %ecx,%eax
 74a:	8b 10                	mov    (%eax),%edx
 74c:	73 32                	jae    780 <free+0x50>
 74e:	39 d1                	cmp    %edx,%ecx
 750:	72 04                	jb     756 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 752:	39 d0                	cmp    %edx,%eax
 754:	72 32                	jb     788 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 756:	8b 73 fc             	mov    -0x4(%ebx),%esi
 759:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 75c:	39 fa                	cmp    %edi,%edx
 75e:	74 30                	je     790 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 760:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 763:	8b 50 04             	mov    0x4(%eax),%edx
 766:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 769:	39 f1                	cmp    %esi,%ecx
 76b:	74 3a                	je     7a7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 76d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 76f:	a3 64 0c 00 00       	mov    %eax,0xc64
}
 774:	5b                   	pop    %ebx
 775:	5e                   	pop    %esi
 776:	5f                   	pop    %edi
 777:	5d                   	pop    %ebp
 778:	c3                   	ret    
 779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 780:	39 d0                	cmp    %edx,%eax
 782:	72 04                	jb     788 <free+0x58>
 784:	39 d1                	cmp    %edx,%ecx
 786:	72 ce                	jb     756 <free+0x26>
{
 788:	89 d0                	mov    %edx,%eax
 78a:	eb bc                	jmp    748 <free+0x18>
 78c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 790:	03 72 04             	add    0x4(%edx),%esi
 793:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 796:	8b 10                	mov    (%eax),%edx
 798:	8b 12                	mov    (%edx),%edx
 79a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 79d:	8b 50 04             	mov    0x4(%eax),%edx
 7a0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7a3:	39 f1                	cmp    %esi,%ecx
 7a5:	75 c6                	jne    76d <free+0x3d>
    p->s.size += bp->s.size;
 7a7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 7aa:	a3 64 0c 00 00       	mov    %eax,0xc64
    p->s.size += bp->s.size;
 7af:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7b2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7b5:	89 10                	mov    %edx,(%eax)
}
 7b7:	5b                   	pop    %ebx
 7b8:	5e                   	pop    %esi
 7b9:	5f                   	pop    %edi
 7ba:	5d                   	pop    %ebp
 7bb:	c3                   	ret    
 7bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	57                   	push   %edi
 7c4:	56                   	push   %esi
 7c5:	53                   	push   %ebx
 7c6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7cc:	8b 15 64 0c 00 00    	mov    0xc64,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d2:	8d 78 07             	lea    0x7(%eax),%edi
 7d5:	c1 ef 03             	shr    $0x3,%edi
 7d8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 7db:	85 d2                	test   %edx,%edx
 7dd:	0f 84 9d 00 00 00    	je     880 <malloc+0xc0>
 7e3:	8b 02                	mov    (%edx),%eax
 7e5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 7e8:	39 cf                	cmp    %ecx,%edi
 7ea:	76 6c                	jbe    858 <malloc+0x98>
 7ec:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 7f2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7f7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 7fa:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 801:	eb 0e                	jmp    811 <malloc+0x51>
 803:	90                   	nop
 804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 808:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 80a:	8b 48 04             	mov    0x4(%eax),%ecx
 80d:	39 f9                	cmp    %edi,%ecx
 80f:	73 47                	jae    858 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 811:	39 05 64 0c 00 00    	cmp    %eax,0xc64
 817:	89 c2                	mov    %eax,%edx
 819:	75 ed                	jne    808 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 81b:	83 ec 0c             	sub    $0xc,%esp
 81e:	56                   	push   %esi
 81f:	e8 66 fc ff ff       	call   48a <sbrk>
  if(p == (char*)-1)
 824:	83 c4 10             	add    $0x10,%esp
 827:	83 f8 ff             	cmp    $0xffffffff,%eax
 82a:	74 1c                	je     848 <malloc+0x88>
  hp->s.size = nu;
 82c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 82f:	83 ec 0c             	sub    $0xc,%esp
 832:	83 c0 08             	add    $0x8,%eax
 835:	50                   	push   %eax
 836:	e8 f5 fe ff ff       	call   730 <free>
  return freep;
 83b:	8b 15 64 0c 00 00    	mov    0xc64,%edx
      if((p = morecore(nunits)) == 0)
 841:	83 c4 10             	add    $0x10,%esp
 844:	85 d2                	test   %edx,%edx
 846:	75 c0                	jne    808 <malloc+0x48>
        return 0;
  }
}
 848:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 84b:	31 c0                	xor    %eax,%eax
}
 84d:	5b                   	pop    %ebx
 84e:	5e                   	pop    %esi
 84f:	5f                   	pop    %edi
 850:	5d                   	pop    %ebp
 851:	c3                   	ret    
 852:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 858:	39 cf                	cmp    %ecx,%edi
 85a:	74 54                	je     8b0 <malloc+0xf0>
        p->s.size -= nunits;
 85c:	29 f9                	sub    %edi,%ecx
 85e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 861:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 864:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 867:	89 15 64 0c 00 00    	mov    %edx,0xc64
}
 86d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 870:	83 c0 08             	add    $0x8,%eax
}
 873:	5b                   	pop    %ebx
 874:	5e                   	pop    %esi
 875:	5f                   	pop    %edi
 876:	5d                   	pop    %ebp
 877:	c3                   	ret    
 878:	90                   	nop
 879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 880:	c7 05 64 0c 00 00 68 	movl   $0xc68,0xc64
 887:	0c 00 00 
 88a:	c7 05 68 0c 00 00 68 	movl   $0xc68,0xc68
 891:	0c 00 00 
    base.s.size = 0;
 894:	b8 68 0c 00 00       	mov    $0xc68,%eax
 899:	c7 05 6c 0c 00 00 00 	movl   $0x0,0xc6c
 8a0:	00 00 00 
 8a3:	e9 44 ff ff ff       	jmp    7ec <malloc+0x2c>
 8a8:	90                   	nop
 8a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 8b0:	8b 08                	mov    (%eax),%ecx
 8b2:	89 0a                	mov    %ecx,(%edx)
 8b4:	eb b1                	jmp    867 <malloc+0xa7>

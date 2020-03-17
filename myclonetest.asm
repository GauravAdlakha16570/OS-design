
_myclonetest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
 
 
 
int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
	for (i = 0; i < 20; i++) {
   7:	31 c0                	xor    %eax,%eax
{
   9:	ff 71 fc             	pushl  -0x4(%ecx)
   c:	55                   	push   %ebp
	for (i = 0; i < 20; i++) {
   d:	c7 05 08 10 00 00 00 	movl   $0x0,0x1008
  14:	00 00 00 
{
  17:	89 e5                	mov    %esp,%ebp
  19:	53                   	push   %ebx
  1a:	51                   	push   %ecx
  1b:	90                   	nop
  1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		arr[i] = i;
		printf(1, "arr at i is %d\n", i);
  20:	83 ec 04             	sub    $0x4,%esp
		arr[i] = i;
  23:	89 04 85 00 20 00 00 	mov    %eax,0x2000(,%eax,4)
		printf(1, "arr at i is %d\n", i);
  2a:	50                   	push   %eax
  2b:	68 28 08 00 00       	push   $0x828
  30:	6a 01                	push   $0x1
  32:	e8 99 04 00 00       	call   4d0 <printf>
	for (i = 0; i < 20; i++) {
  37:	a1 08 10 00 00       	mov    0x1008,%eax
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	83 c0 01             	add    $0x1,%eax
  42:	83 f8 13             	cmp    $0x13,%eax
  45:	a3 08 10 00 00       	mov    %eax,0x1008
  4a:	7e d4                	jle    20 <main+0x20>
		
	}
	int tid = 0;
  	int numb = 0;
  	for (i = 0; i < 20; i++) {
  4c:	c7 05 08 10 00 00 00 	movl   $0x0,0x1008
  53:	00 00 00 
  56:	8d 76 00             	lea    0x0(%esi),%esi
  59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		 tid = clone(&somefunc, (void*)stack, (void*)numb);
  60:	83 ec 04             	sub    $0x4,%esp
  63:	6a 00                	push   $0x0
  65:	68 00 30 00 00       	push   $0x3000
  6a:	68 d0 00 00 00       	push   $0xd0
  6f:	e8 7e 03 00 00       	call   3f2 <clone>
		 //printf(1, "tid = %d\n", tid);
		 sleep(100);
  74:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
		 tid = clone(&somefunc, (void*)stack, (void*)numb);
  7b:	89 c3                	mov    %eax,%ebx
		 sleep(100);
  7d:	e8 60 03 00 00       	call   3e2 <sleep>
		 printf(1, "x is at %d\n", someint);
  82:	83 c4 0c             	add    $0xc,%esp
  85:	ff 35 04 10 00 00    	pushl  0x1004
  8b:	68 38 08 00 00       	push   $0x838
  90:	6a 01                	push   $0x1
  92:	e8 39 04 00 00       	call   4d0 <printf>
  	for (i = 0; i < 20; i++) {
  97:	a1 08 10 00 00       	mov    0x1008,%eax
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	83 c0 01             	add    $0x1,%eax
  a2:	83 f8 13             	cmp    $0x13,%eax
  a5:	a3 08 10 00 00       	mov    %eax,0x1008
  aa:	7e b4                	jle    60 <main+0x60>
		 
}
printf(1, "tid = %d\n", tid);
  ac:	83 ec 04             	sub    $0x4,%esp
  af:	53                   	push   %ebx
  b0:	68 44 08 00 00       	push   $0x844
  b5:	6a 01                	push   $0x1
  b7:	e8 14 04 00 00       	call   4d0 <printf>
	  printf(1, "this is the thread process. My pid is %d and my parent's id is %d.\n", getpid(), tid);
  }
  else {
	  printf(1, "this is the parent process. My pid is %d and my parent's id is %d.\n", getpid(), tid);
  }*/ 
  exit();
  bc:	e8 91 02 00 00       	call   352 <exit>
  c1:	66 90                	xchg   %ax,%ax
  c3:	66 90                	xchg   %ax,%ax
  c5:	66 90                	xchg   %ax,%ax
  c7:	66 90                	xchg   %ax,%ax
  c9:	66 90                	xchg   %ax,%ax
  cb:	66 90                	xchg   %ax,%ax
  cd:	66 90                	xchg   %ax,%ax
  cf:	90                   	nop

000000d0 <somefunc>:
 void *somefunc(void *param) {
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	83 ec 08             	sub    $0x8,%esp
	someint += arr[j];
  d6:	a1 00 10 00 00       	mov    0x1000,%eax
  db:	8b 14 85 00 20 00 00 	mov    0x2000(,%eax,4),%edx
	j++;
  e2:	83 c0 01             	add    $0x1,%eax
	someint += arr[j];
  e5:	01 15 04 10 00 00    	add    %edx,0x1004
	j++;
  eb:	a3 00 10 00 00       	mov    %eax,0x1000
	 exit();
  f0:	e8 5d 02 00 00       	call   352 <exit>
  f5:	66 90                	xchg   %ax,%ax
  f7:	66 90                	xchg   %ax,%ax
  f9:	66 90                	xchg   %ax,%ax
  fb:	66 90                	xchg   %ax,%ax
  fd:	66 90                	xchg   %ax,%ax
  ff:	90                   	nop

00000100 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	53                   	push   %ebx
 104:	8b 45 08             	mov    0x8(%ebp),%eax
 107:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 10a:	89 c2                	mov    %eax,%edx
 10c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 110:	83 c1 01             	add    $0x1,%ecx
 113:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 117:	83 c2 01             	add    $0x1,%edx
 11a:	84 db                	test   %bl,%bl
 11c:	88 5a ff             	mov    %bl,-0x1(%edx)
 11f:	75 ef                	jne    110 <strcpy+0x10>
    ;
  return os;
}
 121:	5b                   	pop    %ebx
 122:	5d                   	pop    %ebp
 123:	c3                   	ret    
 124:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 12a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000130 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	53                   	push   %ebx
 134:	8b 55 08             	mov    0x8(%ebp),%edx
 137:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 13a:	0f b6 02             	movzbl (%edx),%eax
 13d:	0f b6 19             	movzbl (%ecx),%ebx
 140:	84 c0                	test   %al,%al
 142:	75 1c                	jne    160 <strcmp+0x30>
 144:	eb 2a                	jmp    170 <strcmp+0x40>
 146:	8d 76 00             	lea    0x0(%esi),%esi
 149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 150:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 153:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 156:	83 c1 01             	add    $0x1,%ecx
 159:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 15c:	84 c0                	test   %al,%al
 15e:	74 10                	je     170 <strcmp+0x40>
 160:	38 d8                	cmp    %bl,%al
 162:	74 ec                	je     150 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 164:	29 d8                	sub    %ebx,%eax
}
 166:	5b                   	pop    %ebx
 167:	5d                   	pop    %ebp
 168:	c3                   	ret    
 169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 170:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 172:	29 d8                	sub    %ebx,%eax
}
 174:	5b                   	pop    %ebx
 175:	5d                   	pop    %ebp
 176:	c3                   	ret    
 177:	89 f6                	mov    %esi,%esi
 179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000180 <strlen>:

uint
strlen(const char *s)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 186:	80 39 00             	cmpb   $0x0,(%ecx)
 189:	74 15                	je     1a0 <strlen+0x20>
 18b:	31 d2                	xor    %edx,%edx
 18d:	8d 76 00             	lea    0x0(%esi),%esi
 190:	83 c2 01             	add    $0x1,%edx
 193:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 197:	89 d0                	mov    %edx,%eax
 199:	75 f5                	jne    190 <strlen+0x10>
    ;
  return n;
}
 19b:	5d                   	pop    %ebp
 19c:	c3                   	ret    
 19d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 1a0:	31 c0                	xor    %eax,%eax
}
 1a2:	5d                   	pop    %ebp
 1a3:	c3                   	ret    
 1a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 1bd:	89 d7                	mov    %edx,%edi
 1bf:	fc                   	cld    
 1c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1c2:	89 d0                	mov    %edx,%eax
 1c4:	5f                   	pop    %edi
 1c5:	5d                   	pop    %ebp
 1c6:	c3                   	ret    
 1c7:	89 f6                	mov    %esi,%esi
 1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001d0 <strchr>:

char*
strchr(const char *s, char c)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	53                   	push   %ebx
 1d4:	8b 45 08             	mov    0x8(%ebp),%eax
 1d7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 1da:	0f b6 10             	movzbl (%eax),%edx
 1dd:	84 d2                	test   %dl,%dl
 1df:	74 1d                	je     1fe <strchr+0x2e>
    if(*s == c)
 1e1:	38 d3                	cmp    %dl,%bl
 1e3:	89 d9                	mov    %ebx,%ecx
 1e5:	75 0d                	jne    1f4 <strchr+0x24>
 1e7:	eb 17                	jmp    200 <strchr+0x30>
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1f0:	38 ca                	cmp    %cl,%dl
 1f2:	74 0c                	je     200 <strchr+0x30>
  for(; *s; s++)
 1f4:	83 c0 01             	add    $0x1,%eax
 1f7:	0f b6 10             	movzbl (%eax),%edx
 1fa:	84 d2                	test   %dl,%dl
 1fc:	75 f2                	jne    1f0 <strchr+0x20>
      return (char*)s;
  return 0;
 1fe:	31 c0                	xor    %eax,%eax
}
 200:	5b                   	pop    %ebx
 201:	5d                   	pop    %ebp
 202:	c3                   	ret    
 203:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000210 <gets>:

char*
gets(char *buf, int max)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	56                   	push   %esi
 215:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 216:	31 f6                	xor    %esi,%esi
 218:	89 f3                	mov    %esi,%ebx
{
 21a:	83 ec 1c             	sub    $0x1c,%esp
 21d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 220:	eb 2f                	jmp    251 <gets+0x41>
 222:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 228:	8d 45 e7             	lea    -0x19(%ebp),%eax
 22b:	83 ec 04             	sub    $0x4,%esp
 22e:	6a 01                	push   $0x1
 230:	50                   	push   %eax
 231:	6a 00                	push   $0x0
 233:	e8 32 01 00 00       	call   36a <read>
    if(cc < 1)
 238:	83 c4 10             	add    $0x10,%esp
 23b:	85 c0                	test   %eax,%eax
 23d:	7e 1c                	jle    25b <gets+0x4b>
      break;
    buf[i++] = c;
 23f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 243:	83 c7 01             	add    $0x1,%edi
 246:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 249:	3c 0a                	cmp    $0xa,%al
 24b:	74 23                	je     270 <gets+0x60>
 24d:	3c 0d                	cmp    $0xd,%al
 24f:	74 1f                	je     270 <gets+0x60>
  for(i=0; i+1 < max; ){
 251:	83 c3 01             	add    $0x1,%ebx
 254:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 257:	89 fe                	mov    %edi,%esi
 259:	7c cd                	jl     228 <gets+0x18>
 25b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 25d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 260:	c6 03 00             	movb   $0x0,(%ebx)
}
 263:	8d 65 f4             	lea    -0xc(%ebp),%esp
 266:	5b                   	pop    %ebx
 267:	5e                   	pop    %esi
 268:	5f                   	pop    %edi
 269:	5d                   	pop    %ebp
 26a:	c3                   	ret    
 26b:	90                   	nop
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 270:	8b 75 08             	mov    0x8(%ebp),%esi
 273:	8b 45 08             	mov    0x8(%ebp),%eax
 276:	01 de                	add    %ebx,%esi
 278:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 27a:	c6 03 00             	movb   $0x0,(%ebx)
}
 27d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 280:	5b                   	pop    %ebx
 281:	5e                   	pop    %esi
 282:	5f                   	pop    %edi
 283:	5d                   	pop    %ebp
 284:	c3                   	ret    
 285:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000290 <stat>:

int
stat(const char *n, struct stat *st)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	56                   	push   %esi
 294:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 295:	83 ec 08             	sub    $0x8,%esp
 298:	6a 00                	push   $0x0
 29a:	ff 75 08             	pushl  0x8(%ebp)
 29d:	e8 f0 00 00 00       	call   392 <open>
  if(fd < 0)
 2a2:	83 c4 10             	add    $0x10,%esp
 2a5:	85 c0                	test   %eax,%eax
 2a7:	78 27                	js     2d0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2a9:	83 ec 08             	sub    $0x8,%esp
 2ac:	ff 75 0c             	pushl  0xc(%ebp)
 2af:	89 c3                	mov    %eax,%ebx
 2b1:	50                   	push   %eax
 2b2:	e8 f3 00 00 00       	call   3aa <fstat>
  close(fd);
 2b7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2ba:	89 c6                	mov    %eax,%esi
  close(fd);
 2bc:	e8 b9 00 00 00       	call   37a <close>
  return r;
 2c1:	83 c4 10             	add    $0x10,%esp
}
 2c4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2c7:	89 f0                	mov    %esi,%eax
 2c9:	5b                   	pop    %ebx
 2ca:	5e                   	pop    %esi
 2cb:	5d                   	pop    %ebp
 2cc:	c3                   	ret    
 2cd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2d0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2d5:	eb ed                	jmp    2c4 <stat+0x34>
 2d7:	89 f6                	mov    %esi,%esi
 2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002e0 <atoi>:

int
atoi(const char *s)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	53                   	push   %ebx
 2e4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2e7:	0f be 11             	movsbl (%ecx),%edx
 2ea:	8d 42 d0             	lea    -0x30(%edx),%eax
 2ed:	3c 09                	cmp    $0x9,%al
  n = 0;
 2ef:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 2f4:	77 1f                	ja     315 <atoi+0x35>
 2f6:	8d 76 00             	lea    0x0(%esi),%esi
 2f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 300:	8d 04 80             	lea    (%eax,%eax,4),%eax
 303:	83 c1 01             	add    $0x1,%ecx
 306:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 30a:	0f be 11             	movsbl (%ecx),%edx
 30d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 310:	80 fb 09             	cmp    $0x9,%bl
 313:	76 eb                	jbe    300 <atoi+0x20>
  return n;
}
 315:	5b                   	pop    %ebx
 316:	5d                   	pop    %ebp
 317:	c3                   	ret    
 318:	90                   	nop
 319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000320 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	56                   	push   %esi
 324:	53                   	push   %ebx
 325:	8b 5d 10             	mov    0x10(%ebp),%ebx
 328:	8b 45 08             	mov    0x8(%ebp),%eax
 32b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 32e:	85 db                	test   %ebx,%ebx
 330:	7e 14                	jle    346 <memmove+0x26>
 332:	31 d2                	xor    %edx,%edx
 334:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 338:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 33c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 33f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 342:	39 d3                	cmp    %edx,%ebx
 344:	75 f2                	jne    338 <memmove+0x18>
  return vdst;
}
 346:	5b                   	pop    %ebx
 347:	5e                   	pop    %esi
 348:	5d                   	pop    %ebp
 349:	c3                   	ret    

0000034a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 34a:	b8 01 00 00 00       	mov    $0x1,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <exit>:
SYSCALL(exit)
 352:	b8 02 00 00 00       	mov    $0x2,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <wait>:
SYSCALL(wait)
 35a:	b8 03 00 00 00       	mov    $0x3,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <pipe>:
SYSCALL(pipe)
 362:	b8 04 00 00 00       	mov    $0x4,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <read>:
SYSCALL(read)
 36a:	b8 05 00 00 00       	mov    $0x5,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <write>:
SYSCALL(write)
 372:	b8 10 00 00 00       	mov    $0x10,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <close>:
SYSCALL(close)
 37a:	b8 15 00 00 00       	mov    $0x15,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <kill>:
SYSCALL(kill)
 382:	b8 06 00 00 00       	mov    $0x6,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <exec>:
SYSCALL(exec)
 38a:	b8 07 00 00 00       	mov    $0x7,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <open>:
SYSCALL(open)
 392:	b8 0f 00 00 00       	mov    $0xf,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <mknod>:
SYSCALL(mknod)
 39a:	b8 11 00 00 00       	mov    $0x11,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <unlink>:
SYSCALL(unlink)
 3a2:	b8 12 00 00 00       	mov    $0x12,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <fstat>:
SYSCALL(fstat)
 3aa:	b8 08 00 00 00       	mov    $0x8,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <link>:
SYSCALL(link)
 3b2:	b8 13 00 00 00       	mov    $0x13,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <mkdir>:
SYSCALL(mkdir)
 3ba:	b8 14 00 00 00       	mov    $0x14,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <chdir>:
SYSCALL(chdir)
 3c2:	b8 09 00 00 00       	mov    $0x9,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <dup>:
SYSCALL(dup)
 3ca:	b8 0a 00 00 00       	mov    $0xa,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <getpid>:
SYSCALL(getpid)
 3d2:	b8 0b 00 00 00       	mov    $0xb,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <sbrk>:
SYSCALL(sbrk)
 3da:	b8 0c 00 00 00       	mov    $0xc,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <sleep>:
SYSCALL(sleep)
 3e2:	b8 0d 00 00 00       	mov    $0xd,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <uptime>:
SYSCALL(uptime)
 3ea:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <clone>:
SYSCALL(clone)
 3f2:	b8 16 00 00 00       	mov    $0x16,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <join>:
SYSCALL(join) 
 3fa:	b8 17 00 00 00       	mov    $0x17,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <semaphore_init>:
SYSCALL(semaphore_init)
 402:	b8 18 00 00 00       	mov    $0x18,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <semaphore_wait>:
SYSCALL(semaphore_wait)
 40a:	b8 19 00 00 00       	mov    $0x19,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <semaphore_signal>:
SYSCALL(semaphore_signal)
 412:	b8 1a 00 00 00       	mov    $0x1a,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <semaphore_close>:
SYSCALL(semaphore_close)
 41a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    
 422:	66 90                	xchg   %ax,%ax
 424:	66 90                	xchg   %ax,%ax
 426:	66 90                	xchg   %ax,%ax
 428:	66 90                	xchg   %ax,%ax
 42a:	66 90                	xchg   %ax,%ax
 42c:	66 90                	xchg   %ax,%ax
 42e:	66 90                	xchg   %ax,%ax

00000430 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	56                   	push   %esi
 435:	53                   	push   %ebx
 436:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 439:	85 d2                	test   %edx,%edx
{
 43b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 43e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 440:	79 76                	jns    4b8 <printint+0x88>
 442:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 446:	74 70                	je     4b8 <printint+0x88>
    x = -xx;
 448:	f7 d8                	neg    %eax
    neg = 1;
 44a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 451:	31 f6                	xor    %esi,%esi
 453:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 456:	eb 0a                	jmp    462 <printint+0x32>
 458:	90                   	nop
 459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 460:	89 fe                	mov    %edi,%esi
 462:	31 d2                	xor    %edx,%edx
 464:	8d 7e 01             	lea    0x1(%esi),%edi
 467:	f7 f1                	div    %ecx
 469:	0f b6 92 58 08 00 00 	movzbl 0x858(%edx),%edx
  }while((x /= base) != 0);
 470:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 472:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 475:	75 e9                	jne    460 <printint+0x30>
  if(neg)
 477:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 47a:	85 c0                	test   %eax,%eax
 47c:	74 08                	je     486 <printint+0x56>
    buf[i++] = '-';
 47e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 483:	8d 7e 02             	lea    0x2(%esi),%edi
 486:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 48a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 48d:	8d 76 00             	lea    0x0(%esi),%esi
 490:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 493:	83 ec 04             	sub    $0x4,%esp
 496:	83 ee 01             	sub    $0x1,%esi
 499:	6a 01                	push   $0x1
 49b:	53                   	push   %ebx
 49c:	57                   	push   %edi
 49d:	88 45 d7             	mov    %al,-0x29(%ebp)
 4a0:	e8 cd fe ff ff       	call   372 <write>

  while(--i >= 0)
 4a5:	83 c4 10             	add    $0x10,%esp
 4a8:	39 de                	cmp    %ebx,%esi
 4aa:	75 e4                	jne    490 <printint+0x60>
    putc(fd, buf[i]);
}
 4ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4af:	5b                   	pop    %ebx
 4b0:	5e                   	pop    %esi
 4b1:	5f                   	pop    %edi
 4b2:	5d                   	pop    %ebp
 4b3:	c3                   	ret    
 4b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4b8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 4bf:	eb 90                	jmp    451 <printint+0x21>
 4c1:	eb 0d                	jmp    4d0 <printf>
 4c3:	90                   	nop
 4c4:	90                   	nop
 4c5:	90                   	nop
 4c6:	90                   	nop
 4c7:	90                   	nop
 4c8:	90                   	nop
 4c9:	90                   	nop
 4ca:	90                   	nop
 4cb:	90                   	nop
 4cc:	90                   	nop
 4cd:	90                   	nop
 4ce:	90                   	nop
 4cf:	90                   	nop

000004d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	57                   	push   %edi
 4d4:	56                   	push   %esi
 4d5:	53                   	push   %ebx
 4d6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4d9:	8b 75 0c             	mov    0xc(%ebp),%esi
 4dc:	0f b6 1e             	movzbl (%esi),%ebx
 4df:	84 db                	test   %bl,%bl
 4e1:	0f 84 b3 00 00 00    	je     59a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 4e7:	8d 45 10             	lea    0x10(%ebp),%eax
 4ea:	83 c6 01             	add    $0x1,%esi
  state = 0;
 4ed:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 4ef:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4f2:	eb 2f                	jmp    523 <printf+0x53>
 4f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4f8:	83 f8 25             	cmp    $0x25,%eax
 4fb:	0f 84 a7 00 00 00    	je     5a8 <printf+0xd8>
  write(fd, &c, 1);
 501:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 504:	83 ec 04             	sub    $0x4,%esp
 507:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 50a:	6a 01                	push   $0x1
 50c:	50                   	push   %eax
 50d:	ff 75 08             	pushl  0x8(%ebp)
 510:	e8 5d fe ff ff       	call   372 <write>
 515:	83 c4 10             	add    $0x10,%esp
 518:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 51b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 51f:	84 db                	test   %bl,%bl
 521:	74 77                	je     59a <printf+0xca>
    if(state == 0){
 523:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 525:	0f be cb             	movsbl %bl,%ecx
 528:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 52b:	74 cb                	je     4f8 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 52d:	83 ff 25             	cmp    $0x25,%edi
 530:	75 e6                	jne    518 <printf+0x48>
      if(c == 'd'){
 532:	83 f8 64             	cmp    $0x64,%eax
 535:	0f 84 05 01 00 00    	je     640 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 53b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 541:	83 f9 70             	cmp    $0x70,%ecx
 544:	74 72                	je     5b8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 546:	83 f8 73             	cmp    $0x73,%eax
 549:	0f 84 99 00 00 00    	je     5e8 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 54f:	83 f8 63             	cmp    $0x63,%eax
 552:	0f 84 08 01 00 00    	je     660 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 558:	83 f8 25             	cmp    $0x25,%eax
 55b:	0f 84 ef 00 00 00    	je     650 <printf+0x180>
  write(fd, &c, 1);
 561:	8d 45 e7             	lea    -0x19(%ebp),%eax
 564:	83 ec 04             	sub    $0x4,%esp
 567:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 56b:	6a 01                	push   $0x1
 56d:	50                   	push   %eax
 56e:	ff 75 08             	pushl  0x8(%ebp)
 571:	e8 fc fd ff ff       	call   372 <write>
 576:	83 c4 0c             	add    $0xc,%esp
 579:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 57c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 57f:	6a 01                	push   $0x1
 581:	50                   	push   %eax
 582:	ff 75 08             	pushl  0x8(%ebp)
 585:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 588:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 58a:	e8 e3 fd ff ff       	call   372 <write>
  for(i = 0; fmt[i]; i++){
 58f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 593:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 596:	84 db                	test   %bl,%bl
 598:	75 89                	jne    523 <printf+0x53>
    }
  }
}
 59a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 59d:	5b                   	pop    %ebx
 59e:	5e                   	pop    %esi
 59f:	5f                   	pop    %edi
 5a0:	5d                   	pop    %ebp
 5a1:	c3                   	ret    
 5a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 5a8:	bf 25 00 00 00       	mov    $0x25,%edi
 5ad:	e9 66 ff ff ff       	jmp    518 <printf+0x48>
 5b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 5b8:	83 ec 0c             	sub    $0xc,%esp
 5bb:	b9 10 00 00 00       	mov    $0x10,%ecx
 5c0:	6a 00                	push   $0x0
 5c2:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 5c5:	8b 45 08             	mov    0x8(%ebp),%eax
 5c8:	8b 17                	mov    (%edi),%edx
 5ca:	e8 61 fe ff ff       	call   430 <printint>
        ap++;
 5cf:	89 f8                	mov    %edi,%eax
 5d1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5d4:	31 ff                	xor    %edi,%edi
        ap++;
 5d6:	83 c0 04             	add    $0x4,%eax
 5d9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 5dc:	e9 37 ff ff ff       	jmp    518 <printf+0x48>
 5e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 5e8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5eb:	8b 08                	mov    (%eax),%ecx
        ap++;
 5ed:	83 c0 04             	add    $0x4,%eax
 5f0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 5f3:	85 c9                	test   %ecx,%ecx
 5f5:	0f 84 8e 00 00 00    	je     689 <printf+0x1b9>
        while(*s != 0){
 5fb:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 5fe:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 600:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 602:	84 c0                	test   %al,%al
 604:	0f 84 0e ff ff ff    	je     518 <printf+0x48>
 60a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 60d:	89 de                	mov    %ebx,%esi
 60f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 612:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 615:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 618:	83 ec 04             	sub    $0x4,%esp
          s++;
 61b:	83 c6 01             	add    $0x1,%esi
 61e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 621:	6a 01                	push   $0x1
 623:	57                   	push   %edi
 624:	53                   	push   %ebx
 625:	e8 48 fd ff ff       	call   372 <write>
        while(*s != 0){
 62a:	0f b6 06             	movzbl (%esi),%eax
 62d:	83 c4 10             	add    $0x10,%esp
 630:	84 c0                	test   %al,%al
 632:	75 e4                	jne    618 <printf+0x148>
 634:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 637:	31 ff                	xor    %edi,%edi
 639:	e9 da fe ff ff       	jmp    518 <printf+0x48>
 63e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 640:	83 ec 0c             	sub    $0xc,%esp
 643:	b9 0a 00 00 00       	mov    $0xa,%ecx
 648:	6a 01                	push   $0x1
 64a:	e9 73 ff ff ff       	jmp    5c2 <printf+0xf2>
 64f:	90                   	nop
  write(fd, &c, 1);
 650:	83 ec 04             	sub    $0x4,%esp
 653:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 656:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 659:	6a 01                	push   $0x1
 65b:	e9 21 ff ff ff       	jmp    581 <printf+0xb1>
        putc(fd, *ap);
 660:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 663:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 666:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 668:	6a 01                	push   $0x1
        ap++;
 66a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 66d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 670:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 673:	50                   	push   %eax
 674:	ff 75 08             	pushl  0x8(%ebp)
 677:	e8 f6 fc ff ff       	call   372 <write>
        ap++;
 67c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 67f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 682:	31 ff                	xor    %edi,%edi
 684:	e9 8f fe ff ff       	jmp    518 <printf+0x48>
          s = "(null)";
 689:	bb 4e 08 00 00       	mov    $0x84e,%ebx
        while(*s != 0){
 68e:	b8 28 00 00 00       	mov    $0x28,%eax
 693:	e9 72 ff ff ff       	jmp    60a <printf+0x13a>
 698:	66 90                	xchg   %ax,%ax
 69a:	66 90                	xchg   %ax,%ax
 69c:	66 90                	xchg   %ax,%ax
 69e:	66 90                	xchg   %ax,%ax

000006a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6a1:	a1 0c 10 00 00       	mov    0x100c,%eax
{
 6a6:	89 e5                	mov    %esp,%ebp
 6a8:	57                   	push   %edi
 6a9:	56                   	push   %esi
 6aa:	53                   	push   %ebx
 6ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 6b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b8:	39 c8                	cmp    %ecx,%eax
 6ba:	8b 10                	mov    (%eax),%edx
 6bc:	73 32                	jae    6f0 <free+0x50>
 6be:	39 d1                	cmp    %edx,%ecx
 6c0:	72 04                	jb     6c6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6c2:	39 d0                	cmp    %edx,%eax
 6c4:	72 32                	jb     6f8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6c6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6c9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6cc:	39 fa                	cmp    %edi,%edx
 6ce:	74 30                	je     700 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6d0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6d3:	8b 50 04             	mov    0x4(%eax),%edx
 6d6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6d9:	39 f1                	cmp    %esi,%ecx
 6db:	74 3a                	je     717 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6dd:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6df:	a3 0c 10 00 00       	mov    %eax,0x100c
}
 6e4:	5b                   	pop    %ebx
 6e5:	5e                   	pop    %esi
 6e6:	5f                   	pop    %edi
 6e7:	5d                   	pop    %ebp
 6e8:	c3                   	ret    
 6e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6f0:	39 d0                	cmp    %edx,%eax
 6f2:	72 04                	jb     6f8 <free+0x58>
 6f4:	39 d1                	cmp    %edx,%ecx
 6f6:	72 ce                	jb     6c6 <free+0x26>
{
 6f8:	89 d0                	mov    %edx,%eax
 6fa:	eb bc                	jmp    6b8 <free+0x18>
 6fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 700:	03 72 04             	add    0x4(%edx),%esi
 703:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 706:	8b 10                	mov    (%eax),%edx
 708:	8b 12                	mov    (%edx),%edx
 70a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 70d:	8b 50 04             	mov    0x4(%eax),%edx
 710:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 713:	39 f1                	cmp    %esi,%ecx
 715:	75 c6                	jne    6dd <free+0x3d>
    p->s.size += bp->s.size;
 717:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 71a:	a3 0c 10 00 00       	mov    %eax,0x100c
    p->s.size += bp->s.size;
 71f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 722:	8b 53 f8             	mov    -0x8(%ebx),%edx
 725:	89 10                	mov    %edx,(%eax)
}
 727:	5b                   	pop    %ebx
 728:	5e                   	pop    %esi
 729:	5f                   	pop    %edi
 72a:	5d                   	pop    %ebp
 72b:	c3                   	ret    
 72c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000730 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	57                   	push   %edi
 734:	56                   	push   %esi
 735:	53                   	push   %ebx
 736:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 739:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 73c:	8b 15 0c 10 00 00    	mov    0x100c,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 742:	8d 78 07             	lea    0x7(%eax),%edi
 745:	c1 ef 03             	shr    $0x3,%edi
 748:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 74b:	85 d2                	test   %edx,%edx
 74d:	0f 84 9d 00 00 00    	je     7f0 <malloc+0xc0>
 753:	8b 02                	mov    (%edx),%eax
 755:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 758:	39 cf                	cmp    %ecx,%edi
 75a:	76 6c                	jbe    7c8 <malloc+0x98>
 75c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 762:	bb 00 10 00 00       	mov    $0x1000,%ebx
 767:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 76a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 771:	eb 0e                	jmp    781 <malloc+0x51>
 773:	90                   	nop
 774:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 778:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 77a:	8b 48 04             	mov    0x4(%eax),%ecx
 77d:	39 f9                	cmp    %edi,%ecx
 77f:	73 47                	jae    7c8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 781:	39 05 0c 10 00 00    	cmp    %eax,0x100c
 787:	89 c2                	mov    %eax,%edx
 789:	75 ed                	jne    778 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 78b:	83 ec 0c             	sub    $0xc,%esp
 78e:	56                   	push   %esi
 78f:	e8 46 fc ff ff       	call   3da <sbrk>
  if(p == (char*)-1)
 794:	83 c4 10             	add    $0x10,%esp
 797:	83 f8 ff             	cmp    $0xffffffff,%eax
 79a:	74 1c                	je     7b8 <malloc+0x88>
  hp->s.size = nu;
 79c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 79f:	83 ec 0c             	sub    $0xc,%esp
 7a2:	83 c0 08             	add    $0x8,%eax
 7a5:	50                   	push   %eax
 7a6:	e8 f5 fe ff ff       	call   6a0 <free>
  return freep;
 7ab:	8b 15 0c 10 00 00    	mov    0x100c,%edx
      if((p = morecore(nunits)) == 0)
 7b1:	83 c4 10             	add    $0x10,%esp
 7b4:	85 d2                	test   %edx,%edx
 7b6:	75 c0                	jne    778 <malloc+0x48>
        return 0;
  }
}
 7b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 7bb:	31 c0                	xor    %eax,%eax
}
 7bd:	5b                   	pop    %ebx
 7be:	5e                   	pop    %esi
 7bf:	5f                   	pop    %edi
 7c0:	5d                   	pop    %ebp
 7c1:	c3                   	ret    
 7c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 7c8:	39 cf                	cmp    %ecx,%edi
 7ca:	74 54                	je     820 <malloc+0xf0>
        p->s.size -= nunits;
 7cc:	29 f9                	sub    %edi,%ecx
 7ce:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 7d1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 7d4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 7d7:	89 15 0c 10 00 00    	mov    %edx,0x100c
}
 7dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 7e0:	83 c0 08             	add    $0x8,%eax
}
 7e3:	5b                   	pop    %ebx
 7e4:	5e                   	pop    %esi
 7e5:	5f                   	pop    %edi
 7e6:	5d                   	pop    %ebp
 7e7:	c3                   	ret    
 7e8:	90                   	nop
 7e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 7f0:	c7 05 0c 10 00 00 10 	movl   $0x1010,0x100c
 7f7:	10 00 00 
 7fa:	c7 05 10 10 00 00 10 	movl   $0x1010,0x1010
 801:	10 00 00 
    base.s.size = 0;
 804:	b8 10 10 00 00       	mov    $0x1010,%eax
 809:	c7 05 14 10 00 00 00 	movl   $0x0,0x1014
 810:	00 00 00 
 813:	e9 44 ff ff ff       	jmp    75c <malloc+0x2c>
 818:	90                   	nop
 819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 820:	8b 08                	mov    (%eax),%ecx
 822:	89 0a                	mov    %ecx,(%edx)
 824:	eb b1                	jmp    7d7 <malloc+0xa7>

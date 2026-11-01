
build/app.elf:     file format elf32-littleriscv


Disassembly of section .init:

f9000000 <_start>:

_start:
#ifdef USE_GP
.option push
.option norelax
	la gp, __global_pointer$
f9000000:	00005197          	auipc	gp,0x5
f9000004:	75818193          	addi	gp,gp,1880 # f9005758 <__global_pointer$>

f9000008 <init>:
	sw a0, smp_lottery_lock, a1
    ret
#endif

init:
	la sp, _sp
f9000008:	00006117          	auipc	sp,0x6
f900000c:	fd810113          	addi	sp,sp,-40 # f9005fe0 <__freertos_irq_stack_top>

	/* Load data section */
	la a0, _data_lma
f9000010:	00004517          	auipc	a0,0x4
f9000014:	6a050513          	addi	a0,a0,1696 # f90046b0 <_data>
	la a1, _data
f9000018:	00004597          	auipc	a1,0x4
f900001c:	69858593          	addi	a1,a1,1688 # f90046b0 <_data>
	la a2, _edata
f9000020:	00005617          	auipc	a2,0x5
f9000024:	f8060613          	addi	a2,a2,-128 # f9004fa0 <input.1>
	bgeu a1, a2, 2f
f9000028:	00c5fc63          	bgeu	a1,a2,f9000040 <init+0x38>
1:
	lw t0, (a0)
f900002c:	00052283          	lw	t0,0(a0)
	sw t0, (a1)
f9000030:	0055a023          	sw	t0,0(a1)
	addi a0, a0, 4
f9000034:	00450513          	addi	a0,a0,4
	addi a1, a1, 4
f9000038:	00458593          	addi	a1,a1,4
	bltu a1, a2, 1b
f900003c:	fec5e8e3          	bltu	a1,a2,f900002c <init+0x24>
2:

	/* Clear bss section */
	la a0, __bss_start
f9000040:	00005517          	auipc	a0,0x5
f9000044:	f6050513          	addi	a0,a0,-160 # f9004fa0 <input.1>
	la a1, _end
f9000048:	00005597          	auipc	a1,0x5
f900004c:	f9858593          	addi	a1,a1,-104 # f9004fe0 <_end>
	bgeu a0, a1, 2f
f9000050:	00b57863          	bgeu	a0,a1,f9000060 <init+0x58>
1:
	sw zero, (a0)
f9000054:	00052023          	sw	zero,0(a0)
	addi a0, a0, 4
f9000058:	00450513          	addi	a0,a0,4
	bltu a0, a1, 1b
f900005c:	feb56ce3          	bltu	a0,a1,f9000054 <init+0x4c>
2:

#ifndef NO_LIBC_INIT_ARRAY
	call __libc_init_array
f9000060:	010000ef          	jal	f9000070 <__libc_init_array>
#endif

	call main
f9000064:	0a0000ef          	jal	f9000104 <main>

f9000068 <mainDone>:
mainDone:
    j mainDone
f9000068:	0000006f          	j	f9000068 <mainDone>

f900006c <_init>:


	.globl _init
_init:
    ret
f900006c:	00008067          	ret

Disassembly of section .text:

f9000070 <__libc_init_array>:
f9000070:	ff010113          	addi	sp,sp,-16
f9000074:	00812423          	sw	s0,8(sp)
f9000078:	01212023          	sw	s2,0(sp)
f900007c:	00004797          	auipc	a5,0x4
f9000080:	63478793          	addi	a5,a5,1588 # f90046b0 <_data>
f9000084:	00004417          	auipc	s0,0x4
f9000088:	62c40413          	addi	s0,s0,1580 # f90046b0 <_data>
f900008c:	00112623          	sw	ra,12(sp)
f9000090:	00912223          	sw	s1,4(sp)
f9000094:	40878933          	sub	s2,a5,s0
f9000098:	02878063          	beq	a5,s0,f90000b8 <__libc_init_array+0x48>
f900009c:	40295913          	srai	s2,s2,0x2
f90000a0:	00000493          	li	s1,0
f90000a4:	00042783          	lw	a5,0(s0)
f90000a8:	00148493          	addi	s1,s1,1
f90000ac:	00440413          	addi	s0,s0,4
f90000b0:	000780e7          	jalr	a5
f90000b4:	ff24e8e3          	bltu	s1,s2,f90000a4 <__libc_init_array+0x34>
f90000b8:	00004797          	auipc	a5,0x4
f90000bc:	5f878793          	addi	a5,a5,1528 # f90046b0 <_data>
f90000c0:	00004417          	auipc	s0,0x4
f90000c4:	5f040413          	addi	s0,s0,1520 # f90046b0 <_data>
f90000c8:	40878933          	sub	s2,a5,s0
f90000cc:	40295913          	srai	s2,s2,0x2
f90000d0:	00878e63          	beq	a5,s0,f90000ec <__libc_init_array+0x7c>
f90000d4:	00000493          	li	s1,0
f90000d8:	00042783          	lw	a5,0(s0)
f90000dc:	00148493          	addi	s1,s1,1
f90000e0:	00440413          	addi	s0,s0,4
f90000e4:	000780e7          	jalr	a5
f90000e8:	ff24e8e3          	bltu	s1,s2,f90000d8 <__libc_init_array+0x68>
f90000ec:	00c12083          	lw	ra,12(sp)
f90000f0:	00812403          	lw	s0,8(sp)
f90000f4:	00412483          	lw	s1,4(sp)
f90000f8:	00012903          	lw	s2,0(sp)
f90000fc:	01010113          	addi	sp,sp,16
f9000100:	00008067          	ret

f9000104 <main>:
    }
}


//////////////////////////////////////////////////////////////////////////////6//
void main() {
f9000104:	ff010113          	addi	sp,sp,-16
f9000108:	00112623          	sw	ra,12(sp)
f900010c:	00812423          	sw	s0,8(sp)
f9000110:	00912223          	sw	s1,4(sp)
    u32 speed;
    bsp_init();
f9000114:	584010ef          	jal	f9001698 <bsp_init>
    bsp_printf("\n");
f9000118:	f9005437          	lui	s0,0xf9005
f900011c:	9dc40513          	addi	a0,s0,-1572 # f90049dc <_data+0x32c>
f9000120:	65c010ef          	jal	f900177c <bsp_printf>
    bsp_printf("******************************************\r\n");
f9000124:	f90054b7          	lui	s1,0xf9005
f9000128:	9e048513          	addi	a0,s1,-1568 # f90049e0 <_data+0x330>
f900012c:	650010ef          	jal	f900177c <bsp_printf>
    bsp_printf("Video Streaming Platform SMT135-C 10G SFP+\r\n");
f9000130:	f9005537          	lui	a0,0xf9005
f9000134:	a1050513          	addi	a0,a0,-1520 # f9004a10 <_data+0x360>
f9000138:	644010ef          	jal	f900177c <bsp_printf>
    bsp_printf("******************************************\r\n");
f900013c:	9e048513          	addi	a0,s1,-1568
f9000140:	63c010ef          	jal	f900177c <bsp_printf>
    bsp_printf("\n");
f9000144:	9dc40513          	addi	a0,s0,-1572
f9000148:	634010ef          	jal	f900177c <bsp_printf>
	init();
f900014c:	275010ef          	jal	f9001bc0 <init>
//	set_video_startup();
    bsp_uDelay(1000*1000);
f9000150:	f8b00637          	lui	a2,0xf8b00
f9000154:	05f5e5b7          	lui	a1,0x5f5e
f9000158:	10058593          	addi	a1,a1,256 # 5f5e100 <__stack_size+0x5f5d100>
f900015c:	000f4537          	lui	a0,0xf4
f9000160:	24050513          	addi	a0,a0,576 # f4240 <__stack_size+0xf3240>
f9000164:	2d0010ef          	jal	f9001434 <clint_uDelay>
    print_menu();
f9000168:	2bd010ef          	jal	f9001c24 <print_menu>
f900016c:	0080006f          	j	f9000174 <main+0x70>
    while(1) {
        while (uart_readOccupancy(BSP_UART_TERMINAL))
        {
            console_main();
f9000170:	399010ef          	jal	f9001d08 <console_main>
        while (uart_readOccupancy(BSP_UART_TERMINAL))
f9000174:	f8010537          	lui	a0,0xf8010
f9000178:	210010ef          	jal	f9001388 <uart_readOccupancy>
f900017c:	fe051ae3          	bnez	a0,f9000170 <main+0x6c>
        }
        bsp_uDelay(10*1000);
f9000180:	f8b00637          	lui	a2,0xf8b00
f9000184:	05f5e5b7          	lui	a1,0x5f5e
f9000188:	10058593          	addi	a1,a1,256 # 5f5e100 <__stack_size+0x5f5d100>
f900018c:	00002537          	lui	a0,0x2
f9000190:	71050513          	addi	a0,a0,1808 # 2710 <__stack_size+0x1710>
f9000194:	2a0010ef          	jal	f9001434 <clint_uDelay>
        while (uart_readOccupancy(BSP_UART_TERMINAL))
f9000198:	fddff06f          	j	f9000174 <main+0x70>

f900019c <uart_writeAvailability>:
#include "type.h"
#include "soc.h"


    static inline u32 read_u32(u32 address){
        return *((volatile u32*) address);
f900019c:	00452503          	lw	a0,4(a0)
*          of available spaces for writing data from bits 23 to 16. It then
*          returns this value after masking with 0xFF.
*
******************************************************************************/
    static u32 uart_writeAvailability(u32 reg){
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
f90001a0:	01055513          	srli	a0,a0,0x10
    }
f90001a4:	0ff57513          	zext.b	a0,a0
f90001a8:	00008067          	ret

f90001ac <uart_write>:
* @note    The function waits until there is available space in the UART buffer
*          for writing data. Once space is available, it writes the character
*          data to the UART data register.
*
******************************************************************************/
    static void uart_write(u32 reg, char data){
f90001ac:	ff010113          	addi	sp,sp,-16
f90001b0:	00112623          	sw	ra,12(sp)
f90001b4:	00812423          	sw	s0,8(sp)
f90001b8:	00912223          	sw	s1,4(sp)
f90001bc:	00050413          	mv	s0,a0
f90001c0:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
f90001c4:	00040513          	mv	a0,s0
f90001c8:	fd5ff0ef          	jal	f900019c <uart_writeAvailability>
f90001cc:	fe050ce3          	beqz	a0,f90001c4 <uart_write+0x18>
    }
    
    static inline void write_u32(u32 data, u32 address){
        *((volatile u32*) address) = data;
f90001d0:	00942023          	sw	s1,0(s0)
        write_u32(data, reg + UART_DATA);
    }
f90001d4:	00c12083          	lw	ra,12(sp)
f90001d8:	00812403          	lw	s0,8(sp)
f90001dc:	00412483          	lw	s1,4(sp)
f90001e0:	01010113          	addi	sp,sp,16
f90001e4:	00008067          	ret

f90001e8 <clint_uDelay>:
*          and the time limit is non-negative, indicating that the delay has
*          not yet elapsed.
*
******************************************************************************/
    static void clint_uDelay(u32 usec, u32 hz, u32 reg){
        u32 mTimePerUsec = hz/1000000;
f90001e8:	000f47b7          	lui	a5,0xf4
f90001ec:	24078793          	addi	a5,a5,576 # f4240 <__stack_size+0xf3240>
f90001f0:	02f5d5b3          	divu	a1,a1,a5
    readReg_u32 (clint_getTimeLow , CLINT_TIME_ADDR)
f90001f4:	0000c7b7          	lui	a5,0xc
f90001f8:	ff878793          	addi	a5,a5,-8 # bff8 <__stack_size+0xaff8>
f90001fc:	00f60633          	add	a2,a2,a5
        return *((volatile u32*) address);
f9000200:	00062783          	lw	a5,0(a2) # f8b00000 <__stack_size+0xf8aff000>
        u32 limit = clint_getTimeLow(reg) + usec*mTimePerUsec;
f9000204:	02a585b3          	mul	a1,a1,a0
f9000208:	00f58733          	add	a4,a1,a5
f900020c:	00062783          	lw	a5,0(a2)
        while((int32_t)(limit-(clint_getTimeLow(reg))) >= 0);
f9000210:	40f707b3          	sub	a5,a4,a5
f9000214:	fe07dce3          	bgez	a5,f900020c <clint_uDelay+0x24>
f9000218:	00008067          	ret

f900021c <_putchar>:
#include <math.h>
#include <string.h>
#include "bsp.h"

#if (ENABLE_BSP_PRINTF)
    static void _putchar(char character){
f900021c:	ff010113          	addi	sp,sp,-16
f9000220:	00112623          	sw	ra,12(sp)
f9000224:	00050593          	mv	a1,a0
        #if (ENABLE_SEMIHOSTING_PRINT == 1)
            sh_writec(character);
        #else
            bsp_putChar(character);
f9000228:	f8010537          	lui	a0,0xf8010
f900022c:	f81ff0ef          	jal	f90001ac <uart_write>
        #endif // (ENABLE_SEMIHOSTING_PRINT == 1)
    }
f9000230:	00c12083          	lw	ra,12(sp)
f9000234:	01010113          	addi	sp,sp,16
f9000238:	00008067          	ret

f900023c <_putchar_s>:

    static void _putchar_s(char *p)
    {
f900023c:	ff010113          	addi	sp,sp,-16
f9000240:	00112623          	sw	ra,12(sp)
f9000244:	00812423          	sw	s0,8(sp)
f9000248:	00050413          	mv	s0,a0
    #if (ENABLE_SEMIHOSTING_PRINT == 1)
        sh_write0(p);
    #else
        while (*p)
f900024c:	00c0006f          	j	f9000258 <_putchar_s+0x1c>
            _putchar(*(p++));
f9000250:	00140413          	addi	s0,s0,1
f9000254:	fc9ff0ef          	jal	f900021c <_putchar>
        while (*p)
f9000258:	00044503          	lbu	a0,0(s0)
f900025c:	fe051ae3          	bnez	a0,f9000250 <_putchar_s+0x14>
    #endif // (ENABLE_SEMIHOSTING_PRINT == 1)
    }
f9000260:	00c12083          	lw	ra,12(sp)
f9000264:	00812403          	lw	s0,8(sp)
f9000268:	01010113          	addi	sp,sp,16
f900026c:	00008067          	ret

f9000270 <bsp_printHex>:

        static void bsp_printHex(uint32_t val)
    {
f9000270:	ff010113          	addi	sp,sp,-16
f9000274:	00112623          	sw	ra,12(sp)
f9000278:	00812423          	sw	s0,8(sp)
f900027c:	00912223          	sw	s1,4(sp)
f9000280:	00050493          	mv	s1,a0
        uint32_t digits;
        digits =8;

        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9000284:	01c00413          	li	s0,28
f9000288:	0240006f          	j	f90002ac <bsp_printHex+0x3c>
            _putchar("0123456789ABCDEF"[(val >> i) % 16]);
f900028c:	0084d733          	srl	a4,s1,s0
f9000290:	00f77713          	andi	a4,a4,15
f9000294:	f90047b7          	lui	a5,0xf9004
f9000298:	6b078793          	addi	a5,a5,1712 # f90046b0 <_data>
f900029c:	00e787b3          	add	a5,a5,a4
f90002a0:	0007c503          	lbu	a0,0(a5)
f90002a4:	f79ff0ef          	jal	f900021c <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f90002a8:	ffc40413          	addi	s0,s0,-4
f90002ac:	fe0450e3          	bgez	s0,f900028c <bsp_printHex+0x1c>
        }
    }
f90002b0:	00c12083          	lw	ra,12(sp)
f90002b4:	00812403          	lw	s0,8(sp)
f90002b8:	00412483          	lw	s1,4(sp)
f90002bc:	01010113          	addi	sp,sp,16
f90002c0:	00008067          	ret

f90002c4 <bsp_printHex_lower>:

    static void bsp_printHex_lower(uint32_t val)
    {
f90002c4:	ff010113          	addi	sp,sp,-16
f90002c8:	00112623          	sw	ra,12(sp)
f90002cc:	00812423          	sw	s0,8(sp)
f90002d0:	00912223          	sw	s1,4(sp)
f90002d4:	00050493          	mv	s1,a0
        uint32_t digits;
        digits =8;

        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f90002d8:	01c00413          	li	s0,28
f90002dc:	0240006f          	j	f9000300 <bsp_printHex_lower+0x3c>
            _putchar("0123456789abcdef"[(val >> i) % 16]);
f90002e0:	0084d733          	srl	a4,s1,s0
f90002e4:	00f77713          	andi	a4,a4,15
f90002e8:	f90047b7          	lui	a5,0xf9004
f90002ec:	6c478793          	addi	a5,a5,1732 # f90046c4 <_data+0x14>
f90002f0:	00e787b3          	add	a5,a5,a4
f90002f4:	0007c503          	lbu	a0,0(a5)
f90002f8:	f25ff0ef          	jal	f900021c <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f90002fc:	ffc40413          	addi	s0,s0,-4
f9000300:	fe0450e3          	bgez	s0,f90002e0 <bsp_printHex_lower+0x1c>

        }
    }
f9000304:	00c12083          	lw	ra,12(sp)
f9000308:	00812403          	lw	s0,8(sp)
f900030c:	00412483          	lw	s1,4(sp)
f9000310:	01010113          	addi	sp,sp,16
f9000314:	00008067          	ret

f9000318 <bsp_printf_c>:
*
* @param c: The character to be output.
*
******************************************************************************/
    static void bsp_printf_c(int c)
    {
f9000318:	ff010113          	addi	sp,sp,-16
f900031c:	00112623          	sw	ra,12(sp)
        _putchar(c);
f9000320:	0ff57513          	zext.b	a0,a0
f9000324:	ef9ff0ef          	jal	f900021c <_putchar>
    }
f9000328:	00c12083          	lw	ra,12(sp)
f900032c:	01010113          	addi	sp,sp,16
f9000330:	00008067          	ret

f9000334 <bsp_printf_s>:
*
* @param s: A pointer to the null-terminated string to be output.
*
*******************************************************************************/
    static void bsp_printf_s(char *p)
    {
f9000334:	ff010113          	addi	sp,sp,-16
f9000338:	00112623          	sw	ra,12(sp)
        _putchar_s(p);
f900033c:	f01ff0ef          	jal	f900023c <_putchar_s>
    }
f9000340:	00c12083          	lw	ra,12(sp)
f9000344:	01010113          	addi	sp,sp,16
f9000348:	00008067          	ret

f900034c <bsp_printf_d>:
* - Handles negative numbers by printing a '-' sign.
* - Uses the 'bsp_printf_c' function to print each character.
*
******************************************************************************/
    static void bsp_printf_d(int val)
    {
f900034c:	fd010113          	addi	sp,sp,-48
f9000350:	02112623          	sw	ra,44(sp)
f9000354:	02812423          	sw	s0,40(sp)
f9000358:	02912223          	sw	s1,36(sp)
f900035c:	00050493          	mv	s1,a0
        char buffer[32];
        char *p = buffer;
        if (val < 0) {
f9000360:	00054663          	bltz	a0,f900036c <bsp_printf_d+0x20>
    {
f9000364:	00010413          	mv	s0,sp
f9000368:	02c0006f          	j	f9000394 <bsp_printf_d+0x48>
            bsp_printf_c('-');
f900036c:	02d00513          	li	a0,45
f9000370:	fa9ff0ef          	jal	f9000318 <bsp_printf_c>
            val = -val;
f9000374:	409004b3          	neg	s1,s1
f9000378:	fedff06f          	j	f9000364 <bsp_printf_d+0x18>
        }
        while (val || p == buffer) {
            *(p++) = '0' + val % 10;
f900037c:	00a00713          	li	a4,10
f9000380:	02e4e7b3          	rem	a5,s1,a4
f9000384:	03078793          	addi	a5,a5,48
f9000388:	00f40023          	sb	a5,0(s0)
            val = val / 10;
f900038c:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
f9000390:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
f9000394:	fe0494e3          	bnez	s1,f900037c <bsp_printf_d+0x30>
f9000398:	00010793          	mv	a5,sp
f900039c:	fef400e3          	beq	s0,a5,f900037c <bsp_printf_d+0x30>
        }
        while (p != buffer)
f90003a0:	00010793          	mv	a5,sp
f90003a4:	00f40a63          	beq	s0,a5,f90003b8 <bsp_printf_d+0x6c>
            bsp_printf_c(*(--p));
f90003a8:	fff40413          	addi	s0,s0,-1
f90003ac:	00044503          	lbu	a0,0(s0)
f90003b0:	f69ff0ef          	jal	f9000318 <bsp_printf_c>
f90003b4:	fedff06f          	j	f90003a0 <bsp_printf_d+0x54>
    }
f90003b8:	02c12083          	lw	ra,44(sp)
f90003bc:	02812403          	lw	s0,40(sp)
f90003c0:	02412483          	lw	s1,36(sp)
f90003c4:	03010113          	addi	sp,sp,48
f90003c8:	00008067          	ret

f90003cc <bsp_printf_x>:
* - Calls 'bsp_printHex_lower' to print the hexadecimal representation.
* - Determines the number of leading zeros to be printed based on the value.
*
******************************************************************************/
    static void bsp_printf_x(int val)
    {
f90003cc:	ff010113          	addi	sp,sp,-16
f90003d0:	00112623          	sw	ra,12(sp)
        int i,digi=2;

        for(i=0;i<8;i++)
f90003d4:	00000713          	li	a4,0
f90003d8:	00700793          	li	a5,7
f90003dc:	02e7c063          	blt	a5,a4,f90003fc <bsp_printf_x+0x30>
        {
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f90003e0:	00271693          	slli	a3,a4,0x2
f90003e4:	ff000793          	li	a5,-16
f90003e8:	00d797b3          	sll	a5,a5,a3
f90003ec:	00f577b3          	and	a5,a0,a5
f90003f0:	00078663          	beqz	a5,f90003fc <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
f90003f4:	00170713          	addi	a4,a4,1
f90003f8:	fe1ff06f          	j	f90003d8 <bsp_printf_x+0xc>
            {
                digi=i+1;
                break;
            }
        }
        bsp_printHex_lower(val);
f90003fc:	ec9ff0ef          	jal	f90002c4 <bsp_printHex_lower>
    }
f9000400:	00c12083          	lw	ra,12(sp)
f9000404:	01010113          	addi	sp,sp,16
f9000408:	00008067          	ret

f900040c <bsp_printf_X>:
* - Calls 'bsp_printHex' to print the uppercase hexadecimal representation.
* - Determines the number of leading zeros to be printed based on the value.
*
******************************************************************************/
    static void bsp_printf_X(int val)
        {
f900040c:	ff010113          	addi	sp,sp,-16
f9000410:	00112623          	sw	ra,12(sp)
            int i,digi=2;

            for(i=0;i<8;i++)
f9000414:	00000713          	li	a4,0
f9000418:	00700793          	li	a5,7
f900041c:	02e7c063          	blt	a5,a4,f900043c <bsp_printf_X+0x30>
            {
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f9000420:	00271693          	slli	a3,a4,0x2
f9000424:	ff000793          	li	a5,-16
f9000428:	00d797b3          	sll	a5,a5,a3
f900042c:	00f577b3          	and	a5,a0,a5
f9000430:	00078663          	beqz	a5,f900043c <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
f9000434:	00170713          	addi	a4,a4,1
f9000438:	fe1ff06f          	j	f9000418 <bsp_printf_X+0xc>
                {
                    digi=i+1;
                    break;
                }
            }
            bsp_printHex(val);
f900043c:	e35ff0ef          	jal	f9000270 <bsp_printHex>
        }
f9000440:	00c12083          	lw	ra,12(sp)
f9000444:	01010113          	addi	sp,sp,16
f9000448:	00008067          	ret

f900044c <bsp_printf>:
* - Handles each format specifier by calling the appropriate helper function.
* - If floating-point support is disabled, prints a warning for the 'f' specifier.
*
******************************************************************************/
    static void bsp_printf(const char *format, ...)
    {
f900044c:	fc010113          	addi	sp,sp,-64
f9000450:	00112e23          	sw	ra,28(sp)
f9000454:	00812c23          	sw	s0,24(sp)
f9000458:	00912a23          	sw	s1,20(sp)
f900045c:	00050493          	mv	s1,a0
f9000460:	02b12223          	sw	a1,36(sp)
f9000464:	02c12423          	sw	a2,40(sp)
f9000468:	02d12623          	sw	a3,44(sp)
f900046c:	02e12823          	sw	a4,48(sp)
f9000470:	02f12a23          	sw	a5,52(sp)
f9000474:	03012c23          	sw	a6,56(sp)
f9000478:	03112e23          	sw	a7,60(sp)
        int i;
        va_list ap;

        va_start(ap, format);
f900047c:	02410793          	addi	a5,sp,36
f9000480:	00f12623          	sw	a5,12(sp)

        for (i = 0; format[i]; i++)
f9000484:	00000413          	li	s0,0
f9000488:	01c0006f          	j	f90004a4 <bsp_printf+0x58>
            if (format[i] == '%') {
                while (format[++i]) {
                    if (format[i] == 'c') {
                        bsp_printf_c(va_arg(ap,int));
f900048c:	00c12783          	lw	a5,12(sp)
f9000490:	00478713          	addi	a4,a5,4
f9000494:	00e12623          	sw	a4,12(sp)
f9000498:	0007a503          	lw	a0,0(a5)
f900049c:	e7dff0ef          	jal	f9000318 <bsp_printf_c>
        for (i = 0; format[i]; i++)
f90004a0:	00140413          	addi	s0,s0,1
f90004a4:	008487b3          	add	a5,s1,s0
f90004a8:	0007c503          	lbu	a0,0(a5)
f90004ac:	0a050e63          	beqz	a0,f9000568 <bsp_printf+0x11c>
            if (format[i] == '%') {
f90004b0:	02500793          	li	a5,37
f90004b4:	06f50e63          	beq	a0,a5,f9000530 <bsp_printf+0xe4>
                        break;
                    }
#endif //#if (ENABLE_FLOATING_POINT_SUPPORT)
                }
            } else
                bsp_printf_c(format[i]);
f90004b8:	e61ff0ef          	jal	f9000318 <bsp_printf_c>
f90004bc:	fe5ff06f          	j	f90004a0 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
f90004c0:	00c12783          	lw	a5,12(sp)
f90004c4:	00478713          	addi	a4,a5,4
f90004c8:	00e12623          	sw	a4,12(sp)
f90004cc:	0007a503          	lw	a0,0(a5)
f90004d0:	e65ff0ef          	jal	f9000334 <bsp_printf_s>
                        break;
f90004d4:	fcdff06f          	j	f90004a0 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
f90004d8:	00c12783          	lw	a5,12(sp)
f90004dc:	00478713          	addi	a4,a5,4
f90004e0:	00e12623          	sw	a4,12(sp)
f90004e4:	0007a503          	lw	a0,0(a5)
f90004e8:	e65ff0ef          	jal	f900034c <bsp_printf_d>
                        break;
f90004ec:	fb5ff06f          	j	f90004a0 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
f90004f0:	00c12783          	lw	a5,12(sp)
f90004f4:	00478713          	addi	a4,a5,4
f90004f8:	00e12623          	sw	a4,12(sp)
f90004fc:	0007a503          	lw	a0,0(a5)
f9000500:	f0dff0ef          	jal	f900040c <bsp_printf_X>
                        break;
f9000504:	f9dff06f          	j	f90004a0 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
f9000508:	00c12783          	lw	a5,12(sp)
f900050c:	00478713          	addi	a4,a5,4
f9000510:	00e12623          	sw	a4,12(sp)
f9000514:	0007a503          	lw	a0,0(a5)
f9000518:	eb5ff0ef          	jal	f90003cc <bsp_printf_x>
                        break;
f900051c:	f85ff06f          	j	f90004a0 <bsp_printf+0x54>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
f9000520:	f9004537          	lui	a0,0xf9004
f9000524:	6d850513          	addi	a0,a0,1752 # f90046d8 <_data+0x28>
f9000528:	e0dff0ef          	jal	f9000334 <bsp_printf_s>
                        break;
f900052c:	f75ff06f          	j	f90004a0 <bsp_printf+0x54>
                while (format[++i]) {
f9000530:	00140413          	addi	s0,s0,1
f9000534:	008487b3          	add	a5,s1,s0
f9000538:	0007c783          	lbu	a5,0(a5)
f900053c:	f60782e3          	beqz	a5,f90004a0 <bsp_printf+0x54>
                    if (format[i] == 'c') {
f9000540:	fa878793          	addi	a5,a5,-88
f9000544:	0ff7f693          	zext.b	a3,a5
f9000548:	02000713          	li	a4,32
f900054c:	fed762e3          	bltu	a4,a3,f9000530 <bsp_printf+0xe4>
f9000550:	00269793          	slli	a5,a3,0x2
f9000554:	f9005737          	lui	a4,0xf9005
f9000558:	a5c70713          	addi	a4,a4,-1444 # f9004a5c <_data+0x3ac>
f900055c:	00e787b3          	add	a5,a5,a4
f9000560:	0007a783          	lw	a5,0(a5)
f9000564:	00078067          	jr	a5

        va_end(ap);
    }
f9000568:	01c12083          	lw	ra,28(sp)
f900056c:	01812403          	lw	s0,24(sp)
f9000570:	01412483          	lw	s1,20(sp)
f9000574:	04010113          	addi	sp,sp,64
f9000578:	00008067          	ret

f900057c <read_apb_reg>:
        bsp_printf("written: %x\r\n", base_addr + config[i].reg);
    }
}

u32 read_apb_reg(u32 reg) {
    return read_u32(APB_SLAVE + reg);
f900057c:	f81007b7          	lui	a5,0xf8100
f9000580:	00f50533          	add	a0,a0,a5
f9000584:	00052503          	lw	a0,0(a0)
}
f9000588:	00008067          	ret

f900058c <write_apb_reg>:

void write_apb_reg(u32 data, u32 reg) {
    write_u32(data, APB_SLAVE + reg);
f900058c:	f81007b7          	lui	a5,0xf8100
f9000590:	00f585b3          	add	a1,a1,a5
        *((volatile u32*) address) = data;
f9000594:	00a5a023          	sw	a0,0(a1)
}
f9000598:	00008067          	ret

f900059c <update_video_timing>:

void update_video_timing(VideoTiming_t config) {
    write_u32(config.max_hres, APB_SLAVE + REG_MAX_HRES);
f900059c:	00052703          	lw	a4,0(a0)
f90005a0:	f81007b7          	lui	a5,0xf8100
f90005a4:	02e7a223          	sw	a4,36(a5) # f8100024 <__stack_size+0xf80ff024>
    write_u32(config.hsp, APB_SLAVE + REG_HSP);
f90005a8:	00852703          	lw	a4,8(a0)
f90005ac:	f81007b7          	lui	a5,0xf8100
f90005b0:	02e7a423          	sw	a4,40(a5) # f8100028 <__stack_size+0xf80ff028>
    write_u32(config.hbp, APB_SLAVE + REG_HBP);
f90005b4:	00c52703          	lw	a4,12(a0)
f90005b8:	f81007b7          	lui	a5,0xf8100
f90005bc:	02e7a623          	sw	a4,44(a5) # f810002c <__stack_size+0xf80ff02c>
    write_u32(config.hact, APB_SLAVE + REG_HACT);
f90005c0:	00452703          	lw	a4,4(a0)
f90005c4:	f81007b7          	lui	a5,0xf8100
f90005c8:	02e7a823          	sw	a4,48(a5) # f8100030 <__stack_size+0xf80ff030>
    write_u32(config.hfp, APB_SLAVE + REG_HFP);
f90005cc:	01052703          	lw	a4,16(a0)
f90005d0:	f81007b7          	lui	a5,0xf8100
f90005d4:	02e7aa23          	sw	a4,52(a5) # f8100034 <__stack_size+0xf80ff034>
    write_u32(config.vsp, APB_SLAVE + REG_VSP);
f90005d8:	01852703          	lw	a4,24(a0)
f90005dc:	f81007b7          	lui	a5,0xf8100
f90005e0:	02e7ac23          	sw	a4,56(a5) # f8100038 <__stack_size+0xf80ff038>
    write_u32(config.vbp, APB_SLAVE + REG_VBP);
f90005e4:	01c52703          	lw	a4,28(a0)
f90005e8:	f81007b7          	lui	a5,0xf8100
f90005ec:	02e7ae23          	sw	a4,60(a5) # f810003c <__stack_size+0xf80ff03c>
    write_u32(config.max_vres, APB_SLAVE + REG_MAX_VRES);
f90005f0:	01452703          	lw	a4,20(a0)
f90005f4:	f81007b7          	lui	a5,0xf8100
f90005f8:	04e7a023          	sw	a4,64(a5) # f8100040 <__stack_size+0xf80ff040>
    write_u32(config.vfp, APB_SLAVE + REG_VFP);
f90005fc:	02052703          	lw	a4,32(a0)
f9000600:	f81007b7          	lui	a5,0xf8100
f9000604:	04e7a223          	sw	a4,68(a5) # f8100044 <__stack_size+0xf80ff044>
    write_u32(config.pcnt, APB_SLAVE + REG_PCNT);
f9000608:	02452703          	lw	a4,36(a0)
f900060c:	f81007b7          	lui	a5,0xf8100
f9000610:	04e7a423          	sw	a4,72(a5) # f8100048 <__stack_size+0xf80ff048>
}
f9000614:	00008067          	ret

f9000618 <reg_init>:

void reg_init() {
f9000618:	fb010113          	addi	sp,sp,-80
f900061c:	04112623          	sw	ra,76(sp)
f9000620:	04812423          	sw	s0,72(sp)
f9000624:	04912223          	sw	s1,68(sp)
f9000628:	05212023          	sw	s2,64(sp)
f900062c:	03312e23          	sw	s3,60(sp)
f9000630:	03412c23          	sw	s4,56(sp)
f9000634:	03512a23          	sw	s5,52(sp)
    IPv4 local_ip = {.data = {20, 100, 16, 172}};
f9000638:	ffff0437          	lui	s0,0xffff0
f900063c:	0ff40413          	addi	s0,s0,255 # ffff00ff <__freertos_irq_stack_top+0x6fea11f>
f9000640:	01447913          	andi	s2,s0,20
f9000644:	000066b7          	lui	a3,0x6
f9000648:	40068693          	addi	a3,a3,1024 # 6400 <__stack_size+0x5400>
f900064c:	00d96933          	or	s2,s2,a3
f9000650:	ff010737          	lui	a4,0xff010
f9000654:	fff70713          	addi	a4,a4,-1 # ff00ffff <__freertos_irq_stack_top+0x600a01f>
f9000658:	00e97933          	and	s2,s2,a4
f900065c:	001005b7          	lui	a1,0x100
f9000660:	00b96933          	or	s2,s2,a1
f9000664:	010007b7          	lui	a5,0x1000
f9000668:	fff78793          	addi	a5,a5,-1 # ffffff <__stack_size+0xffefff>
f900066c:	00f97933          	and	s2,s2,a5
f9000670:	ac000637          	lui	a2,0xac000
f9000674:	00c96933          	or	s2,s2,a2
    IPv4 dest_ip = {.data = {10, 100, 16, 172}};
f9000678:	00a47493          	andi	s1,s0,10
f900067c:	00d4e4b3          	or	s1,s1,a3
f9000680:	00e4f4b3          	and	s1,s1,a4
f9000684:	00b4e4b3          	or	s1,s1,a1
f9000688:	00f4f4b3          	and	s1,s1,a5
f900068c:	00c4e4b3          	or	s1,s1,a2
f9000690:	f82007b7          	lui	a5,0xf8200
f9000694:	0007a423          	sw	zero,8(a5) # f8200008 <__stack_size+0xf81ff008>
f9000698:	f81009b7          	lui	s3,0xf8100
f900069c:	0209a023          	sw	zero,32(s3) # f8100020 <__stack_size+0xf80ff020>
f90006a0:	f8100a37          	lui	s4,0xf8100
f90006a4:	040a2623          	sw	zero,76(s4) # f810004c <__stack_size+0xf80ff04c>
f90006a8:	00100a93          	li	s5,1
f90006ac:	0157a423          	sw	s5,8(a5)

    write_u32(0, SERDES_APB_SLAVE + 8); // assert soft reset
    write_u32(0, APB_SLAVE + REG_VIDEO_RSTN);
    write_u32(0, APB_SLAVE + REG_HDMI_RESET);
    write_u32(1, SERDES_APB_SLAVE + 8); // deassert soft reset
    bsp_uDelay(1000*1000);  // WARNING: a long delay is need here
f90006b0:	f8b00637          	lui	a2,0xf8b00
f90006b4:	05f5e5b7          	lui	a1,0x5f5e
f90006b8:	10058593          	addi	a1,a1,256 # 5f5e100 <__stack_size+0x5f5d100>
f90006bc:	000f4537          	lui	a0,0xf4
f90006c0:	24050513          	addi	a0,a0,576 # f4240 <__stack_size+0xf3240>
f90006c4:	b25ff0ef          	jal	f90001e8 <clint_uDelay>

    bsp_printf("network initialization started\r\n");
f90006c8:	f9004537          	lui	a0,0xf9004
f90006cc:	72450513          	addi	a0,a0,1828 # f9004724 <_data+0x74>
f90006d0:	d7dff0ef          	jal	f900044c <bsp_printf>
f90006d4:	f81007b7          	lui	a5,0xf8100
f90006d8:	0527a823          	sw	s2,80(a5) # f8100050 <__stack_size+0xf80ff050>
f90006dc:	f81007b7          	lui	a5,0xf8100
f90006e0:	0497aa23          	sw	s1,84(a5) # f8100054 <__stack_size+0xf80ff054>
f90006e4:	f81007b7          	lui	a5,0xf8100
f90006e8:	0497ac23          	sw	s1,88(a5) # f8100058 <__stack_size+0xf80ff058>
f90006ec:	f81007b7          	lui	a5,0xf8100
f90006f0:	4d200713          	li	a4,1234
f90006f4:	04e7ae23          	sw	a4,92(a5) # f810005c <__stack_size+0xf80ff05c>
f90006f8:	f81007b7          	lui	a5,0xf8100
f90006fc:	4d300713          	li	a4,1235
f9000700:	06e7a023          	sw	a4,96(a5) # f8100060 <__stack_size+0xf80ff060>
f9000704:	f81007b7          	lui	a5,0xf8100
f9000708:	46000713          	li	a4,1120
f900070c:	06e7aa23          	sw	a4,116(a5) # f8100074 <__stack_size+0xf80ff074>
    write_u32(gateway.ip, APB_SLAVE + REG_GATEWAY_IP);
    write_u32(dest_ip.ip, APB_SLAVE + REG_DEST_IP);
    write_u32(1234, APB_SLAVE + REG_SOURCE_PORT);
    write_u32(1235, APB_SLAVE + REG_DEST_PORT);
    write_u32(floor((9000 - 20 - 8 - 8 - 4)/8), APB_SLAVE + REG_MSS);
    update_video_timing(timing_1080p30);
f9000710:	f90057b7          	lui	a5,0xf9005
f9000714:	be878793          	addi	a5,a5,-1048 # f9004be8 <timing_1080p30>
f9000718:	0007ae03          	lw	t3,0(a5)
f900071c:	0047a303          	lw	t1,4(a5)
f9000720:	0087a883          	lw	a7,8(a5)
f9000724:	00c7a803          	lw	a6,12(a5)
f9000728:	0107a503          	lw	a0,16(a5)
f900072c:	0147a583          	lw	a1,20(a5)
f9000730:	0187a603          	lw	a2,24(a5)
f9000734:	01c7a683          	lw	a3,28(a5)
f9000738:	0207a703          	lw	a4,32(a5)
f900073c:	0247a783          	lw	a5,36(a5)
f9000740:	01c12023          	sw	t3,0(sp)
f9000744:	00612223          	sw	t1,4(sp)
f9000748:	01112423          	sw	a7,8(sp)
f900074c:	01012623          	sw	a6,12(sp)
f9000750:	00a12823          	sw	a0,16(sp)
f9000754:	00b12a23          	sw	a1,20(sp)
f9000758:	00c12c23          	sw	a2,24(sp)
f900075c:	00d12e23          	sw	a3,28(sp)
f9000760:	02e12023          	sw	a4,32(sp)
f9000764:	02f12223          	sw	a5,36(sp)
f9000768:	00010513          	mv	a0,sp
f900076c:	e31ff0ef          	jal	f900059c <update_video_timing>
f9000770:	055a2623          	sw	s5,76(s4)
f9000774:	0359a023          	sw	s5,32(s3)
    write_u32(1, APB_SLAVE + REG_HDMI_RESET);
    write_u32(1, APB_SLAVE + REG_VIDEO_RSTN);

    for (int i=0 ; i<25 ; ++i) {
f9000778:	00000413          	li	s0,0
f900077c:	03c0006f          	j	f90007b8 <reg_init+0x1a0>
        u32 val = read_u32(APB_SLAVE + i*4);
f9000780:	00241793          	slli	a5,s0,0x2
f9000784:	f8100737          	lui	a4,0xf8100
f9000788:	00e787b3          	add	a5,a5,a4
        return *((volatile u32*) address);
f900078c:	0007a483          	lw	s1,0(a5)
        bsp_printf("reg %d readback: ", i);
f9000790:	00040593          	mv	a1,s0
f9000794:	f9004537          	lui	a0,0xf9004
f9000798:	74850513          	addi	a0,a0,1864 # f9004748 <_data+0x98>
f900079c:	cb1ff0ef          	jal	f900044c <bsp_printf>
        bsp_printf_x(val);
f90007a0:	00048513          	mv	a0,s1
f90007a4:	c29ff0ef          	jal	f90003cc <bsp_printf_x>
        bsp_printf("\r\n");
f90007a8:	f9004537          	lui	a0,0xf9004
f90007ac:	75c50513          	addi	a0,a0,1884 # f900475c <_data+0xac>
f90007b0:	c9dff0ef          	jal	f900044c <bsp_printf>
    for (int i=0 ; i<25 ; ++i) {
f90007b4:	00140413          	addi	s0,s0,1
f90007b8:	01800793          	li	a5,24
f90007bc:	fc87d2e3          	bge	a5,s0,f9000780 <reg_init+0x168>
    }

    bsp_printf("initialized!\r\n");
f90007c0:	f9004537          	lui	a0,0xf9004
f90007c4:	76050513          	addi	a0,a0,1888 # f9004760 <_data+0xb0>
f90007c8:	c85ff0ef          	jal	f900044c <bsp_printf>
    bsp_uDelay(50*1000);
f90007cc:	f8b00637          	lui	a2,0xf8b00
f90007d0:	05f5e5b7          	lui	a1,0x5f5e
f90007d4:	10058593          	addi	a1,a1,256 # 5f5e100 <__stack_size+0x5f5d100>
f90007d8:	0000c537          	lui	a0,0xc
f90007dc:	35050513          	addi	a0,a0,848 # c350 <__stack_size+0xb350>
f90007e0:	a09ff0ef          	jal	f90001e8 <clint_uDelay>
}
f90007e4:	04c12083          	lw	ra,76(sp)
f90007e8:	04812403          	lw	s0,72(sp)
f90007ec:	04412483          	lw	s1,68(sp)
f90007f0:	04012903          	lw	s2,64(sp)
f90007f4:	03c12983          	lw	s3,60(sp)
f90007f8:	03812a03          	lw	s4,56(sp)
f90007fc:	03412a83          	lw	s5,52(sp)
f9000800:	05010113          	addi	sp,sp,80
f9000804:	00008067          	ret

f9000808 <uart_writeAvailability>:
f9000808:	00452503          	lw	a0,4(a0)
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
f900080c:	01055513          	srli	a0,a0,0x10
    }
f9000810:	0ff57513          	zext.b	a0,a0
f9000814:	00008067          	ret

f9000818 <uart_write>:
    static void uart_write(u32 reg, char data){
f9000818:	ff010113          	addi	sp,sp,-16
f900081c:	00112623          	sw	ra,12(sp)
f9000820:	00812423          	sw	s0,8(sp)
f9000824:	00912223          	sw	s1,4(sp)
f9000828:	00050413          	mv	s0,a0
f900082c:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
f9000830:	00040513          	mv	a0,s0
f9000834:	fd5ff0ef          	jal	f9000808 <uart_writeAvailability>
f9000838:	fe050ce3          	beqz	a0,f9000830 <uart_write+0x18>
        *((volatile u32*) address) = data;
f900083c:	00942023          	sw	s1,0(s0)
    }
f9000840:	00c12083          	lw	ra,12(sp)
f9000844:	00812403          	lw	s0,8(sp)
f9000848:	00412483          	lw	s1,4(sp)
f900084c:	01010113          	addi	sp,sp,16
f9000850:	00008067          	ret

f9000854 <uart_writeStr>:
*
* @note    The function iterates through each character of the string and writes
*          them one by one to the UART buffer using the uart_write function.
*
******************************************************************************/
    static void uart_writeStr(u32 reg, const char* str){
f9000854:	ff010113          	addi	sp,sp,-16
f9000858:	00112623          	sw	ra,12(sp)
f900085c:	00812423          	sw	s0,8(sp)
f9000860:	00912223          	sw	s1,4(sp)
f9000864:	00050493          	mv	s1,a0
f9000868:	00058413          	mv	s0,a1
        while(*str) uart_write(reg, *str++);
f900086c:	0100006f          	j	f900087c <uart_writeStr+0x28>
f9000870:	00140413          	addi	s0,s0,1
f9000874:	00048513          	mv	a0,s1
f9000878:	fa1ff0ef          	jal	f9000818 <uart_write>
f900087c:	00044583          	lbu	a1,0(s0)
f9000880:	fe0598e3          	bnez	a1,f9000870 <uart_writeStr+0x1c>
    }
f9000884:	00c12083          	lw	ra,12(sp)
f9000888:	00812403          	lw	s0,8(sp)
f900088c:	00412483          	lw	s1,4(sp)
f9000890:	01010113          	addi	sp,sp,16
f9000894:	00008067          	ret

f9000898 <assert>:
    return read_u32(addr);
}


void assert(int cond){
    if(!cond) {
f9000898:	00050463          	beqz	a0,f90008a0 <assert+0x8>
f900089c:	00008067          	ret
void assert(int cond){
f90008a0:	ff010113          	addi	sp,sp,-16
f90008a4:	00112623          	sw	ra,12(sp)
        uart_writeStr(BSP_UART_TERMINAL, "Assert failure\n");
f90008a8:	f90045b7          	lui	a1,0xf9004
f90008ac:	7e858593          	addi	a1,a1,2024 # f90047e8 <_data+0x138>
f90008b0:	f8010537          	lui	a0,0xf8010
f90008b4:	fa1ff0ef          	jal	f9000854 <uart_writeStr>
        while(1);
f90008b8:	0000006f          	j	f90008b8 <assert+0x20>

f90008bc <uart_writeAvailability>:
        return *((volatile u32*) address);
f90008bc:	00452503          	lw	a0,4(a0) # f8010004 <__stack_size+0xf800f004>
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
f90008c0:	01055513          	srli	a0,a0,0x10
    }
f90008c4:	0ff57513          	zext.b	a0,a0
f90008c8:	00008067          	ret

f90008cc <uart_write>:
    static void uart_write(u32 reg, char data){
f90008cc:	ff010113          	addi	sp,sp,-16
f90008d0:	00112623          	sw	ra,12(sp)
f90008d4:	00812423          	sw	s0,8(sp)
f90008d8:	00912223          	sw	s1,4(sp)
f90008dc:	00050413          	mv	s0,a0
f90008e0:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
f90008e4:	00040513          	mv	a0,s0
f90008e8:	fd5ff0ef          	jal	f90008bc <uart_writeAvailability>
f90008ec:	fe050ce3          	beqz	a0,f90008e4 <uart_write+0x18>
        *((volatile u32*) address) = data;
f90008f0:	00942023          	sw	s1,0(s0)
    }
f90008f4:	00c12083          	lw	ra,12(sp)
f90008f8:	00812403          	lw	s0,8(sp)
f90008fc:	00412483          	lw	s1,4(sp)
f9000900:	01010113          	addi	sp,sp,16
f9000904:	00008067          	ret

f9000908 <clint_uDelay>:
        u32 mTimePerUsec = hz/1000000;
f9000908:	000f47b7          	lui	a5,0xf4
f900090c:	24078793          	addi	a5,a5,576 # f4240 <__stack_size+0xf3240>
f9000910:	02f5d5b3          	divu	a1,a1,a5
    readReg_u32 (clint_getTimeLow , CLINT_TIME_ADDR)
f9000914:	0000c7b7          	lui	a5,0xc
f9000918:	ff878793          	addi	a5,a5,-8 # bff8 <__stack_size+0xaff8>
f900091c:	00f60633          	add	a2,a2,a5
        return *((volatile u32*) address);
f9000920:	00062783          	lw	a5,0(a2) # f8b00000 <__stack_size+0xf8aff000>
        u32 limit = clint_getTimeLow(reg) + usec*mTimePerUsec;
f9000924:	02a585b3          	mul	a1,a1,a0
f9000928:	00f58733          	add	a4,a1,a5
f900092c:	00062783          	lw	a5,0(a2)
        while((int32_t)(limit-(clint_getTimeLow(reg))) >= 0);
f9000930:	40f707b3          	sub	a5,a4,a5
f9000934:	fe07dce3          	bgez	a5,f900092c <clint_uDelay+0x24>
f9000938:	00008067          	ret

f900093c <_putchar>:
    static void _putchar(char character){
f900093c:	ff010113          	addi	sp,sp,-16
f9000940:	00112623          	sw	ra,12(sp)
f9000944:	00050593          	mv	a1,a0
            bsp_putChar(character);
f9000948:	f8010537          	lui	a0,0xf8010
f900094c:	f81ff0ef          	jal	f90008cc <uart_write>
    }
f9000950:	00c12083          	lw	ra,12(sp)
f9000954:	01010113          	addi	sp,sp,16
f9000958:	00008067          	ret

f900095c <_putchar_s>:
    {
f900095c:	ff010113          	addi	sp,sp,-16
f9000960:	00112623          	sw	ra,12(sp)
f9000964:	00812423          	sw	s0,8(sp)
f9000968:	00050413          	mv	s0,a0
        while (*p)
f900096c:	00c0006f          	j	f9000978 <_putchar_s+0x1c>
            _putchar(*(p++));
f9000970:	00140413          	addi	s0,s0,1
f9000974:	fc9ff0ef          	jal	f900093c <_putchar>
        while (*p)
f9000978:	00044503          	lbu	a0,0(s0)
f900097c:	fe051ae3          	bnez	a0,f9000970 <_putchar_s+0x14>
    }
f9000980:	00c12083          	lw	ra,12(sp)
f9000984:	00812403          	lw	s0,8(sp)
f9000988:	01010113          	addi	sp,sp,16
f900098c:	00008067          	ret

f9000990 <bsp_printHex>:
    {
f9000990:	ff010113          	addi	sp,sp,-16
f9000994:	00112623          	sw	ra,12(sp)
f9000998:	00812423          	sw	s0,8(sp)
f900099c:	00912223          	sw	s1,4(sp)
f90009a0:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f90009a4:	01c00413          	li	s0,28
f90009a8:	0240006f          	j	f90009cc <bsp_printHex+0x3c>
            _putchar("0123456789ABCDEF"[(val >> i) % 16]);
f90009ac:	0084d733          	srl	a4,s1,s0
f90009b0:	00f77713          	andi	a4,a4,15
f90009b4:	f90047b7          	lui	a5,0xf9004
f90009b8:	6b078793          	addi	a5,a5,1712 # f90046b0 <_data>
f90009bc:	00e787b3          	add	a5,a5,a4
f90009c0:	0007c503          	lbu	a0,0(a5)
f90009c4:	f79ff0ef          	jal	f900093c <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f90009c8:	ffc40413          	addi	s0,s0,-4
f90009cc:	fe0450e3          	bgez	s0,f90009ac <bsp_printHex+0x1c>
    }
f90009d0:	00c12083          	lw	ra,12(sp)
f90009d4:	00812403          	lw	s0,8(sp)
f90009d8:	00412483          	lw	s1,4(sp)
f90009dc:	01010113          	addi	sp,sp,16
f90009e0:	00008067          	ret

f90009e4 <bsp_printHex_lower>:
    {
f90009e4:	ff010113          	addi	sp,sp,-16
f90009e8:	00112623          	sw	ra,12(sp)
f90009ec:	00812423          	sw	s0,8(sp)
f90009f0:	00912223          	sw	s1,4(sp)
f90009f4:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f90009f8:	01c00413          	li	s0,28
f90009fc:	0240006f          	j	f9000a20 <bsp_printHex_lower+0x3c>
            _putchar("0123456789abcdef"[(val >> i) % 16]);
f9000a00:	0084d733          	srl	a4,s1,s0
f9000a04:	00f77713          	andi	a4,a4,15
f9000a08:	f90047b7          	lui	a5,0xf9004
f9000a0c:	6c478793          	addi	a5,a5,1732 # f90046c4 <_data+0x14>
f9000a10:	00e787b3          	add	a5,a5,a4
f9000a14:	0007c503          	lbu	a0,0(a5)
f9000a18:	f25ff0ef          	jal	f900093c <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9000a1c:	ffc40413          	addi	s0,s0,-4
f9000a20:	fe0450e3          	bgez	s0,f9000a00 <bsp_printHex_lower+0x1c>
    }
f9000a24:	00c12083          	lw	ra,12(sp)
f9000a28:	00812403          	lw	s0,8(sp)
f9000a2c:	00412483          	lw	s1,4(sp)
f9000a30:	01010113          	addi	sp,sp,16
f9000a34:	00008067          	ret

f9000a38 <bsp_printf_c>:
    {
f9000a38:	ff010113          	addi	sp,sp,-16
f9000a3c:	00112623          	sw	ra,12(sp)
        _putchar(c);
f9000a40:	0ff57513          	zext.b	a0,a0
f9000a44:	ef9ff0ef          	jal	f900093c <_putchar>
    }
f9000a48:	00c12083          	lw	ra,12(sp)
f9000a4c:	01010113          	addi	sp,sp,16
f9000a50:	00008067          	ret

f9000a54 <bsp_printf_s>:
    {
f9000a54:	ff010113          	addi	sp,sp,-16
f9000a58:	00112623          	sw	ra,12(sp)
        _putchar_s(p);
f9000a5c:	f01ff0ef          	jal	f900095c <_putchar_s>
    }
f9000a60:	00c12083          	lw	ra,12(sp)
f9000a64:	01010113          	addi	sp,sp,16
f9000a68:	00008067          	ret

f9000a6c <bsp_printf_d>:
    {
f9000a6c:	fd010113          	addi	sp,sp,-48
f9000a70:	02112623          	sw	ra,44(sp)
f9000a74:	02812423          	sw	s0,40(sp)
f9000a78:	02912223          	sw	s1,36(sp)
f9000a7c:	00050493          	mv	s1,a0
        if (val < 0) {
f9000a80:	00054663          	bltz	a0,f9000a8c <bsp_printf_d+0x20>
    {
f9000a84:	00010413          	mv	s0,sp
f9000a88:	02c0006f          	j	f9000ab4 <bsp_printf_d+0x48>
            bsp_printf_c('-');
f9000a8c:	02d00513          	li	a0,45
f9000a90:	fa9ff0ef          	jal	f9000a38 <bsp_printf_c>
            val = -val;
f9000a94:	409004b3          	neg	s1,s1
f9000a98:	fedff06f          	j	f9000a84 <bsp_printf_d+0x18>
            *(p++) = '0' + val % 10;
f9000a9c:	00a00713          	li	a4,10
f9000aa0:	02e4e7b3          	rem	a5,s1,a4
f9000aa4:	03078793          	addi	a5,a5,48
f9000aa8:	00f40023          	sb	a5,0(s0)
            val = val / 10;
f9000aac:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
f9000ab0:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
f9000ab4:	fe0494e3          	bnez	s1,f9000a9c <bsp_printf_d+0x30>
f9000ab8:	00010793          	mv	a5,sp
f9000abc:	fef400e3          	beq	s0,a5,f9000a9c <bsp_printf_d+0x30>
        while (p != buffer)
f9000ac0:	00010793          	mv	a5,sp
f9000ac4:	00f40a63          	beq	s0,a5,f9000ad8 <bsp_printf_d+0x6c>
            bsp_printf_c(*(--p));
f9000ac8:	fff40413          	addi	s0,s0,-1
f9000acc:	00044503          	lbu	a0,0(s0)
f9000ad0:	f69ff0ef          	jal	f9000a38 <bsp_printf_c>
f9000ad4:	fedff06f          	j	f9000ac0 <bsp_printf_d+0x54>
    }
f9000ad8:	02c12083          	lw	ra,44(sp)
f9000adc:	02812403          	lw	s0,40(sp)
f9000ae0:	02412483          	lw	s1,36(sp)
f9000ae4:	03010113          	addi	sp,sp,48
f9000ae8:	00008067          	ret

f9000aec <bsp_printf_x>:
    {
f9000aec:	ff010113          	addi	sp,sp,-16
f9000af0:	00112623          	sw	ra,12(sp)
        for(i=0;i<8;i++)
f9000af4:	00000713          	li	a4,0
f9000af8:	00700793          	li	a5,7
f9000afc:	02e7c063          	blt	a5,a4,f9000b1c <bsp_printf_x+0x30>
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f9000b00:	00271693          	slli	a3,a4,0x2
f9000b04:	ff000793          	li	a5,-16
f9000b08:	00d797b3          	sll	a5,a5,a3
f9000b0c:	00f577b3          	and	a5,a0,a5
f9000b10:	00078663          	beqz	a5,f9000b1c <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
f9000b14:	00170713          	addi	a4,a4,1 # f8100001 <__stack_size+0xf80ff001>
f9000b18:	fe1ff06f          	j	f9000af8 <bsp_printf_x+0xc>
        bsp_printHex_lower(val);
f9000b1c:	ec9ff0ef          	jal	f90009e4 <bsp_printHex_lower>
    }
f9000b20:	00c12083          	lw	ra,12(sp)
f9000b24:	01010113          	addi	sp,sp,16
f9000b28:	00008067          	ret

f9000b2c <bsp_printf_X>:
        {
f9000b2c:	ff010113          	addi	sp,sp,-16
f9000b30:	00112623          	sw	ra,12(sp)
            for(i=0;i<8;i++)
f9000b34:	00000713          	li	a4,0
f9000b38:	00700793          	li	a5,7
f9000b3c:	02e7c063          	blt	a5,a4,f9000b5c <bsp_printf_X+0x30>
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f9000b40:	00271693          	slli	a3,a4,0x2
f9000b44:	ff000793          	li	a5,-16
f9000b48:	00d797b3          	sll	a5,a5,a3
f9000b4c:	00f577b3          	and	a5,a0,a5
f9000b50:	00078663          	beqz	a5,f9000b5c <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
f9000b54:	00170713          	addi	a4,a4,1
f9000b58:	fe1ff06f          	j	f9000b38 <bsp_printf_X+0xc>
            bsp_printHex(val);
f9000b5c:	e35ff0ef          	jal	f9000990 <bsp_printHex>
        }
f9000b60:	00c12083          	lw	ra,12(sp)
f9000b64:	01010113          	addi	sp,sp,16
f9000b68:	00008067          	ret

f9000b6c <i2c_masterBusy>:
f9000b6c:	04052503          	lw	a0,64(a0) # f8010040 <__stack_size+0xf800f040>
* @return      Returns 1 if the I2C master is busy, and 0 otherwise.
*
******************************************************************************/
    static int i2c_masterBusy(u32 reg){
        return (read_u32(reg + I2C_MASTER_STATUS) & I2C_MASTER_BUSY) != 0;
    }
f9000b70:	00157513          	andi	a0,a0,1
f9000b74:	00008067          	ret

f9000b78 <i2c_masterStartBlocking>:
        write_u32(I2C_MASTER_START | I2C_MASTER_START_DROPPED, reg + I2C_MASTER_STATUS);
f9000b78:	04050713          	addi	a4,a0,64
        *((volatile u32*) address) = data;
f9000b7c:	21000793          	li	a5,528
f9000b80:	04f52023          	sw	a5,64(a0)
        return *((volatile u32*) address);
f9000b84:	00072783          	lw	a5,0(a4)
* @return      None.
*
******************************************************************************/
    static void i2c_masterStartBlocking(u32 reg){
        i2c_masterStart(reg);
        while(i2c_getMasterStatus(reg) & I2C_MASTER_START);
f9000b88:	0107f793          	andi	a5,a5,16
f9000b8c:	fe079ce3          	bnez	a5,f9000b84 <i2c_masterStartBlocking+0xc>
    }
f9000b90:	00008067          	ret

f9000b94 <i2c_masterStopWait>:
* @param reg   The base address of the I2C registers.
*
* @return      None.
*
******************************************************************************/
    static void i2c_masterStopWait(u32 reg){
f9000b94:	ff010113          	addi	sp,sp,-16
f9000b98:	00112623          	sw	ra,12(sp)
f9000b9c:	00812423          	sw	s0,8(sp)
f9000ba0:	00050413          	mv	s0,a0
        while(i2c_masterBusy(reg));
f9000ba4:	00040513          	mv	a0,s0
f9000ba8:	fc5ff0ef          	jal	f9000b6c <i2c_masterBusy>
f9000bac:	fe051ce3          	bnez	a0,f9000ba4 <i2c_masterStopWait+0x10>
    }
f9000bb0:	00c12083          	lw	ra,12(sp)
f9000bb4:	00812403          	lw	s0,8(sp)
f9000bb8:	01010113          	addi	sp,sp,16
f9000bbc:	00008067          	ret

f9000bc0 <i2c_masterStopBlocking>:
* @param reg   The base address of the I2C registers.
*
* @return      None.
*
******************************************************************************/
    static void i2c_masterStopBlocking(u32 reg){
f9000bc0:	ff010113          	addi	sp,sp,-16
f9000bc4:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
f9000bc8:	42000713          	li	a4,1056
f9000bcc:	04e52023          	sw	a4,64(a0)
        i2c_masterStop(reg);
        i2c_masterStopWait(reg);
f9000bd0:	fc5ff0ef          	jal	f9000b94 <i2c_masterStopWait>
    }
f9000bd4:	00c12083          	lw	ra,12(sp)
f9000bd8:	01010113          	addi	sp,sp,16
f9000bdc:	00008067          	ret

f9000be0 <i2c_txAckWait>:
        return *((volatile u32*) address);
f9000be0:	00452783          	lw	a5,4(a0)
*
* @return      None.
*
******************************************************************************/
    static void i2c_txAckWait(u32 reg){
        while(read_u32(reg + I2C_TX_ACK) & I2C_TX_VALID);
f9000be4:	1007f793          	andi	a5,a5,256
f9000be8:	fe079ce3          	bnez	a5,f9000be0 <i2c_txAckWait>
    }
f9000bec:	00008067          	ret

f9000bf0 <i2c_txNackBlocking>:
* @param reg   The base address of the I2C registers.
*
* @return      None.
*
******************************************************************************/
    static void i2c_txNackBlocking(u32 reg){
f9000bf0:	ff010113          	addi	sp,sp,-16
f9000bf4:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
f9000bf8:	30100713          	li	a4,769
f9000bfc:	00e52223          	sw	a4,4(a0)
        i2c_txNack(reg);
        i2c_txAckWait(reg);
f9000c00:	fe1ff0ef          	jal	f9000be0 <i2c_txAckWait>
    }
f9000c04:	00c12083          	lw	ra,12(sp)
f9000c08:	01010113          	addi	sp,sp,16
f9000c0c:	00008067          	ret

f9000c10 <i2c_rxData>:
        return *((volatile u32*) address);
f9000c10:	00852503          	lw	a0,8(a0)
*
******************************************************************************/

    static u32 i2c_rxData(u32 reg){
        return read_u32(reg + I2C_RX_DATA) & I2C_RX_VALUE;
    }
f9000c14:	0ff57513          	zext.b	a0,a0
f9000c18:	00008067          	ret

f9000c1c <i2c_rxNack>:
f9000c1c:	00c52503          	lw	a0,12(a0)
*
* @return      1 if NACK signal is detected, otherwise 0.
*
******************************************************************************/
    static int i2c_rxNack(u32 reg){
        return (read_u32(reg + I2C_RX_ACK) & I2C_RX_VALUE) != 0;
f9000c20:	0ff57513          	zext.b	a0,a0
    }
f9000c24:	00a03533          	snez	a0,a0
f9000c28:	00008067          	ret

f9000c2c <i2c_rxAck>:
f9000c2c:	00c52503          	lw	a0,12(a0)
*
* @return      1 if ACK signal is detected, otherwise 0.
*
******************************************************************************/
    static int i2c_rxAck(u32 reg){
        return (read_u32(reg + I2C_RX_ACK) & I2C_RX_VALUE) == 0;
f9000c30:	0ff57513          	zext.b	a0,a0
    }
f9000c34:	00153513          	seqz	a0,a0
f9000c38:	00008067          	ret

f9000c3c <bsp_printf>:
    {
f9000c3c:	fc010113          	addi	sp,sp,-64
f9000c40:	00112e23          	sw	ra,28(sp)
f9000c44:	00812c23          	sw	s0,24(sp)
f9000c48:	00912a23          	sw	s1,20(sp)
f9000c4c:	00050493          	mv	s1,a0
f9000c50:	02b12223          	sw	a1,36(sp)
f9000c54:	02c12423          	sw	a2,40(sp)
f9000c58:	02d12623          	sw	a3,44(sp)
f9000c5c:	02e12823          	sw	a4,48(sp)
f9000c60:	02f12a23          	sw	a5,52(sp)
f9000c64:	03012c23          	sw	a6,56(sp)
f9000c68:	03112e23          	sw	a7,60(sp)
        va_start(ap, format);
f9000c6c:	02410793          	addi	a5,sp,36
f9000c70:	00f12623          	sw	a5,12(sp)
        for (i = 0; format[i]; i++)
f9000c74:	00000413          	li	s0,0
f9000c78:	01c0006f          	j	f9000c94 <bsp_printf+0x58>
                        bsp_printf_c(va_arg(ap,int));
f9000c7c:	00c12783          	lw	a5,12(sp)
f9000c80:	00478713          	addi	a4,a5,4
f9000c84:	00e12623          	sw	a4,12(sp)
f9000c88:	0007a503          	lw	a0,0(a5)
f9000c8c:	dadff0ef          	jal	f9000a38 <bsp_printf_c>
        for (i = 0; format[i]; i++)
f9000c90:	00140413          	addi	s0,s0,1
f9000c94:	008487b3          	add	a5,s1,s0
f9000c98:	0007c503          	lbu	a0,0(a5)
f9000c9c:	0a050e63          	beqz	a0,f9000d58 <bsp_printf+0x11c>
            if (format[i] == '%') {
f9000ca0:	02500793          	li	a5,37
f9000ca4:	06f50e63          	beq	a0,a5,f9000d20 <bsp_printf+0xe4>
                bsp_printf_c(format[i]);
f9000ca8:	d91ff0ef          	jal	f9000a38 <bsp_printf_c>
f9000cac:	fe5ff06f          	j	f9000c90 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
f9000cb0:	00c12783          	lw	a5,12(sp)
f9000cb4:	00478713          	addi	a4,a5,4
f9000cb8:	00e12623          	sw	a4,12(sp)
f9000cbc:	0007a503          	lw	a0,0(a5)
f9000cc0:	d95ff0ef          	jal	f9000a54 <bsp_printf_s>
                        break;
f9000cc4:	fcdff06f          	j	f9000c90 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
f9000cc8:	00c12783          	lw	a5,12(sp)
f9000ccc:	00478713          	addi	a4,a5,4
f9000cd0:	00e12623          	sw	a4,12(sp)
f9000cd4:	0007a503          	lw	a0,0(a5)
f9000cd8:	d95ff0ef          	jal	f9000a6c <bsp_printf_d>
                        break;
f9000cdc:	fb5ff06f          	j	f9000c90 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
f9000ce0:	00c12783          	lw	a5,12(sp)
f9000ce4:	00478713          	addi	a4,a5,4
f9000ce8:	00e12623          	sw	a4,12(sp)
f9000cec:	0007a503          	lw	a0,0(a5)
f9000cf0:	e3dff0ef          	jal	f9000b2c <bsp_printf_X>
                        break;
f9000cf4:	f9dff06f          	j	f9000c90 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
f9000cf8:	00c12783          	lw	a5,12(sp)
f9000cfc:	00478713          	addi	a4,a5,4
f9000d00:	00e12623          	sw	a4,12(sp)
f9000d04:	0007a503          	lw	a0,0(a5)
f9000d08:	de5ff0ef          	jal	f9000aec <bsp_printf_x>
                        break;
f9000d0c:	f85ff06f          	j	f9000c90 <bsp_printf+0x54>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
f9000d10:	f9004537          	lui	a0,0xf9004
f9000d14:	6d850513          	addi	a0,a0,1752 # f90046d8 <_data+0x28>
f9000d18:	d3dff0ef          	jal	f9000a54 <bsp_printf_s>
                        break;
f9000d1c:	f75ff06f          	j	f9000c90 <bsp_printf+0x54>
                while (format[++i]) {
f9000d20:	00140413          	addi	s0,s0,1
f9000d24:	008487b3          	add	a5,s1,s0
f9000d28:	0007c783          	lbu	a5,0(a5)
f9000d2c:	f60782e3          	beqz	a5,f9000c90 <bsp_printf+0x54>
                    if (format[i] == 'c') {
f9000d30:	fa878793          	addi	a5,a5,-88
f9000d34:	0ff7f693          	zext.b	a3,a5
f9000d38:	02000713          	li	a4,32
f9000d3c:	fed762e3          	bltu	a4,a3,f9000d20 <bsp_printf+0xe4>
f9000d40:	00269793          	slli	a5,a3,0x2
f9000d44:	f9005737          	lui	a4,0xf9005
f9000d48:	c1070713          	addi	a4,a4,-1008 # f9004c10 <timing_1080p30+0x28>
f9000d4c:	00e787b3          	add	a5,a5,a4
f9000d50:	0007a783          	lw	a5,0(a5)
f9000d54:	00078067          	jr	a5
    }
f9000d58:	01c12083          	lw	ra,28(sp)
f9000d5c:	01812403          	lw	s0,24(sp)
f9000d60:	01412483          	lw	s1,20(sp)
f9000d64:	04010113          	addi	sp,sp,64
f9000d68:	00008067          	ret

f9000d6c <WriteRegData>:
		{IMX900_GAIN_LOW, 0x00},
};


void WriteRegData(u8 addr, u16 reg, u8 data)
{
f9000d6c:	fe010113          	addi	sp,sp,-32
f9000d70:	00112e23          	sw	ra,28(sp)
f9000d74:	00812c23          	sw	s0,24(sp)
f9000d78:	00912a23          	sw	s1,20(sp)
f9000d7c:	01212823          	sw	s2,16(sp)
f9000d80:	01312623          	sw	s3,12(sp)
f9000d84:	01412423          	sw	s4,8(sp)
f9000d88:	00050413          	mv	s0,a0
f9000d8c:	00058493          	mv	s1,a1
f9000d90:	00060993          	mv	s3,a2
	u8 outdata;

    i2c_masterStartBlocking(I2C_CTRL_CAM);
f9000d94:	f8016537          	lui	a0,0xf8016
f9000d98:	de1ff0ef          	jal	f9000b78 <i2c_masterStartBlocking>

    i2c_txByte(I2C_CTRL_CAM, addr<<1);
f9000d9c:	00141413          	slli	s0,s0,0x1
f9000da0:	0ff47413          	zext.b	s0,s0
        write_u32(byte | I2C_TX_VALID | I2C_TX_ENABLE | I2C_TX_DISABLE_ON_DATA_CONFLICT, reg + I2C_TX_DATA);
f9000da4:	00001937          	lui	s2,0x1
f9000da8:	b0090913          	addi	s2,s2,-1280 # b00 <CUSTOM2+0xaa5>
f9000dac:	01246433          	or	s0,s0,s2
        *((volatile u32*) address) = data;
f9000db0:	f8016a37          	lui	s4,0xf8016
f9000db4:	008a2023          	sw	s0,0(s4) # f8016000 <__stack_size+0xf8015000>
	i2c_txNackBlocking(I2C_CTRL_CAM);
f9000db8:	f8016537          	lui	a0,0xf8016
f9000dbc:	e35ff0ef          	jal	f9000bf0 <i2c_txNackBlocking>
	assert(i2c_rxAck(I2C_CTRL_CAM)); // Optional check
f9000dc0:	f8016537          	lui	a0,0xf8016
f9000dc4:	e69ff0ef          	jal	f9000c2c <i2c_rxAck>
f9000dc8:	ad1ff0ef          	jal	f9000898 <assert>

	i2c_txByte(I2C_CTRL_CAM, (reg>>8) & 0xFF);
f9000dcc:	0084d793          	srli	a5,s1,0x8
f9000dd0:	0127e7b3          	or	a5,a5,s2
f9000dd4:	00fa2023          	sw	a5,0(s4)
	i2c_txNackBlocking(I2C_CTRL_CAM);
f9000dd8:	f8016537          	lui	a0,0xf8016
f9000ddc:	e15ff0ef          	jal	f9000bf0 <i2c_txNackBlocking>
	assert(i2c_rxAck(I2C_CTRL_CAM)); // Optional check
f9000de0:	f8016537          	lui	a0,0xf8016
f9000de4:	e49ff0ef          	jal	f9000c2c <i2c_rxAck>
f9000de8:	ab1ff0ef          	jal	f9000898 <assert>

	i2c_txByte(I2C_CTRL_CAM, (reg) & 0xFF);
f9000dec:	0ff4f493          	zext.b	s1,s1
f9000df0:	0124e4b3          	or	s1,s1,s2
f9000df4:	009a2023          	sw	s1,0(s4)
	i2c_txNackBlocking(I2C_CTRL_CAM);
f9000df8:	f8016537          	lui	a0,0xf8016
f9000dfc:	df5ff0ef          	jal	f9000bf0 <i2c_txNackBlocking>
	assert(i2c_rxAck(I2C_CTRL_CAM)); // Optional check
f9000e00:	f8016537          	lui	a0,0xf8016
f9000e04:	e29ff0ef          	jal	f9000c2c <i2c_rxAck>
f9000e08:	a91ff0ef          	jal	f9000898 <assert>
f9000e0c:	0129e9b3          	or	s3,s3,s2
f9000e10:	013a2023          	sw	s3,0(s4)

	i2c_txByte(I2C_CTRL_CAM, data & 0xFF);
	i2c_txNackBlocking(I2C_CTRL_CAM);
f9000e14:	f8016537          	lui	a0,0xf8016
f9000e18:	dd9ff0ef          	jal	f9000bf0 <i2c_txNackBlocking>
	assert(i2c_rxAck(I2C_CTRL_CAM)); // Optional check
f9000e1c:	f8016537          	lui	a0,0xf8016
f9000e20:	e0dff0ef          	jal	f9000c2c <i2c_rxAck>
f9000e24:	a75ff0ef          	jal	f9000898 <assert>

	i2c_masterStopBlocking(I2C_CTRL_CAM);
f9000e28:	f8016537          	lui	a0,0xf8016
f9000e2c:	d95ff0ef          	jal	f9000bc0 <i2c_masterStopBlocking>
}
f9000e30:	01c12083          	lw	ra,28(sp)
f9000e34:	01812403          	lw	s0,24(sp)
f9000e38:	01412483          	lw	s1,20(sp)
f9000e3c:	01012903          	lw	s2,16(sp)
f9000e40:	00c12983          	lw	s3,12(sp)
f9000e44:	00812a03          	lw	s4,8(sp)
f9000e48:	02010113          	addi	sp,sp,32
f9000e4c:	00008067          	ret

f9000e50 <ReadRegData>:

u8 ReadRegData(u8 addr, u16 reg)
{
f9000e50:	fe010113          	addi	sp,sp,-32
f9000e54:	00112e23          	sw	ra,28(sp)
f9000e58:	00812c23          	sw	s0,24(sp)
f9000e5c:	00912a23          	sw	s1,20(sp)
f9000e60:	01212823          	sw	s2,16(sp)
f9000e64:	01312623          	sw	s3,12(sp)
f9000e68:	00050413          	mv	s0,a0
f9000e6c:	00058493          	mv	s1,a1
	u8 outdata;

    i2c_masterStartBlocking(I2C_CTRL_CAM);
f9000e70:	f8016537          	lui	a0,0xf8016
f9000e74:	d05ff0ef          	jal	f9000b78 <i2c_masterStartBlocking>

    i2c_txByte(I2C_CTRL_CAM, addr<<1);
f9000e78:	00141793          	slli	a5,s0,0x1
f9000e7c:	0ff7f793          	zext.b	a5,a5
f9000e80:	00001937          	lui	s2,0x1
f9000e84:	b0090913          	addi	s2,s2,-1280 # b00 <CUSTOM2+0xaa5>
f9000e88:	0127e7b3          	or	a5,a5,s2
f9000e8c:	f80169b7          	lui	s3,0xf8016
f9000e90:	00f9a023          	sw	a5,0(s3) # f8016000 <__stack_size+0xf8015000>
	i2c_txNackBlocking(I2C_CTRL_CAM);
f9000e94:	f8016537          	lui	a0,0xf8016
f9000e98:	d59ff0ef          	jal	f9000bf0 <i2c_txNackBlocking>
	assert(i2c_rxAck(I2C_CTRL_CAM)); // Optional check
f9000e9c:	f8016537          	lui	a0,0xf8016
f9000ea0:	d8dff0ef          	jal	f9000c2c <i2c_rxAck>
f9000ea4:	9f5ff0ef          	jal	f9000898 <assert>

	i2c_txByte(I2C_CTRL_CAM, (reg>>8) & 0xFF);
f9000ea8:	0084d793          	srli	a5,s1,0x8
f9000eac:	0127e7b3          	or	a5,a5,s2
f9000eb0:	00f9a023          	sw	a5,0(s3)
	i2c_txNackBlocking(I2C_CTRL_CAM);
f9000eb4:	f8016537          	lui	a0,0xf8016
f9000eb8:	d39ff0ef          	jal	f9000bf0 <i2c_txNackBlocking>
	assert(i2c_rxAck(I2C_CTRL_CAM)); // Optional check
f9000ebc:	f8016537          	lui	a0,0xf8016
f9000ec0:	d6dff0ef          	jal	f9000c2c <i2c_rxAck>
f9000ec4:	9d5ff0ef          	jal	f9000898 <assert>

	i2c_txByte(I2C_CTRL_CAM, (reg) & 0xFF);
f9000ec8:	0ff4f493          	zext.b	s1,s1
f9000ecc:	0124e4b3          	or	s1,s1,s2
f9000ed0:	0099a023          	sw	s1,0(s3)
	i2c_txNackBlocking(I2C_CTRL_CAM);
f9000ed4:	f8016537          	lui	a0,0xf8016
f9000ed8:	d19ff0ef          	jal	f9000bf0 <i2c_txNackBlocking>
	assert(i2c_rxAck(I2C_CTRL_CAM)); // Optional check
f9000edc:	f8016537          	lui	a0,0xf8016
f9000ee0:	d4dff0ef          	jal	f9000c2c <i2c_rxAck>
f9000ee4:	9b5ff0ef          	jal	f9000898 <assert>

	i2c_masterStopBlocking(I2C_CTRL_CAM);
f9000ee8:	f8016537          	lui	a0,0xf8016
f9000eec:	cd5ff0ef          	jal	f9000bc0 <i2c_masterStopBlocking>
	i2c_masterStartBlocking(I2C_CTRL_CAM);
f9000ef0:	f8016537          	lui	a0,0xf8016
f9000ef4:	c85ff0ef          	jal	f9000b78 <i2c_masterStartBlocking>

	i2c_txByte(I2C_CTRL_CAM, (addr<<1) | 0x01);
f9000ef8:	00141413          	slli	s0,s0,0x1
f9000efc:	00146413          	ori	s0,s0,1
f9000f00:	0ff47413          	zext.b	s0,s0
f9000f04:	01246433          	or	s0,s0,s2
f9000f08:	0089a023          	sw	s0,0(s3)
	i2c_txNackBlocking(I2C_CTRL_CAM);
f9000f0c:	f8016537          	lui	a0,0xf8016
f9000f10:	ce1ff0ef          	jal	f9000bf0 <i2c_txNackBlocking>
	assert(i2c_rxAck(I2C_CTRL_CAM)); // Optional check
f9000f14:	f8016537          	lui	a0,0xf8016
f9000f18:	d15ff0ef          	jal	f9000c2c <i2c_rxAck>
f9000f1c:	97dff0ef          	jal	f9000898 <assert>
f9000f20:	000017b7          	lui	a5,0x1
f9000f24:	bff78793          	addi	a5,a5,-1025 # bff <CUSTOM2+0xba4>
f9000f28:	00f9a023          	sw	a5,0(s3)

	i2c_txByte(I2C_CTRL_CAM, 0xFF);
	i2c_txNackBlocking(I2C_CTRL_CAM);
f9000f2c:	f8016537          	lui	a0,0xf8016
f9000f30:	cc1ff0ef          	jal	f9000bf0 <i2c_txNackBlocking>
	assert(i2c_rxNack(I2C_CTRL_CAM)); // Optional check
f9000f34:	f8016537          	lui	a0,0xf8016
f9000f38:	ce5ff0ef          	jal	f9000c1c <i2c_rxNack>
f9000f3c:	95dff0ef          	jal	f9000898 <assert>
	outdata = i2c_rxData(I2C_CTRL_CAM);
f9000f40:	f8016537          	lui	a0,0xf8016
f9000f44:	ccdff0ef          	jal	f9000c10 <i2c_rxData>
f9000f48:	0ff57413          	zext.b	s0,a0

	i2c_masterStopBlocking(I2C_CTRL_CAM);
f9000f4c:	f8016537          	lui	a0,0xf8016
f9000f50:	c71ff0ef          	jal	f9000bc0 <i2c_masterStopBlocking>

	return outdata;
}
f9000f54:	00040513          	mv	a0,s0
f9000f58:	01c12083          	lw	ra,28(sp)
f9000f5c:	01812403          	lw	s0,24(sp)
f9000f60:	01412483          	lw	s1,20(sp)
f9000f64:	01012903          	lw	s2,16(sp)
f9000f68:	00c12983          	lw	s3,12(sp)
f9000f6c:	02010113          	addi	sp,sp,32
f9000f70:	00008067          	ret

f9000f74 <IMX900_init>:
{
	PiCamV3_TestPattern(Enable, mode);
}


void IMX900_init(CameraRes_t res){
f9000f74:	fc010113          	addi	sp,sp,-64
f9000f78:	02112e23          	sw	ra,60(sp)
f9000f7c:	02812c23          	sw	s0,56(sp)
	u8 data;
	static int fun_num = 0;
    update_video_timing(videoParams[fun_num].timing);
f9000f80:	f90057b7          	lui	a5,0xf9005
f9000f84:	ae078793          	addi	a5,a5,-1312 # f9004ae0 <videoParams>
f9000f88:	0007ae03          	lw	t3,0(a5)
f9000f8c:	0047a303          	lw	t1,4(a5)
f9000f90:	0087a883          	lw	a7,8(a5)
f9000f94:	00c7a803          	lw	a6,12(a5)
f9000f98:	0107a503          	lw	a0,16(a5)
f9000f9c:	0147a583          	lw	a1,20(a5)
f9000fa0:	0187a603          	lw	a2,24(a5)
f9000fa4:	01c7a683          	lw	a3,28(a5)
f9000fa8:	0207a703          	lw	a4,32(a5)
f9000fac:	0247a783          	lw	a5,36(a5)
f9000fb0:	01c12023          	sw	t3,0(sp)
f9000fb4:	00612223          	sw	t1,4(sp)
f9000fb8:	01112423          	sw	a7,8(sp)
f9000fbc:	01012623          	sw	a6,12(sp)
f9000fc0:	00a12823          	sw	a0,16(sp)
f9000fc4:	00b12a23          	sw	a1,20(sp)
f9000fc8:	00c12c23          	sw	a2,24(sp)
f9000fcc:	00d12e23          	sw	a3,28(sp)
f9000fd0:	02e12023          	sw	a4,32(sp)
f9000fd4:	02f12223          	sw	a5,36(sp)
f9000fd8:	00010513          	mv	a0,sp
f9000fdc:	dc0ff0ef          	jal	f900059c <update_video_timing>

	WRITE_REGS_MODULE(module_common_regs);
f9000fe0:	00000413          	li	s0,0
f9000fe4:	0280006f          	j	f900100c <IMX900_init+0x98>
f9000fe8:	f90057b7          	lui	a5,0xf9005
f9000fec:	00241713          	slli	a4,s0,0x2
f9000ff0:	d1078793          	addi	a5,a5,-752 # f9004d10 <module_common_regs>
f9000ff4:	00e787b3          	add	a5,a5,a4
    WriteRegData(0x10, reg, data);
f9000ff8:	0027c603          	lbu	a2,2(a5)
f9000ffc:	0007d583          	lhu	a1,0(a5)
f9001000:	01000513          	li	a0,16
f9001004:	d69ff0ef          	jal	f9000d6c <WriteRegData>
	WRITE_REGS_MODULE(module_common_regs);
f9001008:	00140413          	addi	s0,s0,1
f900100c:	00400793          	li	a5,4
f9001010:	fc87fce3          	bgeu	a5,s0,f9000fe8 <IMX900_init+0x74>
	data = ReadRegData(0x10, 0x0101);
f9001014:	10100593          	li	a1,257
f9001018:	01000513          	li	a0,16
f900101c:	e35ff0ef          	jal	f9000e50 <ReadRegData>
	while(1){
		data = ReadRegData(0x10, 0x0101);
f9001020:	10100593          	li	a1,257
f9001024:	01000513          	li	a0,16
f9001028:	e29ff0ef          	jal	f9000e50 <ReadRegData>
		if (data == 0x80) {
f900102c:	08000793          	li	a5,128
f9001030:	00f50e63          	beq	a0,a5,f900104c <IMX900_init+0xd8>
			bsp_printf("CModule Init Passed\r\n");
			break;
		}else if (data == 0x01){
f9001034:	00100793          	li	a5,1
f9001038:	fef514e3          	bne	a0,a5,f9001020 <IMX900_init+0xac>
			bsp_printf("CModule Init Failed\r\n");
f900103c:	f9005537          	lui	a0,0xf9005
f9001040:	81050513          	addi	a0,a0,-2032 # f9004810 <_data+0x160>
f9001044:	bf9ff0ef          	jal	f9000c3c <bsp_printf>
			break;
f9001048:	0100006f          	j	f9001058 <IMX900_init+0xe4>
			bsp_printf("CModule Init Passed\r\n");
f900104c:	f9004537          	lui	a0,0xf9004
f9001050:	7f850513          	addi	a0,a0,2040 # f90047f8 <_data+0x148>
f9001054:	be9ff0ef          	jal	f9000c3c <bsp_printf>
		}else{
		}
	}
	//bsp_uDelay(1000*1000);
	//WRITE_REGS_IMX900(imx900_common_regs);
	bsp_uDelay(1000*1000);
f9001058:	f8b00637          	lui	a2,0xf8b00
f900105c:	05f5e5b7          	lui	a1,0x5f5e
f9001060:	10058593          	addi	a1,a1,256 # 5f5e100 <__stack_size+0x5f5d100>
f9001064:	000f4537          	lui	a0,0xf4
f9001068:	24050513          	addi	a0,a0,576 # f4240 <__stack_size+0xf3240>
f900106c:	89dff0ef          	jal	f9000908 <clint_uDelay>
	WRITE_REGS_IMX900(imx900_regs_0);
f9001070:	00000413          	li	s0,0
f9001074:	0280006f          	j	f900109c <IMX900_init+0x128>
f9001078:	f90057b7          	lui	a5,0xf9005
f900107c:	00241713          	slli	a4,s0,0x2
f9001080:	c9478793          	addi	a5,a5,-876 # f9004c94 <imx900_regs_0>
f9001084:	00e787b3          	add	a5,a5,a4
    WriteRegData(0x1A, reg, data);
f9001088:	0027c603          	lbu	a2,2(a5)
f900108c:	0007d583          	lhu	a1,0(a5)
f9001090:	01a00513          	li	a0,26
f9001094:	cd9ff0ef          	jal	f9000d6c <WriteRegData>
	WRITE_REGS_IMX900(imx900_regs_0);
f9001098:	00140413          	addi	s0,s0,1
f900109c:	01e00793          	li	a5,30
f90010a0:	fc87fce3          	bgeu	a5,s0,f9001078 <IMX900_init+0x104>
	bsp_uDelay(1000*1000);
f90010a4:	f8b00637          	lui	a2,0xf8b00
f90010a8:	05f5e5b7          	lui	a1,0x5f5e
f90010ac:	10058593          	addi	a1,a1,256 # 5f5e100 <__stack_size+0x5f5d100>
f90010b0:	000f4537          	lui	a0,0xf4
f90010b4:	24050513          	addi	a0,a0,576 # f4240 <__stack_size+0xf3240>
f90010b8:	851ff0ef          	jal	f9000908 <clint_uDelay>

	 write_apb_reg(fun_num, REG_PIXEL_MODE);
f90010bc:	07c00593          	li	a1,124
f90010c0:	00000513          	li	a0,0
f90010c4:	cc8ff0ef          	jal	f900058c <write_apb_reg>
}
f90010c8:	03c12083          	lw	ra,60(sp)
f90010cc:	03812403          	lw	s0,56(sp)
f90010d0:	04010113          	addi	sp,sp,64
f90010d4:	00008067          	ret

f90010d8 <Gainfilter>:

void Gainfilter(u16 AGain, u16 DGain)
{
f90010d8:	ff010113          	addi	sp,sp,-16
f90010dc:	00112623          	sw	ra,12(sp)
f90010e0:	00812423          	sw	s0,8(sp)
f90010e4:	00058413          	mv	s0,a1
    WriteRegData(0x1A, reg, data);
f90010e8:	0085d613          	srli	a2,a1,0x8
f90010ec:	000035b7          	lui	a1,0x3
f90010f0:	51558593          	addi	a1,a1,1301 # 3515 <__stack_size+0x2515>
f90010f4:	01a00513          	li	a0,26
f90010f8:	c75ff0ef          	jal	f9000d6c <WriteRegData>
f90010fc:	0ff47613          	zext.b	a2,s0
f9001100:	000035b7          	lui	a1,0x3
f9001104:	51458593          	addi	a1,a1,1300 # 3514 <__stack_size+0x2514>
f9001108:	01a00513          	li	a0,26
f900110c:	c61ff0ef          	jal	f9000d6c <WriteRegData>
	u8 ret=0;
	WriteRegData_1A(IMX900_REG_DIGITAL_GAIN, (u8)(DGain >> 8));    //MSB
	WriteRegData_1A(IMX900_REG_ANALOG_GAIN, (u8)(DGain & 0xff));  //LSB
}
f9001110:	00c12083          	lw	ra,12(sp)
f9001114:	00812403          	lw	s0,8(sp)
f9001118:	01010113          	addi	sp,sp,16
f900111c:	00008067          	ret

f9001120 <clamp>:
    u32 cnt = read_u32(ISP_APB + 4);
    // *4 because 1 cycle = 4 pixels
    return sum/cnt;
}

static float clamp(float val, float min, float max) {
f9001120:	ff010113          	addi	sp,sp,-16
f9001124:	00112623          	sw	ra,12(sp)
f9001128:	00812423          	sw	s0,8(sp)
f900112c:	00912223          	sw	s1,4(sp)
f9001130:	01212023          	sw	s2,0(sp)
f9001134:	00050493          	mv	s1,a0
f9001138:	00058413          	mv	s0,a1
f900113c:	00060913          	mv	s2,a2
    return val < min ? min : val > max ? max : val;
f9001140:	1a1020ef          	jal	f9003ae0 <__lesf2>
f9001144:	00054c63          	bltz	a0,f900115c <clamp+0x3c>
f9001148:	00090593          	mv	a1,s2
f900114c:	00048513          	mv	a0,s1
f9001150:	0c9020ef          	jal	f9003a18 <__gesf2>
f9001154:	02a05263          	blez	a0,f9001178 <clamp+0x58>
f9001158:	00090413          	mv	s0,s2
}
f900115c:	00040513          	mv	a0,s0
f9001160:	00c12083          	lw	ra,12(sp)
f9001164:	00812403          	lw	s0,8(sp)
f9001168:	00412483          	lw	s1,4(sp)
f900116c:	00012903          	lw	s2,0(sp)
f9001170:	01010113          	addi	sp,sp,16
f9001174:	00008067          	ret
    return val < min ? min : val > max ? max : val;
f9001178:	00048413          	mv	s0,s1
f900117c:	fe1ff06f          	j	f900115c <clamp+0x3c>

f9001180 <update_incremental>:

static u32 update_incremental(PidIncremental *pid, u32 point) {
f9001180:	fe010113          	addi	sp,sp,-32
f9001184:	00112e23          	sw	ra,28(sp)
f9001188:	00812c23          	sw	s0,24(sp)
f900118c:	00912a23          	sw	s1,20(sp)
f9001190:	01212823          	sw	s2,16(sp)
f9001194:	01312623          	sw	s3,12(sp)
f9001198:	01412423          	sw	s4,8(sp)
f900119c:	00050413          	mv	s0,a0
    pid->err = pid->set_point - point;
f90011a0:	00c52483          	lw	s1,12(a0)
f90011a4:	00058513          	mv	a0,a1
f90011a8:	368030ef          	jal	f9004510 <__floatunsisf>
f90011ac:	00050593          	mv	a1,a0
f90011b0:	00048513          	mv	a0,s1
f90011b4:	5dd020ef          	jal	f9003f90 <__subsf3>
f90011b8:	00050493          	mv	s1,a0
f90011bc:	00a42823          	sw	a0,16(s0)

    float increment_val = 
        pid->kp*(pid->err - pid->err_next) + 
f90011c0:	01c42983          	lw	s3,28(s0)
f90011c4:	01442903          	lw	s2,20(s0)
f90011c8:	00090593          	mv	a1,s2
f90011cc:	5c5020ef          	jal	f9003f90 <__subsf3>
f90011d0:	00050593          	mv	a1,a0
f90011d4:	00098513          	mv	a0,s3
f90011d8:	1d9020ef          	jal	f9003bb0 <__mulsf3>
f90011dc:	00050993          	mv	s3,a0
        pid->ki*pid->err + 
f90011e0:	02042583          	lw	a1,32(s0)
f90011e4:	00048513          	mv	a0,s1
f90011e8:	1c9020ef          	jal	f9003bb0 <__mulsf3>
f90011ec:	00050593          	mv	a1,a0
        pid->kp*(pid->err - pid->err_next) + 
f90011f0:	00098513          	mv	a0,s3
f90011f4:	34c020ef          	jal	f9003540 <__addsf3>
f90011f8:	00050993          	mv	s3,a0
        pid->kd*(pid->err - 2 * pid->err_next + pid->err_last);
f90011fc:	02442a03          	lw	s4,36(s0)
f9001200:	00090593          	mv	a1,s2
f9001204:	00090513          	mv	a0,s2
f9001208:	338020ef          	jal	f9003540 <__addsf3>
f900120c:	00050593          	mv	a1,a0
f9001210:	00048513          	mv	a0,s1
f9001214:	57d020ef          	jal	f9003f90 <__subsf3>
f9001218:	01842583          	lw	a1,24(s0)
f900121c:	324020ef          	jal	f9003540 <__addsf3>
f9001220:	00050593          	mv	a1,a0
f9001224:	000a0513          	mv	a0,s4
f9001228:	189020ef          	jal	f9003bb0 <__mulsf3>
f900122c:	00050593          	mv	a1,a0
    float increment_val = 
f9001230:	00098513          	mv	a0,s3
f9001234:	30c020ef          	jal	f9003540 <__addsf3>

    increment_val = clamp(increment_val, -1*pid->incr_limit, pid->incr_limit);
f9001238:	00042603          	lw	a2,0(s0)
f900123c:	800009b7          	lui	s3,0x80000
f9001240:	00c9c5b3          	xor	a1,s3,a2
f9001244:	eddff0ef          	jal	f9001120 <clamp>
f9001248:	00050593          	mv	a1,a0
    pid->actual_val += increment_val;
f900124c:	00842503          	lw	a0,8(s0)
f9001250:	2f0020ef          	jal	f9003540 <__addsf3>
f9001254:	00a42423          	sw	a0,8(s0)
    pid->actual_val = clamp(pid->actual_val, -1*pid->output_limit, pid->output_limit);
f9001258:	00442603          	lw	a2,4(s0)
f900125c:	00c9c5b3          	xor	a1,s3,a2
f9001260:	ec1ff0ef          	jal	f9001120 <clamp>
f9001264:	00a42423          	sw	a0,8(s0)
    
    pid->err_last = pid->err_next;
f9001268:	01242c23          	sw	s2,24(s0)
    pid->err_next = pid->err;
f900126c:	00942a23          	sw	s1,20(s0)
    return pid->actual_val;
f9001270:	240030ef          	jal	f90044b0 <__fixunssfsi>
}
f9001274:	01c12083          	lw	ra,28(sp)
f9001278:	01812403          	lw	s0,24(sp)
f900127c:	01412483          	lw	s1,20(sp)
f9001280:	01012903          	lw	s2,16(sp)
f9001284:	00c12983          	lw	s3,12(sp)
f9001288:	00812a03          	lw	s4,8(sp)
f900128c:	02010113          	addi	sp,sp,32
f9001290:	00008067          	ret

f9001294 <isp_set_color_balance>:
f9001294:	f81007b7          	lui	a5,0xf8100
f9001298:	00a7a423          	sw	a0,8(a5) # f8100008 <__stack_size+0xf80ff008>
f900129c:	f81007b7          	lui	a5,0xf8100
f90012a0:	00b7a623          	sw	a1,12(a5) # f810000c <__stack_size+0xf80ff00c>
f90012a4:	f81007b7          	lui	a5,0xf8100
f90012a8:	00c7a823          	sw	a2,16(a5) # f8100010 <__stack_size+0xf80ff010>
}
f90012ac:	00008067          	ret

f90012b0 <isp_get_expose_avg>:
        return *((volatile u32*) address);
f90012b0:	f81007b7          	lui	a5,0xf8100
f90012b4:	0007a503          	lw	a0,0(a5) # f8100000 <__stack_size+0xf80ff000>
f90012b8:	00478793          	addi	a5,a5,4
f90012bc:	0007a783          	lw	a5,0(a5)
}
f90012c0:	02f55533          	divu	a0,a0,a5
f90012c4:	00008067          	ret

f90012c8 <isp_update_gain>:
        output[i] = output[i-1] + (alpha*(input[i] - output[i-1])); 
    }
    return output[points-1];
}     

u32 isp_update_gain(u32 current_gain) {
f90012c8:	ff010113          	addi	sp,sp,-16
f90012cc:	00112623          	sw	ra,12(sp)
    // incremental pid
    static float input[10];
    static float output[10];
    u32 avg = isp_get_expose_avg();
f90012d0:	fe1ff0ef          	jal	f90012b0 <isp_get_expose_avg>
f90012d4:	00050593          	mv	a1,a0
    // memcpy(input, input+1, sizeof(float)*9);
    // input[9] = avg;
    // s32 avg_filter = lowPassFrequency(input, output, 10);

    return update_incremental(&exp_pid, avg);
f90012d8:	86018513          	addi	a0,gp,-1952 # f9004fb8 <exp_pid>
f90012dc:	ea5ff0ef          	jal	f9001180 <update_incremental>
}
f90012e0:	00c12083          	lw	ra,12(sp)
f90012e4:	01010113          	addi	sp,sp,16
f90012e8:	00008067          	ret

f90012ec <isp_set_setpoint>:
//         }
//         bsp_printf("\r\n");
//     }
// }

void isp_set_setpoint(u32 exp_setpoint) {
f90012ec:	ff010113          	addi	sp,sp,-16
f90012f0:	00112623          	sw	ra,12(sp)
f90012f4:	00812423          	sw	s0,8(sp)
    exp_pid.set_point = exp_setpoint;
f90012f8:	218030ef          	jal	f9004510 <__floatunsisf>
f90012fc:	86018413          	addi	s0,gp,-1952 # f9004fb8 <exp_pid>
f9001300:	00a42623          	sw	a0,12(s0)
}
f9001304:	00c12083          	lw	ra,12(sp)
f9001308:	00812403          	lw	s0,8(sp)
f900130c:	01010113          	addi	sp,sp,16
f9001310:	00008067          	ret

f9001314 <isp_init>:

void isp_init(u32 exp_setpoint) {
f9001314:	ff010113          	addi	sp,sp,-16
f9001318:	00112623          	sw	ra,12(sp)
f900131c:	00812423          	sw	s0,8(sp)
f9001320:	00912223          	sw	s1,4(sp)
    exp_pid.actual_val=0.0;
f9001324:	86018413          	addi	s0,gp,-1952 # f9004fb8 <exp_pid>
f9001328:	00000493          	li	s1,0
f900132c:	00942423          	sw	s1,8(s0)
    exp_pid.set_point=exp_setpoint;
f9001330:	1e0030ef          	jal	f9004510 <__floatunsisf>
f9001334:	00a42623          	sw	a0,12(s0)
   // exp_pid.incr_limit = 1000.0;
   // exp_pid.output_limit = 4000.0;
    exp_pid.incr_limit = 100.0;
f9001338:	8281a783          	lw	a5,-2008(gp) # f9004f80 <prev_dig_gain.4+0x14>
f900133c:	00f42023          	sw	a5,0(s0)
    exp_pid.output_limit = 480.0;
f9001340:	82c1a783          	lw	a5,-2004(gp) # f9004f84 <prev_dig_gain.4+0x18>
f9001344:	00f42223          	sw	a5,4(s0)
    exp_pid.err_last = 0.0;
f9001348:	00942c23          	sw	s1,24(s0)
    // exp_pid.acc_err = 0.0;
    exp_pid.kp = 0.1;
f900134c:	8301a783          	lw	a5,-2000(gp) # f9004f88 <prev_dig_gain.4+0x1c>
f9001350:	00f42e23          	sw	a5,28(s0)
    exp_pid.ki = 0.11;
f9001354:	8341a783          	lw	a5,-1996(gp) # f9004f8c <prev_dig_gain.4+0x20>
f9001358:	02f42023          	sw	a5,32(s0)
    exp_pid.kd = 0.15;
f900135c:	8381a783          	lw	a5,-1992(gp) # f9004f90 <prev_dig_gain.4+0x24>
f9001360:	02f42223          	sw	a5,36(s0)
}
f9001364:	00c12083          	lw	ra,12(sp)
f9001368:	00812403          	lw	s0,8(sp)
f900136c:	00412483          	lw	s1,4(sp)
f9001370:	01010113          	addi	sp,sp,16
f9001374:	00008067          	ret

f9001378 <uart_writeAvailability>:
f9001378:	00452503          	lw	a0,4(a0)
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
f900137c:	01055513          	srli	a0,a0,0x10
    }
f9001380:	0ff57513          	zext.b	a0,a0
f9001384:	00008067          	ret

f9001388 <uart_readOccupancy>:
f9001388:	00452503          	lw	a0,4(a0)
    }
f900138c:	01855513          	srli	a0,a0,0x18
f9001390:	00008067          	ret

f9001394 <uart_write>:
    static void uart_write(u32 reg, char data){
f9001394:	ff010113          	addi	sp,sp,-16
f9001398:	00112623          	sw	ra,12(sp)
f900139c:	00812423          	sw	s0,8(sp)
f90013a0:	00912223          	sw	s1,4(sp)
f90013a4:	00050413          	mv	s0,a0
f90013a8:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
f90013ac:	00040513          	mv	a0,s0
f90013b0:	fc9ff0ef          	jal	f9001378 <uart_writeAvailability>
f90013b4:	fe050ce3          	beqz	a0,f90013ac <uart_write+0x18>
        *((volatile u32*) address) = data;
f90013b8:	00942023          	sw	s1,0(s0)
    }
f90013bc:	00c12083          	lw	ra,12(sp)
f90013c0:	00812403          	lw	s0,8(sp)
f90013c4:	00412483          	lw	s1,4(sp)
f90013c8:	01010113          	addi	sp,sp,16
f90013cc:	00008067          	ret

f90013d0 <uart_read>:
* @note    The function waits until there is data available in the UART buffer
*          for reading. Once data is available, it reads the character data from
*          the UART data register and returns it.
*
******************************************************************************/
    static char uart_read(u32 reg){
f90013d0:	ff010113          	addi	sp,sp,-16
f90013d4:	00112623          	sw	ra,12(sp)
f90013d8:	00812423          	sw	s0,8(sp)
f90013dc:	00050413          	mv	s0,a0
        while(uart_readOccupancy(reg) == 0);
f90013e0:	00040513          	mv	a0,s0
f90013e4:	fa5ff0ef          	jal	f9001388 <uart_readOccupancy>
f90013e8:	fe050ce3          	beqz	a0,f90013e0 <uart_read+0x10>
        return *((volatile u32*) address);
f90013ec:	00042503          	lw	a0,0(s0)
        return read_u32(reg + UART_DATA);
    }
f90013f0:	0ff57513          	zext.b	a0,a0
f90013f4:	00c12083          	lw	ra,12(sp)
f90013f8:	00812403          	lw	s0,8(sp)
f90013fc:	01010113          	addi	sp,sp,16
f9001400:	00008067          	ret

f9001404 <uart_applyConfig>:
*          value using data length, parity, and stop bit settings from the configuration
*          structure, and writes this value to the UART frame configuration register.
*
******************************************************************************/
    static void uart_applyConfig(u32 reg, Uart_Config *config){
        write_u32(config->clockDivider, reg + UART_CLOCK_DIVIDER);
f9001404:	00c5a783          	lw	a5,12(a1)
        *((volatile u32*) address) = data;
f9001408:	00f52423          	sw	a5,8(a0)
        write_u32(((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16), reg + UART_FRAME_CONFIG);
f900140c:	0005a783          	lw	a5,0(a1)
f9001410:	fff78793          	addi	a5,a5,-1
f9001414:	0045a703          	lw	a4,4(a1)
f9001418:	00871713          	slli	a4,a4,0x8
f900141c:	00e7e7b3          	or	a5,a5,a4
f9001420:	0085a703          	lw	a4,8(a1)
f9001424:	01071713          	slli	a4,a4,0x10
f9001428:	00e7e7b3          	or	a5,a5,a4
f900142c:	00f52623          	sw	a5,12(a0)
    }
f9001430:	00008067          	ret

f9001434 <clint_uDelay>:
        u32 mTimePerUsec = hz/1000000;
f9001434:	000f47b7          	lui	a5,0xf4
f9001438:	24078793          	addi	a5,a5,576 # f4240 <__stack_size+0xf3240>
f900143c:	02f5d5b3          	divu	a1,a1,a5
    readReg_u32 (clint_getTimeLow , CLINT_TIME_ADDR)
f9001440:	0000c7b7          	lui	a5,0xc
f9001444:	ff878793          	addi	a5,a5,-8 # bff8 <__stack_size+0xaff8>
f9001448:	00f60633          	add	a2,a2,a5
        return *((volatile u32*) address);
f900144c:	00062783          	lw	a5,0(a2) # f8b00000 <__stack_size+0xf8aff000>
        u32 limit = clint_getTimeLow(reg) + usec*mTimePerUsec;
f9001450:	02a585b3          	mul	a1,a1,a0
f9001454:	00f58733          	add	a4,a1,a5
f9001458:	00062783          	lw	a5,0(a2)
        while((int32_t)(limit-(clint_getTimeLow(reg))) >= 0);
f900145c:	40f707b3          	sub	a5,a4,a5
f9001460:	fe07dce3          	bgez	a5,f9001458 <clint_uDelay+0x24>
f9001464:	00008067          	ret

f9001468 <_putchar>:
    static void _putchar(char character){
f9001468:	ff010113          	addi	sp,sp,-16
f900146c:	00112623          	sw	ra,12(sp)
f9001470:	00050593          	mv	a1,a0
            bsp_putChar(character);
f9001474:	f8010537          	lui	a0,0xf8010
f9001478:	f1dff0ef          	jal	f9001394 <uart_write>
    }
f900147c:	00c12083          	lw	ra,12(sp)
f9001480:	01010113          	addi	sp,sp,16
f9001484:	00008067          	ret

f9001488 <_putchar_s>:
    {
f9001488:	ff010113          	addi	sp,sp,-16
f900148c:	00112623          	sw	ra,12(sp)
f9001490:	00812423          	sw	s0,8(sp)
f9001494:	00050413          	mv	s0,a0
        while (*p)
f9001498:	00c0006f          	j	f90014a4 <_putchar_s+0x1c>
            _putchar(*(p++));
f900149c:	00140413          	addi	s0,s0,1
f90014a0:	fc9ff0ef          	jal	f9001468 <_putchar>
        while (*p)
f90014a4:	00044503          	lbu	a0,0(s0)
f90014a8:	fe051ae3          	bnez	a0,f900149c <_putchar_s+0x14>
    }
f90014ac:	00c12083          	lw	ra,12(sp)
f90014b0:	00812403          	lw	s0,8(sp)
f90014b4:	01010113          	addi	sp,sp,16
f90014b8:	00008067          	ret

f90014bc <bsp_printHex>:
    {
f90014bc:	ff010113          	addi	sp,sp,-16
f90014c0:	00112623          	sw	ra,12(sp)
f90014c4:	00812423          	sw	s0,8(sp)
f90014c8:	00912223          	sw	s1,4(sp)
f90014cc:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f90014d0:	01c00413          	li	s0,28
f90014d4:	0240006f          	j	f90014f8 <bsp_printHex+0x3c>
            _putchar("0123456789ABCDEF"[(val >> i) % 16]);
f90014d8:	0084d733          	srl	a4,s1,s0
f90014dc:	00f77713          	andi	a4,a4,15
f90014e0:	f90047b7          	lui	a5,0xf9004
f90014e4:	6b078793          	addi	a5,a5,1712 # f90046b0 <_data>
f90014e8:	00e787b3          	add	a5,a5,a4
f90014ec:	0007c503          	lbu	a0,0(a5)
f90014f0:	f79ff0ef          	jal	f9001468 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f90014f4:	ffc40413          	addi	s0,s0,-4
f90014f8:	fe0450e3          	bgez	s0,f90014d8 <bsp_printHex+0x1c>
    }
f90014fc:	00c12083          	lw	ra,12(sp)
f9001500:	00812403          	lw	s0,8(sp)
f9001504:	00412483          	lw	s1,4(sp)
f9001508:	01010113          	addi	sp,sp,16
f900150c:	00008067          	ret

f9001510 <bsp_printHex_lower>:
    {
f9001510:	ff010113          	addi	sp,sp,-16
f9001514:	00112623          	sw	ra,12(sp)
f9001518:	00812423          	sw	s0,8(sp)
f900151c:	00912223          	sw	s1,4(sp)
f9001520:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9001524:	01c00413          	li	s0,28
f9001528:	0240006f          	j	f900154c <bsp_printHex_lower+0x3c>
            _putchar("0123456789abcdef"[(val >> i) % 16]);
f900152c:	0084d733          	srl	a4,s1,s0
f9001530:	00f77713          	andi	a4,a4,15
f9001534:	f90047b7          	lui	a5,0xf9004
f9001538:	6c478793          	addi	a5,a5,1732 # f90046c4 <_data+0x14>
f900153c:	00e787b3          	add	a5,a5,a4
f9001540:	0007c503          	lbu	a0,0(a5)
f9001544:	f25ff0ef          	jal	f9001468 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9001548:	ffc40413          	addi	s0,s0,-4
f900154c:	fe0450e3          	bgez	s0,f900152c <bsp_printHex_lower+0x1c>
    }
f9001550:	00c12083          	lw	ra,12(sp)
f9001554:	00812403          	lw	s0,8(sp)
f9001558:	00412483          	lw	s1,4(sp)
f900155c:	01010113          	addi	sp,sp,16
f9001560:	00008067          	ret

f9001564 <bsp_printf_c>:
    {
f9001564:	ff010113          	addi	sp,sp,-16
f9001568:	00112623          	sw	ra,12(sp)
        _putchar(c);
f900156c:	0ff57513          	zext.b	a0,a0
f9001570:	ef9ff0ef          	jal	f9001468 <_putchar>
    }
f9001574:	00c12083          	lw	ra,12(sp)
f9001578:	01010113          	addi	sp,sp,16
f900157c:	00008067          	ret

f9001580 <bsp_printf_s>:
    {
f9001580:	ff010113          	addi	sp,sp,-16
f9001584:	00112623          	sw	ra,12(sp)
        _putchar_s(p);
f9001588:	f01ff0ef          	jal	f9001488 <_putchar_s>
    }
f900158c:	00c12083          	lw	ra,12(sp)
f9001590:	01010113          	addi	sp,sp,16
f9001594:	00008067          	ret

f9001598 <bsp_printf_d>:
    {
f9001598:	fd010113          	addi	sp,sp,-48
f900159c:	02112623          	sw	ra,44(sp)
f90015a0:	02812423          	sw	s0,40(sp)
f90015a4:	02912223          	sw	s1,36(sp)
f90015a8:	00050493          	mv	s1,a0
        if (val < 0) {
f90015ac:	00054663          	bltz	a0,f90015b8 <bsp_printf_d+0x20>
    {
f90015b0:	00010413          	mv	s0,sp
f90015b4:	02c0006f          	j	f90015e0 <bsp_printf_d+0x48>
            bsp_printf_c('-');
f90015b8:	02d00513          	li	a0,45
f90015bc:	fa9ff0ef          	jal	f9001564 <bsp_printf_c>
            val = -val;
f90015c0:	409004b3          	neg	s1,s1
f90015c4:	fedff06f          	j	f90015b0 <bsp_printf_d+0x18>
            *(p++) = '0' + val % 10;
f90015c8:	00a00713          	li	a4,10
f90015cc:	02e4e7b3          	rem	a5,s1,a4
f90015d0:	03078793          	addi	a5,a5,48
f90015d4:	00f40023          	sb	a5,0(s0)
            val = val / 10;
f90015d8:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
f90015dc:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
f90015e0:	fe0494e3          	bnez	s1,f90015c8 <bsp_printf_d+0x30>
f90015e4:	00010793          	mv	a5,sp
f90015e8:	fef400e3          	beq	s0,a5,f90015c8 <bsp_printf_d+0x30>
        while (p != buffer)
f90015ec:	00010793          	mv	a5,sp
f90015f0:	00f40a63          	beq	s0,a5,f9001604 <bsp_printf_d+0x6c>
            bsp_printf_c(*(--p));
f90015f4:	fff40413          	addi	s0,s0,-1
f90015f8:	00044503          	lbu	a0,0(s0)
f90015fc:	f69ff0ef          	jal	f9001564 <bsp_printf_c>
f9001600:	fedff06f          	j	f90015ec <bsp_printf_d+0x54>
    }
f9001604:	02c12083          	lw	ra,44(sp)
f9001608:	02812403          	lw	s0,40(sp)
f900160c:	02412483          	lw	s1,36(sp)
f9001610:	03010113          	addi	sp,sp,48
f9001614:	00008067          	ret

f9001618 <bsp_printf_x>:
    {
f9001618:	ff010113          	addi	sp,sp,-16
f900161c:	00112623          	sw	ra,12(sp)
        for(i=0;i<8;i++)
f9001620:	00000713          	li	a4,0
f9001624:	00700793          	li	a5,7
f9001628:	02e7c063          	blt	a5,a4,f9001648 <bsp_printf_x+0x30>
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f900162c:	00271693          	slli	a3,a4,0x2
f9001630:	ff000793          	li	a5,-16
f9001634:	00d797b3          	sll	a5,a5,a3
f9001638:	00f577b3          	and	a5,a0,a5
f900163c:	00078663          	beqz	a5,f9001648 <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
f9001640:	00170713          	addi	a4,a4,1
f9001644:	fe1ff06f          	j	f9001624 <bsp_printf_x+0xc>
        bsp_printHex_lower(val);
f9001648:	ec9ff0ef          	jal	f9001510 <bsp_printHex_lower>
    }
f900164c:	00c12083          	lw	ra,12(sp)
f9001650:	01010113          	addi	sp,sp,16
f9001654:	00008067          	ret

f9001658 <bsp_printf_X>:
        {
f9001658:	ff010113          	addi	sp,sp,-16
f900165c:	00112623          	sw	ra,12(sp)
            for(i=0;i<8;i++)
f9001660:	00000713          	li	a4,0
f9001664:	00700793          	li	a5,7
f9001668:	02e7c063          	blt	a5,a4,f9001688 <bsp_printf_X+0x30>
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f900166c:	00271693          	slli	a3,a4,0x2
f9001670:	ff000793          	li	a5,-16
f9001674:	00d797b3          	sll	a5,a5,a3
f9001678:	00f577b3          	and	a5,a0,a5
f900167c:	00078663          	beqz	a5,f9001688 <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
f9001680:	00170713          	addi	a4,a4,1
f9001684:	fe1ff06f          	j	f9001664 <bsp_printf_X+0xc>
            bsp_printHex(val);
f9001688:	e35ff0ef          	jal	f90014bc <bsp_printHex>
        }
f900168c:	00c12083          	lw	ra,12(sp)
f9001690:	01010113          	addi	sp,sp,16
f9001694:	00008067          	ret

f9001698 <bsp_init>:
    *   1. UART baudrate
    *   2. 
    */
////////////////////////////////////////////////////////////////////////////////
    static void bsp_init()
    {
f9001698:	fe010113          	addi	sp,sp,-32
f900169c:	00112e23          	sw	ra,28(sp)
        Uart_Config uartConfig;
        uartConfig.dataLength   = BITS_8;
f90016a0:	00800793          	li	a5,8
f90016a4:	00f12023          	sw	a5,0(sp)
        uartConfig.parity       = NONE;
f90016a8:	00012223          	sw	zero,4(sp)
        uartConfig.stop         = ONE;
f90016ac:	00012423          	sw	zero,8(sp)
        uartConfig.clockDivider = BSP_CLINT_HZ/(BSP_UART_BAUDRATE*BSP_UART_DATA_LEN)-1;
f90016b0:	06b00793          	li	a5,107
f90016b4:	00f12623          	sw	a5,12(sp)
        uart_applyConfig(BSP_UART_TERMINAL, &uartConfig);    
f90016b8:	00010593          	mv	a1,sp
f90016bc:	f8010537          	lui	a0,0xf8010
f90016c0:	d45ff0ef          	jal	f9001404 <uart_applyConfig>
    }
f90016c4:	01c12083          	lw	ra,28(sp)
f90016c8:	02010113          	addi	sp,sp,32
f90016cc:	00008067          	ret

f90016d0 <plic_set_priority>:
*          specified priority value to the calculated address, effectively
*          setting the priority for the specified interrupt gateway in the PLIC.
*
******************************************************************************/
    static void plic_set_priority(u32 plic, u32 gateway, u32 priority){
        write_u32(priority, plic + PLIC_PRIORITY_BASE + gateway*4);
f90016d0:	00259593          	slli	a1,a1,0x2
f90016d4:	00a585b3          	add	a1,a1,a0
        *((volatile u32*) address) = data;
f90016d8:	00c5a023          	sw	a2,0(a1)
    }
f90016dc:	00008067          	ret

f90016e0 <plic_set_enable>:
*          to the enable register.
*
******************************************************************************/

    static void plic_set_enable(u32 plic, u32 target,u32 gateway, u32 enable){
        u32 word = plic + PLIC_ENABLE_BASE + target * PLIC_ENABLE_PER_HART + (gateway / 32 * 4);
f90016e0:	00759593          	slli	a1,a1,0x7
f90016e4:	00a585b3          	add	a1,a1,a0
f90016e8:	00565793          	srli	a5,a2,0x5
f90016ec:	00279793          	slli	a5,a5,0x2
f90016f0:	00f587b3          	add	a5,a1,a5
f90016f4:	00002737          	lui	a4,0x2
f90016f8:	00e787b3          	add	a5,a5,a4
        u32 mask = 1 << (gateway % 32);
f90016fc:	00100713          	li	a4,1
f9001700:	00c71633          	sll	a2,a4,a2
        if (enable)
f9001704:	00068a63          	beqz	a3,f9001718 <plic_set_enable+0x38>
        return *((volatile u32*) address);
f9001708:	0007a703          	lw	a4,0(a5)
            write_u32(read_u32(word) | mask, word);
f900170c:	00e66633          	or	a2,a2,a4
        *((volatile u32*) address) = data;
f9001710:	00c7a023          	sw	a2,0(a5)
    }
f9001714:	00008067          	ret
        return *((volatile u32*) address);
f9001718:	0007a703          	lw	a4,0(a5)
        else
            write_u32(read_u32(word) & ~mask, word);
f900171c:	fff64613          	not	a2,a2
f9001720:	00e67633          	and	a2,a2,a4
        *((volatile u32*) address) = data;
f9001724:	00c7a023          	sw	a2,0(a5)
    }
f9001728:	00008067          	ret

f900172c <plic_set_threshold>:
*          to the calculated address, effectively setting the threshold for the
*          specified target in the PLIC.
*
******************************************************************************/   
    static void plic_set_threshold(u32 plic, u32 target, u32 threshold){
        write_u32(threshold, plic + PLIC_THRESHOLD_BASE + target*PLIC_CONTEXT_PER_HART);
f900172c:	00c59593          	slli	a1,a1,0xc
f9001730:	00a585b3          	add	a1,a1,a0
f9001734:	002007b7          	lui	a5,0x200
f9001738:	00f585b3          	add	a1,a1,a5
f900173c:	00c5a023          	sw	a2,0(a1)
    }
f9001740:	00008067          	ret

f9001744 <plic_claim>:
*          value from the calculated address, effectively claiming an interrupt
*          for the specified target in the PLIC.
*
******************************************************************************/
    static u32 plic_claim(u32 plic, u32 target){
        return read_u32(plic + PLIC_CLAIM_BASE + target*PLIC_CONTEXT_PER_HART);
f9001744:	00c59593          	slli	a1,a1,0xc
f9001748:	00a585b3          	add	a1,a1,a0
f900174c:	002007b7          	lui	a5,0x200
f9001750:	00478793          	addi	a5,a5,4 # 200004 <__stack_size+0x1ff004>
f9001754:	00f585b3          	add	a1,a1,a5
        return *((volatile u32*) address);
f9001758:	0005a503          	lw	a0,0(a1)
    }
f900175c:	00008067          	ret

f9001760 <plic_release>:
*          to the calculated address, effectively releasing the claimed interrupt
*          for the specified target in the PLIC.
*
******************************************************************************/
    static void plic_release(u32 plic, u32 target, u32 gateway){
        write_u32(gateway,plic + PLIC_CLAIM_BASE + target*PLIC_CONTEXT_PER_HART);
f9001760:	00c59593          	slli	a1,a1,0xc
f9001764:	00a585b3          	add	a1,a1,a0
f9001768:	002007b7          	lui	a5,0x200
f900176c:	00478793          	addi	a5,a5,4 # 200004 <__stack_size+0x1ff004>
f9001770:	00f585b3          	add	a1,a1,a5
        *((volatile u32*) address) = data;
f9001774:	00c5a023          	sw	a2,0(a1)
    }
f9001778:	00008067          	ret

f900177c <bsp_printf>:
    {
f900177c:	fc010113          	addi	sp,sp,-64
f9001780:	00112e23          	sw	ra,28(sp)
f9001784:	00812c23          	sw	s0,24(sp)
f9001788:	00912a23          	sw	s1,20(sp)
f900178c:	00050493          	mv	s1,a0
f9001790:	02b12223          	sw	a1,36(sp)
f9001794:	02c12423          	sw	a2,40(sp)
f9001798:	02d12623          	sw	a3,44(sp)
f900179c:	02e12823          	sw	a4,48(sp)
f90017a0:	02f12a23          	sw	a5,52(sp)
f90017a4:	03012c23          	sw	a6,56(sp)
f90017a8:	03112e23          	sw	a7,60(sp)
        va_start(ap, format);
f90017ac:	02410793          	addi	a5,sp,36
f90017b0:	00f12623          	sw	a5,12(sp)
        for (i = 0; format[i]; i++)
f90017b4:	00000413          	li	s0,0
f90017b8:	01c0006f          	j	f90017d4 <bsp_printf+0x58>
                        bsp_printf_c(va_arg(ap,int));
f90017bc:	00c12783          	lw	a5,12(sp)
f90017c0:	00478713          	addi	a4,a5,4
f90017c4:	00e12623          	sw	a4,12(sp)
f90017c8:	0007a503          	lw	a0,0(a5)
f90017cc:	d99ff0ef          	jal	f9001564 <bsp_printf_c>
        for (i = 0; format[i]; i++)
f90017d0:	00140413          	addi	s0,s0,1
f90017d4:	008487b3          	add	a5,s1,s0
f90017d8:	0007c503          	lbu	a0,0(a5)
f90017dc:	0a050e63          	beqz	a0,f9001898 <bsp_printf+0x11c>
            if (format[i] == '%') {
f90017e0:	02500793          	li	a5,37
f90017e4:	06f50e63          	beq	a0,a5,f9001860 <bsp_printf+0xe4>
                bsp_printf_c(format[i]);
f90017e8:	d7dff0ef          	jal	f9001564 <bsp_printf_c>
f90017ec:	fe5ff06f          	j	f90017d0 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
f90017f0:	00c12783          	lw	a5,12(sp)
f90017f4:	00478713          	addi	a4,a5,4
f90017f8:	00e12623          	sw	a4,12(sp)
f90017fc:	0007a503          	lw	a0,0(a5)
f9001800:	d81ff0ef          	jal	f9001580 <bsp_printf_s>
                        break;
f9001804:	fcdff06f          	j	f90017d0 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
f9001808:	00c12783          	lw	a5,12(sp)
f900180c:	00478713          	addi	a4,a5,4
f9001810:	00e12623          	sw	a4,12(sp)
f9001814:	0007a503          	lw	a0,0(a5)
f9001818:	d81ff0ef          	jal	f9001598 <bsp_printf_d>
                        break;
f900181c:	fb5ff06f          	j	f90017d0 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
f9001820:	00c12783          	lw	a5,12(sp)
f9001824:	00478713          	addi	a4,a5,4
f9001828:	00e12623          	sw	a4,12(sp)
f900182c:	0007a503          	lw	a0,0(a5)
f9001830:	e29ff0ef          	jal	f9001658 <bsp_printf_X>
                        break;
f9001834:	f9dff06f          	j	f90017d0 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
f9001838:	00c12783          	lw	a5,12(sp)
f900183c:	00478713          	addi	a4,a5,4
f9001840:	00e12623          	sw	a4,12(sp)
f9001844:	0007a503          	lw	a0,0(a5)
f9001848:	dd1ff0ef          	jal	f9001618 <bsp_printf_x>
                        break;
f900184c:	f85ff06f          	j	f90017d0 <bsp_printf+0x54>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
f9001850:	f9004537          	lui	a0,0xf9004
f9001854:	6d850513          	addi	a0,a0,1752 # f90046d8 <_data+0x28>
f9001858:	d29ff0ef          	jal	f9001580 <bsp_printf_s>
                        break;
f900185c:	f75ff06f          	j	f90017d0 <bsp_printf+0x54>
                while (format[++i]) {
f9001860:	00140413          	addi	s0,s0,1
f9001864:	008487b3          	add	a5,s1,s0
f9001868:	0007c783          	lbu	a5,0(a5)
f900186c:	f60782e3          	beqz	a5,f90017d0 <bsp_printf+0x54>
                    if (format[i] == 'c') {
f9001870:	fa878793          	addi	a5,a5,-88
f9001874:	0ff7f693          	zext.b	a3,a5
f9001878:	02000713          	li	a4,32
f900187c:	fed762e3          	bltu	a4,a3,f9001860 <bsp_printf+0xe4>
f9001880:	00269793          	slli	a5,a3,0x2
f9001884:	f9005737          	lui	a4,0xf9005
f9001888:	d2470713          	addi	a4,a4,-732 # f9004d24 <module_common_regs+0x14>
f900188c:	00e787b3          	add	a5,a5,a4
f9001890:	0007a783          	lw	a5,0(a5)
f9001894:	00078067          	jr	a5
    }
f9001898:	01c12083          	lw	ra,28(sp)
f900189c:	01812403          	lw	s0,24(sp)
f90018a0:	01412483          	lw	s1,20(sp)
f90018a4:	04010113          	addi	sp,sp,64
f90018a8:	00008067          	ret

f90018ac <crash>:
void crash(char* causeType, u32 cause){
f90018ac:	ff010113          	addi	sp,sp,-16
f90018b0:	00112623          	sw	ra,12(sp)
f90018b4:	00058613          	mv	a2,a1
    bsp_printf("\r\n*** CRASH due to %s: %d***\r\n", causeType, cause);
f90018b8:	00050593          	mv	a1,a0
f90018bc:	f9005537          	lui	a0,0xf9005
f90018c0:	82850513          	addi	a0,a0,-2008 # f9004828 <_data+0x178>
f90018c4:	eb9ff0ef          	jal	f900177c <bsp_printf>
    while(1);
f90018c8:	0000006f          	j	f90018c8 <crash+0x1c>

f90018cc <poll_host_settings>:
void poll_host_settings() {
f90018cc:	ff010113          	addi	sp,sp,-16
f90018d0:	00112623          	sw	ra,12(sp)
f90018d4:	00812423          	sw	s0,8(sp)
f90018d8:	00912223          	sw	s1,4(sp)
f90018dc:	01212023          	sw	s2,0(sp)
    u32 e_tmp = read_apb_reg(REG_OVERRIDE_EXPOSURE);
f90018e0:	06400513          	li	a0,100
f90018e4:	c99fe0ef          	jal	f900057c <read_apb_reg>
f90018e8:	00050913          	mv	s2,a0
    u32 r_tmp = read_apb_reg(REG_OVERRIDE_GAIN_R);
f90018ec:	06800513          	li	a0,104
f90018f0:	c8dfe0ef          	jal	f900057c <read_apb_reg>
f90018f4:	00050413          	mv	s0,a0
    u32 g_tmp = read_apb_reg(REG_OVERRIDE_GAIN_G);
f90018f8:	06c00513          	li	a0,108
f90018fc:	c81fe0ef          	jal	f900057c <read_apb_reg>
f9001900:	00050493          	mv	s1,a0
    u32 b_tmp = read_apb_reg(REG_OVERRIDE_GAIN_B);
f9001904:	07000513          	li	a0,112
f9001908:	c75fe0ef          	jal	f900057c <read_apb_reg>
    if (e_tmp != e_raw || r_tmp != r_raw || g_tmp != g_raw || b_tmp != b_raw) {
f900190c:	85c1a783          	lw	a5,-1956(gp) # f9004fb4 <e_raw.8>
f9001910:	01279663          	bne	a5,s2,f900191c <poll_host_settings+0x50>
f9001914:	8581a783          	lw	a5,-1960(gp) # f9004fb0 <r_raw.7>
f9001918:	08878c63          	beq	a5,s0,f90019b0 <poll_host_settings+0xe4>
        e_raw = e_tmp;
f900191c:	8521ae23          	sw	s2,-1956(gp) # f9004fb4 <e_raw.8>
        r_raw = r_tmp;
f9001920:	8481ac23          	sw	s0,-1960(gp) # f9004fb0 <r_raw.7>
        g_raw = g_tmp;
f9001924:	8491aa23          	sw	s1,-1964(gp) # f9004fac <g_raw.6>
        b_raw = b_tmp;
f9001928:	84a1a823          	sw	a0,-1968(gp) # f9004fa8 <b_raw.5>
        s32 r = 420 + ((s32)r_raw - 128);
f900192c:	12440413          	addi	s0,s0,292
        s32 g = 256 + ((s32)g_raw - 128);
f9001930:	08048493          	addi	s1,s1,128
        s32 b = 600 + ((s32)b_raw - 128)*1.5;
f9001934:	f8050513          	addi	a0,a0,-128
f9001938:	351010ef          	jal	f9003488 <__floatsidf>
f900193c:	8181a603          	lw	a2,-2024(gp) # f9004f70 <prev_dig_gain.4+0x4>
f9001940:	81c1a683          	lw	a3,-2020(gp) # f9004f74 <prev_dig_gain.4+0x8>
f9001944:	3e8010ef          	jal	f9002d2c <__muldf3>
f9001948:	8201a603          	lw	a2,-2016(gp) # f9004f78 <prev_dig_gain.4+0xc>
f900194c:	8241a683          	lw	a3,-2012(gp) # f9004f7c <prev_dig_gain.4+0x10>
f9001950:	315000ef          	jal	f9002464 <__adddf3>
f9001954:	2b1010ef          	jal	f9003404 <__fixdfsi>
f9001958:	00050613          	mv	a2,a0
        r = r > 0 ? r : 0;
f900195c:	00040513          	mv	a0,s0
f9001960:	06044263          	bltz	s0,f90019c4 <poll_host_settings+0xf8>
        g = g > 0 ? g : 0;
f9001964:	00048593          	mv	a1,s1
f9001968:	0604c263          	bltz	s1,f90019cc <poll_host_settings+0x100>
        b = b > 0 ? b : 0;
f900196c:	06064463          	bltz	a2,f90019d4 <poll_host_settings+0x108>
        isp_set_color_balance(r, g, b);
f9001970:	925ff0ef          	jal	f9001294 <isp_set_color_balance>
        isp_set_setpoint(e);
f9001974:	00090513          	mv	a0,s2
f9001978:	975ff0ef          	jal	f90012ec <isp_set_setpoint>
        bsp_printf("target exposure value: %d, red gain: %d, green gain: %d, blue gain: %d\r\n", e_raw, r_raw, g_raw, b_raw);
f900197c:	8501a703          	lw	a4,-1968(gp) # f9004fa8 <b_raw.5>
f9001980:	8541a683          	lw	a3,-1964(gp) # f9004fac <g_raw.6>
f9001984:	8581a603          	lw	a2,-1960(gp) # f9004fb0 <r_raw.7>
f9001988:	85c1a583          	lw	a1,-1956(gp) # f9004fb4 <e_raw.8>
f900198c:	f9005537          	lui	a0,0xf9005
f9001990:	84850513          	addi	a0,a0,-1976 # f9004848 <_data+0x198>
f9001994:	de9ff0ef          	jal	f900177c <bsp_printf>
}
f9001998:	00c12083          	lw	ra,12(sp)
f900199c:	00812403          	lw	s0,8(sp)
f90019a0:	00412483          	lw	s1,4(sp)
f90019a4:	00012903          	lw	s2,0(sp)
f90019a8:	01010113          	addi	sp,sp,16
f90019ac:	00008067          	ret
    if (e_tmp != e_raw || r_tmp != r_raw || g_tmp != g_raw || b_tmp != b_raw) {
f90019b0:	8541a783          	lw	a5,-1964(gp) # f9004fac <g_raw.6>
f90019b4:	f69794e3          	bne	a5,s1,f900191c <poll_host_settings+0x50>
f90019b8:	8501a783          	lw	a5,-1968(gp) # f9004fa8 <b_raw.5>
f90019bc:	f6a790e3          	bne	a5,a0,f900191c <poll_host_settings+0x50>
f90019c0:	fd9ff06f          	j	f9001998 <poll_host_settings+0xcc>
        r = r > 0 ? r : 0;
f90019c4:	00000513          	li	a0,0
f90019c8:	f9dff06f          	j	f9001964 <poll_host_settings+0x98>
        g = g > 0 ? g : 0;
f90019cc:	00000593          	li	a1,0
f90019d0:	f9dff06f          	j	f900196c <poll_host_settings+0xa0>
        b = b > 0 ? b : 0;
f90019d4:	00000613          	li	a2,0
f90019d8:	f99ff06f          	j	f9001970 <poll_host_settings+0xa4>

f90019dc <timer_handler>:
void timer_handler() {
f90019dc:	ff010113          	addi	sp,sp,-16
f90019e0:	00112623          	sw	ra,12(sp)
f90019e4:	00812423          	sw	s0,8(sp)
    u32 new_gain = isp_update_gain(prev_dig_gain);
f90019e8:	8141d503          	lhu	a0,-2028(gp) # f9004f6c <prev_dig_gain.4>
f90019ec:	8ddff0ef          	jal	f90012c8 <isp_update_gain>
f90019f0:	00050413          	mv	s0,a0
    u32 exp_avg = isp_get_expose_avg();
f90019f4:	8bdff0ef          	jal	f90012b0 <isp_get_expose_avg>
f90019f8:	00050593          	mv	a1,a0
    ++count;
f90019fc:	84c1a783          	lw	a5,-1972(gp) # f9004fa4 <count.3>
f9001a00:	00178793          	addi	a5,a5,1
f9001a04:	84f1a623          	sw	a5,-1972(gp) # f9004fa4 <count.3>
    if (count >= 10 || abs(prev_dig_gain - new_gain) > 10) {
f9001a08:	00900713          	li	a4,9
f9001a0c:	02f76063          	bltu	a4,a5,f9001a2c <timer_handler+0x50>
f9001a10:	8141d783          	lhu	a5,-2028(gp) # f9004f6c <prev_dig_gain.4>
f9001a14:	408787b3          	sub	a5,a5,s0
f9001a18:	41f7d713          	srai	a4,a5,0x1f
f9001a1c:	00f747b3          	xor	a5,a4,a5
f9001a20:	40e787b3          	sub	a5,a5,a4
f9001a24:	00a00713          	li	a4,10
f9001a28:	00f75e63          	bge	a4,a5,f9001a44 <timer_handler+0x68>
        bsp_printf("global average: %d, gain: %d, new gain: %d\r\n", exp_avg, prev_dig_gain, new_gain);
f9001a2c:	00040693          	mv	a3,s0
f9001a30:	8141d603          	lhu	a2,-2028(gp) # f9004f6c <prev_dig_gain.4>
f9001a34:	f9005537          	lui	a0,0xf9005
f9001a38:	89450513          	addi	a0,a0,-1900 # f9004894 <_data+0x1e4>
f9001a3c:	d41ff0ef          	jal	f900177c <bsp_printf>
        count = 0;
f9001a40:	8401a623          	sw	zero,-1972(gp) # f9004fa4 <count.3>
    Gainfilter(ana_gain, new_gain);
f9001a44:	01041413          	slli	s0,s0,0x10
f9001a48:	01045413          	srli	s0,s0,0x10
f9001a4c:	00040593          	mv	a1,s0
f9001a50:	21c00513          	li	a0,540
f9001a54:	e84ff0ef          	jal	f90010d8 <Gainfilter>
    prev_dig_gain = new_gain;
f9001a58:	80819a23          	sh	s0,-2028(gp) # f9004f6c <prev_dig_gain.4>
    poll_host_settings();
f9001a5c:	e71ff0ef          	jal	f90018cc <poll_host_settings>
}
f9001a60:	00c12083          	lw	ra,12(sp)
f9001a64:	00812403          	lw	s0,8(sp)
f9001a68:	01010113          	addi	sp,sp,16
f9001a6c:	00008067          	ret

f9001a70 <externalInterrupt>:
void externalInterrupt() {
f9001a70:	ff010113          	addi	sp,sp,-16
f9001a74:	00112623          	sw	ra,12(sp)
f9001a78:	00812423          	sw	s0,8(sp)
    while(claim = plic_claim(BSP_PLIC, BSP_PLIC_CPU_0)){
f9001a7c:	00000593          	li	a1,0
f9001a80:	f8c00537          	lui	a0,0xf8c00
f9001a84:	cc1ff0ef          	jal	f9001744 <plic_claim>
f9001a88:	00050413          	mv	s0,a0
f9001a8c:	02050a63          	beqz	a0,f9001ac0 <externalInterrupt+0x50>
        switch(claim){
f9001a90:	01300793          	li	a5,19
f9001a94:	00f41e63          	bne	s0,a5,f9001ab0 <externalInterrupt+0x40>
        case USER_TIMER_0: timer_handler(); break;
f9001a98:	f45ff0ef          	jal	f90019dc <timer_handler>
        plic_release(BSP_PLIC, BSP_PLIC_CPU_0, claim); 
f9001a9c:	00040613          	mv	a2,s0
f9001aa0:	00000593          	li	a1,0
f9001aa4:	f8c00537          	lui	a0,0xf8c00
f9001aa8:	cb9ff0ef          	jal	f9001760 <plic_release>
f9001aac:	fd1ff06f          	j	f9001a7c <externalInterrupt+0xc>
        default: crash("claim", claim); break;
f9001ab0:	00040593          	mv	a1,s0
f9001ab4:	f9005537          	lui	a0,0xf9005
f9001ab8:	8c450513          	addi	a0,a0,-1852 # f90048c4 <_data+0x214>
f9001abc:	df1ff0ef          	jal	f90018ac <crash>
}
f9001ac0:	00c12083          	lw	ra,12(sp)
f9001ac4:	00812403          	lw	s0,8(sp)
f9001ac8:	01010113          	addi	sp,sp,16
f9001acc:	00008067          	ret

f9001ad0 <trap>:
void trap(){
f9001ad0:	ff010113          	addi	sp,sp,-16
f9001ad4:	00112623          	sw	ra,12(sp)
    int32_t mcause = csr_read(mcause);
f9001ad8:	342027f3          	csrr	a5,mcause
    int32_t cause     = mcause & 0xF;
f9001adc:	00f7f593          	andi	a1,a5,15
    if(interrupt){
f9001ae0:	0207d463          	bgez	a5,f9001b08 <trap+0x38>
        switch(cause){
f9001ae4:	00b00793          	li	a5,11
f9001ae8:	00f59a63          	bne	a1,a5,f9001afc <trap+0x2c>
        case CAUSE_MACHINE_EXTERNAL: externalInterrupt(); break;
f9001aec:	f85ff0ef          	jal	f9001a70 <externalInterrupt>
}
f9001af0:	00c12083          	lw	ra,12(sp)
f9001af4:	01010113          	addi	sp,sp,16
f9001af8:	00008067          	ret
        default: crash("cause", cause); break;
f9001afc:	f9005537          	lui	a0,0xf9005
f9001b00:	8cc50513          	addi	a0,a0,-1844 # f90048cc <_data+0x21c>
f9001b04:	da9ff0ef          	jal	f90018ac <crash>
        crash("cause", cause);
f9001b08:	f9005537          	lui	a0,0xf9005
f9001b0c:	8cc50513          	addi	a0,a0,-1844 # f90048cc <_data+0x21c>
f9001b10:	d9dff0ef          	jal	f90018ac <crash>

f9001b14 <interrupt_set>:
void interrupt_set(u32 gateway, u32 enable) {
f9001b14:	ff010113          	addi	sp,sp,-16
f9001b18:	00112623          	sw	ra,12(sp)
f9001b1c:	00050613          	mv	a2,a0
f9001b20:	00058693          	mv	a3,a1
    plic_set_enable(BSP_PLIC, BSP_PLIC_CPU_0, gateway, enable);
f9001b24:	00000593          	li	a1,0
f9001b28:	f8c00537          	lui	a0,0xf8c00
f9001b2c:	bb5ff0ef          	jal	f90016e0 <plic_set_enable>
}
f9001b30:	00c12083          	lw	ra,12(sp)
f9001b34:	01010113          	addi	sp,sp,16
f9001b38:	00008067          	ret

f9001b3c <interrupt_init>:
void interrupt_init() {
f9001b3c:	ff010113          	addi	sp,sp,-16
f9001b40:	00112623          	sw	ra,12(sp)
    plic_set_threshold(BSP_PLIC, BSP_PLIC_CPU_0, 0); //cpu 0 accept all interrupts with priority above 0
f9001b44:	00000613          	li	a2,0
f9001b48:	00000593          	li	a1,0
f9001b4c:	f8c00537          	lui	a0,0xf8c00
f9001b50:	bddff0ef          	jal	f900172c <plic_set_threshold>
    plic_set_enable(BSP_PLIC, BSP_PLIC_CPU_0, USER_TIMER_0, 1);
f9001b54:	00100693          	li	a3,1
f9001b58:	01300613          	li	a2,19
f9001b5c:	00000593          	li	a1,0
f9001b60:	f8c00537          	lui	a0,0xf8c00
f9001b64:	b7dff0ef          	jal	f90016e0 <plic_set_enable>
    plic_set_priority(BSP_PLIC, USER_TIMER_0, 2);
f9001b68:	00200613          	li	a2,2
f9001b6c:	01300593          	li	a1,19
f9001b70:	f8c00537          	lui	a0,0xf8c00
f9001b74:	b5dff0ef          	jal	f90016d0 <plic_set_priority>
    bsp_printf("plic initialized\r\n");
f9001b78:	f9005537          	lui	a0,0xf9005
f9001b7c:	8d450513          	addi	a0,a0,-1836 # f90048d4 <_data+0x224>
f9001b80:	bfdff0ef          	jal	f900177c <bsp_printf>
    csr_write(mtvec, trap_entry); 
f9001b84:	f90027b7          	lui	a5,0xf9002
f9001b88:	3d478793          	addi	a5,a5,980 # f90023d4 <trap_entry>
f9001b8c:	30579073          	csrw	mtvec,a5
    csr_set(mie, MIE_MEIE); //Enable external interrupts and core timer
f9001b90:	000017b7          	lui	a5,0x1
f9001b94:	80078793          	addi	a5,a5,-2048 # 800 <CUSTOM2+0x7a5>
f9001b98:	3047a073          	csrs	mie,a5
    csr_write(mstatus, MSTATUS_FS | MSTATUS_MPP | MSTATUS_MIE);
f9001b9c:	000087b7          	lui	a5,0x8
f9001ba0:	80878793          	addi	a5,a5,-2040 # 7808 <__stack_size+0x6808>
f9001ba4:	30079073          	csrw	mstatus,a5
    bsp_printf("Interrupt initialized\r\n");
f9001ba8:	f9005537          	lui	a0,0xf9005
f9001bac:	8e850513          	addi	a0,a0,-1816 # f90048e8 <_data+0x238>
f9001bb0:	bcdff0ef          	jal	f900177c <bsp_printf>
}
f9001bb4:	00c12083          	lw	ra,12(sp)
f9001bb8:	01010113          	addi	sp,sp,16
f9001bbc:	00008067          	ret

f9001bc0 <init>:
void init() {
f9001bc0:	ff010113          	addi	sp,sp,-16
f9001bc4:	00112623          	sw	ra,12(sp)
    reg_init();
f9001bc8:	a51fe0ef          	jal	f9000618 <reg_init>
    cam_i2c_init();
f9001bcc:	34c000ef          	jal	f9001f18 <cam_i2c_init>
    interrupt_set(USER_TIMER_0, 0);
f9001bd0:	00000593          	li	a1,0
f9001bd4:	01300513          	li	a0,19
f9001bd8:	f3dff0ef          	jal	f9001b14 <interrupt_set>
    IMX900_init(CameraRes_1080P);
f9001bdc:	00100513          	li	a0,1
f9001be0:	b94ff0ef          	jal	f9000f74 <IMX900_init>
    interrupt_set(USER_TIMER_0, 1);
f9001be4:	00100593          	li	a1,1
f9001be8:	01300513          	li	a0,19
f9001bec:	f29ff0ef          	jal	f9001b14 <interrupt_set>
    bsp_printf("Camera initialized\r\n");
f9001bf0:	f9005537          	lui	a0,0xf9005
f9001bf4:	90050513          	addi	a0,a0,-1792 # f9004900 <_data+0x250>
f9001bf8:	b85ff0ef          	jal	f900177c <bsp_printf>
    isp_init(0.0);
f9001bfc:	00000513          	li	a0,0
f9001c00:	f14ff0ef          	jal	f9001314 <isp_init>
    initTimer(SYSTEM_CLINT_HZ/10);
f9001c04:	00989537          	lui	a0,0x989
f9001c08:	68050513          	addi	a0,a0,1664 # 989680 <__stack_size+0x988680>
f9001c0c:	00000593          	li	a1,0
f9001c10:	704000ef          	jal	f9002314 <initTimer>
    interrupt_init();
f9001c14:	f29ff0ef          	jal	f9001b3c <interrupt_init>
}
f9001c18:	00c12083          	lw	ra,12(sp)
f9001c1c:	01010113          	addi	sp,sp,16
f9001c20:	00008067          	ret

f9001c24 <print_menu>:
{
f9001c24:	ff010113          	addi	sp,sp,-16
f9001c28:	00112623          	sw	ra,12(sp)
f9001c2c:	00812423          	sw	s0,8(sp)
    bsp_printf("---------------------------\r\n");
f9001c30:	f9005537          	lui	a0,0xf9005
f9001c34:	91850513          	addi	a0,a0,-1768 # f9004918 <_data+0x268>
f9001c38:	b45ff0ef          	jal	f900177c <bsp_printf>
    bsp_printf("Choose resolution and frame rate:\r\n");
f9001c3c:	f9005537          	lui	a0,0xf9005
f9001c40:	93850513          	addi	a0,a0,-1736 # f9004938 <_data+0x288>
f9001c44:	b39ff0ef          	jal	f900177c <bsp_printf>
    for (int tmp_i = 0; tmp_i < sizeof(videoParams)/sizeof(videoParams[0]); tmp_i++){
f9001c48:	00000413          	li	s0,0
f9001c4c:	0400006f          	j	f9001c8c <print_menu+0x68>
    	bsp_printf("%d: ", tmp_i);
f9001c50:	00040593          	mv	a1,s0
f9001c54:	f9005537          	lui	a0,0xf9005
f9001c58:	95c50513          	addi	a0,a0,-1700 # f900495c <_data+0x2ac>
f9001c5c:	b21ff0ef          	jal	f900177c <bsp_printf>
    	bsp_printf(videoParams[tmp_i].description);
f9001c60:	f90057b7          	lui	a5,0xf9005
f9001c64:	02c00713          	li	a4,44
f9001c68:	02e40733          	mul	a4,s0,a4
f9001c6c:	ae078793          	addi	a5,a5,-1312 # f9004ae0 <videoParams>
f9001c70:	00e787b3          	add	a5,a5,a4
f9001c74:	0287a503          	lw	a0,40(a5)
f9001c78:	b05ff0ef          	jal	f900177c <bsp_printf>
    	bsp_printf("\r\n");
f9001c7c:	f9004537          	lui	a0,0xf9004
f9001c80:	75c50513          	addi	a0,a0,1884 # f900475c <_data+0xac>
f9001c84:	af9ff0ef          	jal	f900177c <bsp_printf>
    for (int tmp_i = 0; tmp_i < sizeof(videoParams)/sizeof(videoParams[0]); tmp_i++){
f9001c88:	00140413          	addi	s0,s0,1
f9001c8c:	00500793          	li	a5,5
f9001c90:	fc87f0e3          	bgeu	a5,s0,f9001c50 <print_menu+0x2c>
    bsp_printf("\r\n");
f9001c94:	f9004537          	lui	a0,0xf9004
f9001c98:	75c50513          	addi	a0,a0,1884 # f900475c <_data+0xac>
f9001c9c:	ae1ff0ef          	jal	f900177c <bsp_printf>
    bsp_printf("Choose pixel format:\r\n");
f9001ca0:	f9005537          	lui	a0,0xf9005
f9001ca4:	96450513          	addi	a0,a0,-1692 # f9004964 <_data+0x2b4>
f9001ca8:	ad5ff0ef          	jal	f900177c <bsp_printf>
    for (int tmp_i = 0; tmp_i < sizeof(pixelFormat)/sizeof(pixelFormat[0]); tmp_i++){
f9001cac:	00000413          	li	s0,0
f9001cb0:	00200793          	li	a5,2
f9001cb4:	0487e263          	bltu	a5,s0,f9001cf8 <print_menu+0xd4>
    	bsp_printf("%c: ", 'a' + tmp_i);
f9001cb8:	06140593          	addi	a1,s0,97
f9001cbc:	f9005537          	lui	a0,0xf9005
f9001cc0:	97c50513          	addi	a0,a0,-1668 # f900497c <_data+0x2cc>
f9001cc4:	ab9ff0ef          	jal	f900177c <bsp_printf>
    	bsp_printf_s(pixelFormat[tmp_i]);
f9001cc8:	00241793          	slli	a5,s0,0x2
f9001ccc:	008787b3          	add	a5,a5,s0
f9001cd0:	00279513          	slli	a0,a5,0x2
f9001cd4:	f90057b7          	lui	a5,0xf9005
f9001cd8:	f2c78793          	addi	a5,a5,-212 # f9004f2c <pixelFormat>
f9001cdc:	00a78533          	add	a0,a5,a0
f9001ce0:	8a1ff0ef          	jal	f9001580 <bsp_printf_s>
    	bsp_printf("\r\n");
f9001ce4:	f9004537          	lui	a0,0xf9004
f9001ce8:	75c50513          	addi	a0,a0,1884 # f900475c <_data+0xac>
f9001cec:	a91ff0ef          	jal	f900177c <bsp_printf>
    for (int tmp_i = 0; tmp_i < sizeof(pixelFormat)/sizeof(pixelFormat[0]); tmp_i++){
f9001cf0:	00140413          	addi	s0,s0,1
f9001cf4:	fbdff06f          	j	f9001cb0 <print_menu+0x8c>
}
f9001cf8:	00c12083          	lw	ra,12(sp)
f9001cfc:	00812403          	lw	s0,8(sp)
f9001d00:	01010113          	addi	sp,sp,16
f9001d04:	00008067          	ret

f9001d08 <console_main>:
{
f9001d08:	fc010113          	addi	sp,sp,-64
f9001d0c:	02112e23          	sw	ra,60(sp)
    input = uart_read(BSP_UART_TERMINAL);
f9001d10:	f8010537          	lui	a0,0xf8010
f9001d14:	ebcff0ef          	jal	f90013d0 <uart_read>
f9001d18:	84a18423          	sb	a0,-1976(gp) # f9004fa0 <input.1>
    fun_num = input - '0';
f9001d1c:	fd050513          	addi	a0,a0,-48 # f800ffd0 <__stack_size+0xf800efd0>
f9001d20:	80a1a823          	sw	a0,-2032(gp) # f9004f68 <fun_num.0>
    if ((fun_num >= 0 && fun_num <= 9) && (fun_num < sizeof(videoParams)/sizeof(videoParams[0]))) {
f9001d24:	00500793          	li	a5,5
f9001d28:	02a7f263          	bgeu	a5,a0,f9001d4c <console_main+0x44>
    fun_num = input - 'a';
f9001d2c:	8481c783          	lbu	a5,-1976(gp) # f9004fa0 <input.1>
f9001d30:	f9f78793          	addi	a5,a5,-97
f9001d34:	80f1a823          	sw	a5,-2032(gp) # f9004f68 <fun_num.0>
    if ((fun_num >= 0 && fun_num <= 9) && (fun_num < sizeof(pixelFormat)/sizeof(pixelFormat[0]))) {
f9001d38:	00200713          	li	a4,2
f9001d3c:	12f77e63          	bgeu	a4,a5,f9001e78 <console_main+0x170>
}
f9001d40:	03c12083          	lw	ra,60(sp)
f9001d44:	04010113          	addi	sp,sp,64
f9001d48:	00008067          	ret
f9001d4c:	02812c23          	sw	s0,56(sp)
f9001d50:	02912a23          	sw	s1,52(sp)
f9001d54:	03212823          	sw	s2,48(sp)
        bsp_printf("    using ");
f9001d58:	f9005537          	lui	a0,0xf9005
f9001d5c:	98450513          	addi	a0,a0,-1660 # f9004984 <_data+0x2d4>
f9001d60:	a1dff0ef          	jal	f900177c <bsp_printf>
        bsp_printf(videoParams[fun_num].description);
f9001d64:	8101a703          	lw	a4,-2032(gp) # f9004f68 <fun_num.0>
f9001d68:	f90057b7          	lui	a5,0xf9005
f9001d6c:	ae078413          	addi	s0,a5,-1312 # f9004ae0 <videoParams>
f9001d70:	02c00913          	li	s2,44
f9001d74:	032707b3          	mul	a5,a4,s2
f9001d78:	00f407b3          	add	a5,s0,a5
f9001d7c:	0287a503          	lw	a0,40(a5)
f9001d80:	9fdff0ef          	jal	f900177c <bsp_printf>
        bsp_printf("\r\n\r\n");
f9001d84:	f9005537          	lui	a0,0xf9005
f9001d88:	99050513          	addi	a0,a0,-1648 # f9004990 <_data+0x2e0>
f9001d8c:	9f1ff0ef          	jal	f900177c <bsp_printf>
        interrupt_set(USER_TIMER_0, 0);
f9001d90:	00000593          	li	a1,0
f9001d94:	01300513          	li	a0,19
f9001d98:	d7dff0ef          	jal	f9001b14 <interrupt_set>
        update_video_timing(videoParams[fun_num].timing);
f9001d9c:	8101a783          	lw	a5,-2032(gp) # f9004f68 <fun_num.0>
f9001da0:	032787b3          	mul	a5,a5,s2
f9001da4:	00f407b3          	add	a5,s0,a5
f9001da8:	0007ae03          	lw	t3,0(a5)
f9001dac:	0047a303          	lw	t1,4(a5)
f9001db0:	0087a883          	lw	a7,8(a5)
f9001db4:	00c7a803          	lw	a6,12(a5)
f9001db8:	0107a503          	lw	a0,16(a5)
f9001dbc:	0147a583          	lw	a1,20(a5)
f9001dc0:	0187a603          	lw	a2,24(a5)
f9001dc4:	01c7a683          	lw	a3,28(a5)
f9001dc8:	0207a703          	lw	a4,32(a5)
f9001dcc:	0247a783          	lw	a5,36(a5)
f9001dd0:	01c12023          	sw	t3,0(sp)
f9001dd4:	00612223          	sw	t1,4(sp)
f9001dd8:	01112423          	sw	a7,8(sp)
f9001ddc:	01012623          	sw	a6,12(sp)
f9001de0:	00a12823          	sw	a0,16(sp)
f9001de4:	00b12a23          	sw	a1,20(sp)
f9001de8:	00c12c23          	sw	a2,24(sp)
f9001dec:	00d12e23          	sw	a3,28(sp)
f9001df0:	02e12023          	sw	a4,32(sp)
f9001df4:	02f12223          	sw	a5,36(sp)
f9001df8:	00010513          	mv	a0,sp
f9001dfc:	fa0fe0ef          	jal	f900059c <update_video_timing>
        switch(fun_num) {
f9001e00:	8101a783          	lw	a5,-2032(gp) # f9004f68 <fun_num.0>
f9001e04:	00300713          	li	a4,3
f9001e08:	02f74e63          	blt	a4,a5,f9001e44 <console_main+0x13c>
f9001e0c:	00200713          	li	a4,2
f9001e10:	04e7d663          	bge	a5,a4,f9001e5c <console_main+0x154>
f9001e14:	00100713          	li	a4,1
f9001e18:	04f76863          	bltu	a4,a5,f9001e68 <console_main+0x160>
            	IMX900_init(CameraRes_1080P);
f9001e1c:	00100513          	li	a0,1
f9001e20:	954ff0ef          	jal	f9000f74 <IMX900_init>
        interrupt_set(USER_TIMER_0, 1);
f9001e24:	00100593          	li	a1,1
f9001e28:	01300513          	li	a0,19
f9001e2c:	ce9ff0ef          	jal	f9001b14 <interrupt_set>
        print_menu();
f9001e30:	df5ff0ef          	jal	f9001c24 <print_menu>
f9001e34:	03812403          	lw	s0,56(sp)
f9001e38:	03412483          	lw	s1,52(sp)
f9001e3c:	03012903          	lw	s2,48(sp)
f9001e40:	eedff06f          	j	f9001d2c <console_main+0x24>
        switch(fun_num) {
f9001e44:	ffc78793          	addi	a5,a5,-4
f9001e48:	00100713          	li	a4,1
f9001e4c:	00f76e63          	bltu	a4,a5,f9001e68 <console_main+0x160>
            	IMX900_init(CameraRes_4K);
f9001e50:	00000513          	li	a0,0
f9001e54:	920ff0ef          	jal	f9000f74 <IMX900_init>
                break;
f9001e58:	fcdff06f          	j	f9001e24 <console_main+0x11c>
            	IMX900_init(CameraRes_1440P);
f9001e5c:	00200513          	li	a0,2
f9001e60:	914ff0ef          	jal	f9000f74 <IMX900_init>
                break;
f9001e64:	fc1ff06f          	j	f9001e24 <console_main+0x11c>
                bsp_printf("unexpected resolution & frame rate\r\n");
f9001e68:	f9005537          	lui	a0,0xf9005
f9001e6c:	99850513          	addi	a0,a0,-1640 # f9004998 <_data+0x2e8>
f9001e70:	90dff0ef          	jal	f900177c <bsp_printf>
                break;
f9001e74:	fb1ff06f          	j	f9001e24 <console_main+0x11c>
f9001e78:	02812c23          	sw	s0,56(sp)
        bsp_printf("    using ");
f9001e7c:	f9005537          	lui	a0,0xf9005
f9001e80:	98450513          	addi	a0,a0,-1660 # f9004984 <_data+0x2d4>
f9001e84:	8f9ff0ef          	jal	f900177c <bsp_printf>
        bsp_printf(pixelFormat[fun_num]);
f9001e88:	8101a703          	lw	a4,-2032(gp) # f9004f68 <fun_num.0>
f9001e8c:	00271793          	slli	a5,a4,0x2
f9001e90:	00e787b3          	add	a5,a5,a4
f9001e94:	00279793          	slli	a5,a5,0x2
f9001e98:	f9005537          	lui	a0,0xf9005
f9001e9c:	f2c50513          	addi	a0,a0,-212 # f9004f2c <pixelFormat>
f9001ea0:	00f50533          	add	a0,a0,a5
f9001ea4:	8d9ff0ef          	jal	f900177c <bsp_printf>
        bsp_printf("\r\n\r\n");
f9001ea8:	f9005537          	lui	a0,0xf9005
f9001eac:	99050513          	addi	a0,a0,-1648 # f9004990 <_data+0x2e0>
f9001eb0:	8cdff0ef          	jal	f900177c <bsp_printf>
        switch(fun_num) {
f9001eb4:	8101a503          	lw	a0,-2032(gp) # f9004f68 <fun_num.0>
f9001eb8:	00200793          	li	a5,2
f9001ebc:	00a7ec63          	bltu	a5,a0,f9001ed4 <console_main+0x1cc>
                write_apb_reg(fun_num, REG_PIXEL_MODE);
f9001ec0:	07c00593          	li	a1,124
f9001ec4:	ec8fe0ef          	jal	f900058c <write_apb_reg>
        print_menu();
f9001ec8:	d5dff0ef          	jal	f9001c24 <print_menu>
f9001ecc:	03812403          	lw	s0,56(sp)
}
f9001ed0:	e71ff06f          	j	f9001d40 <console_main+0x38>
                bsp_printf("unsupported pixel format\r\n");
f9001ed4:	f9005537          	lui	a0,0xf9005
f9001ed8:	9c050513          	addi	a0,a0,-1600 # f90049c0 <_data+0x310>
f9001edc:	8a1ff0ef          	jal	f900177c <bsp_printf>
                break;
f9001ee0:	fe9ff06f          	j	f9001ec8 <console_main+0x1c0>

f9001ee4 <i2c_applyConfig>:
        write_u32(config->samplingClockDivider, reg + I2C_SAMPLING_CLOCK_DIVIDER);
f9001ee4:	0005a783          	lw	a5,0(a1)
f9001ee8:	02f52423          	sw	a5,40(a0)
        write_u32(config->timeout, reg + I2C_TIMEOUT);
f9001eec:	0045a783          	lw	a5,4(a1)
f9001ef0:	02f52623          	sw	a5,44(a0)
        write_u32(config->tsuDat, reg + I2C_TSUDAT);
f9001ef4:	0085a783          	lw	a5,8(a1)
f9001ef8:	02f52823          	sw	a5,48(a0)
        write_u32(config->tLow, reg + I2C_TLOW);
f9001efc:	00c5a783          	lw	a5,12(a1)
f9001f00:	04f52823          	sw	a5,80(a0)
        write_u32(config->tHigh, reg + I2C_THIGH);
f9001f04:	0105a783          	lw	a5,16(a1)
f9001f08:	04f52a23          	sw	a5,84(a0)
        write_u32(config->tBuf, reg + I2C_TBUF);
f9001f0c:	0145a783          	lw	a5,20(a1)
f9001f10:	04f52c23          	sw	a5,88(a0)
    }
f9001f14:	00008067          	ret

f9001f18 <cam_i2c_init>:

#include "i2c.h"
#include "peri.h"

void cam_i2c_init() {
f9001f18:	fd010113          	addi	sp,sp,-48
f9001f1c:	02112623          	sw	ra,44(sp)
    const int i2c_freq = 100000;
    I2c_Config i2c_mipi;
    i2c_mipi.samplingClockDivider = 3;
f9001f20:	00300793          	li	a5,3
f9001f24:	00f12423          	sw	a5,8(sp)
    i2c_mipi.timeout = I2C_CTRL_HZ/1000;
f9001f28:	000187b7          	lui	a5,0x18
f9001f2c:	6a078793          	addi	a5,a5,1696 # 186a0 <__stack_size+0x176a0>
f9001f30:	00f12623          	sw	a5,12(sp)
    i2c_mipi.tsuDat  = I2C_CTRL_HZ/(i2c_freq*5);
f9001f34:	0c800793          	li	a5,200
f9001f38:	00f12823          	sw	a5,16(sp)

    /* T_low & T_high = i2c period / 2  */
    i2c_mipi.tLow  = I2C_CTRL_HZ/(i2c_freq*2);
f9001f3c:	1f400793          	li	a5,500
f9001f40:	00f12a23          	sw	a5,20(sp)
    i2c_mipi.tHigh = I2C_CTRL_HZ/(i2c_freq*2);
f9001f44:	00f12c23          	sw	a5,24(sp)
    i2c_mipi.tBuf  = I2C_CTRL_HZ/(i2c_freq);
f9001f48:	3e800793          	li	a5,1000
f9001f4c:	00f12e23          	sw	a5,28(sp)

    i2c_applyConfig(I2C_CTRL_CAM, &i2c_mipi);
f9001f50:	00810593          	addi	a1,sp,8
f9001f54:	f8016537          	lui	a0,0xf8016
f9001f58:	f8dff0ef          	jal	f9001ee4 <i2c_applyConfig>
}
f9001f5c:	02c12083          	lw	ra,44(sp)
f9001f60:	03010113          	addi	sp,sp,48
f9001f64:	00008067          	ret

f9001f68 <uart_writeAvailability>:
        return *((volatile u32*) address);
f9001f68:	00452503          	lw	a0,4(a0) # f8016004 <__stack_size+0xf8015004>
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
f9001f6c:	01055513          	srli	a0,a0,0x10
    }
f9001f70:	0ff57513          	zext.b	a0,a0
f9001f74:	00008067          	ret

f9001f78 <uart_write>:
    static void uart_write(u32 reg, char data){
f9001f78:	ff010113          	addi	sp,sp,-16
f9001f7c:	00112623          	sw	ra,12(sp)
f9001f80:	00812423          	sw	s0,8(sp)
f9001f84:	00912223          	sw	s1,4(sp)
f9001f88:	00050413          	mv	s0,a0
f9001f8c:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
f9001f90:	00040513          	mv	a0,s0
f9001f94:	fd5ff0ef          	jal	f9001f68 <uart_writeAvailability>
f9001f98:	fe050ce3          	beqz	a0,f9001f90 <uart_write+0x18>
        *((volatile u32*) address) = data;
f9001f9c:	00942023          	sw	s1,0(s0)
    }
f9001fa0:	00c12083          	lw	ra,12(sp)
f9001fa4:	00812403          	lw	s0,8(sp)
f9001fa8:	00412483          	lw	s1,4(sp)
f9001fac:	01010113          	addi	sp,sp,16
f9001fb0:	00008067          	ret

f9001fb4 <_putchar>:
    static void _putchar(char character){
f9001fb4:	ff010113          	addi	sp,sp,-16
f9001fb8:	00112623          	sw	ra,12(sp)
f9001fbc:	00050593          	mv	a1,a0
            bsp_putChar(character);
f9001fc0:	f8010537          	lui	a0,0xf8010
f9001fc4:	fb5ff0ef          	jal	f9001f78 <uart_write>
    }
f9001fc8:	00c12083          	lw	ra,12(sp)
f9001fcc:	01010113          	addi	sp,sp,16
f9001fd0:	00008067          	ret

f9001fd4 <_putchar_s>:
    {
f9001fd4:	ff010113          	addi	sp,sp,-16
f9001fd8:	00112623          	sw	ra,12(sp)
f9001fdc:	00812423          	sw	s0,8(sp)
f9001fe0:	00050413          	mv	s0,a0
        while (*p)
f9001fe4:	00c0006f          	j	f9001ff0 <_putchar_s+0x1c>
            _putchar(*(p++));
f9001fe8:	00140413          	addi	s0,s0,1
f9001fec:	fc9ff0ef          	jal	f9001fb4 <_putchar>
        while (*p)
f9001ff0:	00044503          	lbu	a0,0(s0)
f9001ff4:	fe051ae3          	bnez	a0,f9001fe8 <_putchar_s+0x14>
    }
f9001ff8:	00c12083          	lw	ra,12(sp)
f9001ffc:	00812403          	lw	s0,8(sp)
f9002000:	01010113          	addi	sp,sp,16
f9002004:	00008067          	ret

f9002008 <bsp_printHex>:
    {
f9002008:	ff010113          	addi	sp,sp,-16
f900200c:	00112623          	sw	ra,12(sp)
f9002010:	00812423          	sw	s0,8(sp)
f9002014:	00912223          	sw	s1,4(sp)
f9002018:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f900201c:	01c00413          	li	s0,28
f9002020:	0240006f          	j	f9002044 <bsp_printHex+0x3c>
            _putchar("0123456789ABCDEF"[(val >> i) % 16]);
f9002024:	0084d733          	srl	a4,s1,s0
f9002028:	00f77713          	andi	a4,a4,15
f900202c:	f90047b7          	lui	a5,0xf9004
f9002030:	6b078793          	addi	a5,a5,1712 # f90046b0 <_data>
f9002034:	00e787b3          	add	a5,a5,a4
f9002038:	0007c503          	lbu	a0,0(a5)
f900203c:	f79ff0ef          	jal	f9001fb4 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9002040:	ffc40413          	addi	s0,s0,-4
f9002044:	fe0450e3          	bgez	s0,f9002024 <bsp_printHex+0x1c>
    }
f9002048:	00c12083          	lw	ra,12(sp)
f900204c:	00812403          	lw	s0,8(sp)
f9002050:	00412483          	lw	s1,4(sp)
f9002054:	01010113          	addi	sp,sp,16
f9002058:	00008067          	ret

f900205c <bsp_printHex_lower>:
    {
f900205c:	ff010113          	addi	sp,sp,-16
f9002060:	00112623          	sw	ra,12(sp)
f9002064:	00812423          	sw	s0,8(sp)
f9002068:	00912223          	sw	s1,4(sp)
f900206c:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9002070:	01c00413          	li	s0,28
f9002074:	0240006f          	j	f9002098 <bsp_printHex_lower+0x3c>
            _putchar("0123456789abcdef"[(val >> i) % 16]);
f9002078:	0084d733          	srl	a4,s1,s0
f900207c:	00f77713          	andi	a4,a4,15
f9002080:	f90047b7          	lui	a5,0xf9004
f9002084:	6c478793          	addi	a5,a5,1732 # f90046c4 <_data+0x14>
f9002088:	00e787b3          	add	a5,a5,a4
f900208c:	0007c503          	lbu	a0,0(a5)
f9002090:	f25ff0ef          	jal	f9001fb4 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9002094:	ffc40413          	addi	s0,s0,-4
f9002098:	fe0450e3          	bgez	s0,f9002078 <bsp_printHex_lower+0x1c>
    }
f900209c:	00c12083          	lw	ra,12(sp)
f90020a0:	00812403          	lw	s0,8(sp)
f90020a4:	00412483          	lw	s1,4(sp)
f90020a8:	01010113          	addi	sp,sp,16
f90020ac:	00008067          	ret

f90020b0 <bsp_printf_c>:
    {
f90020b0:	ff010113          	addi	sp,sp,-16
f90020b4:	00112623          	sw	ra,12(sp)
        _putchar(c);
f90020b8:	0ff57513          	zext.b	a0,a0
f90020bc:	ef9ff0ef          	jal	f9001fb4 <_putchar>
    }
f90020c0:	00c12083          	lw	ra,12(sp)
f90020c4:	01010113          	addi	sp,sp,16
f90020c8:	00008067          	ret

f90020cc <bsp_printf_s>:
    {
f90020cc:	ff010113          	addi	sp,sp,-16
f90020d0:	00112623          	sw	ra,12(sp)
        _putchar_s(p);
f90020d4:	f01ff0ef          	jal	f9001fd4 <_putchar_s>
    }
f90020d8:	00c12083          	lw	ra,12(sp)
f90020dc:	01010113          	addi	sp,sp,16
f90020e0:	00008067          	ret

f90020e4 <bsp_printf_d>:
    {
f90020e4:	fd010113          	addi	sp,sp,-48
f90020e8:	02112623          	sw	ra,44(sp)
f90020ec:	02812423          	sw	s0,40(sp)
f90020f0:	02912223          	sw	s1,36(sp)
f90020f4:	00050493          	mv	s1,a0
        if (val < 0) {
f90020f8:	00054663          	bltz	a0,f9002104 <bsp_printf_d+0x20>
    {
f90020fc:	00010413          	mv	s0,sp
f9002100:	02c0006f          	j	f900212c <bsp_printf_d+0x48>
            bsp_printf_c('-');
f9002104:	02d00513          	li	a0,45
f9002108:	fa9ff0ef          	jal	f90020b0 <bsp_printf_c>
            val = -val;
f900210c:	409004b3          	neg	s1,s1
f9002110:	fedff06f          	j	f90020fc <bsp_printf_d+0x18>
            *(p++) = '0' + val % 10;
f9002114:	00a00713          	li	a4,10
f9002118:	02e4e7b3          	rem	a5,s1,a4
f900211c:	03078793          	addi	a5,a5,48
f9002120:	00f40023          	sb	a5,0(s0)
            val = val / 10;
f9002124:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
f9002128:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
f900212c:	fe0494e3          	bnez	s1,f9002114 <bsp_printf_d+0x30>
f9002130:	00010793          	mv	a5,sp
f9002134:	fef400e3          	beq	s0,a5,f9002114 <bsp_printf_d+0x30>
        while (p != buffer)
f9002138:	00010793          	mv	a5,sp
f900213c:	00f40a63          	beq	s0,a5,f9002150 <bsp_printf_d+0x6c>
            bsp_printf_c(*(--p));
f9002140:	fff40413          	addi	s0,s0,-1
f9002144:	00044503          	lbu	a0,0(s0)
f9002148:	f69ff0ef          	jal	f90020b0 <bsp_printf_c>
f900214c:	fedff06f          	j	f9002138 <bsp_printf_d+0x54>
    }
f9002150:	02c12083          	lw	ra,44(sp)
f9002154:	02812403          	lw	s0,40(sp)
f9002158:	02412483          	lw	s1,36(sp)
f900215c:	03010113          	addi	sp,sp,48
f9002160:	00008067          	ret

f9002164 <bsp_printf_x>:
    {
f9002164:	ff010113          	addi	sp,sp,-16
f9002168:	00112623          	sw	ra,12(sp)
        for(i=0;i<8;i++)
f900216c:	00000713          	li	a4,0
f9002170:	00700793          	li	a5,7
f9002174:	02e7c063          	blt	a5,a4,f9002194 <bsp_printf_x+0x30>
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f9002178:	00271693          	slli	a3,a4,0x2
f900217c:	ff000793          	li	a5,-16
f9002180:	00d797b3          	sll	a5,a5,a3
f9002184:	00f577b3          	and	a5,a0,a5
f9002188:	00078663          	beqz	a5,f9002194 <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
f900218c:	00170713          	addi	a4,a4,1
f9002190:	fe1ff06f          	j	f9002170 <bsp_printf_x+0xc>
        bsp_printHex_lower(val);
f9002194:	ec9ff0ef          	jal	f900205c <bsp_printHex_lower>
    }
f9002198:	00c12083          	lw	ra,12(sp)
f900219c:	01010113          	addi	sp,sp,16
f90021a0:	00008067          	ret

f90021a4 <bsp_printf_X>:
        {
f90021a4:	ff010113          	addi	sp,sp,-16
f90021a8:	00112623          	sw	ra,12(sp)
            for(i=0;i<8;i++)
f90021ac:	00000713          	li	a4,0
f90021b0:	00700793          	li	a5,7
f90021b4:	02e7c063          	blt	a5,a4,f90021d4 <bsp_printf_X+0x30>
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f90021b8:	00271693          	slli	a3,a4,0x2
f90021bc:	ff000793          	li	a5,-16
f90021c0:	00d797b3          	sll	a5,a5,a3
f90021c4:	00f577b3          	and	a5,a0,a5
f90021c8:	00078663          	beqz	a5,f90021d4 <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
f90021cc:	00170713          	addi	a4,a4,1
f90021d0:	fe1ff06f          	j	f90021b0 <bsp_printf_X+0xc>
            bsp_printHex(val);
f90021d4:	e35ff0ef          	jal	f9002008 <bsp_printHex>
        }
f90021d8:	00c12083          	lw	ra,12(sp)
f90021dc:	01010113          	addi	sp,sp,16
f90021e0:	00008067          	ret

f90021e4 <bsp_printf>:
    {
f90021e4:	fc010113          	addi	sp,sp,-64
f90021e8:	00112e23          	sw	ra,28(sp)
f90021ec:	00812c23          	sw	s0,24(sp)
f90021f0:	00912a23          	sw	s1,20(sp)
f90021f4:	00050493          	mv	s1,a0
f90021f8:	02b12223          	sw	a1,36(sp)
f90021fc:	02c12423          	sw	a2,40(sp)
f9002200:	02d12623          	sw	a3,44(sp)
f9002204:	02e12823          	sw	a4,48(sp)
f9002208:	02f12a23          	sw	a5,52(sp)
f900220c:	03012c23          	sw	a6,56(sp)
f9002210:	03112e23          	sw	a7,60(sp)
        va_start(ap, format);
f9002214:	02410793          	addi	a5,sp,36
f9002218:	00f12623          	sw	a5,12(sp)
        for (i = 0; format[i]; i++)
f900221c:	00000413          	li	s0,0
f9002220:	01c0006f          	j	f900223c <bsp_printf+0x58>
                        bsp_printf_c(va_arg(ap,int));
f9002224:	00c12783          	lw	a5,12(sp)
f9002228:	00478713          	addi	a4,a5,4
f900222c:	00e12623          	sw	a4,12(sp)
f9002230:	0007a503          	lw	a0,0(a5)
f9002234:	e7dff0ef          	jal	f90020b0 <bsp_printf_c>
        for (i = 0; format[i]; i++)
f9002238:	00140413          	addi	s0,s0,1
f900223c:	008487b3          	add	a5,s1,s0
f9002240:	0007c503          	lbu	a0,0(a5)
f9002244:	0a050e63          	beqz	a0,f9002300 <bsp_printf+0x11c>
            if (format[i] == '%') {
f9002248:	02500793          	li	a5,37
f900224c:	06f50e63          	beq	a0,a5,f90022c8 <bsp_printf+0xe4>
                bsp_printf_c(format[i]);
f9002250:	e61ff0ef          	jal	f90020b0 <bsp_printf_c>
f9002254:	fe5ff06f          	j	f9002238 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
f9002258:	00c12783          	lw	a5,12(sp)
f900225c:	00478713          	addi	a4,a5,4
f9002260:	00e12623          	sw	a4,12(sp)
f9002264:	0007a503          	lw	a0,0(a5)
f9002268:	e65ff0ef          	jal	f90020cc <bsp_printf_s>
                        break;
f900226c:	fcdff06f          	j	f9002238 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
f9002270:	00c12783          	lw	a5,12(sp)
f9002274:	00478713          	addi	a4,a5,4
f9002278:	00e12623          	sw	a4,12(sp)
f900227c:	0007a503          	lw	a0,0(a5)
f9002280:	e65ff0ef          	jal	f90020e4 <bsp_printf_d>
                        break;
f9002284:	fb5ff06f          	j	f9002238 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
f9002288:	00c12783          	lw	a5,12(sp)
f900228c:	00478713          	addi	a4,a5,4
f9002290:	00e12623          	sw	a4,12(sp)
f9002294:	0007a503          	lw	a0,0(a5)
f9002298:	f0dff0ef          	jal	f90021a4 <bsp_printf_X>
                        break;
f900229c:	f9dff06f          	j	f9002238 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
f90022a0:	00c12783          	lw	a5,12(sp)
f90022a4:	00478713          	addi	a4,a5,4
f90022a8:	00e12623          	sw	a4,12(sp)
f90022ac:	0007a503          	lw	a0,0(a5)
f90022b0:	eb5ff0ef          	jal	f9002164 <bsp_printf_x>
                        break;
f90022b4:	f85ff06f          	j	f9002238 <bsp_printf+0x54>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
f90022b8:	f9004537          	lui	a0,0xf9004
f90022bc:	6d850513          	addi	a0,a0,1752 # f90046d8 <_data+0x28>
f90022c0:	e0dff0ef          	jal	f90020cc <bsp_printf_s>
                        break;
f90022c4:	f75ff06f          	j	f9002238 <bsp_printf+0x54>
                while (format[++i]) {
f90022c8:	00140413          	addi	s0,s0,1
f90022cc:	008487b3          	add	a5,s1,s0
f90022d0:	0007c783          	lbu	a5,0(a5)
f90022d4:	f60782e3          	beqz	a5,f9002238 <bsp_printf+0x54>
                    if (format[i] == 'c') {
f90022d8:	fa878793          	addi	a5,a5,-88
f90022dc:	0ff7f693          	zext.b	a3,a5
f90022e0:	02000713          	li	a4,32
f90022e4:	fed762e3          	bltu	a4,a3,f90022c8 <bsp_printf+0xe4>
f90022e8:	00269793          	slli	a5,a3,0x2
f90022ec:	f9005737          	lui	a4,0xf9005
f90022f0:	da870713          	addi	a4,a4,-600 # f9004da8 <module_common_regs+0x98>
f90022f4:	00e787b3          	add	a5,a5,a4
f90022f8:	0007a783          	lw	a5,0(a5)
f90022fc:	00078067          	jr	a5
    }
f9002300:	01c12083          	lw	ra,28(sp)
f9002304:	01812403          	lw	s0,24(sp)
f9002308:	01412483          	lw	s1,20(sp)
f900230c:	04010113          	addi	sp,sp,64
f9002310:	00008067          	ret

f9002314 <initTimer>:
#define TIMER_CONFIG_WITH_PRESCALER     0x2
#define TIMER_CONFIG_WITHOUT_PRESCALER  0x1
#define TIMER_CONFIG_SELF_RESTART       0x10000


void initTimer(u64 interval){
f9002314:	ff010113          	addi	sp,sp,-16
f9002318:	00112623          	sw	ra,12(sp)
f900231c:	f80177b7          	lui	a5,0xf8017
f9002320:	06300713          	li	a4,99
f9002324:	00e7a023          	sw	a4,0(a5) # f8017000 <__stack_size+0xf8016000>
f9002328:	00010737          	lui	a4,0x10
f900232c:	00270713          	addi	a4,a4,2 # 10002 <__stack_size+0xf002>
f9002330:	04e7a023          	sw	a4,64(a5)
    //Divide clock rate by 99+1
    write_u32(99, TIMER_PRESCALER_CTRL); 
    write_u32(TIMER_CONFIG_WITH_PRESCALER | TIMER_CONFIG_SELF_RESTART, TIMER_CTRL + 0x0);
    //Will tick each interval cycles (as it use the prescaler)
    write_u32(interval/100 - 1, TIMER_CTRL + 0x4);
f9002334:	001007b7          	lui	a5,0x100
f9002338:	fff78793          	addi	a5,a5,-1 # fffff <__stack_size+0xfefff>
f900233c:	00f57733          	and	a4,a0,a5
f9002340:	00c59613          	slli	a2,a1,0xc
f9002344:	01455693          	srli	a3,a0,0x14
f9002348:	00d666b3          	or	a3,a2,a3
f900234c:	00f6f6b3          	and	a3,a3,a5
f9002350:	00d70733          	add	a4,a4,a3
f9002354:	0085d693          	srli	a3,a1,0x8
f9002358:	00f6f7b3          	and	a5,a3,a5
f900235c:	00f70733          	add	a4,a4,a5
f9002360:	01c5d793          	srli	a5,a1,0x1c
f9002364:	00f70733          	add	a4,a4,a5
f9002368:	01900793          	li	a5,25
f900236c:	02f77733          	remu	a4,a4,a5
f9002370:	40e50733          	sub	a4,a0,a4
f9002374:	00e53533          	sltu	a0,a0,a4
f9002378:	40a587b3          	sub	a5,a1,a0
f900237c:	c28f6637          	lui	a2,0xc28f6
f9002380:	c2960613          	addi	a2,a2,-983 # c28f5c29 <__stack_size+0xc28f4c29>
f9002384:	02c787b3          	mul	a5,a5,a2
f9002388:	8f5c36b7          	lui	a3,0x8f5c3
f900238c:	8f568693          	addi	a3,a3,-1803 # 8f5c28f5 <__stack_size+0x8f5c18f5>
f9002390:	02d706b3          	mul	a3,a4,a3
f9002394:	00d787b3          	add	a5,a5,a3
f9002398:	02c706b3          	mul	a3,a4,a2
f900239c:	02c73733          	mulhu	a4,a4,a2
f90023a0:	00e787b3          	add	a5,a5,a4
f90023a4:	01e79793          	slli	a5,a5,0x1e
f90023a8:	0026d713          	srli	a4,a3,0x2
f90023ac:	00e7e733          	or	a4,a5,a4
f90023b0:	fff70713          	addi	a4,a4,-1
f90023b4:	f80177b7          	lui	a5,0xf8017
f90023b8:	04e7a223          	sw	a4,68(a5) # f8017044 <__stack_size+0xf8016044>
    bsp_printf("user timer initialized!\r\n");
f90023bc:	f9005537          	lui	a0,0xf9005
f90023c0:	a4050513          	addi	a0,a0,-1472 # f9004a40 <_data+0x390>
f90023c4:	e21ff0ef          	jal	f90021e4 <bsp_printf>
}
f90023c8:	00c12083          	lw	ra,12(sp)
f90023cc:	01010113          	addi	sp,sp,16
f90023d0:	00008067          	ret

f90023d4 <trap_entry>:

trap_entry:
#ifdef __riscv_flen
  addi sp, sp, -STACK_SIZE
#else
  addi sp, sp, -64
f90023d4:	fc010113          	addi	sp,sp,-64
#endif
  sw x1,   0*4(sp)
f90023d8:	00112023          	sw	ra,0(sp)
  sw x5,   1*4(sp)
f90023dc:	00512223          	sw	t0,4(sp)
  sw x6,   2*4(sp)
f90023e0:	00612423          	sw	t1,8(sp)
  sw x7,   3*4(sp)
f90023e4:	00712623          	sw	t2,12(sp)
  sw x10,  4*4(sp)
f90023e8:	00a12823          	sw	a0,16(sp)
  sw x11,  5*4(sp)
f90023ec:	00b12a23          	sw	a1,20(sp)
  sw x12,  6*4(sp)
f90023f0:	00c12c23          	sw	a2,24(sp)
  sw x13,  7*4(sp)
f90023f4:	00d12e23          	sw	a3,28(sp)
  sw x14,  8*4(sp)
f90023f8:	02e12023          	sw	a4,32(sp)
  sw x15,  9*4(sp)
f90023fc:	02f12223          	sw	a5,36(sp)
  sw x16, 10*4(sp)
f9002400:	03012423          	sw	a6,40(sp)
  sw x17, 11*4(sp)
f9002404:	03112623          	sw	a7,44(sp)
  sw x28, 12*4(sp)
f9002408:	03c12823          	sw	t3,48(sp)
  sw x29, 13*4(sp)
f900240c:	03d12a23          	sw	t4,52(sp)
  sw x30, 14*4(sp)
f9002410:	03e12c23          	sw	t5,56(sp)
  sw x31, 15*4(sp)
f9002414:	03f12e23          	sw	t6,60(sp)
  FSTORE f30, 64 + 18*FPR_SIZE(sp)
  FSTORE f31, 64 + 19*FPR_SIZE(sp)
  csrr t0, fcsr
  sw t0, 64 + 20*FPR_SIZE(sp)
#endif
  call trap
f9002418:	eb8ff0ef          	jal	f9001ad0 <trap>
  FLOAD f28, 64 + 16*FPR_SIZE(sp)
  FLOAD f29, 64 + 17*FPR_SIZE(sp)
  FLOAD f30, 64 + 18*FPR_SIZE(sp)
  FLOAD f31, 64 + 19*FPR_SIZE(sp)
#endif
  lw x1 ,  0*4(sp)
f900241c:	00012083          	lw	ra,0(sp)
  lw x5,   1*4(sp)
f9002420:	00412283          	lw	t0,4(sp)
  lw x6,   2*4(sp)
f9002424:	00812303          	lw	t1,8(sp)
  lw x7,   3*4(sp)
f9002428:	00c12383          	lw	t2,12(sp)
  lw x10,  4*4(sp)
f900242c:	01012503          	lw	a0,16(sp)
  lw x11,  5*4(sp)
f9002430:	01412583          	lw	a1,20(sp)
  lw x12,  6*4(sp)
f9002434:	01812603          	lw	a2,24(sp)
  lw x13,  7*4(sp)
f9002438:	01c12683          	lw	a3,28(sp)
  lw x14,  8*4(sp)
f900243c:	02012703          	lw	a4,32(sp)
  lw x15,  9*4(sp)
f9002440:	02412783          	lw	a5,36(sp)
  lw x16, 10*4(sp)
f9002444:	02812803          	lw	a6,40(sp)
  lw x17, 11*4(sp)
f9002448:	02c12883          	lw	a7,44(sp)
  lw x28, 12*4(sp)
f900244c:	03012e03          	lw	t3,48(sp)
  lw x29, 13*4(sp)
f9002450:	03412e83          	lw	t4,52(sp)
  lw x30, 14*4(sp)
f9002454:	03812f03          	lw	t5,56(sp)
  lw x31, 15*4(sp)
f9002458:	03c12f83          	lw	t6,60(sp)
#ifdef __riscv_flen
  addi sp, sp, STACK_SIZE
#else
  addi sp, sp, 64
f900245c:	04010113          	addi	sp,sp,64
#endif
f9002460:	30200073          	mret

f9002464 <__adddf3>:
f9002464:	001007b7          	lui	a5,0x100
f9002468:	fe010113          	addi	sp,sp,-32
f900246c:	fff78e93          	addi	t4,a5,-1 # fffff <__stack_size+0xfefff>
f9002470:	00bef833          	and	a6,t4,a1
f9002474:	00def7b3          	and	a5,t4,a3
f9002478:	0146d313          	srli	t1,a3,0x14
f900247c:	01212823          	sw	s2,16(sp)
f9002480:	0145d913          	srli	s2,a1,0x14
f9002484:	00379793          	slli	a5,a5,0x3
f9002488:	00812c23          	sw	s0,24(sp)
f900248c:	00381813          	slli	a6,a6,0x3
f9002490:	01f5d413          	srli	s0,a1,0x1f
f9002494:	01d55713          	srli	a4,a0,0x1d
f9002498:	01d65893          	srli	a7,a2,0x1d
f900249c:	7ff97913          	andi	s2,s2,2047
f90024a0:	7ff37313          	andi	t1,t1,2047
f90024a4:	00112e23          	sw	ra,28(sp)
f90024a8:	00912a23          	sw	s1,20(sp)
f90024ac:	01312623          	sw	s3,12(sp)
f90024b0:	01f6d693          	srli	a3,a3,0x1f
f90024b4:	00f8e8b3          	or	a7,a7,a5
f90024b8:	01076733          	or	a4,a4,a6
f90024bc:	00351593          	slli	a1,a0,0x3
f90024c0:	00361f13          	slli	t5,a2,0x3
f90024c4:	406907b3          	sub	a5,s2,t1
f90024c8:	1ed40463          	beq	s0,a3,f90026b0 <__adddf3+0x24c>
f90024cc:	16f05263          	blez	a5,f9002630 <__adddf3+0x1cc>
f90024d0:	28030663          	beqz	t1,f900275c <__adddf3+0x2f8>
f90024d4:	7ff00693          	li	a3,2047
f90024d8:	42d90663          	beq	s2,a3,f9002904 <__adddf3+0x4a0>
f90024dc:	03800693          	li	a3,56
f90024e0:	00100613          	li	a2,1
f90024e4:	02f6ce63          	blt	a3,a5,f9002520 <__adddf3+0xbc>
f90024e8:	008006b7          	lui	a3,0x800
f90024ec:	00d8e8b3          	or	a7,a7,a3
f90024f0:	01f00693          	li	a3,31
f90024f4:	52f6ce63          	blt	a3,a5,f9002a30 <__adddf3+0x5cc>
f90024f8:	02000693          	li	a3,32
f90024fc:	40f686b3          	sub	a3,a3,a5
f9002500:	00d89633          	sll	a2,a7,a3
f9002504:	00ff5533          	srl	a0,t5,a5
f9002508:	00df16b3          	sll	a3,t5,a3
f900250c:	00a66633          	or	a2,a2,a0
f9002510:	00d036b3          	snez	a3,a3
f9002514:	00f8d8b3          	srl	a7,a7,a5
f9002518:	00d66633          	or	a2,a2,a3
f900251c:	41170733          	sub	a4,a4,a7
f9002520:	40c58633          	sub	a2,a1,a2
f9002524:	00c5b5b3          	sltu	a1,a1,a2
f9002528:	00060493          	mv	s1,a2
f900252c:	40b709b3          	sub	s3,a4,a1
f9002530:	00899793          	slli	a5,s3,0x8
f9002534:	3207da63          	bgez	a5,f9002868 <__adddf3+0x404>
f9002538:	008007b7          	lui	a5,0x800
f900253c:	fff78793          	addi	a5,a5,-1 # 7fffff <__stack_size+0x7fefff>
f9002540:	00f9f9b3          	and	s3,s3,a5
f9002544:	2c098863          	beqz	s3,f9002814 <__adddf3+0x3b0>
f9002548:	00098513          	mv	a0,s3
f900254c:	0dc020ef          	jal	f9004628 <__clzsi2>
f9002550:	ff850793          	addi	a5,a0,-8
f9002554:	02000693          	li	a3,32
f9002558:	40f68733          	sub	a4,a3,a5
f900255c:	00e4d733          	srl	a4,s1,a4
f9002560:	00f999b3          	sll	s3,s3,a5
f9002564:	01376733          	or	a4,a4,s3
f9002568:	00f494b3          	sll	s1,s1,a5
f900256c:	4b27c863          	blt	a5,s2,f9002a1c <__adddf3+0x5b8>
f9002570:	412787b3          	sub	a5,a5,s2
f9002574:	00178793          	addi	a5,a5,1
f9002578:	40f686b3          	sub	a3,a3,a5
f900257c:	00d49633          	sll	a2,s1,a3
f9002580:	00f4d9b3          	srl	s3,s1,a5
f9002584:	00c03633          	snez	a2,a2
f9002588:	01366633          	or	a2,a2,s3
f900258c:	00d716b3          	sll	a3,a4,a3
f9002590:	00c6e4b3          	or	s1,a3,a2
f9002594:	00f759b3          	srl	s3,a4,a5
f9002598:	00000913          	li	s2,0
f900259c:	0074f793          	andi	a5,s1,7
f90025a0:	02078063          	beqz	a5,f90025c0 <__adddf3+0x15c>
f90025a4:	00f4f793          	andi	a5,s1,15
f90025a8:	00400713          	li	a4,4
f90025ac:	00e78a63          	beq	a5,a4,f90025c0 <__adddf3+0x15c>
f90025b0:	00448793          	addi	a5,s1,4
f90025b4:	0097b633          	sltu	a2,a5,s1
f90025b8:	00c989b3          	add	s3,s3,a2
f90025bc:	00078493          	mv	s1,a5
f90025c0:	00899793          	slli	a5,s3,0x8
f90025c4:	6e07da63          	bgez	a5,f9002cb8 <__adddf3+0x854>
f90025c8:	00190793          	addi	a5,s2,1
f90025cc:	7ff00713          	li	a4,2047
f90025d0:	00040e13          	mv	t3,s0
f90025d4:	2ae78663          	beq	a5,a4,f9002880 <__adddf3+0x41c>
f90025d8:	ff800737          	lui	a4,0xff800
f90025dc:	fff70713          	addi	a4,a4,-1 # ff7fffff <__freertos_irq_stack_top+0x67fa01f>
f90025e0:	00e9f733          	and	a4,s3,a4
f90025e4:	7ff7f793          	andi	a5,a5,2047
f90025e8:	01d71813          	slli	a6,a4,0x1d
f90025ec:	0034d613          	srli	a2,s1,0x3
f90025f0:	00971713          	slli	a4,a4,0x9
f90025f4:	00c86833          	or	a6,a6,a2
f90025f8:	00c75713          	srli	a4,a4,0xc
f90025fc:	01c12083          	lw	ra,28(sp)
f9002600:	01812403          	lw	s0,24(sp)
f9002604:	01479793          	slli	a5,a5,0x14
f9002608:	00e7e7b3          	or	a5,a5,a4
f900260c:	01fe1713          	slli	a4,t3,0x1f
f9002610:	00e7e7b3          	or	a5,a5,a4
f9002614:	01412483          	lw	s1,20(sp)
f9002618:	01012903          	lw	s2,16(sp)
f900261c:	00c12983          	lw	s3,12(sp)
f9002620:	00080513          	mv	a0,a6
f9002624:	00078593          	mv	a1,a5
f9002628:	02010113          	addi	sp,sp,32
f900262c:	00008067          	ret
f9002630:	14078c63          	beqz	a5,f9002788 <__adddf3+0x324>
f9002634:	412307b3          	sub	a5,t1,s2
f9002638:	3c091263          	bnez	s2,f90029fc <__adddf3+0x598>
f900263c:	00b76533          	or	a0,a4,a1
f9002640:	4c050463          	beqz	a0,f9002b08 <__adddf3+0x6a4>
f9002644:	fff78513          	addi	a0,a5,-1
f9002648:	60050263          	beqz	a0,f9002c4c <__adddf3+0x7e8>
f900264c:	7ff00813          	li	a6,2047
f9002650:	57078663          	beq	a5,a6,f9002bbc <__adddf3+0x758>
f9002654:	03800793          	li	a5,56
f9002658:	00100613          	li	a2,1
f900265c:	02a7cc63          	blt	a5,a0,f9002694 <__adddf3+0x230>
f9002660:	00050793          	mv	a5,a0
f9002664:	01f00613          	li	a2,31
f9002668:	56f64c63          	blt	a2,a5,f9002be0 <__adddf3+0x77c>
f900266c:	02000513          	li	a0,32
f9002670:	40f50533          	sub	a0,a0,a5
f9002674:	00a71633          	sll	a2,a4,a0
f9002678:	00f5d833          	srl	a6,a1,a5
f900267c:	00a59533          	sll	a0,a1,a0
f9002680:	01066633          	or	a2,a2,a6
f9002684:	00a03533          	snez	a0,a0
f9002688:	00f75733          	srl	a4,a4,a5
f900268c:	00a66633          	or	a2,a2,a0
f9002690:	40e888b3          	sub	a7,a7,a4
f9002694:	40cf0633          	sub	a2,t5,a2
f9002698:	00cf3733          	sltu	a4,t5,a2
f900269c:	00060493          	mv	s1,a2
f90026a0:	40e889b3          	sub	s3,a7,a4
f90026a4:	00030913          	mv	s2,t1
f90026a8:	00068413          	mv	s0,a3
f90026ac:	e85ff06f          	j	f9002530 <__adddf3+0xcc>
f90026b0:	1ef05063          	blez	a5,f9002890 <__adddf3+0x42c>
f90026b4:	14031063          	bnez	t1,f90027f4 <__adddf3+0x390>
f90026b8:	01e8e6b3          	or	a3,a7,t5
f90026bc:	26068c63          	beqz	a3,f9002934 <__adddf3+0x4d0>
f90026c0:	fff78693          	addi	a3,a5,-1
f90026c4:	48068063          	beqz	a3,f9002b44 <__adddf3+0x6e0>
f90026c8:	7ff00613          	li	a2,2047
f90026cc:	22c78c63          	beq	a5,a2,f9002904 <__adddf3+0x4a0>
f90026d0:	03800793          	li	a5,56
f90026d4:	00100993          	li	s3,1
f90026d8:	02d7cc63          	blt	a5,a3,f9002710 <__adddf3+0x2ac>
f90026dc:	00068793          	mv	a5,a3
f90026e0:	01f00693          	li	a3,31
f90026e4:	4af6c063          	blt	a3,a5,f9002b84 <__adddf3+0x720>
f90026e8:	02000693          	li	a3,32
f90026ec:	40f686b3          	sub	a3,a3,a5
f90026f0:	00d899b3          	sll	s3,a7,a3
f90026f4:	00ff5633          	srl	a2,t5,a5
f90026f8:	00df16b3          	sll	a3,t5,a3
f90026fc:	00c9e9b3          	or	s3,s3,a2
f9002700:	00d036b3          	snez	a3,a3
f9002704:	00f8d8b3          	srl	a7,a7,a5
f9002708:	00d9e9b3          	or	s3,s3,a3
f900270c:	01170733          	add	a4,a4,a7
f9002710:	00b985b3          	add	a1,s3,a1
f9002714:	0135b9b3          	sltu	s3,a1,s3
f9002718:	00058493          	mv	s1,a1
f900271c:	00e989b3          	add	s3,s3,a4
f9002720:	00899793          	slli	a5,s3,0x8
f9002724:	1407d263          	bgez	a5,f9002868 <__adddf3+0x404>
f9002728:	00190913          	addi	s2,s2,1
f900272c:	7ff00793          	li	a5,2047
f9002730:	36f90c63          	beq	s2,a5,f9002aa8 <__adddf3+0x644>
f9002734:	ff8007b7          	lui	a5,0xff800
f9002738:	fff78793          	addi	a5,a5,-1 # ff7fffff <__freertos_irq_stack_top+0x67fa01f>
f900273c:	0014f613          	andi	a2,s1,1
f9002740:	00f9f7b3          	and	a5,s3,a5
f9002744:	0014d713          	srli	a4,s1,0x1
f9002748:	00c76733          	or	a4,a4,a2
f900274c:	01f79613          	slli	a2,a5,0x1f
f9002750:	00e664b3          	or	s1,a2,a4
f9002754:	0017d993          	srli	s3,a5,0x1
f9002758:	e45ff06f          	j	f900259c <__adddf3+0x138>
f900275c:	01e8e6b3          	or	a3,a7,t5
f9002760:	1c068a63          	beqz	a3,f9002934 <__adddf3+0x4d0>
f9002764:	fff78693          	addi	a3,a5,-1
f9002768:	40068063          	beqz	a3,f9002b68 <__adddf3+0x704>
f900276c:	7ff00613          	li	a2,2047
f9002770:	18c78a63          	beq	a5,a2,f9002904 <__adddf3+0x4a0>
f9002774:	03800793          	li	a5,56
f9002778:	00100613          	li	a2,1
f900277c:	dad7c2e3          	blt	a5,a3,f9002520 <__adddf3+0xbc>
f9002780:	00068793          	mv	a5,a3
f9002784:	d6dff06f          	j	f90024f0 <__adddf3+0x8c>
f9002788:	00190813          	addi	a6,s2,1
f900278c:	7fe87813          	andi	a6,a6,2046
f9002790:	22081c63          	bnez	a6,f90029c8 <__adddf3+0x564>
f9002794:	00b76333          	or	t1,a4,a1
f9002798:	01e8e833          	or	a6,a7,t5
f900279c:	38091063          	bnez	s2,f9002b1c <__adddf3+0x6b8>
f90027a0:	46030e63          	beqz	t1,f9002c1c <__adddf3+0x7b8>
f90027a4:	40080663          	beqz	a6,f9002bb0 <__adddf3+0x74c>
f90027a8:	41e589b3          	sub	s3,a1,t5
f90027ac:	0135b533          	sltu	a0,a1,s3
f90027b0:	41170633          	sub	a2,a4,a7
f90027b4:	40a60633          	sub	a2,a2,a0
f90027b8:	00861513          	slli	a0,a2,0x8
f90027bc:	50055e63          	bgez	a0,f9002cd8 <__adddf3+0x874>
f90027c0:	40bf05b3          	sub	a1,t5,a1
f90027c4:	40e88733          	sub	a4,a7,a4
f90027c8:	00bf3f33          	sltu	t5,t5,a1
f90027cc:	41e70733          	sub	a4,a4,t5
f90027d0:	00871613          	slli	a2,a4,0x8
f90027d4:	00058493          	mv	s1,a1
f90027d8:	52065e63          	bgez	a2,f9002d14 <__adddf3+0x8b0>
f90027dc:	ff8007b7          	lui	a5,0xff800
f90027e0:	fff78793          	addi	a5,a5,-1 # ff7fffff <__freertos_irq_stack_top+0x67fa01f>
f90027e4:	00f77733          	and	a4,a4,a5
f90027e8:	00068e13          	mv	t3,a3
f90027ec:	00100793          	li	a5,1
f90027f0:	df9ff06f          	j	f90025e8 <__adddf3+0x184>
f90027f4:	7ff00693          	li	a3,2047
f90027f8:	10d90663          	beq	s2,a3,f9002904 <__adddf3+0x4a0>
f90027fc:	03800693          	li	a3,56
f9002800:	00100993          	li	s3,1
f9002804:	f0f6c6e3          	blt	a3,a5,f9002710 <__adddf3+0x2ac>
f9002808:	008006b7          	lui	a3,0x800
f900280c:	00d8e8b3          	or	a7,a7,a3
f9002810:	ed1ff06f          	j	f90026e0 <__adddf3+0x27c>
f9002814:	00048513          	mv	a0,s1
f9002818:	611010ef          	jal	f9004628 <__clzsi2>
f900281c:	01850793          	addi	a5,a0,24
f9002820:	01f00693          	li	a3,31
f9002824:	d2f6d8e3          	bge	a3,a5,f9002554 <__adddf3+0xf0>
f9002828:	ff850713          	addi	a4,a0,-8
f900282c:	00e49733          	sll	a4,s1,a4
f9002830:	2327c663          	blt	a5,s2,f9002a5c <__adddf3+0x5f8>
f9002834:	41278933          	sub	s2,a5,s2
f9002838:	00190793          	addi	a5,s2,1
f900283c:	48f6d663          	bge	a3,a5,f9002cc8 <__adddf3+0x864>
f9002840:	fe190913          	addi	s2,s2,-31
f9002844:	02000693          	li	a3,32
f9002848:	012754b3          	srl	s1,a4,s2
f900284c:	00d78c63          	beq	a5,a3,f9002864 <__adddf3+0x400>
f9002850:	04000693          	li	a3,64
f9002854:	40f687b3          	sub	a5,a3,a5
f9002858:	00f71733          	sll	a4,a4,a5
f900285c:	00e03733          	snez	a4,a4
f9002860:	00e4e4b3          	or	s1,s1,a4
f9002864:	00000913          	li	s2,0
f9002868:	0074f793          	andi	a5,s1,7
f900286c:	d2079ce3          	bnez	a5,f90025a4 <__adddf3+0x140>
f9002870:	00090793          	mv	a5,s2
f9002874:	0034d613          	srli	a2,s1,0x3
f9002878:	00098713          	mv	a4,s3
f900287c:	0c00006f          	j	f900293c <__adddf3+0x4d8>
f9002880:	7ff00793          	li	a5,2047
f9002884:	00000713          	li	a4,0
f9002888:	00000813          	li	a6,0
f900288c:	d71ff06f          	j	f90025fc <__adddf3+0x198>
f9002890:	0c078a63          	beqz	a5,f9002964 <__adddf3+0x500>
f9002894:	412307b3          	sub	a5,t1,s2
f9002898:	1e090263          	beqz	s2,f9002a7c <__adddf3+0x618>
f900289c:	7ff00693          	li	a3,2047
f90028a0:	32d30863          	beq	t1,a3,f9002bd0 <__adddf3+0x76c>
f90028a4:	03800693          	li	a3,56
f90028a8:	00100993          	li	s3,1
f90028ac:	02f6ce63          	blt	a3,a5,f90028e8 <__adddf3+0x484>
f90028b0:	008006b7          	lui	a3,0x800
f90028b4:	00d76733          	or	a4,a4,a3
f90028b8:	01f00693          	li	a3,31
f90028bc:	3cf6c863          	blt	a3,a5,f9002c8c <__adddf3+0x828>
f90028c0:	02000693          	li	a3,32
f90028c4:	40f686b3          	sub	a3,a3,a5
f90028c8:	00d719b3          	sll	s3,a4,a3
f90028cc:	00f5d633          	srl	a2,a1,a5
f90028d0:	00d596b3          	sll	a3,a1,a3
f90028d4:	00c9e9b3          	or	s3,s3,a2
f90028d8:	00d036b3          	snez	a3,a3
f90028dc:	00f75733          	srl	a4,a4,a5
f90028e0:	00d9e9b3          	or	s3,s3,a3
f90028e4:	00e888b3          	add	a7,a7,a4
f90028e8:	01e98733          	add	a4,s3,t5
f90028ec:	013739b3          	sltu	s3,a4,s3
f90028f0:	00070493          	mv	s1,a4
f90028f4:	011989b3          	add	s3,s3,a7
f90028f8:	00030913          	mv	s2,t1
f90028fc:	e25ff06f          	j	f9002720 <__adddf3+0x2bc>
f9002900:	02081063          	bnez	a6,f9002920 <__adddf3+0x4bc>
f9002904:	00351613          	slli	a2,a0,0x3
f9002908:	00365613          	srli	a2,a2,0x3
f900290c:	01d71813          	slli	a6,a4,0x1d
f9002910:	00c86833          	or	a6,a6,a2
f9002914:	00375713          	srli	a4,a4,0x3
f9002918:	01076733          	or	a4,a4,a6
f900291c:	18070663          	beqz	a4,f9002aa8 <__adddf3+0x644>
f9002920:	00000e13          	li	t3,0
f9002924:	7ff00793          	li	a5,2047
f9002928:	00080737          	lui	a4,0x80
f900292c:	00000813          	li	a6,0
f9002930:	ccdff06f          	j	f90025fc <__adddf3+0x198>
f9002934:	00351613          	slli	a2,a0,0x3
f9002938:	00365613          	srli	a2,a2,0x3
f900293c:	01d71813          	slli	a6,a4,0x1d
f9002940:	7ff00693          	li	a3,2047
f9002944:	00c86833          	or	a6,a6,a2
f9002948:	00375713          	srli	a4,a4,0x3
f900294c:	fcd786e3          	beq	a5,a3,f9002918 <__adddf3+0x4b4>
f9002950:	00c71713          	slli	a4,a4,0xc
f9002954:	00c75713          	srli	a4,a4,0xc
f9002958:	7ff7f793          	andi	a5,a5,2047
f900295c:	00040e13          	mv	t3,s0
f9002960:	c9dff06f          	j	f90025fc <__adddf3+0x198>
f9002964:	00190693          	addi	a3,s2,1
f9002968:	7fe6f813          	andi	a6,a3,2046
f900296c:	14081863          	bnez	a6,f9002abc <__adddf3+0x658>
f9002970:	00b766b3          	or	a3,a4,a1
f9002974:	28091c63          	bnez	s2,f9002c0c <__adddf3+0x7a8>
f9002978:	30068263          	beqz	a3,f9002c7c <__adddf3+0x818>
f900297c:	01e8e6b3          	or	a3,a7,t5
f9002980:	22068863          	beqz	a3,f9002bb0 <__adddf3+0x74c>
f9002984:	01e587b3          	add	a5,a1,t5
f9002988:	00b7b5b3          	sltu	a1,a5,a1
f900298c:	01170733          	add	a4,a4,a7
f9002990:	00b70733          	add	a4,a4,a1
f9002994:	0037d813          	srli	a6,a5,0x3
f9002998:	00871793          	slli	a5,a4,0x8
f900299c:	00040e13          	mv	t3,s0
f90029a0:	3407de63          	bgez	a5,f9002cfc <__adddf3+0x898>
f90029a4:	ff8007b7          	lui	a5,0xff800
f90029a8:	fff78793          	addi	a5,a5,-1 # ff7fffff <__freertos_irq_stack_top+0x67fa01f>
f90029ac:	00f77733          	and	a4,a4,a5
f90029b0:	01d71793          	slli	a5,a4,0x1d
f90029b4:	00375713          	srli	a4,a4,0x3
f90029b8:	0107e833          	or	a6,a5,a6
f90029bc:	01d77733          	and	a4,a4,t4
f90029c0:	00100793          	li	a5,1
f90029c4:	c39ff06f          	j	f90025fc <__adddf3+0x198>
f90029c8:	41e58833          	sub	a6,a1,t5
f90029cc:	0105b7b3          	sltu	a5,a1,a6
f90029d0:	411709b3          	sub	s3,a4,a7
f90029d4:	40f989b3          	sub	s3,s3,a5
f90029d8:	00899793          	slli	a5,s3,0x8
f90029dc:	00080493          	mv	s1,a6
f90029e0:	1007c663          	bltz	a5,f9002aec <__adddf3+0x688>
f90029e4:	01386833          	or	a6,a6,s3
f90029e8:	b4081ee3          	bnez	a6,f9002544 <__adddf3+0xe0>
f90029ec:	00000e13          	li	t3,0
f90029f0:	00000793          	li	a5,0
f90029f4:	00000713          	li	a4,0
f90029f8:	c05ff06f          	j	f90025fc <__adddf3+0x198>
f90029fc:	7ff00513          	li	a0,2047
f9002a00:	1aa30e63          	beq	t1,a0,f9002bbc <__adddf3+0x758>
f9002a04:	03800513          	li	a0,56
f9002a08:	00100613          	li	a2,1
f9002a0c:	c8f544e3          	blt	a0,a5,f9002694 <__adddf3+0x230>
f9002a10:	00800637          	lui	a2,0x800
f9002a14:	00c76733          	or	a4,a4,a2
f9002a18:	c4dff06f          	j	f9002664 <__adddf3+0x200>
f9002a1c:	ff8009b7          	lui	s3,0xff800
f9002a20:	fff98993          	addi	s3,s3,-1 # ff7fffff <__freertos_irq_stack_top+0x67fa01f>
f9002a24:	40f90933          	sub	s2,s2,a5
f9002a28:	013779b3          	and	s3,a4,s3
f9002a2c:	b71ff06f          	j	f900259c <__adddf3+0x138>
f9002a30:	fe078693          	addi	a3,a5,-32
f9002a34:	02000613          	li	a2,32
f9002a38:	00d8d6b3          	srl	a3,a7,a3
f9002a3c:	00c78a63          	beq	a5,a2,f9002a50 <__adddf3+0x5ec>
f9002a40:	04000613          	li	a2,64
f9002a44:	40f607b3          	sub	a5,a2,a5
f9002a48:	00f897b3          	sll	a5,a7,a5
f9002a4c:	00ff6f33          	or	t5,t5,a5
f9002a50:	01e03633          	snez	a2,t5
f9002a54:	00d66633          	or	a2,a2,a3
f9002a58:	ac9ff06f          	j	f9002520 <__adddf3+0xbc>
f9002a5c:	ff8006b7          	lui	a3,0xff800
f9002a60:	fff68693          	addi	a3,a3,-1 # ff7fffff <__freertos_irq_stack_top+0x67fa01f>
f9002a64:	40f907b3          	sub	a5,s2,a5
f9002a68:	00d77733          	and	a4,a4,a3
f9002a6c:	01d71813          	slli	a6,a4,0x1d
f9002a70:	01386833          	or	a6,a6,s3
f9002a74:	00375713          	srli	a4,a4,0x3
f9002a78:	ed9ff06f          	j	f9002950 <__adddf3+0x4ec>
f9002a7c:	00b766b3          	or	a3,a4,a1
f9002a80:	1e068663          	beqz	a3,f9002c6c <__adddf3+0x808>
f9002a84:	fff78693          	addi	a3,a5,-1
f9002a88:	0a068e63          	beqz	a3,f9002b44 <__adddf3+0x6e0>
f9002a8c:	7ff00513          	li	a0,2047
f9002a90:	14a78063          	beq	a5,a0,f9002bd0 <__adddf3+0x76c>
f9002a94:	03800793          	li	a5,56
f9002a98:	00100993          	li	s3,1
f9002a9c:	e4d7c6e3          	blt	a5,a3,f90028e8 <__adddf3+0x484>
f9002aa0:	00068793          	mv	a5,a3
f9002aa4:	e15ff06f          	j	f90028b8 <__adddf3+0x454>
f9002aa8:	00040e13          	mv	t3,s0
f9002aac:	7ff00793          	li	a5,2047
f9002ab0:	00000713          	li	a4,0
f9002ab4:	00000813          	li	a6,0
f9002ab8:	b45ff06f          	j	f90025fc <__adddf3+0x198>
f9002abc:	7ff00793          	li	a5,2047
f9002ac0:	fef684e3          	beq	a3,a5,f9002aa8 <__adddf3+0x644>
f9002ac4:	01e58f33          	add	t5,a1,t5
f9002ac8:	00bf35b3          	sltu	a1,t5,a1
f9002acc:	011707b3          	add	a5,a4,a7
f9002ad0:	00b787b3          	add	a5,a5,a1
f9002ad4:	01f79613          	slli	a2,a5,0x1f
f9002ad8:	001f5f13          	srli	t5,t5,0x1
f9002adc:	01e664b3          	or	s1,a2,t5
f9002ae0:	0017d993          	srli	s3,a5,0x1
f9002ae4:	00068913          	mv	s2,a3
f9002ae8:	ab5ff06f          	j	f900259c <__adddf3+0x138>
f9002aec:	40bf0633          	sub	a2,t5,a1
f9002af0:	40e887b3          	sub	a5,a7,a4
f9002af4:	00cf3733          	sltu	a4,t5,a2
f9002af8:	00060493          	mv	s1,a2
f9002afc:	40e789b3          	sub	s3,a5,a4
f9002b00:	00068413          	mv	s0,a3
f9002b04:	a41ff06f          	j	f9002544 <__adddf3+0xe0>
f9002b08:	00361613          	slli	a2,a2,0x3
f9002b0c:	00365613          	srli	a2,a2,0x3
f9002b10:	00068413          	mv	s0,a3
f9002b14:	00088713          	mv	a4,a7
f9002b18:	e25ff06f          	j	f900293c <__adddf3+0x4d8>
f9002b1c:	de0312e3          	bnez	t1,f9002900 <__adddf3+0x49c>
f9002b20:	1c080663          	beqz	a6,f9002cec <__adddf3+0x888>
f9002b24:	0038d713          	srli	a4,a7,0x3
f9002b28:	00361613          	slli	a2,a2,0x3
f9002b2c:	01d89893          	slli	a7,a7,0x1d
f9002b30:	01176733          	or	a4,a4,a7
f9002b34:	00365613          	srli	a2,a2,0x3
f9002b38:	00c76733          	or	a4,a4,a2
f9002b3c:	00068413          	mv	s0,a3
f9002b40:	dddff06f          	j	f900291c <__adddf3+0x4b8>
f9002b44:	01e58f33          	add	t5,a1,t5
f9002b48:	011708b3          	add	a7,a4,a7
f9002b4c:	00bf35b3          	sltu	a1,t5,a1
f9002b50:	00b889b3          	add	s3,a7,a1
f9002b54:	00899793          	slli	a5,s3,0x8
f9002b58:	000f0493          	mv	s1,t5
f9002b5c:	0e07d463          	bgez	a5,f9002c44 <__adddf3+0x7e0>
f9002b60:	00200913          	li	s2,2
f9002b64:	bd1ff06f          	j	f9002734 <__adddf3+0x2d0>
f9002b68:	41e58f33          	sub	t5,a1,t5
f9002b6c:	411708b3          	sub	a7,a4,a7
f9002b70:	01e5b5b3          	sltu	a1,a1,t5
f9002b74:	000f0493          	mv	s1,t5
f9002b78:	40b889b3          	sub	s3,a7,a1
f9002b7c:	00100913          	li	s2,1
f9002b80:	9b1ff06f          	j	f9002530 <__adddf3+0xcc>
f9002b84:	fe078693          	addi	a3,a5,-32
f9002b88:	02000613          	li	a2,32
f9002b8c:	00d8d6b3          	srl	a3,a7,a3
f9002b90:	00c78a63          	beq	a5,a2,f9002ba4 <__adddf3+0x740>
f9002b94:	04000613          	li	a2,64
f9002b98:	40f607b3          	sub	a5,a2,a5
f9002b9c:	00f897b3          	sll	a5,a7,a5
f9002ba0:	00ff6f33          	or	t5,t5,a5
f9002ba4:	01e039b3          	snez	s3,t5
f9002ba8:	00d9e9b3          	or	s3,s3,a3
f9002bac:	b65ff06f          	j	f9002710 <__adddf3+0x2ac>
f9002bb0:	00351613          	slli	a2,a0,0x3
f9002bb4:	00365993          	srli	s3,a2,0x3
f9002bb8:	eb5ff06f          	j	f9002a6c <__adddf3+0x608>
f9002bbc:	00361613          	slli	a2,a2,0x3
f9002bc0:	00365613          	srli	a2,a2,0x3
f9002bc4:	00068413          	mv	s0,a3
f9002bc8:	00088713          	mv	a4,a7
f9002bcc:	d41ff06f          	j	f900290c <__adddf3+0x4a8>
f9002bd0:	00361613          	slli	a2,a2,0x3
f9002bd4:	00365613          	srli	a2,a2,0x3
f9002bd8:	00088713          	mv	a4,a7
f9002bdc:	d31ff06f          	j	f900290c <__adddf3+0x4a8>
f9002be0:	fe078513          	addi	a0,a5,-32
f9002be4:	02000613          	li	a2,32
f9002be8:	00a75533          	srl	a0,a4,a0
f9002bec:	00c78a63          	beq	a5,a2,f9002c00 <__adddf3+0x79c>
f9002bf0:	04000613          	li	a2,64
f9002bf4:	40f607b3          	sub	a5,a2,a5
f9002bf8:	00f717b3          	sll	a5,a4,a5
f9002bfc:	00f5e5b3          	or	a1,a1,a5
f9002c00:	00b03633          	snez	a2,a1
f9002c04:	00a66633          	or	a2,a2,a0
f9002c08:	a8dff06f          	j	f9002694 <__adddf3+0x230>
f9002c0c:	fc0682e3          	beqz	a3,f9002bd0 <__adddf3+0x76c>
f9002c10:	01e8ef33          	or	t5,a7,t5
f9002c14:	d00f16e3          	bnez	t5,f9002920 <__adddf3+0x4bc>
f9002c18:	cedff06f          	j	f9002904 <__adddf3+0x4a0>
f9002c1c:	dc0808e3          	beqz	a6,f90029ec <__adddf3+0x588>
f9002c20:	00361813          	slli	a6,a2,0x3
f9002c24:	01d89793          	slli	a5,a7,0x1d
f9002c28:	00385813          	srli	a6,a6,0x3
f9002c2c:	0038d713          	srli	a4,a7,0x3
f9002c30:	00f86833          	or	a6,a6,a5
f9002c34:	01d77733          	and	a4,a4,t4
f9002c38:	00068e13          	mv	t3,a3
f9002c3c:	00000793          	li	a5,0
f9002c40:	9bdff06f          	j	f90025fc <__adddf3+0x198>
f9002c44:	00100793          	li	a5,1
f9002c48:	c2dff06f          	j	f9002874 <__adddf3+0x410>
f9002c4c:	40bf05b3          	sub	a1,t5,a1
f9002c50:	40e888b3          	sub	a7,a7,a4
f9002c54:	00bf3733          	sltu	a4,t5,a1
f9002c58:	00058493          	mv	s1,a1
f9002c5c:	40e889b3          	sub	s3,a7,a4
f9002c60:	00068413          	mv	s0,a3
f9002c64:	00100913          	li	s2,1
f9002c68:	8c9ff06f          	j	f9002530 <__adddf3+0xcc>
f9002c6c:	00361613          	slli	a2,a2,0x3
f9002c70:	00365613          	srli	a2,a2,0x3
f9002c74:	00088713          	mv	a4,a7
f9002c78:	cc5ff06f          	j	f900293c <__adddf3+0x4d8>
f9002c7c:	00361613          	slli	a2,a2,0x3
f9002c80:	00365993          	srli	s3,a2,0x3
f9002c84:	00088713          	mv	a4,a7
f9002c88:	de5ff06f          	j	f9002a6c <__adddf3+0x608>
f9002c8c:	fe078693          	addi	a3,a5,-32
f9002c90:	02000613          	li	a2,32
f9002c94:	00d756b3          	srl	a3,a4,a3
f9002c98:	00c78a63          	beq	a5,a2,f9002cac <__adddf3+0x848>
f9002c9c:	04000613          	li	a2,64
f9002ca0:	40f607b3          	sub	a5,a2,a5
f9002ca4:	00f717b3          	sll	a5,a4,a5
f9002ca8:	00f5e5b3          	or	a1,a1,a5
f9002cac:	00b039b3          	snez	s3,a1
f9002cb0:	00d9e9b3          	or	s3,s3,a3
f9002cb4:	c35ff06f          	j	f90028e8 <__adddf3+0x484>
f9002cb8:	0034d613          	srli	a2,s1,0x3
f9002cbc:	00090793          	mv	a5,s2
f9002cc0:	00098713          	mv	a4,s3
f9002cc4:	c79ff06f          	j	f900293c <__adddf3+0x4d8>
f9002cc8:	02000693          	li	a3,32
f9002ccc:	40f686b3          	sub	a3,a3,a5
f9002cd0:	00000613          	li	a2,0
f9002cd4:	8b5ff06f          	j	f9002588 <__adddf3+0x124>
f9002cd8:	00c9e833          	or	a6,s3,a2
f9002cdc:	d00808e3          	beqz	a6,f90029ec <__adddf3+0x588>
f9002ce0:	0039d993          	srli	s3,s3,0x3
f9002ce4:	00060713          	mv	a4,a2
f9002ce8:	d85ff06f          	j	f9002a6c <__adddf3+0x608>
f9002cec:	00000e13          	li	t3,0
f9002cf0:	7ff00793          	li	a5,2047
f9002cf4:	00080737          	lui	a4,0x80
f9002cf8:	905ff06f          	j	f90025fc <__adddf3+0x198>
f9002cfc:	01d71793          	slli	a5,a4,0x1d
f9002d00:	00375713          	srli	a4,a4,0x3
f9002d04:	0107e833          	or	a6,a5,a6
f9002d08:	01d77733          	and	a4,a4,t4
f9002d0c:	00000793          	li	a5,0
f9002d10:	8edff06f          	j	f90025fc <__adddf3+0x198>
f9002d14:	01d71813          	slli	a6,a4,0x1d
f9002d18:	0035d593          	srli	a1,a1,0x3
f9002d1c:	00b86833          	or	a6,a6,a1
f9002d20:	00375713          	srli	a4,a4,0x3
f9002d24:	00068413          	mv	s0,a3
f9002d28:	c29ff06f          	j	f9002950 <__adddf3+0x4ec>

f9002d2c <__muldf3>:
f9002d2c:	fd010113          	addi	sp,sp,-48
f9002d30:	0145d793          	srli	a5,a1,0x14
f9002d34:	02812423          	sw	s0,40(sp)
f9002d38:	02912223          	sw	s1,36(sp)
f9002d3c:	03212023          	sw	s2,32(sp)
f9002d40:	01312e23          	sw	s3,28(sp)
f9002d44:	01512a23          	sw	s5,20(sp)
f9002d48:	00c59493          	slli	s1,a1,0xc
f9002d4c:	02112623          	sw	ra,44(sp)
f9002d50:	01412c23          	sw	s4,24(sp)
f9002d54:	01612823          	sw	s6,16(sp)
f9002d58:	01712623          	sw	s7,12(sp)
f9002d5c:	01812423          	sw	s8,8(sp)
f9002d60:	7ff7f793          	andi	a5,a5,2047
f9002d64:	00050413          	mv	s0,a0
f9002d68:	00060a93          	mv	s5,a2
f9002d6c:	00068993          	mv	s3,a3
f9002d70:	00c4d493          	srli	s1,s1,0xc
f9002d74:	01f5d913          	srli	s2,a1,0x1f
f9002d78:	42078463          	beqz	a5,f90031a0 <__muldf3+0x474>
f9002d7c:	7ff00713          	li	a4,2047
f9002d80:	0ae78663          	beq	a5,a4,f9002e2c <__muldf3+0x100>
f9002d84:	00349693          	slli	a3,s1,0x3
f9002d88:	01d55713          	srli	a4,a0,0x1d
f9002d8c:	00d76733          	or	a4,a4,a3
f9002d90:	008006b7          	lui	a3,0x800
f9002d94:	00d764b3          	or	s1,a4,a3
f9002d98:	00351a13          	slli	s4,a0,0x3
f9002d9c:	c0178c13          	addi	s8,a5,-1023
f9002da0:	00000b13          	li	s6,0
f9002da4:	00000b93          	li	s7,0
f9002da8:	0149d793          	srli	a5,s3,0x14
f9002dac:	00c99713          	slli	a4,s3,0xc
f9002db0:	7ff7f793          	andi	a5,a5,2047
f9002db4:	000a8f13          	mv	t5,s5
f9002db8:	00c75413          	srli	s0,a4,0xc
f9002dbc:	01f9d993          	srli	s3,s3,0x1f
f9002dc0:	0a078063          	beqz	a5,f9002e60 <__muldf3+0x134>
f9002dc4:	7ff00713          	li	a4,2047
f9002dc8:	14e78e63          	beq	a5,a4,f9002f24 <__muldf3+0x1f8>
f9002dcc:	00341713          	slli	a4,s0,0x3
f9002dd0:	01dad593          	srli	a1,s5,0x1d
f9002dd4:	00e5e5b3          	or	a1,a1,a4
f9002dd8:	c0178793          	addi	a5,a5,-1023
f9002ddc:	00800737          	lui	a4,0x800
f9002de0:	00e5e433          	or	s0,a1,a4
f9002de4:	003a9f13          	slli	t5,s5,0x3
f9002de8:	018788b3          	add	a7,a5,s8
f9002dec:	00000313          	li	t1,0
f9002df0:	00a00713          	li	a4,10
f9002df4:	00188513          	addi	a0,a7,1
f9002df8:	0b674c63          	blt	a4,s6,f9002eb0 <__muldf3+0x184>
f9002dfc:	013945b3          	xor	a1,s2,s3
f9002e00:	00200793          	li	a5,2
f9002e04:	00058813          	mv	a6,a1
f9002e08:	1567c663          	blt	a5,s6,f9002f54 <__muldf3+0x228>
f9002e0c:	fffb0b13          	addi	s6,s6,-1
f9002e10:	00100713          	li	a4,1
f9002e14:	17676063          	bltu	a4,s6,f9002f74 <__muldf3+0x248>
f9002e18:	3cf30a63          	beq	t1,a5,f90031ec <__muldf3+0x4c0>
f9002e1c:	00040493          	mv	s1,s0
f9002e20:	000f0a13          	mv	s4,t5
f9002e24:	00030b93          	mv	s7,t1
f9002e28:	09c0006f          	j	f9002ec4 <__muldf3+0x198>
f9002e2c:	00a4ea33          	or	s4,s1,a0
f9002e30:	3c0a1863          	bnez	s4,f9003200 <__muldf3+0x4d4>
f9002e34:	0149d793          	srli	a5,s3,0x14
f9002e38:	00c99713          	slli	a4,s3,0xc
f9002e3c:	7ff7f793          	andi	a5,a5,2047
f9002e40:	00000493          	li	s1,0
f9002e44:	00800b13          	li	s6,8
f9002e48:	7ff00c13          	li	s8,2047
f9002e4c:	00200b93          	li	s7,2
f9002e50:	000a8f13          	mv	t5,s5
f9002e54:	00c75413          	srli	s0,a4,0xc
f9002e58:	01f9d993          	srli	s3,s3,0x1f
f9002e5c:	f60794e3          	bnez	a5,f9002dc4 <__muldf3+0x98>
f9002e60:	015467b3          	or	a5,s0,s5
f9002e64:	3c078263          	beqz	a5,f9003228 <__muldf3+0x4fc>
f9002e68:	4a040063          	beqz	s0,f9003308 <__muldf3+0x5dc>
f9002e6c:	00040513          	mv	a0,s0
f9002e70:	7b8010ef          	jal	f9004628 <__clzsi2>
f9002e74:	00050893          	mv	a7,a0
f9002e78:	ff550713          	addi	a4,a0,-11
f9002e7c:	01d00793          	li	a5,29
f9002e80:	ff888f13          	addi	t5,a7,-8
f9002e84:	40e787b3          	sub	a5,a5,a4
f9002e88:	00fad7b3          	srl	a5,s5,a5
f9002e8c:	01e41733          	sll	a4,s0,t5
f9002e90:	00e7e433          	or	s0,a5,a4
f9002e94:	01ea9f33          	sll	t5,s5,t5
f9002e98:	411c08b3          	sub	a7,s8,a7
f9002e9c:	c0d88893          	addi	a7,a7,-1011
f9002ea0:	00a00713          	li	a4,10
f9002ea4:	00000313          	li	t1,0
f9002ea8:	00188513          	addi	a0,a7,1
f9002eac:	f56758e3          	bge	a4,s6,f9002dfc <__muldf3+0xd0>
f9002eb0:	00090593          	mv	a1,s2
f9002eb4:	00200793          	li	a5,2
f9002eb8:	32fb8a63          	beq	s7,a5,f90031ec <__muldf3+0x4c0>
f9002ebc:	00300793          	li	a5,3
f9002ec0:	48fb8c63          	beq	s7,a5,f9003358 <__muldf3+0x62c>
f9002ec4:	00100793          	li	a5,1
f9002ec8:	00058813          	mv	a6,a1
f9002ecc:	46fb9a63          	bne	s7,a5,f9003340 <__muldf3+0x614>
f9002ed0:	00000793          	li	a5,0
f9002ed4:	00000693          	li	a3,0
f9002ed8:	00000713          	li	a4,0
f9002edc:	02c12083          	lw	ra,44(sp)
f9002ee0:	02812403          	lw	s0,40(sp)
f9002ee4:	01479793          	slli	a5,a5,0x14
f9002ee8:	00d7e7b3          	or	a5,a5,a3
f9002eec:	01f81693          	slli	a3,a6,0x1f
f9002ef0:	00d7e7b3          	or	a5,a5,a3
f9002ef4:	02412483          	lw	s1,36(sp)
f9002ef8:	02012903          	lw	s2,32(sp)
f9002efc:	01c12983          	lw	s3,28(sp)
f9002f00:	01812a03          	lw	s4,24(sp)
f9002f04:	01412a83          	lw	s5,20(sp)
f9002f08:	01012b03          	lw	s6,16(sp)
f9002f0c:	00c12b83          	lw	s7,12(sp)
f9002f10:	00812c03          	lw	s8,8(sp)
f9002f14:	00070513          	mv	a0,a4
f9002f18:	00078593          	mv	a1,a5
f9002f1c:	03010113          	addi	sp,sp,48
f9002f20:	00008067          	ret
f9002f24:	01546733          	or	a4,s0,s5
f9002f28:	7ffc0893          	addi	a7,s8,2047
f9002f2c:	30070a63          	beqz	a4,f9003240 <__muldf3+0x514>
f9002f30:	00001737          	lui	a4,0x1
f9002f34:	01394833          	xor	a6,s2,s3
f9002f38:	80070713          	addi	a4,a4,-2048 # 800 <CUSTOM2+0x7a5>
f9002f3c:	003b6b13          	ori	s6,s6,3
f9002f40:	00a00693          	li	a3,10
f9002f44:	00080593          	mv	a1,a6
f9002f48:	00ec0533          	add	a0,s8,a4
f9002f4c:	3966c063          	blt	a3,s6,f90032cc <__muldf3+0x5a0>
f9002f50:	00300313          	li	t1,3
f9002f54:	00100613          	li	a2,1
f9002f58:	01661633          	sll	a2,a2,s6
f9002f5c:	53067713          	andi	a4,a2,1328
f9002f60:	f4071ae3          	bnez	a4,f9002eb4 <__muldf3+0x188>
f9002f64:	24067793          	andi	a5,a2,576
f9002f68:	3c079463          	bnez	a5,f9003330 <__muldf3+0x604>
f9002f6c:	08867613          	andi	a2,a2,136
f9002f70:	2e061263          	bnez	a2,f9003254 <__muldf3+0x528>
f9002f74:	00010fb7          	lui	t6,0x10
f9002f78:	ffff8e93          	addi	t4,t6,-1 # ffff <__stack_size+0xefff>
f9002f7c:	01da77b3          	and	a5,s4,t4
f9002f80:	010a5693          	srli	a3,s4,0x10
f9002f84:	01df7eb3          	and	t4,t5,t4
f9002f88:	010f5e13          	srli	t3,t5,0x10
f9002f8c:	03d78733          	mul	a4,a5,t4
f9002f90:	03d68333          	mul	t1,a3,t4
f9002f94:	01075593          	srli	a1,a4,0x10
f9002f98:	02fe0633          	mul	a2,t3,a5
f9002f9c:	00660633          	add	a2,a2,t1
f9002fa0:	00c585b3          	add	a1,a1,a2
f9002fa4:	03c68f33          	mul	t5,a3,t3
f9002fa8:	0065f463          	bgeu	a1,t1,f9002fb0 <__muldf3+0x284>
f9002fac:	01ff0f33          	add	t5,t5,t6
f9002fb0:	000103b7          	lui	t2,0x10
f9002fb4:	fff38613          	addi	a2,t2,-1 # ffff <__stack_size+0xefff>
f9002fb8:	00c5f333          	and	t1,a1,a2
f9002fbc:	01045f93          	srli	t6,s0,0x10
f9002fc0:	00c77733          	and	a4,a4,a2
f9002fc4:	00c47433          	and	s0,s0,a2
f9002fc8:	01031313          	slli	t1,t1,0x10
f9002fcc:	028782b3          	mul	t0,a5,s0
f9002fd0:	00e30333          	add	t1,t1,a4
f9002fd4:	0105d593          	srli	a1,a1,0x10
f9002fd8:	02868733          	mul	a4,a3,s0
f9002fdc:	0102d613          	srli	a2,t0,0x10
f9002fe0:	02ff87b3          	mul	a5,t6,a5
f9002fe4:	00e787b3          	add	a5,a5,a4
f9002fe8:	00f60633          	add	a2,a2,a5
f9002fec:	03f687b3          	mul	a5,a3,t6
f9002ff0:	00e67463          	bgeu	a2,a4,f9002ff8 <__muldf3+0x2cc>
f9002ff4:	007787b3          	add	a5,a5,t2
f9002ff8:	00010937          	lui	s2,0x10
f9002ffc:	fff90993          	addi	s3,s2,-1 # ffff <__stack_size+0xefff>
f9003000:	01367733          	and	a4,a2,s3
f9003004:	0104d393          	srli	t2,s1,0x10
f9003008:	0134f6b3          	and	a3,s1,s3
f900300c:	0132f2b3          	and	t0,t0,s3
f9003010:	01071713          	slli	a4,a4,0x10
f9003014:	02de84b3          	mul	s1,t4,a3
f9003018:	00570733          	add	a4,a4,t0
f900301c:	01065613          	srli	a2,a2,0x10
f9003020:	00f60633          	add	a2,a2,a5
f9003024:	00e585b3          	add	a1,a1,a4
f9003028:	02de02b3          	mul	t0,t3,a3
f900302c:	0104d793          	srli	a5,s1,0x10
f9003030:	03d38eb3          	mul	t4,t2,t4
f9003034:	01d282b3          	add	t0,t0,t4
f9003038:	005787b3          	add	a5,a5,t0
f900303c:	027e0e33          	mul	t3,t3,t2
f9003040:	01d7f463          	bgeu	a5,t4,f9003048 <__muldf3+0x31c>
f9003044:	012e0e33          	add	t3,t3,s2
f9003048:	000109b7          	lui	s3,0x10
f900304c:	fff98e93          	addi	t4,s3,-1 # ffff <__stack_size+0xefff>
f9003050:	01d7f2b3          	and	t0,a5,t4
f9003054:	0107d793          	srli	a5,a5,0x10
f9003058:	01c787b3          	add	a5,a5,t3
f900305c:	01d4feb3          	and	t4,s1,t4
f9003060:	01029293          	slli	t0,t0,0x10
f9003064:	02d40933          	mul	s2,s0,a3
f9003068:	01d282b3          	add	t0,t0,t4
f900306c:	02838433          	mul	s0,t2,s0
f9003070:	01095e13          	srli	t3,s2,0x10
f9003074:	02df86b3          	mul	a3,t6,a3
f9003078:	008686b3          	add	a3,a3,s0
f900307c:	00de0e33          	add	t3,t3,a3
f9003080:	027f8eb3          	mul	t4,t6,t2
f9003084:	008e7463          	bgeu	t3,s0,f900308c <__muldf3+0x360>
f9003088:	013e8eb3          	add	t4,t4,s3
f900308c:	00010fb7          	lui	t6,0x10
f9003090:	ffff8f93          	addi	t6,t6,-1 # ffff <__stack_size+0xefff>
f9003094:	01fe76b3          	and	a3,t3,t6
f9003098:	01069693          	slli	a3,a3,0x10
f900309c:	01f97933          	and	s2,s2,t6
f90030a0:	01e585b3          	add	a1,a1,t5
f90030a4:	012686b3          	add	a3,a3,s2
f90030a8:	00c68633          	add	a2,a3,a2
f90030ac:	00e5b733          	sltu	a4,a1,a4
f90030b0:	00e60733          	add	a4,a2,a4
f90030b4:	00558f33          	add	t5,a1,t0
f90030b8:	00f707b3          	add	a5,a4,a5
f90030bc:	00bf35b3          	sltu	a1,t5,a1
f90030c0:	00b785b3          	add	a1,a5,a1
f90030c4:	00d636b3          	sltu	a3,a2,a3
f90030c8:	00c73633          	sltu	a2,a4,a2
f90030cc:	00c6e6b3          	or	a3,a3,a2
f90030d0:	00e7b733          	sltu	a4,a5,a4
f90030d4:	010e5e13          	srli	t3,t3,0x10
f90030d8:	00f5b7b3          	sltu	a5,a1,a5
f90030dc:	01c686b3          	add	a3,a3,t3
f90030e0:	00f76733          	or	a4,a4,a5
f90030e4:	009f1793          	slli	a5,t5,0x9
f90030e8:	00d70733          	add	a4,a4,a3
f90030ec:	0067e7b3          	or	a5,a5,t1
f90030f0:	01d70733          	add	a4,a4,t4
f90030f4:	00f037b3          	snez	a5,a5
f90030f8:	017f5613          	srli	a2,t5,0x17
f90030fc:	00971713          	slli	a4,a4,0x9
f9003100:	0175d693          	srli	a3,a1,0x17
f9003104:	00c7e7b3          	or	a5,a5,a2
f9003108:	00959593          	slli	a1,a1,0x9
f900310c:	00b7ea33          	or	s4,a5,a1
f9003110:	00771793          	slli	a5,a4,0x7
f9003114:	00d764b3          	or	s1,a4,a3
f9003118:	0207d063          	bgez	a5,f9003138 <__muldf3+0x40c>
f900311c:	001a5713          	srli	a4,s4,0x1
f9003120:	001a7793          	andi	a5,s4,1
f9003124:	01f49693          	slli	a3,s1,0x1f
f9003128:	00f767b3          	or	a5,a4,a5
f900312c:	00d7ea33          	or	s4,a5,a3
f9003130:	0014d493          	srli	s1,s1,0x1
f9003134:	00050893          	mv	a7,a0
f9003138:	3ff88613          	addi	a2,a7,1023
f900313c:	12c05663          	blez	a2,f9003268 <__muldf3+0x53c>
f9003140:	007a7793          	andi	a5,s4,7
f9003144:	02078063          	beqz	a5,f9003164 <__muldf3+0x438>
f9003148:	00fa7793          	andi	a5,s4,15
f900314c:	00400713          	li	a4,4
f9003150:	00e78a63          	beq	a5,a4,f9003164 <__muldf3+0x438>
f9003154:	004a0713          	addi	a4,s4,4
f9003158:	014737b3          	sltu	a5,a4,s4
f900315c:	00f484b3          	add	s1,s1,a5
f9003160:	00070a13          	mv	s4,a4
f9003164:	00749793          	slli	a5,s1,0x7
f9003168:	0007da63          	bgez	a5,f900317c <__muldf3+0x450>
f900316c:	ff0007b7          	lui	a5,0xff000
f9003170:	fff78793          	addi	a5,a5,-1 # feffffff <__freertos_irq_stack_top+0x5ffa01f>
f9003174:	00f4f4b3          	and	s1,s1,a5
f9003178:	40088613          	addi	a2,a7,1024
f900317c:	7fe00793          	li	a5,2046
f9003180:	1cc7c463          	blt	a5,a2,f9003348 <__muldf3+0x61c>
f9003184:	003a5793          	srli	a5,s4,0x3
f9003188:	01d49713          	slli	a4,s1,0x1d
f900318c:	00949693          	slli	a3,s1,0x9
f9003190:	00f76733          	or	a4,a4,a5
f9003194:	00c6d693          	srli	a3,a3,0xc
f9003198:	7ff67793          	andi	a5,a2,2047
f900319c:	d41ff06f          	j	f9002edc <__muldf3+0x1b0>
f90031a0:	00a4ea33          	or	s4,s1,a0
f90031a4:	060a0863          	beqz	s4,f9003214 <__muldf3+0x4e8>
f90031a8:	12048e63          	beqz	s1,f90032e4 <__muldf3+0x5b8>
f90031ac:	00048513          	mv	a0,s1
f90031b0:	478010ef          	jal	f9004628 <__clzsi2>
f90031b4:	00050613          	mv	a2,a0
f90031b8:	ff550693          	addi	a3,a0,-11
f90031bc:	01d00713          	li	a4,29
f90031c0:	ff860793          	addi	a5,a2,-8 # 7ffff8 <__stack_size+0x7feff8>
f90031c4:	40d70733          	sub	a4,a4,a3
f90031c8:	00e45733          	srl	a4,s0,a4
f90031cc:	00f496b3          	sll	a3,s1,a5
f90031d0:	00d764b3          	or	s1,a4,a3
f90031d4:	00f41a33          	sll	s4,s0,a5
f90031d8:	c0d00793          	li	a5,-1011
f90031dc:	40c78c33          	sub	s8,a5,a2
f90031e0:	00000b13          	li	s6,0
f90031e4:	00000b93          	li	s7,0
f90031e8:	bc1ff06f          	j	f9002da8 <__muldf3+0x7c>
f90031ec:	00058813          	mv	a6,a1
f90031f0:	7ff00793          	li	a5,2047
f90031f4:	00000693          	li	a3,0
f90031f8:	00000713          	li	a4,0
f90031fc:	ce1ff06f          	j	f9002edc <__muldf3+0x1b0>
f9003200:	00050a13          	mv	s4,a0
f9003204:	00c00b13          	li	s6,12
f9003208:	7ff00c13          	li	s8,2047
f900320c:	00300b93          	li	s7,3
f9003210:	b99ff06f          	j	f9002da8 <__muldf3+0x7c>
f9003214:	00000493          	li	s1,0
f9003218:	00400b13          	li	s6,4
f900321c:	00000c13          	li	s8,0
f9003220:	00100b93          	li	s7,1
f9003224:	b85ff06f          	j	f9002da8 <__muldf3+0x7c>
f9003228:	001b6b13          	ori	s6,s6,1
f900322c:	000c0893          	mv	a7,s8
f9003230:	00000413          	li	s0,0
f9003234:	00000f13          	li	t5,0
f9003238:	00100313          	li	t1,1
f900323c:	bb5ff06f          	j	f9002df0 <__muldf3+0xc4>
f9003240:	002b6b13          	ori	s6,s6,2
f9003244:	00000413          	li	s0,0
f9003248:	00000f13          	li	t5,0
f900324c:	00200313          	li	t1,2
f9003250:	ba1ff06f          	j	f9002df0 <__muldf3+0xc4>
f9003254:	00040493          	mv	s1,s0
f9003258:	000f0a13          	mv	s4,t5
f900325c:	00030b93          	mv	s7,t1
f9003260:	00098593          	mv	a1,s3
f9003264:	c51ff06f          	j	f9002eb4 <__muldf3+0x188>
f9003268:	00100713          	li	a4,1
f900326c:	10061063          	bnez	a2,f900336c <__muldf3+0x640>
f9003270:	41e88893          	addi	a7,a7,1054
f9003274:	011a1633          	sll	a2,s4,a7
f9003278:	00c03633          	snez	a2,a2
f900327c:	011498b3          	sll	a7,s1,a7
f9003280:	00ea57b3          	srl	a5,s4,a4
f9003284:	01166633          	or	a2,a2,a7
f9003288:	00f66633          	or	a2,a2,a5
f900328c:	00767793          	andi	a5,a2,7
f9003290:	00e4d5b3          	srl	a1,s1,a4
f9003294:	02078063          	beqz	a5,f90032b4 <__muldf3+0x588>
f9003298:	00f67793          	andi	a5,a2,15
f900329c:	00400713          	li	a4,4
f90032a0:	00e78a63          	beq	a5,a4,f90032b4 <__muldf3+0x588>
f90032a4:	00460793          	addi	a5,a2,4
f90032a8:	00c7b633          	sltu	a2,a5,a2
f90032ac:	00c585b3          	add	a1,a1,a2
f90032b0:	00078613          	mv	a2,a5
f90032b4:	00859513          	slli	a0,a1,0x8
f90032b8:	00100793          	li	a5,1
f90032bc:	00000693          	li	a3,0
f90032c0:	00000713          	li	a4,0
f90032c4:	c0054ce3          	bltz	a0,f9002edc <__muldf3+0x1b0>
f90032c8:	10c0006f          	j	f90033d4 <__muldf3+0x6a8>
f90032cc:	00f00713          	li	a4,15
f90032d0:	12eb1063          	bne	s6,a4,f90033f0 <__muldf3+0x6c4>
f90032d4:	00000813          	li	a6,0
f90032d8:	000806b7          	lui	a3,0x80
f90032dc:	00000713          	li	a4,0
f90032e0:	bfdff06f          	j	f9002edc <__muldf3+0x1b0>
f90032e4:	344010ef          	jal	f9004628 <__clzsi2>
f90032e8:	01550693          	addi	a3,a0,21
f90032ec:	01c00793          	li	a5,28
f90032f0:	02050613          	addi	a2,a0,32
f90032f4:	ecd7d4e3          	bge	a5,a3,f90031bc <__muldf3+0x490>
f90032f8:	ff850513          	addi	a0,a0,-8
f90032fc:	00000a13          	li	s4,0
f9003300:	00a414b3          	sll	s1,s0,a0
f9003304:	ed5ff06f          	j	f90031d8 <__muldf3+0x4ac>
f9003308:	000a8513          	mv	a0,s5
f900330c:	31c010ef          	jal	f9004628 <__clzsi2>
f9003310:	01550713          	addi	a4,a0,21
f9003314:	01c00793          	li	a5,28
f9003318:	02050893          	addi	a7,a0,32
f900331c:	b6e7d0e3          	bge	a5,a4,f9002e7c <__muldf3+0x150>
f9003320:	ff850513          	addi	a0,a0,-8
f9003324:	00000f13          	li	t5,0
f9003328:	00aa9433          	sll	s0,s5,a0
f900332c:	b6dff06f          	j	f9002e98 <__muldf3+0x16c>
f9003330:	00000813          	li	a6,0
f9003334:	7ff00793          	li	a5,2047
f9003338:	000806b7          	lui	a3,0x80
f900333c:	ba1ff06f          	j	f9002edc <__muldf3+0x1b0>
f9003340:	00050893          	mv	a7,a0
f9003344:	df5ff06f          	j	f9003138 <__muldf3+0x40c>
f9003348:	7ff00793          	li	a5,2047
f900334c:	00000693          	li	a3,0
f9003350:	00000713          	li	a4,0
f9003354:	b89ff06f          	j	f9002edc <__muldf3+0x1b0>
f9003358:	00000813          	li	a6,0
f900335c:	7ff00793          	li	a5,2047
f9003360:	000806b7          	lui	a3,0x80
f9003364:	00000713          	li	a4,0
f9003368:	b75ff06f          	j	f9002edc <__muldf3+0x1b0>
f900336c:	40c70733          	sub	a4,a4,a2
f9003370:	03800793          	li	a5,56
f9003374:	b4e7cee3          	blt	a5,a4,f9002ed0 <__muldf3+0x1a4>
f9003378:	01f00793          	li	a5,31
f900337c:	eee7dae3          	bge	a5,a4,f9003270 <__muldf3+0x544>
f9003380:	fe100793          	li	a5,-31
f9003384:	40c787b3          	sub	a5,a5,a2
f9003388:	02000693          	li	a3,32
f900338c:	00f4d7b3          	srl	a5,s1,a5
f9003390:	00d70863          	beq	a4,a3,f90033a0 <__muldf3+0x674>
f9003394:	43e88893          	addi	a7,a7,1086
f9003398:	011498b3          	sll	a7,s1,a7
f900339c:	011a6a33          	or	s4,s4,a7
f90033a0:	01403633          	snez	a2,s4
f90033a4:	00f66633          	or	a2,a2,a5
f90033a8:	00767713          	andi	a4,a2,7
f90033ac:	00000693          	li	a3,0
f90033b0:	02070863          	beqz	a4,f90033e0 <__muldf3+0x6b4>
f90033b4:	00f67793          	andi	a5,a2,15
f90033b8:	00400713          	li	a4,4
f90033bc:	00000593          	li	a1,0
f90033c0:	00e78a63          	beq	a5,a4,f90033d4 <__muldf3+0x6a8>
f90033c4:	00460793          	addi	a5,a2,4
f90033c8:	00c7b633          	sltu	a2,a5,a2
f90033cc:	00c035b3          	snez	a1,a2
f90033d0:	00078613          	mv	a2,a5
f90033d4:	00959693          	slli	a3,a1,0x9
f90033d8:	01d59713          	slli	a4,a1,0x1d
f90033dc:	00c6d693          	srli	a3,a3,0xc
f90033e0:	00365613          	srli	a2,a2,0x3
f90033e4:	00e66733          	or	a4,a2,a4
f90033e8:	00000793          	li	a5,0
f90033ec:	af1ff06f          	j	f9002edc <__muldf3+0x1b0>
f90033f0:	00040493          	mv	s1,s0
f90033f4:	000a8a13          	mv	s4,s5
f90033f8:	00300b93          	li	s7,3
f90033fc:	00098593          	mv	a1,s3
f9003400:	ab5ff06f          	j	f9002eb4 <__muldf3+0x188>

f9003404 <__fixdfsi>:
f9003404:	0145d793          	srli	a5,a1,0x14
f9003408:	001006b7          	lui	a3,0x100
f900340c:	fff68713          	addi	a4,a3,-1 # fffff <__stack_size+0xfefff>
f9003410:	7ff7f793          	andi	a5,a5,2047
f9003414:	3fe00613          	li	a2,1022
f9003418:	00b77733          	and	a4,a4,a1
f900341c:	01f5d593          	srli	a1,a1,0x1f
f9003420:	00f65e63          	bge	a2,a5,f900343c <__fixdfsi+0x38>
f9003424:	41d00613          	li	a2,1053
f9003428:	00f65e63          	bge	a2,a5,f9003444 <__fixdfsi+0x40>
f900342c:	80000537          	lui	a0,0x80000
f9003430:	fff50513          	addi	a0,a0,-1 # 7fffffff <__stack_size+0x7fffefff>
f9003434:	00a58533          	add	a0,a1,a0
f9003438:	00008067          	ret
f900343c:	00000513          	li	a0,0
f9003440:	00008067          	ret
f9003444:	43300613          	li	a2,1075
f9003448:	40f60633          	sub	a2,a2,a5
f900344c:	01f00813          	li	a6,31
f9003450:	00d76733          	or	a4,a4,a3
f9003454:	02c85063          	bge	a6,a2,f9003474 <__fixdfsi+0x70>
f9003458:	41300693          	li	a3,1043
f900345c:	40f687b3          	sub	a5,a3,a5
f9003460:	00f75733          	srl	a4,a4,a5
f9003464:	40e00533          	neg	a0,a4
f9003468:	fc059ce3          	bnez	a1,f9003440 <__fixdfsi+0x3c>
f900346c:	00070513          	mv	a0,a4
f9003470:	00008067          	ret
f9003474:	bed78793          	addi	a5,a5,-1043
f9003478:	00f71733          	sll	a4,a4,a5
f900347c:	00c55533          	srl	a0,a0,a2
f9003480:	00a76733          	or	a4,a4,a0
f9003484:	fe1ff06f          	j	f9003464 <__fixdfsi+0x60>

f9003488 <__floatsidf>:
f9003488:	ff010113          	addi	sp,sp,-16
f900348c:	00112623          	sw	ra,12(sp)
f9003490:	00812423          	sw	s0,8(sp)
f9003494:	00912223          	sw	s1,4(sp)
f9003498:	04050a63          	beqz	a0,f90034ec <__floatsidf+0x64>
f900349c:	41f55713          	srai	a4,a0,0x1f
f90034a0:	00a744b3          	xor	s1,a4,a0
f90034a4:	40e484b3          	sub	s1,s1,a4
f90034a8:	00050793          	mv	a5,a0
f90034ac:	00048513          	mv	a0,s1
f90034b0:	01f7d413          	srli	s0,a5,0x1f
f90034b4:	174010ef          	jal	f9004628 <__clzsi2>
f90034b8:	41e00793          	li	a5,1054
f90034bc:	40a787b3          	sub	a5,a5,a0
f90034c0:	00a00713          	li	a4,10
f90034c4:	7ff7f793          	andi	a5,a5,2047
f90034c8:	06a74063          	blt	a4,a0,f9003528 <__floatsidf+0xa0>
f90034cc:	00b00713          	li	a4,11
f90034d0:	40a70733          	sub	a4,a4,a0
f90034d4:	00e4d733          	srl	a4,s1,a4
f90034d8:	01550513          	addi	a0,a0,21
f90034dc:	00c71713          	slli	a4,a4,0xc
f90034e0:	00a494b3          	sll	s1,s1,a0
f90034e4:	00c75713          	srli	a4,a4,0xc
f90034e8:	0140006f          	j	f90034fc <__floatsidf+0x74>
f90034ec:	00000413          	li	s0,0
f90034f0:	00000793          	li	a5,0
f90034f4:	00000713          	li	a4,0
f90034f8:	00000493          	li	s1,0
f90034fc:	01479793          	slli	a5,a5,0x14
f9003500:	01f41413          	slli	s0,s0,0x1f
f9003504:	00e7e7b3          	or	a5,a5,a4
f9003508:	00c12083          	lw	ra,12(sp)
f900350c:	0087e7b3          	or	a5,a5,s0
f9003510:	00812403          	lw	s0,8(sp)
f9003514:	00048513          	mv	a0,s1
f9003518:	00078593          	mv	a1,a5
f900351c:	00412483          	lw	s1,4(sp)
f9003520:	01010113          	addi	sp,sp,16
f9003524:	00008067          	ret
f9003528:	ff550513          	addi	a0,a0,-11
f900352c:	00a49733          	sll	a4,s1,a0
f9003530:	00c71713          	slli	a4,a4,0xc
f9003534:	00c75713          	srli	a4,a4,0xc
f9003538:	00000493          	li	s1,0
f900353c:	fc1ff06f          	j	f90034fc <__floatsidf+0x74>

f9003540 <__addsf3>:
f9003540:	008007b7          	lui	a5,0x800
f9003544:	ff010113          	addi	sp,sp,-16
f9003548:	01755693          	srli	a3,a0,0x17
f900354c:	0175d713          	srli	a4,a1,0x17
f9003550:	fff78793          	addi	a5,a5,-1 # 7fffff <__stack_size+0x7fefff>
f9003554:	00a7f633          	and	a2,a5,a0
f9003558:	0ff77813          	zext.b	a6,a4
f900355c:	00812423          	sw	s0,8(sp)
f9003560:	01212023          	sw	s2,0(sp)
f9003564:	01f55413          	srli	s0,a0,0x1f
f9003568:	0ff6f913          	zext.b	s2,a3
f900356c:	00b7f533          	and	a0,a5,a1
f9003570:	00112623          	sw	ra,12(sp)
f9003574:	01f5d593          	srli	a1,a1,0x1f
f9003578:	00060693          	mv	a3,a2
f900357c:	00040893          	mv	a7,s0
f9003580:	00361713          	slli	a4,a2,0x3
f9003584:	00351e13          	slli	t3,a0,0x3
f9003588:	41090333          	sub	t1,s2,a6
f900358c:	04b40863          	beq	s0,a1,f90035dc <__addsf3+0x9c>
f9003590:	02605263          	blez	t1,f90035b4 <__addsf3+0x74>
f9003594:	06081863          	bnez	a6,f9003604 <__addsf3+0xc4>
f9003598:	1e0e0463          	beqz	t3,f9003780 <__addsf3+0x240>
f900359c:	fff30793          	addi	a5,t1,-1
f90035a0:	3c078e63          	beqz	a5,f900397c <__addsf3+0x43c>
f90035a4:	0ff00693          	li	a3,255
f90035a8:	1ed30463          	beq	t1,a3,f9003790 <__addsf3+0x250>
f90035ac:	00078313          	mv	t1,a5
f90035b0:	0640006f          	j	f9003614 <__addsf3+0xd4>
f90035b4:	14030463          	beqz	t1,f90036fc <__addsf3+0x1bc>
f90035b8:	41280333          	sub	t1,a6,s2
f90035bc:	28091263          	bnez	s2,f9003840 <__addsf3+0x300>
f90035c0:	1a070c63          	beqz	a4,f9003778 <__addsf3+0x238>
f90035c4:	fff30793          	addi	a5,t1,-1
f90035c8:	3e078263          	beqz	a5,f90039ac <__addsf3+0x46c>
f90035cc:	0ff00693          	li	a3,255
f90035d0:	3ad30063          	beq	t1,a3,f9003970 <__addsf3+0x430>
f90035d4:	00078313          	mv	t1,a5
f90035d8:	2780006f          	j	f9003850 <__addsf3+0x310>
f90035dc:	1e605063          	blez	t1,f90037bc <__addsf3+0x27c>
f90035e0:	16080463          	beqz	a6,f9003748 <__addsf3+0x208>
f90035e4:	0ff00793          	li	a5,255
f90035e8:	1af90463          	beq	s2,a5,f9003790 <__addsf3+0x250>
f90035ec:	040007b7          	lui	a5,0x4000
f90035f0:	00fe6e33          	or	t3,t3,a5
f90035f4:	01b00793          	li	a5,27
f90035f8:	2a67da63          	bge	a5,t1,f90038ac <__addsf3+0x36c>
f90035fc:	00170713          	addi	a4,a4,1
f9003600:	0900006f          	j	f9003690 <__addsf3+0x150>
f9003604:	0ff00793          	li	a5,255
f9003608:	18f90463          	beq	s2,a5,f9003790 <__addsf3+0x250>
f900360c:	040007b7          	lui	a5,0x4000
f9003610:	00fe6e33          	or	t3,t3,a5
f9003614:	01b00693          	li	a3,27
f9003618:	00100793          	li	a5,1
f900361c:	0066ce63          	blt	a3,t1,f9003638 <__addsf3+0xf8>
f9003620:	02000793          	li	a5,32
f9003624:	406787b3          	sub	a5,a5,t1
f9003628:	00fe17b3          	sll	a5,t3,a5
f900362c:	006e56b3          	srl	a3,t3,t1
f9003630:	00f037b3          	snez	a5,a5
f9003634:	00f6e7b3          	or	a5,a3,a5
f9003638:	40f70733          	sub	a4,a4,a5
f900363c:	00571793          	slli	a5,a4,0x5
f9003640:	1607d863          	bgez	a5,f90037b0 <__addsf3+0x270>
f9003644:	00912223          	sw	s1,4(sp)
f9003648:	040004b7          	lui	s1,0x4000
f900364c:	fff48493          	addi	s1,s1,-1 # 3ffffff <__stack_size+0x3ffefff>
f9003650:	009774b3          	and	s1,a4,s1
f9003654:	00048513          	mv	a0,s1
f9003658:	7d1000ef          	jal	f9004628 <__clzsi2>
f900365c:	ffb50513          	addi	a0,a0,-5
f9003660:	00a494b3          	sll	s1,s1,a0
f9003664:	19254063          	blt	a0,s2,f90037e4 <__addsf3+0x2a4>
f9003668:	41250533          	sub	a0,a0,s2
f900366c:	00150513          	addi	a0,a0,1
f9003670:	02000713          	li	a4,32
f9003674:	40a70733          	sub	a4,a4,a0
f9003678:	00e49733          	sll	a4,s1,a4
f900367c:	00e03733          	snez	a4,a4
f9003680:	00a4d4b3          	srl	s1,s1,a0
f9003684:	00e4e733          	or	a4,s1,a4
f9003688:	00412483          	lw	s1,4(sp)
f900368c:	00000913          	li	s2,0
f9003690:	00777793          	andi	a5,a4,7
f9003694:	00078a63          	beqz	a5,f90036a8 <__addsf3+0x168>
f9003698:	00f77793          	andi	a5,a4,15
f900369c:	00400613          	li	a2,4
f90036a0:	00c78463          	beq	a5,a2,f90036a8 <__addsf3+0x168>
f90036a4:	00470713          	addi	a4,a4,4
f90036a8:	00571793          	slli	a5,a4,0x5
f90036ac:	0c07dc63          	bgez	a5,f9003784 <__addsf3+0x244>
f90036b0:	00190793          	addi	a5,s2,1
f90036b4:	0ff00693          	li	a3,255
f90036b8:	00040893          	mv	a7,s0
f90036bc:	0ed78463          	beq	a5,a3,f90037a4 <__addsf3+0x264>
f90036c0:	fc0006b7          	lui	a3,0xfc000
f90036c4:	fff68693          	addi	a3,a3,-1 # fbffffff <__freertos_irq_stack_top+0x2ffa01f>
f90036c8:	00d776b3          	and	a3,a4,a3
f90036cc:	0ff7f513          	zext.b	a0,a5
f90036d0:	00669693          	slli	a3,a3,0x6
f90036d4:	0096d693          	srli	a3,a3,0x9
f90036d8:	00c12083          	lw	ra,12(sp)
f90036dc:	00812403          	lw	s0,8(sp)
f90036e0:	01751513          	slli	a0,a0,0x17
f90036e4:	00d56533          	or	a0,a0,a3
f90036e8:	01f89793          	slli	a5,a7,0x1f
f90036ec:	00012903          	lw	s2,0(sp)
f90036f0:	00f56533          	or	a0,a0,a5
f90036f4:	01010113          	addi	sp,sp,16
f90036f8:	00008067          	ret
f90036fc:	00190613          	addi	a2,s2,1
f9003700:	0fe67613          	andi	a2,a2,254
f9003704:	18061063          	bnez	a2,f9003884 <__addsf3+0x344>
f9003708:	06091063          	bnez	s2,f9003768 <__addsf3+0x228>
f900370c:	2a070863          	beqz	a4,f90039bc <__addsf3+0x47c>
f9003710:	00000513          	li	a0,0
f9003714:	fc0e02e3          	beqz	t3,f90036d8 <__addsf3+0x198>
f9003718:	41c706b3          	sub	a3,a4,t3
f900371c:	00569613          	slli	a2,a3,0x5
f9003720:	2a065e63          	bgez	a2,f90039dc <__addsf3+0x49c>
f9003724:	40ee06b3          	sub	a3,t3,a4
f9003728:	00569713          	slli	a4,a3,0x5
f900372c:	2c075863          	bgez	a4,f90039fc <__addsf3+0x4bc>
f9003730:	fc0007b7          	lui	a5,0xfc000
f9003734:	fff78793          	addi	a5,a5,-1 # fbffffff <__freertos_irq_stack_top+0x2ffa01f>
f9003738:	00f6f6b3          	and	a3,a3,a5
f900373c:	00058893          	mv	a7,a1
f9003740:	00100513          	li	a0,1
f9003744:	f8dff06f          	j	f90036d0 <__addsf3+0x190>
f9003748:	020e0c63          	beqz	t3,f9003780 <__addsf3+0x240>
f900374c:	fff30793          	addi	a5,t1,-1
f9003750:	1e078a63          	beqz	a5,f9003944 <__addsf3+0x404>
f9003754:	0ff00693          	li	a3,255
f9003758:	02d30c63          	beq	t1,a3,f9003790 <__addsf3+0x250>
f900375c:	00078313          	mv	t1,a5
f9003760:	e95ff06f          	j	f90035f4 <__addsf3+0xb4>
f9003764:	20070863          	beqz	a4,f9003974 <__addsf3+0x434>
f9003768:	00000893          	li	a7,0
f900376c:	0ff00513          	li	a0,255
f9003770:	004006b7          	lui	a3,0x400
f9003774:	f65ff06f          	j	f90036d8 <__addsf3+0x198>
f9003778:	00058413          	mv	s0,a1
f900377c:	000e0713          	mv	a4,t3
f9003780:	00030913          	mv	s2,t1
f9003784:	0ff00793          	li	a5,255
f9003788:	00375613          	srli	a2,a4,0x3
f900378c:	1cf91863          	bne	s2,a5,f900395c <__addsf3+0x41c>
f9003790:	fc061ce3          	bnez	a2,f9003768 <__addsf3+0x228>
f9003794:	00040893          	mv	a7,s0
f9003798:	0ff00513          	li	a0,255
f900379c:	00000693          	li	a3,0
f90037a0:	f39ff06f          	j	f90036d8 <__addsf3+0x198>
f90037a4:	0ff00513          	li	a0,255
f90037a8:	00000693          	li	a3,0
f90037ac:	f2dff06f          	j	f90036d8 <__addsf3+0x198>
f90037b0:	00777793          	andi	a5,a4,7
f90037b4:	ee0792e3          	bnez	a5,f9003698 <__addsf3+0x158>
f90037b8:	fcdff06f          	j	f9003784 <__addsf3+0x244>
f90037bc:	04030063          	beqz	t1,f90037fc <__addsf3+0x2bc>
f90037c0:	41280333          	sub	t1,a6,s2
f90037c4:	12091c63          	bnez	s2,f90038fc <__addsf3+0x3bc>
f90037c8:	fa070ae3          	beqz	a4,f900377c <__addsf3+0x23c>
f90037cc:	fff30793          	addi	a5,t1,-1
f90037d0:	16078a63          	beqz	a5,f9003944 <__addsf3+0x404>
f90037d4:	0ff00693          	li	a3,255
f90037d8:	18d30e63          	beq	t1,a3,f9003974 <__addsf3+0x434>
f90037dc:	00078313          	mv	t1,a5
f90037e0:	12c0006f          	j	f900390c <__addsf3+0x3cc>
f90037e4:	fc000737          	lui	a4,0xfc000
f90037e8:	fff70713          	addi	a4,a4,-1 # fbffffff <__freertos_irq_stack_top+0x2ffa01f>
f90037ec:	00e4f733          	and	a4,s1,a4
f90037f0:	40a90933          	sub	s2,s2,a0
f90037f4:	00412483          	lw	s1,4(sp)
f90037f8:	e99ff06f          	j	f9003690 <__addsf3+0x150>
f90037fc:	00190613          	addi	a2,s2,1
f9003800:	0fe67593          	andi	a1,a2,254
f9003804:	10059e63          	bnez	a1,f9003920 <__addsf3+0x3e0>
f9003808:	f4091ee3          	bnez	s2,f9003764 <__addsf3+0x224>
f900380c:	1c070263          	beqz	a4,f90039d0 <__addsf3+0x490>
f9003810:	00000513          	li	a0,0
f9003814:	ec0e02e3          	beqz	t3,f90036d8 <__addsf3+0x198>
f9003818:	01c70e33          	add	t3,a4,t3
f900381c:	005e1713          	slli	a4,t3,0x5
f9003820:	003e5693          	srli	a3,t3,0x3
f9003824:	1c075063          	bgez	a4,f90039e4 <__addsf3+0x4a4>
f9003828:	1f800737          	lui	a4,0x1f800
f900382c:	fff70713          	addi	a4,a4,-1 # 1f7fffff <__stack_size+0x1f7fefff>
f9003830:	00e6f6b3          	and	a3,a3,a4
f9003834:	00f6f6b3          	and	a3,a3,a5
f9003838:	00100513          	li	a0,1
f900383c:	e9dff06f          	j	f90036d8 <__addsf3+0x198>
f9003840:	0ff00793          	li	a5,255
f9003844:	12f80663          	beq	a6,a5,f9003970 <__addsf3+0x430>
f9003848:	040007b7          	lui	a5,0x4000
f900384c:	00f76733          	or	a4,a4,a5
f9003850:	01b00693          	li	a3,27
f9003854:	00100793          	li	a5,1
f9003858:	0066ce63          	blt	a3,t1,f9003874 <__addsf3+0x334>
f900385c:	02000793          	li	a5,32
f9003860:	406787b3          	sub	a5,a5,t1
f9003864:	00f717b3          	sll	a5,a4,a5
f9003868:	00f037b3          	snez	a5,a5
f900386c:	00675733          	srl	a4,a4,t1
f9003870:	00f767b3          	or	a5,a4,a5
f9003874:	40fe0733          	sub	a4,t3,a5
f9003878:	00080913          	mv	s2,a6
f900387c:	00058413          	mv	s0,a1
f9003880:	dbdff06f          	j	f900363c <__addsf3+0xfc>
f9003884:	00912223          	sw	s1,4(sp)
f9003888:	41c704b3          	sub	s1,a4,t3
f900388c:	00549793          	slli	a5,s1,0x5
f9003890:	0a07c463          	bltz	a5,f9003938 <__addsf3+0x3f8>
f9003894:	dc0490e3          	bnez	s1,f9003654 <__addsf3+0x114>
f9003898:	00412483          	lw	s1,4(sp)
f900389c:	00000893          	li	a7,0
f90038a0:	00000513          	li	a0,0
f90038a4:	00000693          	li	a3,0
f90038a8:	e31ff06f          	j	f90036d8 <__addsf3+0x198>
f90038ac:	02000793          	li	a5,32
f90038b0:	406787b3          	sub	a5,a5,t1
f90038b4:	00fe17b3          	sll	a5,t3,a5
f90038b8:	006e5333          	srl	t1,t3,t1
f90038bc:	00f037b3          	snez	a5,a5
f90038c0:	00f36333          	or	t1,t1,a5
f90038c4:	00670733          	add	a4,a4,t1
f90038c8:	00571793          	slli	a5,a4,0x5
f90038cc:	ee07d2e3          	bgez	a5,f90037b0 <__addsf3+0x270>
f90038d0:	00190913          	addi	s2,s2,1
f90038d4:	0ff00513          	li	a0,255
f90038d8:	00000693          	li	a3,0
f90038dc:	dea90ee3          	beq	s2,a0,f90036d8 <__addsf3+0x198>
f90038e0:	7e0006b7          	lui	a3,0x7e000
f90038e4:	00175793          	srli	a5,a4,0x1
f90038e8:	fff68693          	addi	a3,a3,-1 # 7dffffff <__stack_size+0x7dffefff>
f90038ec:	00177713          	andi	a4,a4,1
f90038f0:	00d7f7b3          	and	a5,a5,a3
f90038f4:	00e7e733          	or	a4,a5,a4
f90038f8:	d99ff06f          	j	f9003690 <__addsf3+0x150>
f90038fc:	0ff00793          	li	a5,255
f9003900:	06f80a63          	beq	a6,a5,f9003974 <__addsf3+0x434>
f9003904:	040007b7          	lui	a5,0x4000
f9003908:	00f76733          	or	a4,a4,a5
f900390c:	01b00793          	li	a5,27
f9003910:	0667dc63          	bge	a5,t1,f9003988 <__addsf3+0x448>
f9003914:	001e0713          	addi	a4,t3,1
f9003918:	00080913          	mv	s2,a6
f900391c:	d75ff06f          	j	f9003690 <__addsf3+0x150>
f9003920:	0ff00793          	li	a5,255
f9003924:	e8f600e3          	beq	a2,a5,f90037a4 <__addsf3+0x264>
f9003928:	01c70e33          	add	t3,a4,t3
f900392c:	001e5713          	srli	a4,t3,0x1
f9003930:	00060913          	mv	s2,a2
f9003934:	d5dff06f          	j	f9003690 <__addsf3+0x150>
f9003938:	40ee04b3          	sub	s1,t3,a4
f900393c:	00058413          	mv	s0,a1
f9003940:	d15ff06f          	j	f9003654 <__addsf3+0x114>
f9003944:	01c70733          	add	a4,a4,t3
f9003948:	00571793          	slli	a5,a4,0x5
f900394c:	00200913          	li	s2,2
f9003950:	f807c8e3          	bltz	a5,f90038e0 <__addsf3+0x3a0>
f9003954:	00375613          	srli	a2,a4,0x3
f9003958:	00100913          	li	s2,1
f900395c:	00961613          	slli	a2,a2,0x9
f9003960:	00965693          	srli	a3,a2,0x9
f9003964:	0ff97513          	zext.b	a0,s2
f9003968:	00040893          	mv	a7,s0
f900396c:	d6dff06f          	j	f90036d8 <__addsf3+0x198>
f9003970:	00058413          	mv	s0,a1
f9003974:	00050613          	mv	a2,a0
f9003978:	e19ff06f          	j	f9003790 <__addsf3+0x250>
f900397c:	41c70733          	sub	a4,a4,t3
f9003980:	00100913          	li	s2,1
f9003984:	cb9ff06f          	j	f900363c <__addsf3+0xfc>
f9003988:	02000793          	li	a5,32
f900398c:	406787b3          	sub	a5,a5,t1
f9003990:	00f717b3          	sll	a5,a4,a5
f9003994:	00675333          	srl	t1,a4,t1
f9003998:	00f037b3          	snez	a5,a5
f900399c:	00f36333          	or	t1,t1,a5
f90039a0:	01c30733          	add	a4,t1,t3
f90039a4:	00080913          	mv	s2,a6
f90039a8:	f21ff06f          	j	f90038c8 <__addsf3+0x388>
f90039ac:	40ee0733          	sub	a4,t3,a4
f90039b0:	00058413          	mv	s0,a1
f90039b4:	00100913          	li	s2,1
f90039b8:	c85ff06f          	j	f900363c <__addsf3+0xfc>
f90039bc:	020e0863          	beqz	t3,f90039ec <__addsf3+0x4ac>
f90039c0:	00050693          	mv	a3,a0
f90039c4:	00058893          	mv	a7,a1
f90039c8:	00000513          	li	a0,0
f90039cc:	d0dff06f          	j	f90036d8 <__addsf3+0x198>
f90039d0:	00050693          	mv	a3,a0
f90039d4:	00000513          	li	a0,0
f90039d8:	d01ff06f          	j	f90036d8 <__addsf3+0x198>
f90039dc:	02068863          	beqz	a3,f9003a0c <__addsf3+0x4cc>
f90039e0:	0036d693          	srli	a3,a3,0x3
f90039e4:	00f6f6b3          	and	a3,a3,a5
f90039e8:	cf1ff06f          	j	f90036d8 <__addsf3+0x198>
f90039ec:	00000893          	li	a7,0
f90039f0:	00000513          	li	a0,0
f90039f4:	00000693          	li	a3,0
f90039f8:	ce1ff06f          	j	f90036d8 <__addsf3+0x198>
f90039fc:	0036d693          	srli	a3,a3,0x3
f9003a00:	00f6f6b3          	and	a3,a3,a5
f9003a04:	00058893          	mv	a7,a1
f9003a08:	cd1ff06f          	j	f90036d8 <__addsf3+0x198>
f9003a0c:	00000893          	li	a7,0
f9003a10:	00000693          	li	a3,0
f9003a14:	cc5ff06f          	j	f90036d8 <__addsf3+0x198>

f9003a18 <__gesf2>:
f9003a18:	01755613          	srli	a2,a0,0x17
f9003a1c:	00800737          	lui	a4,0x800
f9003a20:	fff70713          	addi	a4,a4,-1 # 7fffff <__stack_size+0x7fefff>
f9003a24:	0175d693          	srli	a3,a1,0x17
f9003a28:	0ff67613          	zext.b	a2,a2
f9003a2c:	0ff00813          	li	a6,255
f9003a30:	00a778b3          	and	a7,a4,a0
f9003a34:	01f55793          	srli	a5,a0,0x1f
f9003a38:	00b77733          	and	a4,a4,a1
f9003a3c:	0ff6f513          	zext.b	a0,a3
f9003a40:	01f5d593          	srli	a1,a1,0x1f
f9003a44:	05060063          	beq	a2,a6,f9003a84 <__gesf2+0x6c>
f9003a48:	03050063          	beq	a0,a6,f9003a68 <__gesf2+0x50>
f9003a4c:	04061863          	bnez	a2,f9003a9c <__gesf2+0x84>
f9003a50:	02051063          	bnez	a0,f9003a70 <__gesf2+0x58>
f9003a54:	06070a63          	beqz	a4,f9003ac8 <__gesf2+0xb0>
f9003a58:	08089063          	bnez	a7,f9003ad8 <__gesf2+0xc0>
f9003a5c:	00100513          	li	a0,1
f9003a60:	06058063          	beqz	a1,f9003ac0 <__gesf2+0xa8>
f9003a64:	00008067          	ret
f9003a68:	06071463          	bnez	a4,f9003ad0 <__gesf2+0xb8>
f9003a6c:	00061463          	bnez	a2,f9003a74 <__gesf2+0x5c>
f9003a70:	fe0886e3          	beqz	a7,f9003a5c <__gesf2+0x44>
f9003a74:	04b78263          	beq	a5,a1,f9003ab8 <__gesf2+0xa0>
f9003a78:	04079463          	bnez	a5,f9003ac0 <__gesf2+0xa8>
f9003a7c:	00100513          	li	a0,1
f9003a80:	00008067          	ret
f9003a84:	04089663          	bnez	a7,f9003ad0 <__gesf2+0xb8>
f9003a88:	fec518e3          	bne	a0,a2,f9003a78 <__gesf2+0x60>
f9003a8c:	04071263          	bnez	a4,f9003ad0 <__gesf2+0xb8>
f9003a90:	feb794e3          	bne	a5,a1,f9003a78 <__gesf2+0x60>
f9003a94:	00000513          	li	a0,0
f9003a98:	00008067          	ret
f9003a9c:	fc050ee3          	beqz	a0,f9003a78 <__gesf2+0x60>
f9003aa0:	fcb79ce3          	bne	a5,a1,f9003a78 <__gesf2+0x60>
f9003aa4:	fcc54ae3          	blt	a0,a2,f9003a78 <__gesf2+0x60>
f9003aa8:	00a64863          	blt	a2,a0,f9003ab8 <__gesf2+0xa0>
f9003aac:	fd1766e3          	bltu	a4,a7,f9003a78 <__gesf2+0x60>
f9003ab0:	00000513          	li	a0,0
f9003ab4:	fae8f8e3          	bgeu	a7,a4,f9003a64 <__gesf2+0x4c>
f9003ab8:	00100513          	li	a0,1
f9003abc:	fa0794e3          	bnez	a5,f9003a64 <__gesf2+0x4c>
f9003ac0:	fff00513          	li	a0,-1
f9003ac4:	00008067          	ret
f9003ac8:	fa0898e3          	bnez	a7,f9003a78 <__gesf2+0x60>
f9003acc:	00008067          	ret
f9003ad0:	ffe00513          	li	a0,-2
f9003ad4:	00008067          	ret
f9003ad8:	fcb78ae3          	beq	a5,a1,f9003aac <__gesf2+0x94>
f9003adc:	f9dff06f          	j	f9003a78 <__gesf2+0x60>

f9003ae0 <__lesf2>:
f9003ae0:	01755613          	srli	a2,a0,0x17
f9003ae4:	00800737          	lui	a4,0x800
f9003ae8:	fff70713          	addi	a4,a4,-1 # 7fffff <__stack_size+0x7fefff>
f9003aec:	0175d693          	srli	a3,a1,0x17
f9003af0:	0ff67613          	zext.b	a2,a2
f9003af4:	0ff00813          	li	a6,255
f9003af8:	00a778b3          	and	a7,a4,a0
f9003afc:	01f55793          	srli	a5,a0,0x1f
f9003b00:	00b77733          	and	a4,a4,a1
f9003b04:	0ff6f513          	zext.b	a0,a3
f9003b08:	01f5d593          	srli	a1,a1,0x1f
f9003b0c:	05060263          	beq	a2,a6,f9003b50 <__lesf2+0x70>
f9003b10:	03050063          	beq	a0,a6,f9003b30 <__lesf2+0x50>
f9003b14:	04061c63          	bnez	a2,f9003b6c <__lesf2+0x8c>
f9003b18:	02051263          	bnez	a0,f9003b3c <__lesf2+0x5c>
f9003b1c:	06070e63          	beqz	a4,f9003b98 <__lesf2+0xb8>
f9003b20:	08089463          	bnez	a7,f9003ba8 <__lesf2+0xc8>
f9003b24:	00100513          	li	a0,1
f9003b28:	06058463          	beqz	a1,f9003b90 <__lesf2+0xb0>
f9003b2c:	00008067          	ret
f9003b30:	00200513          	li	a0,2
f9003b34:	fe071ce3          	bnez	a4,f9003b2c <__lesf2+0x4c>
f9003b38:	00061463          	bnez	a2,f9003b40 <__lesf2+0x60>
f9003b3c:	fe0884e3          	beqz	a7,f9003b24 <__lesf2+0x44>
f9003b40:	04b78463          	beq	a5,a1,f9003b88 <__lesf2+0xa8>
f9003b44:	04079663          	bnez	a5,f9003b90 <__lesf2+0xb0>
f9003b48:	00100513          	li	a0,1
f9003b4c:	00008067          	ret
f9003b50:	04089863          	bnez	a7,f9003ba0 <__lesf2+0xc0>
f9003b54:	fec518e3          	bne	a0,a2,f9003b44 <__lesf2+0x64>
f9003b58:	00200513          	li	a0,2
f9003b5c:	fc0718e3          	bnez	a4,f9003b2c <__lesf2+0x4c>
f9003b60:	feb792e3          	bne	a5,a1,f9003b44 <__lesf2+0x64>
f9003b64:	00000513          	li	a0,0
f9003b68:	00008067          	ret
f9003b6c:	fc050ce3          	beqz	a0,f9003b44 <__lesf2+0x64>
f9003b70:	fcb79ae3          	bne	a5,a1,f9003b44 <__lesf2+0x64>
f9003b74:	fcc548e3          	blt	a0,a2,f9003b44 <__lesf2+0x64>
f9003b78:	00a64863          	blt	a2,a0,f9003b88 <__lesf2+0xa8>
f9003b7c:	fd1764e3          	bltu	a4,a7,f9003b44 <__lesf2+0x64>
f9003b80:	00000513          	li	a0,0
f9003b84:	fae8f4e3          	bgeu	a7,a4,f9003b2c <__lesf2+0x4c>
f9003b88:	00100513          	li	a0,1
f9003b8c:	fa0790e3          	bnez	a5,f9003b2c <__lesf2+0x4c>
f9003b90:	fff00513          	li	a0,-1
f9003b94:	00008067          	ret
f9003b98:	fa0896e3          	bnez	a7,f9003b44 <__lesf2+0x64>
f9003b9c:	00008067          	ret
f9003ba0:	00200513          	li	a0,2
f9003ba4:	00008067          	ret
f9003ba8:	fcb78ae3          	beq	a5,a1,f9003b7c <__lesf2+0x9c>
f9003bac:	f99ff06f          	j	f9003b44 <__lesf2+0x64>

f9003bb0 <__mulsf3>:
f9003bb0:	fd010113          	addi	sp,sp,-48
f9003bb4:	01755793          	srli	a5,a0,0x17
f9003bb8:	03212023          	sw	s2,32(sp)
f9003bbc:	01412c23          	sw	s4,24(sp)
f9003bc0:	02112623          	sw	ra,44(sp)
f9003bc4:	00951a13          	slli	s4,a0,0x9
f9003bc8:	02812423          	sw	s0,40(sp)
f9003bcc:	02912223          	sw	s1,36(sp)
f9003bd0:	01312e23          	sw	s3,28(sp)
f9003bd4:	01512a23          	sw	s5,20(sp)
f9003bd8:	01612823          	sw	s6,16(sp)
f9003bdc:	0ff7f793          	zext.b	a5,a5
f9003be0:	009a5a13          	srli	s4,s4,0x9
f9003be4:	01f55913          	srli	s2,a0,0x1f
f9003be8:	24078063          	beqz	a5,f9003e28 <__mulsf3+0x278>
f9003bec:	0ff00713          	li	a4,255
f9003bf0:	16e78663          	beq	a5,a4,f9003d5c <__mulsf3+0x1ac>
f9003bf4:	003a1a13          	slli	s4,s4,0x3
f9003bf8:	04000737          	lui	a4,0x4000
f9003bfc:	00ea6a33          	or	s4,s4,a4
f9003c00:	f8178993          	addi	s3,a5,-127 # 3ffff81 <__stack_size+0x3ffef81>
f9003c04:	00000493          	li	s1,0
f9003c08:	00000b13          	li	s6,0
f9003c0c:	0175d793          	srli	a5,a1,0x17
f9003c10:	00959a93          	slli	s5,a1,0x9
f9003c14:	0ff7f793          	zext.b	a5,a5
f9003c18:	009ada93          	srli	s5,s5,0x9
f9003c1c:	01f5d413          	srli	s0,a1,0x1f
f9003c20:	16078263          	beqz	a5,f9003d84 <__mulsf3+0x1d4>
f9003c24:	0ff00713          	li	a4,255
f9003c28:	1ce78a63          	beq	a5,a4,f9003dfc <__mulsf3+0x24c>
f9003c2c:	003a9a93          	slli	s5,s5,0x3
f9003c30:	f8178793          	addi	a5,a5,-127
f9003c34:	04000737          	lui	a4,0x4000
f9003c38:	00eaeab3          	or	s5,s5,a4
f9003c3c:	00f989b3          	add	s3,s3,a5
f9003c40:	00000593          	li	a1,0
f9003c44:	00a00793          	li	a5,10
f9003c48:	00198613          	addi	a2,s3,1
f9003c4c:	1497c863          	blt	a5,s1,f9003d9c <__mulsf3+0x1ec>
f9003c50:	00894533          	xor	a0,s2,s0
f9003c54:	00200793          	li	a5,2
f9003c58:	00050693          	mv	a3,a0
f9003c5c:	1e97d863          	bge	a5,s1,f9003e4c <__mulsf3+0x29c>
f9003c60:	00100713          	li	a4,1
f9003c64:	00971733          	sll	a4,a4,s1
f9003c68:	53077793          	andi	a5,a4,1328
f9003c6c:	12079a63          	bnez	a5,f9003da0 <__mulsf3+0x1f0>
f9003c70:	24077793          	andi	a5,a4,576
f9003c74:	26079863          	bnez	a5,f9003ee4 <__mulsf3+0x334>
f9003c78:	08877713          	andi	a4,a4,136
f9003c7c:	24071c63          	bnez	a4,f9003ed4 <__mulsf3+0x324>
f9003c80:	000108b7          	lui	a7,0x10
f9003c84:	fff88793          	addi	a5,a7,-1 # ffff <__stack_size+0xefff>
f9003c88:	010a5593          	srli	a1,s4,0x10
f9003c8c:	010ad813          	srli	a6,s5,0x10
f9003c90:	00fa7a33          	and	s4,s4,a5
f9003c94:	00faf7b3          	and	a5,s5,a5
f9003c98:	03478533          	mul	a0,a5,s4
f9003c9c:	02f587b3          	mul	a5,a1,a5
f9003ca0:	01055713          	srli	a4,a0,0x10
f9003ca4:	03480a33          	mul	s4,a6,s4
f9003ca8:	00fa0a33          	add	s4,s4,a5
f9003cac:	01470733          	add	a4,a4,s4
f9003cb0:	030585b3          	mul	a1,a1,a6
f9003cb4:	00f77463          	bgeu	a4,a5,f9003cbc <__mulsf3+0x10c>
f9003cb8:	011585b3          	add	a1,a1,a7
f9003cbc:	00010837          	lui	a6,0x10
f9003cc0:	fff80813          	addi	a6,a6,-1 # ffff <__stack_size+0xefff>
f9003cc4:	010777b3          	and	a5,a4,a6
f9003cc8:	01079793          	slli	a5,a5,0x10
f9003ccc:	01057533          	and	a0,a0,a6
f9003cd0:	00a787b3          	add	a5,a5,a0
f9003cd4:	01075713          	srli	a4,a4,0x10
f9003cd8:	00679a13          	slli	s4,a5,0x6
f9003cdc:	00b70733          	add	a4,a4,a1
f9003ce0:	01a7d793          	srli	a5,a5,0x1a
f9003ce4:	00671713          	slli	a4,a4,0x6
f9003ce8:	01403a33          	snez	s4,s4
f9003cec:	00fa6a33          	or	s4,s4,a5
f9003cf0:	00471793          	slli	a5,a4,0x4
f9003cf4:	01476a33          	or	s4,a4,s4
f9003cf8:	0007da63          	bgez	a5,f9003d0c <__mulsf3+0x15c>
f9003cfc:	001a5793          	srli	a5,s4,0x1
f9003d00:	001a7a13          	andi	s4,s4,1
f9003d04:	0147ea33          	or	s4,a5,s4
f9003d08:	00060993          	mv	s3,a2
f9003d0c:	07f98793          	addi	a5,s3,127
f9003d10:	1ef05263          	blez	a5,f9003ef4 <__mulsf3+0x344>
f9003d14:	007a7713          	andi	a4,s4,7
f9003d18:	00070a63          	beqz	a4,f9003d2c <__mulsf3+0x17c>
f9003d1c:	00fa7713          	andi	a4,s4,15
f9003d20:	00400613          	li	a2,4
f9003d24:	00c70463          	beq	a4,a2,f9003d2c <__mulsf3+0x17c>
f9003d28:	004a0a13          	addi	s4,s4,4
f9003d2c:	004a1713          	slli	a4,s4,0x4
f9003d30:	00075a63          	bgez	a4,f9003d44 <__mulsf3+0x194>
f9003d34:	f80007b7          	lui	a5,0xf8000
f9003d38:	fff78793          	addi	a5,a5,-1 # f7ffffff <__stack_size+0xf7ffefff>
f9003d3c:	00fa7a33          	and	s4,s4,a5
f9003d40:	08098793          	addi	a5,s3,128
f9003d44:	0fe00713          	li	a4,254
f9003d48:	22f74663          	blt	a4,a5,f9003f74 <__mulsf3+0x3c4>
f9003d4c:	006a1713          	slli	a4,s4,0x6
f9003d50:	00975713          	srli	a4,a4,0x9
f9003d54:	0ff7f793          	zext.b	a5,a5
f9003d58:	06c0006f          	j	f9003dc4 <__mulsf3+0x214>
f9003d5c:	160a1463          	bnez	s4,f9003ec4 <__mulsf3+0x314>
f9003d60:	0175d793          	srli	a5,a1,0x17
f9003d64:	00959a93          	slli	s5,a1,0x9
f9003d68:	0ff7f793          	zext.b	a5,a5
f9003d6c:	00800493          	li	s1,8
f9003d70:	0ff00993          	li	s3,255
f9003d74:	00200b13          	li	s6,2
f9003d78:	009ada93          	srli	s5,s5,0x9
f9003d7c:	01f5d413          	srli	s0,a1,0x1f
f9003d80:	ea0792e3          	bnez	a5,f9003c24 <__mulsf3+0x74>
f9003d84:	100a9863          	bnez	s5,f9003e94 <__mulsf3+0x2e4>
f9003d88:	0014e493          	ori	s1,s1,1
f9003d8c:	00a00793          	li	a5,10
f9003d90:	00100593          	li	a1,1
f9003d94:	00198613          	addi	a2,s3,1
f9003d98:	ea97dce3          	bge	a5,s1,f9003c50 <__mulsf3+0xa0>
f9003d9c:	00090513          	mv	a0,s2
f9003da0:	00200793          	li	a5,2
f9003da4:	08fb0c63          	beq	s6,a5,f9003e3c <__mulsf3+0x28c>
f9003da8:	00300793          	li	a5,3
f9003dac:	12fb0c63          	beq	s6,a5,f9003ee4 <__mulsf3+0x334>
f9003db0:	00100793          	li	a5,1
f9003db4:	00050693          	mv	a3,a0
f9003db8:	1afb1a63          	bne	s6,a5,f9003f6c <__mulsf3+0x3bc>
f9003dbc:	00000793          	li	a5,0
f9003dc0:	00000713          	li	a4,0
f9003dc4:	02c12083          	lw	ra,44(sp)
f9003dc8:	02812403          	lw	s0,40(sp)
f9003dcc:	01779513          	slli	a0,a5,0x17
f9003dd0:	00e56533          	or	a0,a0,a4
f9003dd4:	01f69793          	slli	a5,a3,0x1f
f9003dd8:	02412483          	lw	s1,36(sp)
f9003ddc:	02012903          	lw	s2,32(sp)
f9003de0:	01c12983          	lw	s3,28(sp)
f9003de4:	01812a03          	lw	s4,24(sp)
f9003de8:	01412a83          	lw	s5,20(sp)
f9003dec:	01012b03          	lw	s6,16(sp)
f9003df0:	00f56533          	or	a0,a0,a5
f9003df4:	03010113          	addi	sp,sp,48
f9003df8:	00008067          	ret
f9003dfc:	0ff98713          	addi	a4,s3,255
f9003e00:	0a0a8a63          	beqz	s5,f9003eb4 <__mulsf3+0x304>
f9003e04:	0034e493          	ori	s1,s1,3
f9003e08:	00a00693          	li	a3,10
f9003e0c:	10098613          	addi	a2,s3,256
f9003e10:	1496c063          	blt	a3,s1,f9003f50 <__mulsf3+0x3a0>
f9003e14:	008946b3          	xor	a3,s2,s0
f9003e18:	00068513          	mv	a0,a3
f9003e1c:	00070993          	mv	s3,a4
f9003e20:	00300593          	li	a1,3
f9003e24:	e3dff06f          	j	f9003c60 <__mulsf3+0xb0>
f9003e28:	040a1063          	bnez	s4,f9003e68 <__mulsf3+0x2b8>
f9003e2c:	00400493          	li	s1,4
f9003e30:	00000993          	li	s3,0
f9003e34:	00100b13          	li	s6,1
f9003e38:	dd5ff06f          	j	f9003c0c <__mulsf3+0x5c>
f9003e3c:	00050693          	mv	a3,a0
f9003e40:	0ff00793          	li	a5,255
f9003e44:	00000713          	li	a4,0
f9003e48:	f7dff06f          	j	f9003dc4 <__mulsf3+0x214>
f9003e4c:	fff48493          	addi	s1,s1,-1
f9003e50:	00100713          	li	a4,1
f9003e54:	e29766e3          	bltu	a4,s1,f9003c80 <__mulsf3+0xd0>
f9003e58:	fef582e3          	beq	a1,a5,f9003e3c <__mulsf3+0x28c>
f9003e5c:	000a8a13          	mv	s4,s5
f9003e60:	00058b13          	mv	s6,a1
f9003e64:	f4dff06f          	j	f9003db0 <__mulsf3+0x200>
f9003e68:	000a0513          	mv	a0,s4
f9003e6c:	00b12623          	sw	a1,12(sp)
f9003e70:	7b8000ef          	jal	f9004628 <__clzsi2>
f9003e74:	ffb50793          	addi	a5,a0,-5
f9003e78:	00fa1a33          	sll	s4,s4,a5
f9003e7c:	f8a00793          	li	a5,-118
f9003e80:	00c12583          	lw	a1,12(sp)
f9003e84:	40a789b3          	sub	s3,a5,a0
f9003e88:	00000493          	li	s1,0
f9003e8c:	00000b13          	li	s6,0
f9003e90:	d7dff06f          	j	f9003c0c <__mulsf3+0x5c>
f9003e94:	000a8513          	mv	a0,s5
f9003e98:	790000ef          	jal	f9004628 <__clzsi2>
f9003e9c:	ffb50793          	addi	a5,a0,-5
f9003ea0:	40a98533          	sub	a0,s3,a0
f9003ea4:	00fa9ab3          	sll	s5,s5,a5
f9003ea8:	f8a50993          	addi	s3,a0,-118
f9003eac:	00000593          	li	a1,0
f9003eb0:	d95ff06f          	j	f9003c44 <__mulsf3+0x94>
f9003eb4:	0024e493          	ori	s1,s1,2
f9003eb8:	00070993          	mv	s3,a4
f9003ebc:	00200593          	li	a1,2
f9003ec0:	d85ff06f          	j	f9003c44 <__mulsf3+0x94>
f9003ec4:	00c00493          	li	s1,12
f9003ec8:	0ff00993          	li	s3,255
f9003ecc:	00300b13          	li	s6,3
f9003ed0:	d3dff06f          	j	f9003c0c <__mulsf3+0x5c>
f9003ed4:	000a8a13          	mv	s4,s5
f9003ed8:	00058b13          	mv	s6,a1
f9003edc:	00040513          	mv	a0,s0
f9003ee0:	ec1ff06f          	j	f9003da0 <__mulsf3+0x1f0>
f9003ee4:	00000693          	li	a3,0
f9003ee8:	0ff00793          	li	a5,255
f9003eec:	00400737          	lui	a4,0x400
f9003ef0:	ed5ff06f          	j	f9003dc4 <__mulsf3+0x214>
f9003ef4:	00100613          	li	a2,1
f9003ef8:	00078c63          	beqz	a5,f9003f10 <__mulsf3+0x360>
f9003efc:	40f60633          	sub	a2,a2,a5
f9003f00:	01b00593          	li	a1,27
f9003f04:	00000793          	li	a5,0
f9003f08:	00000713          	li	a4,0
f9003f0c:	eac5cce3          	blt	a1,a2,f9003dc4 <__mulsf3+0x214>
f9003f10:	09e98713          	addi	a4,s3,158
f9003f14:	00ea1733          	sll	a4,s4,a4
f9003f18:	00e03733          	snez	a4,a4
f9003f1c:	00ca57b3          	srl	a5,s4,a2
f9003f20:	00e7e7b3          	or	a5,a5,a4
f9003f24:	0077f713          	andi	a4,a5,7
f9003f28:	00070a63          	beqz	a4,f9003f3c <__mulsf3+0x38c>
f9003f2c:	00f7f713          	andi	a4,a5,15
f9003f30:	00400613          	li	a2,4
f9003f34:	00c70463          	beq	a4,a2,f9003f3c <__mulsf3+0x38c>
f9003f38:	00478793          	addi	a5,a5,4
f9003f3c:	00579713          	slli	a4,a5,0x5
f9003f40:	04075063          	bgez	a4,f9003f80 <__mulsf3+0x3d0>
f9003f44:	00100793          	li	a5,1
f9003f48:	00000713          	li	a4,0
f9003f4c:	e79ff06f          	j	f9003dc4 <__mulsf3+0x214>
f9003f50:	00f00593          	li	a1,15
f9003f54:	00000693          	li	a3,0
f9003f58:	00400737          	lui	a4,0x400
f9003f5c:	000a8a13          	mv	s4,s5
f9003f60:	00300b13          	li	s6,3
f9003f64:	e6b480e3          	beq	s1,a1,f9003dc4 <__mulsf3+0x214>
f9003f68:	f75ff06f          	j	f9003edc <__mulsf3+0x32c>
f9003f6c:	00060993          	mv	s3,a2
f9003f70:	d9dff06f          	j	f9003d0c <__mulsf3+0x15c>
f9003f74:	0ff00793          	li	a5,255
f9003f78:	00000713          	li	a4,0
f9003f7c:	e49ff06f          	j	f9003dc4 <__mulsf3+0x214>
f9003f80:	00679793          	slli	a5,a5,0x6
f9003f84:	0097d713          	srli	a4,a5,0x9
f9003f88:	00000793          	li	a5,0
f9003f8c:	e39ff06f          	j	f9003dc4 <__mulsf3+0x214>

f9003f90 <__subsf3>:
f9003f90:	008007b7          	lui	a5,0x800
f9003f94:	ff010113          	addi	sp,sp,-16
f9003f98:	fff78793          	addi	a5,a5,-1 # 7fffff <__stack_size+0x7fefff>
f9003f9c:	0175d693          	srli	a3,a1,0x17
f9003fa0:	00a7f833          	and	a6,a5,a0
f9003fa4:	00b7f733          	and	a4,a5,a1
f9003fa8:	00812423          	sw	s0,8(sp)
f9003fac:	00912223          	sw	s1,4(sp)
f9003fb0:	01755413          	srli	s0,a0,0x17
f9003fb4:	01f55493          	srli	s1,a0,0x1f
f9003fb8:	00112623          	sw	ra,12(sp)
f9003fbc:	0ff6f693          	zext.b	a3,a3
f9003fc0:	0ff00513          	li	a0,255
f9003fc4:	00080613          	mv	a2,a6
f9003fc8:	0ff47413          	zext.b	s0,s0
f9003fcc:	00048313          	mv	t1,s1
f9003fd0:	00381793          	slli	a5,a6,0x3
f9003fd4:	01f5d593          	srli	a1,a1,0x1f
f9003fd8:	00371e13          	slli	t3,a4,0x3
f9003fdc:	04a68a63          	beq	a3,a0,f9004030 <__subsf3+0xa0>
f9003fe0:	0015c893          	xori	a7,a1,1
f9003fe4:	40d405b3          	sub	a1,s0,a3
f9003fe8:	03148263          	beq	s1,a7,f900400c <__subsf3+0x7c>
f9003fec:	48b05263          	blez	a1,f9004470 <__subsf3+0x4e0>
f9003ff0:	06069663          	bnez	a3,f900405c <__subsf3+0xcc>
f9003ff4:	1c0e0c63          	beqz	t3,f90041cc <__subsf3+0x23c>
f9003ff8:	fff58713          	addi	a4,a1,-1
f9003ffc:	3c070c63          	beqz	a4,f90043d4 <__subsf3+0x444>
f9004000:	1ca58e63          	beq	a1,a0,f90041dc <__subsf3+0x24c>
f9004004:	00070593          	mv	a1,a4
f9004008:	0600006f          	j	f9004068 <__subsf3+0xd8>
f900400c:	48b05263          	blez	a1,f9004490 <__subsf3+0x500>
f9004010:	18068e63          	beqz	a3,f90041ac <__subsf3+0x21c>
f9004014:	1ca40463          	beq	s0,a0,f90041dc <__subsf3+0x24c>
f9004018:	04000737          	lui	a4,0x4000
f900401c:	00ee6e33          	or	t3,t3,a4
f9004020:	01b00713          	li	a4,27
f9004024:	2cb75c63          	bge	a4,a1,f90042fc <__subsf3+0x36c>
f9004028:	00178793          	addi	a5,a5,1
f900402c:	0b80006f          	j	f90040e4 <__subsf3+0x154>
f9004030:	f0140513          	addi	a0,s0,-255
f9004034:	100e1e63          	bnez	t3,f9004150 <__subsf3+0x1c0>
f9004038:	0015c893          	xori	a7,a1,1
f900403c:	29148063          	beq	s1,a7,f90042bc <__subsf3+0x32c>
f9004040:	1a050e63          	beqz	a0,f90041fc <__subsf3+0x26c>
f9004044:	00088493          	mv	s1,a7
f9004048:	10040c63          	beqz	s0,f9004160 <__subsf3+0x1d0>
f900404c:	0014f313          	andi	t1,s1,1
f9004050:	0ff00513          	li	a0,255
f9004054:	00000613          	li	a2,0
f9004058:	0d40006f          	j	f900412c <__subsf3+0x19c>
f900405c:	18a40063          	beq	s0,a0,f90041dc <__subsf3+0x24c>
f9004060:	04000737          	lui	a4,0x4000
f9004064:	00ee6e33          	or	t3,t3,a4
f9004068:	01b00693          	li	a3,27
f900406c:	00100713          	li	a4,1
f9004070:	00b6ce63          	blt	a3,a1,f900408c <__subsf3+0xfc>
f9004074:	02000713          	li	a4,32
f9004078:	40b70733          	sub	a4,a4,a1
f900407c:	00ee1733          	sll	a4,t3,a4
f9004080:	00be56b3          	srl	a3,t3,a1
f9004084:	00e03733          	snez	a4,a4
f9004088:	00e6e733          	or	a4,a3,a4
f900408c:	40e787b3          	sub	a5,a5,a4
f9004090:	00579713          	slli	a4,a5,0x5
f9004094:	14075e63          	bgez	a4,f90041f0 <__subsf3+0x260>
f9004098:	01212023          	sw	s2,0(sp)
f900409c:	04000937          	lui	s2,0x4000
f90040a0:	fff90913          	addi	s2,s2,-1 # 3ffffff <__stack_size+0x3ffefff>
f90040a4:	0127f933          	and	s2,a5,s2
f90040a8:	00090513          	mv	a0,s2
f90040ac:	57c000ef          	jal	f9004628 <__clzsi2>
f90040b0:	ffb50513          	addi	a0,a0,-5
f90040b4:	00a91933          	sll	s2,s2,a0
f90040b8:	18854863          	blt	a0,s0,f9004248 <__subsf3+0x2b8>
f90040bc:	40850533          	sub	a0,a0,s0
f90040c0:	00150513          	addi	a0,a0,1
f90040c4:	02000793          	li	a5,32
f90040c8:	40a787b3          	sub	a5,a5,a0
f90040cc:	00f917b3          	sll	a5,s2,a5
f90040d0:	00f037b3          	snez	a5,a5
f90040d4:	00a95933          	srl	s2,s2,a0
f90040d8:	00f967b3          	or	a5,s2,a5
f90040dc:	00012903          	lw	s2,0(sp)
f90040e0:	00000413          	li	s0,0
f90040e4:	0077f713          	andi	a4,a5,7
f90040e8:	00070a63          	beqz	a4,f90040fc <__subsf3+0x16c>
f90040ec:	00f7f713          	andi	a4,a5,15
f90040f0:	00400693          	li	a3,4
f90040f4:	00d70463          	beq	a4,a3,f90040fc <__subsf3+0x16c>
f90040f8:	00478793          	addi	a5,a5,4
f90040fc:	00579713          	slli	a4,a5,0x5
f9004100:	0c075863          	bgez	a4,f90041d0 <__subsf3+0x240>
f9004104:	00140413          	addi	s0,s0,1
f9004108:	0ff00713          	li	a4,255
f900410c:	f4e400e3          	beq	s0,a4,f900404c <__subsf3+0xbc>
f9004110:	fc000637          	lui	a2,0xfc000
f9004114:	fff60613          	addi	a2,a2,-1 # fbffffff <__freertos_irq_stack_top+0x2ffa01f>
f9004118:	00c7f633          	and	a2,a5,a2
f900411c:	0ff47513          	zext.b	a0,s0
f9004120:	00661613          	slli	a2,a2,0x6
f9004124:	00965613          	srli	a2,a2,0x9
f9004128:	0014f313          	andi	t1,s1,1
f900412c:	00c12083          	lw	ra,12(sp)
f9004130:	00812403          	lw	s0,8(sp)
f9004134:	01751513          	slli	a0,a0,0x17
f9004138:	00c56533          	or	a0,a0,a2
f900413c:	01f31793          	slli	a5,t1,0x1f
f9004140:	00412483          	lw	s1,4(sp)
f9004144:	00f56533          	or	a0,a0,a5
f9004148:	01010113          	addi	sp,sp,16
f900414c:	00008067          	ret
f9004150:	00058893          	mv	a7,a1
f9004154:	12b48a63          	beq	s1,a1,f9004288 <__subsf3+0x2f8>
f9004158:	0a050263          	beqz	a0,f90041fc <__subsf3+0x26c>
f900415c:	20041263          	bnez	s0,f9004360 <__subsf3+0x3d0>
f9004160:	0ff00593          	li	a1,255
f9004164:	06078063          	beqz	a5,f90041c4 <__subsf3+0x234>
f9004168:	fff58613          	addi	a2,a1,-1
f900416c:	28060c63          	beqz	a2,f9004404 <__subsf3+0x474>
f9004170:	0ff00513          	li	a0,255
f9004174:	00088493          	mv	s1,a7
f9004178:	24a58a63          	beq	a1,a0,f90043cc <__subsf3+0x43c>
f900417c:	01b00593          	li	a1,27
f9004180:	00100713          	li	a4,1
f9004184:	00c5ce63          	blt	a1,a2,f90041a0 <__subsf3+0x210>
f9004188:	02000713          	li	a4,32
f900418c:	40c70733          	sub	a4,a4,a2
f9004190:	00e79733          	sll	a4,a5,a4
f9004194:	00c7d633          	srl	a2,a5,a2
f9004198:	00e03733          	snez	a4,a4
f900419c:	00e66733          	or	a4,a2,a4
f90041a0:	40ee07b3          	sub	a5,t3,a4
f90041a4:	00068413          	mv	s0,a3
f90041a8:	ee9ff06f          	j	f9004090 <__subsf3+0x100>
f90041ac:	020e0063          	beqz	t3,f90041cc <__subsf3+0x23c>
f90041b0:	fff58713          	addi	a4,a1,-1
f90041b4:	1e070463          	beqz	a4,f900439c <__subsf3+0x40c>
f90041b8:	02a58263          	beq	a1,a0,f90041dc <__subsf3+0x24c>
f90041bc:	00070593          	mv	a1,a4
f90041c0:	e61ff06f          	j	f9004020 <__subsf3+0x90>
f90041c4:	00088493          	mv	s1,a7
f90041c8:	000e0793          	mv	a5,t3
f90041cc:	00058413          	mv	s0,a1
f90041d0:	0ff00713          	li	a4,255
f90041d4:	0037d813          	srli	a6,a5,0x3
f90041d8:	1ce41e63          	bne	s0,a4,f90043b4 <__subsf3+0x424>
f90041dc:	e60808e3          	beqz	a6,f900404c <__subsf3+0xbc>
f90041e0:	00000313          	li	t1,0
f90041e4:	0ff00513          	li	a0,255
f90041e8:	00400637          	lui	a2,0x400
f90041ec:	f41ff06f          	j	f900412c <__subsf3+0x19c>
f90041f0:	0077f713          	andi	a4,a5,7
f90041f4:	ee071ce3          	bnez	a4,f90040ec <__subsf3+0x15c>
f90041f8:	fd9ff06f          	j	f90041d0 <__subsf3+0x240>
f90041fc:	00140693          	addi	a3,s0,1
f9004200:	0fe6f693          	andi	a3,a3,254
f9004204:	04069e63          	bnez	a3,f9004260 <__subsf3+0x2d0>
f9004208:	fc041ce3          	bnez	s0,f90041e0 <__subsf3+0x250>
f900420c:	20078463          	beqz	a5,f9004414 <__subsf3+0x484>
f9004210:	00000513          	li	a0,0
f9004214:	f00e0ce3          	beqz	t3,f900412c <__subsf3+0x19c>
f9004218:	41c78733          	sub	a4,a5,t3
f900421c:	00571693          	slli	a3,a4,0x5
f9004220:	2206d263          	bgez	a3,f9004444 <__subsf3+0x4b4>
f9004224:	40fe0633          	sub	a2,t3,a5
f9004228:	00561793          	slli	a5,a2,0x5
f900422c:	2207d463          	bgez	a5,f9004454 <__subsf3+0x4c4>
f9004230:	fc0007b7          	lui	a5,0xfc000
f9004234:	fff78793          	addi	a5,a5,-1 # fbffffff <__freertos_irq_stack_top+0x2ffa01f>
f9004238:	00f67633          	and	a2,a2,a5
f900423c:	00088493          	mv	s1,a7
f9004240:	00100513          	li	a0,1
f9004244:	eddff06f          	j	f9004120 <__subsf3+0x190>
f9004248:	fc0007b7          	lui	a5,0xfc000
f900424c:	fff78793          	addi	a5,a5,-1 # fbffffff <__freertos_irq_stack_top+0x2ffa01f>
f9004250:	00f977b3          	and	a5,s2,a5
f9004254:	40a40433          	sub	s0,s0,a0
f9004258:	00012903          	lw	s2,0(sp)
f900425c:	e89ff06f          	j	f90040e4 <__subsf3+0x154>
f9004260:	01212023          	sw	s2,0(sp)
f9004264:	41c78933          	sub	s2,a5,t3
f9004268:	00591713          	slli	a4,s2,0x5
f900426c:	12074263          	bltz	a4,f9004390 <__subsf3+0x400>
f9004270:	e2091ce3          	bnez	s2,f90040a8 <__subsf3+0x118>
f9004274:	00012903          	lw	s2,0(sp)
f9004278:	00000313          	li	t1,0
f900427c:	00000513          	li	a0,0
f9004280:	00000613          	li	a2,0
f9004284:	ea9ff06f          	j	f900412c <__subsf3+0x19c>
f9004288:	02050c63          	beqz	a0,f90042c0 <__subsf3+0x330>
f900428c:	14041063          	bnez	s0,f90043cc <__subsf3+0x43c>
f9004290:	0ff00593          	li	a1,255
f9004294:	f2078ae3          	beqz	a5,f90041c8 <__subsf3+0x238>
f9004298:	fff58613          	addi	a2,a1,-1
f900429c:	10060063          	beqz	a2,f900439c <__subsf3+0x40c>
f90042a0:	0ff00513          	li	a0,255
f90042a4:	12a58463          	beq	a1,a0,f90043cc <__subsf3+0x43c>
f90042a8:	01b00713          	li	a4,27
f90042ac:	12c75a63          	bge	a4,a2,f90043e0 <__subsf3+0x450>
f90042b0:	001e0793          	addi	a5,t3,1
f90042b4:	00068413          	mv	s0,a3
f90042b8:	e2dff06f          	j	f90040e4 <__subsf3+0x154>
f90042bc:	08051c63          	bnez	a0,f9004354 <__subsf3+0x3c4>
f90042c0:	00140693          	addi	a3,s0,1
f90042c4:	0fe6f593          	andi	a1,a3,254
f90042c8:	0a059863          	bnez	a1,f9004378 <__subsf3+0x3e8>
f90042cc:	0e041e63          	bnez	s0,f90043c8 <__subsf3+0x438>
f90042d0:	14078c63          	beqz	a5,f9004428 <__subsf3+0x498>
f90042d4:	00000513          	li	a0,0
f90042d8:	e40e0ae3          	beqz	t3,f900412c <__subsf3+0x19c>
f90042dc:	01c78e33          	add	t3,a5,t3
f90042e0:	003e5793          	srli	a5,t3,0x3
f90042e4:	00979793          	slli	a5,a5,0x9
f90042e8:	005e1713          	slli	a4,t3,0x5
f90042ec:	0097d613          	srli	a2,a5,0x9
f90042f0:	e2075ee3          	bgez	a4,f900412c <__subsf3+0x19c>
f90042f4:	00100513          	li	a0,1
f90042f8:	e35ff06f          	j	f900412c <__subsf3+0x19c>
f90042fc:	02000713          	li	a4,32
f9004300:	40b70733          	sub	a4,a4,a1
f9004304:	00ee1733          	sll	a4,t3,a4
f9004308:	00be55b3          	srl	a1,t3,a1
f900430c:	00e03733          	snez	a4,a4
f9004310:	00e5e5b3          	or	a1,a1,a4
f9004314:	00b787b3          	add	a5,a5,a1
f9004318:	00579713          	slli	a4,a5,0x5
f900431c:	ec075ae3          	bgez	a4,f90041f0 <__subsf3+0x260>
f9004320:	00140413          	addi	s0,s0,1
f9004324:	0ff00713          	li	a4,255
f9004328:	00e41863          	bne	s0,a4,f9004338 <__subsf3+0x3a8>
f900432c:	0ff00513          	li	a0,255
f9004330:	00000613          	li	a2,0
f9004334:	df9ff06f          	j	f900412c <__subsf3+0x19c>
f9004338:	7e0006b7          	lui	a3,0x7e000
f900433c:	0017d713          	srli	a4,a5,0x1
f9004340:	fff68693          	addi	a3,a3,-1 # 7dffffff <__stack_size+0x7dffefff>
f9004344:	0017f793          	andi	a5,a5,1
f9004348:	00d77733          	and	a4,a4,a3
f900434c:	00f767b3          	or	a5,a4,a5
f9004350:	d95ff06f          	j	f90040e4 <__subsf3+0x154>
f9004354:	ce041ce3          	bnez	s0,f900404c <__subsf3+0xbc>
f9004358:	0ff00593          	li	a1,255
f900435c:	f39ff06f          	j	f9004294 <__subsf3+0x304>
f9004360:	00058493          	mv	s1,a1
f9004364:	00070813          	mv	a6,a4
f9004368:	e75ff06f          	j	f90041dc <__subsf3+0x24c>
f900436c:	00140693          	addi	a3,s0,1
f9004370:	0fe6f593          	andi	a1,a3,254
f9004374:	f4058ee3          	beqz	a1,f90042d0 <__subsf3+0x340>
f9004378:	0ff00713          	li	a4,255
f900437c:	fae688e3          	beq	a3,a4,f900432c <__subsf3+0x39c>
f9004380:	01c78e33          	add	t3,a5,t3
f9004384:	001e5793          	srli	a5,t3,0x1
f9004388:	00068413          	mv	s0,a3
f900438c:	d59ff06f          	j	f90040e4 <__subsf3+0x154>
f9004390:	40fe0933          	sub	s2,t3,a5
f9004394:	00088493          	mv	s1,a7
f9004398:	d11ff06f          	j	f90040a8 <__subsf3+0x118>
f900439c:	01c787b3          	add	a5,a5,t3
f90043a0:	00579713          	slli	a4,a5,0x5
f90043a4:	00200413          	li	s0,2
f90043a8:	f80748e3          	bltz	a4,f9004338 <__subsf3+0x3a8>
f90043ac:	0037d813          	srli	a6,a5,0x3
f90043b0:	00100413          	li	s0,1
f90043b4:	00981813          	slli	a6,a6,0x9
f90043b8:	00985613          	srli	a2,a6,0x9
f90043bc:	0ff47513          	zext.b	a0,s0
f90043c0:	0014f313          	andi	t1,s1,1
f90043c4:	d69ff06f          	j	f900412c <__subsf3+0x19c>
f90043c8:	e0079ce3          	bnez	a5,f90041e0 <__subsf3+0x250>
f90043cc:	00070813          	mv	a6,a4
f90043d0:	e0dff06f          	j	f90041dc <__subsf3+0x24c>
f90043d4:	41c787b3          	sub	a5,a5,t3
f90043d8:	00100413          	li	s0,1
f90043dc:	cb5ff06f          	j	f9004090 <__subsf3+0x100>
f90043e0:	02000713          	li	a4,32
f90043e4:	40c70733          	sub	a4,a4,a2
f90043e8:	00e79733          	sll	a4,a5,a4
f90043ec:	00c7d633          	srl	a2,a5,a2
f90043f0:	00e037b3          	snez	a5,a4
f90043f4:	00f66633          	or	a2,a2,a5
f90043f8:	01c607b3          	add	a5,a2,t3
f90043fc:	00068413          	mv	s0,a3
f9004400:	f19ff06f          	j	f9004318 <__subsf3+0x388>
f9004404:	40fe07b3          	sub	a5,t3,a5
f9004408:	00088493          	mv	s1,a7
f900440c:	00100413          	li	s0,1
f9004410:	c81ff06f          	j	f9004090 <__subsf3+0x100>
f9004414:	020e0063          	beqz	t3,f9004434 <__subsf3+0x4a4>
f9004418:	00088313          	mv	t1,a7
f900441c:	00070613          	mv	a2,a4
f9004420:	00000513          	li	a0,0
f9004424:	d09ff06f          	j	f900412c <__subsf3+0x19c>
f9004428:	00070613          	mv	a2,a4
f900442c:	00000513          	li	a0,0
f9004430:	cfdff06f          	j	f900412c <__subsf3+0x19c>
f9004434:	00000313          	li	t1,0
f9004438:	00000513          	li	a0,0
f900443c:	00000613          	li	a2,0
f9004440:	cedff06f          	j	f900412c <__subsf3+0x19c>
f9004444:	02070063          	beqz	a4,f9004464 <__subsf3+0x4d4>
f9004448:	00671713          	slli	a4,a4,0x6
f900444c:	00975613          	srli	a2,a4,0x9
f9004450:	cddff06f          	j	f900412c <__subsf3+0x19c>
f9004454:	00661613          	slli	a2,a2,0x6
f9004458:	00088313          	mv	t1,a7
f900445c:	00965613          	srli	a2,a2,0x9
f9004460:	ccdff06f          	j	f900412c <__subsf3+0x19c>
f9004464:	00000313          	li	t1,0
f9004468:	00000613          	li	a2,0
f900446c:	cc1ff06f          	j	f900412c <__subsf3+0x19c>
f9004470:	d80586e3          	beqz	a1,f90041fc <__subsf3+0x26c>
f9004474:	40868633          	sub	a2,a3,s0
f9004478:	00060593          	mv	a1,a2
f900447c:	ce0404e3          	beqz	s0,f9004164 <__subsf3+0x1d4>
f9004480:	04000737          	lui	a4,0x4000
f9004484:	00e7e7b3          	or	a5,a5,a4
f9004488:	00088493          	mv	s1,a7
f900448c:	cf1ff06f          	j	f900417c <__subsf3+0x1ec>
f9004490:	ec058ee3          	beqz	a1,f900436c <__subsf3+0x3dc>
f9004494:	40868633          	sub	a2,a3,s0
f9004498:	00041663          	bnez	s0,f90044a4 <__subsf3+0x514>
f900449c:	00060593          	mv	a1,a2
f90044a0:	df5ff06f          	j	f9004294 <__subsf3+0x304>
f90044a4:	04000737          	lui	a4,0x4000
f90044a8:	00e7e7b3          	or	a5,a5,a4
f90044ac:	dfdff06f          	j	f90042a8 <__subsf3+0x318>

f90044b0 <__fixunssfsi>:
f90044b0:	01755713          	srli	a4,a0,0x17
f90044b4:	00800637          	lui	a2,0x800
f90044b8:	fff60793          	addi	a5,a2,-1 # 7fffff <__stack_size+0x7fefff>
f90044bc:	0ff77713          	zext.b	a4,a4
f90044c0:	07e00593          	li	a1,126
f90044c4:	00a7f6b3          	and	a3,a5,a0
f90044c8:	01f55793          	srli	a5,a0,0x1f
f90044cc:	00000513          	li	a0,0
f90044d0:	00e5d463          	bge	a1,a4,f90044d8 <__fixunssfsi+0x28>
f90044d4:	00078463          	beqz	a5,f90044dc <__fixunssfsi+0x2c>
f90044d8:	00008067          	ret
f90044dc:	09e00793          	li	a5,158
f90044e0:	fff00513          	li	a0,-1
f90044e4:	fee7cae3          	blt	a5,a4,f90044d8 <__fixunssfsi+0x28>
f90044e8:	09500593          	li	a1,149
f90044ec:	00c6e7b3          	or	a5,a3,a2
f90044f0:	00e5d863          	bge	a1,a4,f9004500 <__fixunssfsi+0x50>
f90044f4:	f6a70713          	addi	a4,a4,-150 # 3ffff6a <__stack_size+0x3ffef6a>
f90044f8:	00e79533          	sll	a0,a5,a4
f90044fc:	00008067          	ret
f9004500:	09600513          	li	a0,150
f9004504:	40e50533          	sub	a0,a0,a4
f9004508:	00a7d533          	srl	a0,a5,a0
f900450c:	00008067          	ret

f9004510 <__floatunsisf>:
f9004510:	ff010113          	addi	sp,sp,-16
f9004514:	00112623          	sw	ra,12(sp)
f9004518:	00812423          	sw	s0,8(sp)
f900451c:	04050863          	beqz	a0,f900456c <__floatunsisf+0x5c>
f9004520:	00050413          	mv	s0,a0
f9004524:	104000ef          	jal	f9004628 <__clzsi2>
f9004528:	09e00793          	li	a5,158
f900452c:	40a787b3          	sub	a5,a5,a0
f9004530:	09600713          	li	a4,150
f9004534:	04f74c63          	blt	a4,a5,f900458c <__floatunsisf+0x7c>
f9004538:	00800713          	li	a4,8
f900453c:	0ce50e63          	beq	a0,a4,f9004618 <__floatunsisf+0x108>
f9004540:	ff850513          	addi	a0,a0,-8
f9004544:	00a41433          	sll	s0,s0,a0
f9004548:	00941413          	slli	s0,s0,0x9
f900454c:	0ff7f513          	zext.b	a0,a5
f9004550:	00945413          	srli	s0,s0,0x9
f9004554:	01751513          	slli	a0,a0,0x17
f9004558:	00c12083          	lw	ra,12(sp)
f900455c:	00856533          	or	a0,a0,s0
f9004560:	00812403          	lw	s0,8(sp)
f9004564:	01010113          	addi	sp,sp,16
f9004568:	00008067          	ret
f900456c:	00000513          	li	a0,0
f9004570:	00000413          	li	s0,0
f9004574:	01751513          	slli	a0,a0,0x17
f9004578:	00c12083          	lw	ra,12(sp)
f900457c:	00856533          	or	a0,a0,s0
f9004580:	00812403          	lw	s0,8(sp)
f9004584:	01010113          	addi	sp,sp,16
f9004588:	00008067          	ret
f900458c:	09900713          	li	a4,153
f9004590:	06f74463          	blt	a4,a5,f90045f8 <__floatunsisf+0xe8>
f9004594:	ffb50713          	addi	a4,a0,-5
f9004598:	00e41733          	sll	a4,s0,a4
f900459c:	fc0006b7          	lui	a3,0xfc000
f90045a0:	fff68693          	addi	a3,a3,-1 # fbffffff <__freertos_irq_stack_top+0x2ffa01f>
f90045a4:	00777613          	andi	a2,a4,7
f90045a8:	00d77433          	and	s0,a4,a3
f90045ac:	02060463          	beqz	a2,f90045d4 <__floatunsisf+0xc4>
f90045b0:	00f77713          	andi	a4,a4,15
f90045b4:	00400613          	li	a2,4
f90045b8:	00c70e63          	beq	a4,a2,f90045d4 <__floatunsisf+0xc4>
f90045bc:	00440413          	addi	s0,s0,4
f90045c0:	00541713          	slli	a4,s0,0x5
f90045c4:	00075863          	bgez	a4,f90045d4 <__floatunsisf+0xc4>
f90045c8:	09f00793          	li	a5,159
f90045cc:	00d47433          	and	s0,s0,a3
f90045d0:	40a787b3          	sub	a5,a5,a0
f90045d4:	00641413          	slli	s0,s0,0x6
f90045d8:	0ff7f513          	zext.b	a0,a5
f90045dc:	00945413          	srli	s0,s0,0x9
f90045e0:	01751513          	slli	a0,a0,0x17
f90045e4:	00c12083          	lw	ra,12(sp)
f90045e8:	00856533          	or	a0,a0,s0
f90045ec:	00812403          	lw	s0,8(sp)
f90045f0:	01010113          	addi	sp,sp,16
f90045f4:	00008067          	ret
f90045f8:	01b50713          	addi	a4,a0,27
f90045fc:	00500693          	li	a3,5
f9004600:	00e41733          	sll	a4,s0,a4
f9004604:	40a686b3          	sub	a3,a3,a0
f9004608:	00e03733          	snez	a4,a4
f900460c:	00d45433          	srl	s0,s0,a3
f9004610:	00876733          	or	a4,a4,s0
f9004614:	f89ff06f          	j	f900459c <__floatunsisf+0x8c>
f9004618:	00941413          	slli	s0,s0,0x9
f900461c:	00945413          	srli	s0,s0,0x9
f9004620:	09600513          	li	a0,150
f9004624:	f51ff06f          	j	f9004574 <__floatunsisf+0x64>

f9004628 <__clzsi2>:
f9004628:	000107b7          	lui	a5,0x10
f900462c:	02f57a63          	bgeu	a0,a5,f9004660 <__clzsi2+0x38>
f9004630:	10053793          	sltiu	a5,a0,256
f9004634:	0017b793          	seqz	a5,a5
f9004638:	00379793          	slli	a5,a5,0x3
f900463c:	02000713          	li	a4,32
f9004640:	40f70733          	sub	a4,a4,a5
f9004644:	00f55533          	srl	a0,a0,a5
f9004648:	00000797          	auipc	a5,0x0
f900464c:	7e478793          	addi	a5,a5,2020 # f9004e2c <__clz_tab>
f9004650:	00a787b3          	add	a5,a5,a0
f9004654:	0007c503          	lbu	a0,0(a5)
f9004658:	40a70533          	sub	a0,a4,a0
f900465c:	00008067          	ret
f9004660:	010007b7          	lui	a5,0x1000
f9004664:	02f57463          	bgeu	a0,a5,f900468c <__clzsi2+0x64>
f9004668:	01000793          	li	a5,16
f900466c:	00f55533          	srl	a0,a0,a5
f9004670:	00000797          	auipc	a5,0x0
f9004674:	7bc78793          	addi	a5,a5,1980 # f9004e2c <__clz_tab>
f9004678:	00a787b3          	add	a5,a5,a0
f900467c:	0007c503          	lbu	a0,0(a5)
f9004680:	01000713          	li	a4,16
f9004684:	40a70533          	sub	a0,a4,a0
f9004688:	00008067          	ret
f900468c:	01800793          	li	a5,24
f9004690:	00f55533          	srl	a0,a0,a5
f9004694:	00000797          	auipc	a5,0x0
f9004698:	79878793          	addi	a5,a5,1944 # f9004e2c <__clz_tab>
f900469c:	00a787b3          	add	a5,a5,a0
f90046a0:	0007c503          	lbu	a0,0(a5)
f90046a4:	00800713          	li	a4,8
f90046a8:	40a70533          	sub	a0,a4,a0
f90046ac:	00008067          	ret

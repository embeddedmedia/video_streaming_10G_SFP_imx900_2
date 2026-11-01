
build/app.elf:     file format elf32-littleriscv


Disassembly of section .init:

f9000000 <_start>:

_start:
#ifdef USE_GP
.option push
.option norelax
	la gp, __global_pointer$
f9000000:	00005197          	auipc	gp,0x5
f9000004:	6e018193          	addi	gp,gp,1760 # f90056e0 <__global_pointer$>

f9000008 <init>:
	sw a0, smp_lottery_lock, a1
    ret
#endif

init:
	la sp, _sp
f9000008:	00006117          	auipc	sp,0x6
f900000c:	f6810113          	addi	sp,sp,-152 # f9005f70 <__freertos_irq_stack_top>

	/* Load data section */
	la a0, _data_lma
f9000010:	00004517          	auipc	a0,0x4
f9000014:	67050513          	addi	a0,a0,1648 # f9004680 <_data>
	la a1, _data
f9000018:	00004597          	auipc	a1,0x4
f900001c:	66858593          	addi	a1,a1,1640 # f9004680 <_data>
	la a2, _edata
f9000020:	00005617          	auipc	a2,0x5
f9000024:	f0860613          	addi	a2,a2,-248 # f9004f28 <input.1>
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
f9000044:	ee850513          	addi	a0,a0,-280 # f9004f28 <input.1>
	la a1, _end
f9000048:	00005597          	auipc	a1,0x5
f900004c:	f2058593          	addi	a1,a1,-224 # f9004f68 <_end>
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
f9000080:	60478793          	addi	a5,a5,1540 # f9004680 <_data>
f9000084:	00004417          	auipc	s0,0x4
f9000088:	5fc40413          	addi	s0,s0,1532 # f9004680 <_data>
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
f90000bc:	5c878793          	addi	a5,a5,1480 # f9004680 <_data>
f90000c0:	00004417          	auipc	s0,0x4
f90000c4:	5c040413          	addi	s0,s0,1472 # f9004680 <_data>
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
    u32 speed;
    bsp_init();
f900010c:	55c010ef          	jal	f9001668 <bsp_init>
    bsp_printf("Video Streaming 10G\r\n");
f9000110:	f9005537          	lui	a0,0xf9005
f9000114:	9ac50513          	addi	a0,a0,-1620 # f90049ac <_data+0x32c>
f9000118:	634010ef          	jal	f900174c <bsp_printf>
	init();
f900011c:	275010ef          	jal	f9001b90 <init>
//	set_video_startup();
    bsp_uDelay(1000*1000);
f9000120:	f8b00637          	lui	a2,0xf8b00
f9000124:	05f5e5b7          	lui	a1,0x5f5e
f9000128:	10058593          	addi	a1,a1,256 # 5f5e100 <__stack_size+0x5f5d100>
f900012c:	000f4537          	lui	a0,0xf4
f9000130:	24050513          	addi	a0,a0,576 # f4240 <__stack_size+0xf3240>
f9000134:	2d0010ef          	jal	f9001404 <clint_uDelay>
    print_menu();
f9000138:	2bd010ef          	jal	f9001bf4 <print_menu>
f900013c:	0080006f          	j	f9000144 <main+0x40>
    while(1) {
        while (uart_readOccupancy(BSP_UART_TERMINAL))
        {
            console_main();
f9000140:	399010ef          	jal	f9001cd8 <console_main>
        while (uart_readOccupancy(BSP_UART_TERMINAL))
f9000144:	f8010537          	lui	a0,0xf8010
f9000148:	210010ef          	jal	f9001358 <uart_readOccupancy>
f900014c:	fe051ae3          	bnez	a0,f9000140 <main+0x3c>
        }
        bsp_uDelay(10*1000);
f9000150:	f8b00637          	lui	a2,0xf8b00
f9000154:	05f5e5b7          	lui	a1,0x5f5e
f9000158:	10058593          	addi	a1,a1,256 # 5f5e100 <__stack_size+0x5f5d100>
f900015c:	00002537          	lui	a0,0x2
f9000160:	71050513          	addi	a0,a0,1808 # 2710 <__stack_size+0x1710>
f9000164:	2a0010ef          	jal	f9001404 <clint_uDelay>
        while (uart_readOccupancy(BSP_UART_TERMINAL))
f9000168:	fddff06f          	j	f9000144 <main+0x40>

f900016c <uart_writeAvailability>:
#include "type.h"
#include "soc.h"


    static inline u32 read_u32(u32 address){
        return *((volatile u32*) address);
f900016c:	00452503          	lw	a0,4(a0)
*          of available spaces for writing data from bits 23 to 16. It then
*          returns this value after masking with 0xFF.
*
******************************************************************************/
    static u32 uart_writeAvailability(u32 reg){
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
f9000170:	01055513          	srli	a0,a0,0x10
    }
f9000174:	0ff57513          	zext.b	a0,a0
f9000178:	00008067          	ret

f900017c <uart_write>:
* @note    The function waits until there is available space in the UART buffer
*          for writing data. Once space is available, it writes the character
*          data to the UART data register.
*
******************************************************************************/
    static void uart_write(u32 reg, char data){
f900017c:	ff010113          	addi	sp,sp,-16
f9000180:	00112623          	sw	ra,12(sp)
f9000184:	00812423          	sw	s0,8(sp)
f9000188:	00912223          	sw	s1,4(sp)
f900018c:	00050413          	mv	s0,a0
f9000190:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
f9000194:	00040513          	mv	a0,s0
f9000198:	fd5ff0ef          	jal	f900016c <uart_writeAvailability>
f900019c:	fe050ce3          	beqz	a0,f9000194 <uart_write+0x18>
    }
    
    static inline void write_u32(u32 data, u32 address){
        *((volatile u32*) address) = data;
f90001a0:	00942023          	sw	s1,0(s0)
        write_u32(data, reg + UART_DATA);
    }
f90001a4:	00c12083          	lw	ra,12(sp)
f90001a8:	00812403          	lw	s0,8(sp)
f90001ac:	00412483          	lw	s1,4(sp)
f90001b0:	01010113          	addi	sp,sp,16
f90001b4:	00008067          	ret

f90001b8 <clint_uDelay>:
*          and the time limit is non-negative, indicating that the delay has
*          not yet elapsed.
*
******************************************************************************/
    static void clint_uDelay(u32 usec, u32 hz, u32 reg){
        u32 mTimePerUsec = hz/1000000;
f90001b8:	000f47b7          	lui	a5,0xf4
f90001bc:	24078793          	addi	a5,a5,576 # f4240 <__stack_size+0xf3240>
f90001c0:	02f5d5b3          	divu	a1,a1,a5
    readReg_u32 (clint_getTimeLow , CLINT_TIME_ADDR)
f90001c4:	0000c7b7          	lui	a5,0xc
f90001c8:	ff878793          	addi	a5,a5,-8 # bff8 <__stack_size+0xaff8>
f90001cc:	00f60633          	add	a2,a2,a5
        return *((volatile u32*) address);
f90001d0:	00062783          	lw	a5,0(a2) # f8b00000 <__stack_size+0xf8aff000>
        u32 limit = clint_getTimeLow(reg) + usec*mTimePerUsec;
f90001d4:	02a585b3          	mul	a1,a1,a0
f90001d8:	00f58733          	add	a4,a1,a5
f90001dc:	00062783          	lw	a5,0(a2)
        while((int32_t)(limit-(clint_getTimeLow(reg))) >= 0);
f90001e0:	40f707b3          	sub	a5,a4,a5
f90001e4:	fe07dce3          	bgez	a5,f90001dc <clint_uDelay+0x24>
f90001e8:	00008067          	ret

f90001ec <_putchar>:
#include <math.h>
#include <string.h>
#include "bsp.h"

#if (ENABLE_BSP_PRINTF)
    static void _putchar(char character){
f90001ec:	ff010113          	addi	sp,sp,-16
f90001f0:	00112623          	sw	ra,12(sp)
f90001f4:	00050593          	mv	a1,a0
        #if (ENABLE_SEMIHOSTING_PRINT == 1)
            sh_writec(character);
        #else
            bsp_putChar(character);
f90001f8:	f8010537          	lui	a0,0xf8010
f90001fc:	f81ff0ef          	jal	f900017c <uart_write>
        #endif // (ENABLE_SEMIHOSTING_PRINT == 1)
    }
f9000200:	00c12083          	lw	ra,12(sp)
f9000204:	01010113          	addi	sp,sp,16
f9000208:	00008067          	ret

f900020c <_putchar_s>:

    static void _putchar_s(char *p)
    {
f900020c:	ff010113          	addi	sp,sp,-16
f9000210:	00112623          	sw	ra,12(sp)
f9000214:	00812423          	sw	s0,8(sp)
f9000218:	00050413          	mv	s0,a0
    #if (ENABLE_SEMIHOSTING_PRINT == 1)
        sh_write0(p);
    #else
        while (*p)
f900021c:	00c0006f          	j	f9000228 <_putchar_s+0x1c>
            _putchar(*(p++));
f9000220:	00140413          	addi	s0,s0,1
f9000224:	fc9ff0ef          	jal	f90001ec <_putchar>
        while (*p)
f9000228:	00044503          	lbu	a0,0(s0)
f900022c:	fe051ae3          	bnez	a0,f9000220 <_putchar_s+0x14>
    #endif // (ENABLE_SEMIHOSTING_PRINT == 1)
    }
f9000230:	00c12083          	lw	ra,12(sp)
f9000234:	00812403          	lw	s0,8(sp)
f9000238:	01010113          	addi	sp,sp,16
f900023c:	00008067          	ret

f9000240 <bsp_printHex>:

        static void bsp_printHex(uint32_t val)
    {
f9000240:	ff010113          	addi	sp,sp,-16
f9000244:	00112623          	sw	ra,12(sp)
f9000248:	00812423          	sw	s0,8(sp)
f900024c:	00912223          	sw	s1,4(sp)
f9000250:	00050493          	mv	s1,a0
        uint32_t digits;
        digits =8;

        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9000254:	01c00413          	li	s0,28
f9000258:	0240006f          	j	f900027c <bsp_printHex+0x3c>
            _putchar("0123456789ABCDEF"[(val >> i) % 16]);
f900025c:	0084d733          	srl	a4,s1,s0
f9000260:	00f77713          	andi	a4,a4,15
f9000264:	f90047b7          	lui	a5,0xf9004
f9000268:	68078793          	addi	a5,a5,1664 # f9004680 <_data>
f900026c:	00e787b3          	add	a5,a5,a4
f9000270:	0007c503          	lbu	a0,0(a5)
f9000274:	f79ff0ef          	jal	f90001ec <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9000278:	ffc40413          	addi	s0,s0,-4
f900027c:	fe0450e3          	bgez	s0,f900025c <bsp_printHex+0x1c>
        }
    }
f9000280:	00c12083          	lw	ra,12(sp)
f9000284:	00812403          	lw	s0,8(sp)
f9000288:	00412483          	lw	s1,4(sp)
f900028c:	01010113          	addi	sp,sp,16
f9000290:	00008067          	ret

f9000294 <bsp_printHex_lower>:

    static void bsp_printHex_lower(uint32_t val)
    {
f9000294:	ff010113          	addi	sp,sp,-16
f9000298:	00112623          	sw	ra,12(sp)
f900029c:	00812423          	sw	s0,8(sp)
f90002a0:	00912223          	sw	s1,4(sp)
f90002a4:	00050493          	mv	s1,a0
        uint32_t digits;
        digits =8;

        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f90002a8:	01c00413          	li	s0,28
f90002ac:	0240006f          	j	f90002d0 <bsp_printHex_lower+0x3c>
            _putchar("0123456789abcdef"[(val >> i) % 16]);
f90002b0:	0084d733          	srl	a4,s1,s0
f90002b4:	00f77713          	andi	a4,a4,15
f90002b8:	f90047b7          	lui	a5,0xf9004
f90002bc:	69478793          	addi	a5,a5,1684 # f9004694 <_data+0x14>
f90002c0:	00e787b3          	add	a5,a5,a4
f90002c4:	0007c503          	lbu	a0,0(a5)
f90002c8:	f25ff0ef          	jal	f90001ec <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f90002cc:	ffc40413          	addi	s0,s0,-4
f90002d0:	fe0450e3          	bgez	s0,f90002b0 <bsp_printHex_lower+0x1c>

        }
    }
f90002d4:	00c12083          	lw	ra,12(sp)
f90002d8:	00812403          	lw	s0,8(sp)
f90002dc:	00412483          	lw	s1,4(sp)
f90002e0:	01010113          	addi	sp,sp,16
f90002e4:	00008067          	ret

f90002e8 <bsp_printf_c>:
*
* @param c: The character to be output.
*
******************************************************************************/
    static void bsp_printf_c(int c)
    {
f90002e8:	ff010113          	addi	sp,sp,-16
f90002ec:	00112623          	sw	ra,12(sp)
        _putchar(c);
f90002f0:	0ff57513          	zext.b	a0,a0
f90002f4:	ef9ff0ef          	jal	f90001ec <_putchar>
    }
f90002f8:	00c12083          	lw	ra,12(sp)
f90002fc:	01010113          	addi	sp,sp,16
f9000300:	00008067          	ret

f9000304 <bsp_printf_s>:
*
* @param s: A pointer to the null-terminated string to be output.
*
*******************************************************************************/
    static void bsp_printf_s(char *p)
    {
f9000304:	ff010113          	addi	sp,sp,-16
f9000308:	00112623          	sw	ra,12(sp)
        _putchar_s(p);
f900030c:	f01ff0ef          	jal	f900020c <_putchar_s>
    }
f9000310:	00c12083          	lw	ra,12(sp)
f9000314:	01010113          	addi	sp,sp,16
f9000318:	00008067          	ret

f900031c <bsp_printf_d>:
* - Handles negative numbers by printing a '-' sign.
* - Uses the 'bsp_printf_c' function to print each character.
*
******************************************************************************/
    static void bsp_printf_d(int val)
    {
f900031c:	fd010113          	addi	sp,sp,-48
f9000320:	02112623          	sw	ra,44(sp)
f9000324:	02812423          	sw	s0,40(sp)
f9000328:	02912223          	sw	s1,36(sp)
f900032c:	00050493          	mv	s1,a0
        char buffer[32];
        char *p = buffer;
        if (val < 0) {
f9000330:	00054663          	bltz	a0,f900033c <bsp_printf_d+0x20>
    {
f9000334:	00010413          	mv	s0,sp
f9000338:	02c0006f          	j	f9000364 <bsp_printf_d+0x48>
            bsp_printf_c('-');
f900033c:	02d00513          	li	a0,45
f9000340:	fa9ff0ef          	jal	f90002e8 <bsp_printf_c>
            val = -val;
f9000344:	409004b3          	neg	s1,s1
f9000348:	fedff06f          	j	f9000334 <bsp_printf_d+0x18>
        }
        while (val || p == buffer) {
            *(p++) = '0' + val % 10;
f900034c:	00a00713          	li	a4,10
f9000350:	02e4e7b3          	rem	a5,s1,a4
f9000354:	03078793          	addi	a5,a5,48
f9000358:	00f40023          	sb	a5,0(s0)
            val = val / 10;
f900035c:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
f9000360:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
f9000364:	fe0494e3          	bnez	s1,f900034c <bsp_printf_d+0x30>
f9000368:	00010793          	mv	a5,sp
f900036c:	fef400e3          	beq	s0,a5,f900034c <bsp_printf_d+0x30>
        }
        while (p != buffer)
f9000370:	00010793          	mv	a5,sp
f9000374:	00f40a63          	beq	s0,a5,f9000388 <bsp_printf_d+0x6c>
            bsp_printf_c(*(--p));
f9000378:	fff40413          	addi	s0,s0,-1
f900037c:	00044503          	lbu	a0,0(s0)
f9000380:	f69ff0ef          	jal	f90002e8 <bsp_printf_c>
f9000384:	fedff06f          	j	f9000370 <bsp_printf_d+0x54>
    }
f9000388:	02c12083          	lw	ra,44(sp)
f900038c:	02812403          	lw	s0,40(sp)
f9000390:	02412483          	lw	s1,36(sp)
f9000394:	03010113          	addi	sp,sp,48
f9000398:	00008067          	ret

f900039c <bsp_printf_x>:
* - Calls 'bsp_printHex_lower' to print the hexadecimal representation.
* - Determines the number of leading zeros to be printed based on the value.
*
******************************************************************************/
    static void bsp_printf_x(int val)
    {
f900039c:	ff010113          	addi	sp,sp,-16
f90003a0:	00112623          	sw	ra,12(sp)
        int i,digi=2;

        for(i=0;i<8;i++)
f90003a4:	00000713          	li	a4,0
f90003a8:	00700793          	li	a5,7
f90003ac:	02e7c063          	blt	a5,a4,f90003cc <bsp_printf_x+0x30>
        {
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f90003b0:	00271693          	slli	a3,a4,0x2
f90003b4:	ff000793          	li	a5,-16
f90003b8:	00d797b3          	sll	a5,a5,a3
f90003bc:	00f577b3          	and	a5,a0,a5
f90003c0:	00078663          	beqz	a5,f90003cc <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
f90003c4:	00170713          	addi	a4,a4,1
f90003c8:	fe1ff06f          	j	f90003a8 <bsp_printf_x+0xc>
            {
                digi=i+1;
                break;
            }
        }
        bsp_printHex_lower(val);
f90003cc:	ec9ff0ef          	jal	f9000294 <bsp_printHex_lower>
    }
f90003d0:	00c12083          	lw	ra,12(sp)
f90003d4:	01010113          	addi	sp,sp,16
f90003d8:	00008067          	ret

f90003dc <bsp_printf_X>:
* - Calls 'bsp_printHex' to print the uppercase hexadecimal representation.
* - Determines the number of leading zeros to be printed based on the value.
*
******************************************************************************/
    static void bsp_printf_X(int val)
        {
f90003dc:	ff010113          	addi	sp,sp,-16
f90003e0:	00112623          	sw	ra,12(sp)
            int i,digi=2;

            for(i=0;i<8;i++)
f90003e4:	00000713          	li	a4,0
f90003e8:	00700793          	li	a5,7
f90003ec:	02e7c063          	blt	a5,a4,f900040c <bsp_printf_X+0x30>
            {
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f90003f0:	00271693          	slli	a3,a4,0x2
f90003f4:	ff000793          	li	a5,-16
f90003f8:	00d797b3          	sll	a5,a5,a3
f90003fc:	00f577b3          	and	a5,a0,a5
f9000400:	00078663          	beqz	a5,f900040c <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
f9000404:	00170713          	addi	a4,a4,1
f9000408:	fe1ff06f          	j	f90003e8 <bsp_printf_X+0xc>
                {
                    digi=i+1;
                    break;
                }
            }
            bsp_printHex(val);
f900040c:	e35ff0ef          	jal	f9000240 <bsp_printHex>
        }
f9000410:	00c12083          	lw	ra,12(sp)
f9000414:	01010113          	addi	sp,sp,16
f9000418:	00008067          	ret

f900041c <bsp_printf>:
* - Handles each format specifier by calling the appropriate helper function.
* - If floating-point support is disabled, prints a warning for the 'f' specifier.
*
******************************************************************************/
    static void bsp_printf(const char *format, ...)
    {
f900041c:	fc010113          	addi	sp,sp,-64
f9000420:	00112e23          	sw	ra,28(sp)
f9000424:	00812c23          	sw	s0,24(sp)
f9000428:	00912a23          	sw	s1,20(sp)
f900042c:	00050493          	mv	s1,a0
f9000430:	02b12223          	sw	a1,36(sp)
f9000434:	02c12423          	sw	a2,40(sp)
f9000438:	02d12623          	sw	a3,44(sp)
f900043c:	02e12823          	sw	a4,48(sp)
f9000440:	02f12a23          	sw	a5,52(sp)
f9000444:	03012c23          	sw	a6,56(sp)
f9000448:	03112e23          	sw	a7,60(sp)
        int i;
        va_list ap;

        va_start(ap, format);
f900044c:	02410793          	addi	a5,sp,36
f9000450:	00f12623          	sw	a5,12(sp)

        for (i = 0; format[i]; i++)
f9000454:	00000413          	li	s0,0
f9000458:	01c0006f          	j	f9000474 <bsp_printf+0x58>
            if (format[i] == '%') {
                while (format[++i]) {
                    if (format[i] == 'c') {
                        bsp_printf_c(va_arg(ap,int));
f900045c:	00c12783          	lw	a5,12(sp)
f9000460:	00478713          	addi	a4,a5,4
f9000464:	00e12623          	sw	a4,12(sp)
f9000468:	0007a503          	lw	a0,0(a5)
f900046c:	e7dff0ef          	jal	f90002e8 <bsp_printf_c>
        for (i = 0; format[i]; i++)
f9000470:	00140413          	addi	s0,s0,1
f9000474:	008487b3          	add	a5,s1,s0
f9000478:	0007c503          	lbu	a0,0(a5)
f900047c:	0a050e63          	beqz	a0,f9000538 <bsp_printf+0x11c>
            if (format[i] == '%') {
f9000480:	02500793          	li	a5,37
f9000484:	06f50e63          	beq	a0,a5,f9000500 <bsp_printf+0xe4>
                        break;
                    }
#endif //#if (ENABLE_FLOATING_POINT_SUPPORT)
                }
            } else
                bsp_printf_c(format[i]);
f9000488:	e61ff0ef          	jal	f90002e8 <bsp_printf_c>
f900048c:	fe5ff06f          	j	f9000470 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
f9000490:	00c12783          	lw	a5,12(sp)
f9000494:	00478713          	addi	a4,a5,4
f9000498:	00e12623          	sw	a4,12(sp)
f900049c:	0007a503          	lw	a0,0(a5)
f90004a0:	e65ff0ef          	jal	f9000304 <bsp_printf_s>
                        break;
f90004a4:	fcdff06f          	j	f9000470 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
f90004a8:	00c12783          	lw	a5,12(sp)
f90004ac:	00478713          	addi	a4,a5,4
f90004b0:	00e12623          	sw	a4,12(sp)
f90004b4:	0007a503          	lw	a0,0(a5)
f90004b8:	e65ff0ef          	jal	f900031c <bsp_printf_d>
                        break;
f90004bc:	fb5ff06f          	j	f9000470 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
f90004c0:	00c12783          	lw	a5,12(sp)
f90004c4:	00478713          	addi	a4,a5,4
f90004c8:	00e12623          	sw	a4,12(sp)
f90004cc:	0007a503          	lw	a0,0(a5)
f90004d0:	f0dff0ef          	jal	f90003dc <bsp_printf_X>
                        break;
f90004d4:	f9dff06f          	j	f9000470 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
f90004d8:	00c12783          	lw	a5,12(sp)
f90004dc:	00478713          	addi	a4,a5,4
f90004e0:	00e12623          	sw	a4,12(sp)
f90004e4:	0007a503          	lw	a0,0(a5)
f90004e8:	eb5ff0ef          	jal	f900039c <bsp_printf_x>
                        break;
f90004ec:	f85ff06f          	j	f9000470 <bsp_printf+0x54>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
f90004f0:	f9004537          	lui	a0,0xf9004
f90004f4:	6a850513          	addi	a0,a0,1704 # f90046a8 <_data+0x28>
f90004f8:	e0dff0ef          	jal	f9000304 <bsp_printf_s>
                        break;
f90004fc:	f75ff06f          	j	f9000470 <bsp_printf+0x54>
                while (format[++i]) {
f9000500:	00140413          	addi	s0,s0,1
f9000504:	008487b3          	add	a5,s1,s0
f9000508:	0007c783          	lbu	a5,0(a5)
f900050c:	f60782e3          	beqz	a5,f9000470 <bsp_printf+0x54>
                    if (format[i] == 'c') {
f9000510:	fa878793          	addi	a5,a5,-88
f9000514:	0ff7f693          	zext.b	a3,a5
f9000518:	02000713          	li	a4,32
f900051c:	fed762e3          	bltu	a4,a3,f9000500 <bsp_printf+0xe4>
f9000520:	00269793          	slli	a5,a3,0x2
f9000524:	f9005737          	lui	a4,0xf9005
f9000528:	9e070713          	addi	a4,a4,-1568 # f90049e0 <_data+0x360>
f900052c:	00e787b3          	add	a5,a5,a4
f9000530:	0007a783          	lw	a5,0(a5)
f9000534:	00078067          	jr	a5

        va_end(ap);
    }
f9000538:	01c12083          	lw	ra,28(sp)
f900053c:	01812403          	lw	s0,24(sp)
f9000540:	01412483          	lw	s1,20(sp)
f9000544:	04010113          	addi	sp,sp,64
f9000548:	00008067          	ret

f900054c <read_apb_reg>:
        bsp_printf("written: %x\r\n", base_addr + config[i].reg);
    }
}

u32 read_apb_reg(u32 reg) {
    return read_u32(APB_SLAVE + reg);
f900054c:	f81007b7          	lui	a5,0xf8100
f9000550:	00f50533          	add	a0,a0,a5
f9000554:	00052503          	lw	a0,0(a0)
}
f9000558:	00008067          	ret

f900055c <write_apb_reg>:

void write_apb_reg(u32 data, u32 reg) {
    write_u32(data, APB_SLAVE + reg);
f900055c:	f81007b7          	lui	a5,0xf8100
f9000560:	00f585b3          	add	a1,a1,a5
        *((volatile u32*) address) = data;
f9000564:	00a5a023          	sw	a0,0(a1)
}
f9000568:	00008067          	ret

f900056c <update_video_timing>:

void update_video_timing(VideoTiming_t config) {
    write_u32(config.max_hres, APB_SLAVE + REG_MAX_HRES);
f900056c:	00052703          	lw	a4,0(a0)
f9000570:	f81007b7          	lui	a5,0xf8100
f9000574:	02e7a223          	sw	a4,36(a5) # f8100024 <__stack_size+0xf80ff024>
    write_u32(config.hsp, APB_SLAVE + REG_HSP);
f9000578:	00852703          	lw	a4,8(a0)
f900057c:	f81007b7          	lui	a5,0xf8100
f9000580:	02e7a423          	sw	a4,40(a5) # f8100028 <__stack_size+0xf80ff028>
    write_u32(config.hbp, APB_SLAVE + REG_HBP);
f9000584:	00c52703          	lw	a4,12(a0)
f9000588:	f81007b7          	lui	a5,0xf8100
f900058c:	02e7a623          	sw	a4,44(a5) # f810002c <__stack_size+0xf80ff02c>
    write_u32(config.hact, APB_SLAVE + REG_HACT);
f9000590:	00452703          	lw	a4,4(a0)
f9000594:	f81007b7          	lui	a5,0xf8100
f9000598:	02e7a823          	sw	a4,48(a5) # f8100030 <__stack_size+0xf80ff030>
    write_u32(config.hfp, APB_SLAVE + REG_HFP);
f900059c:	01052703          	lw	a4,16(a0)
f90005a0:	f81007b7          	lui	a5,0xf8100
f90005a4:	02e7aa23          	sw	a4,52(a5) # f8100034 <__stack_size+0xf80ff034>
    write_u32(config.vsp, APB_SLAVE + REG_VSP);
f90005a8:	01852703          	lw	a4,24(a0)
f90005ac:	f81007b7          	lui	a5,0xf8100
f90005b0:	02e7ac23          	sw	a4,56(a5) # f8100038 <__stack_size+0xf80ff038>
    write_u32(config.vbp, APB_SLAVE + REG_VBP);
f90005b4:	01c52703          	lw	a4,28(a0)
f90005b8:	f81007b7          	lui	a5,0xf8100
f90005bc:	02e7ae23          	sw	a4,60(a5) # f810003c <__stack_size+0xf80ff03c>
    write_u32(config.max_vres, APB_SLAVE + REG_MAX_VRES);
f90005c0:	01452703          	lw	a4,20(a0)
f90005c4:	f81007b7          	lui	a5,0xf8100
f90005c8:	04e7a023          	sw	a4,64(a5) # f8100040 <__stack_size+0xf80ff040>
    write_u32(config.vfp, APB_SLAVE + REG_VFP);
f90005cc:	02052703          	lw	a4,32(a0)
f90005d0:	f81007b7          	lui	a5,0xf8100
f90005d4:	04e7a223          	sw	a4,68(a5) # f8100044 <__stack_size+0xf80ff044>
    write_u32(config.pcnt, APB_SLAVE + REG_PCNT);
f90005d8:	02452703          	lw	a4,36(a0)
f90005dc:	f81007b7          	lui	a5,0xf8100
f90005e0:	04e7a423          	sw	a4,72(a5) # f8100048 <__stack_size+0xf80ff048>
}
f90005e4:	00008067          	ret

f90005e8 <reg_init>:

void reg_init() {
f90005e8:	fb010113          	addi	sp,sp,-80
f90005ec:	04112623          	sw	ra,76(sp)
f90005f0:	04812423          	sw	s0,72(sp)
f90005f4:	04912223          	sw	s1,68(sp)
f90005f8:	05212023          	sw	s2,64(sp)
f90005fc:	03312e23          	sw	s3,60(sp)
f9000600:	03412c23          	sw	s4,56(sp)
f9000604:	03512a23          	sw	s5,52(sp)
    IPv4 local_ip = {.data = {20, 100, 16, 172}};
f9000608:	ffff0437          	lui	s0,0xffff0
f900060c:	0ff40413          	addi	s0,s0,255 # ffff00ff <__freertos_irq_stack_top+0x6fea18f>
f9000610:	01447913          	andi	s2,s0,20
f9000614:	000066b7          	lui	a3,0x6
f9000618:	40068693          	addi	a3,a3,1024 # 6400 <__stack_size+0x5400>
f900061c:	00d96933          	or	s2,s2,a3
f9000620:	ff010737          	lui	a4,0xff010
f9000624:	fff70713          	addi	a4,a4,-1 # ff00ffff <__freertos_irq_stack_top+0x600a08f>
f9000628:	00e97933          	and	s2,s2,a4
f900062c:	001005b7          	lui	a1,0x100
f9000630:	00b96933          	or	s2,s2,a1
f9000634:	010007b7          	lui	a5,0x1000
f9000638:	fff78793          	addi	a5,a5,-1 # ffffff <__stack_size+0xffefff>
f900063c:	00f97933          	and	s2,s2,a5
f9000640:	ac000637          	lui	a2,0xac000
f9000644:	00c96933          	or	s2,s2,a2
    IPv4 dest_ip = {.data = {10, 100, 16, 172}};
f9000648:	00a47493          	andi	s1,s0,10
f900064c:	00d4e4b3          	or	s1,s1,a3
f9000650:	00e4f4b3          	and	s1,s1,a4
f9000654:	00b4e4b3          	or	s1,s1,a1
f9000658:	00f4f4b3          	and	s1,s1,a5
f900065c:	00c4e4b3          	or	s1,s1,a2
f9000660:	f82007b7          	lui	a5,0xf8200
f9000664:	0007a423          	sw	zero,8(a5) # f8200008 <__stack_size+0xf81ff008>
f9000668:	f81009b7          	lui	s3,0xf8100
f900066c:	0209a023          	sw	zero,32(s3) # f8100020 <__stack_size+0xf80ff020>
f9000670:	f8100a37          	lui	s4,0xf8100
f9000674:	040a2623          	sw	zero,76(s4) # f810004c <__stack_size+0xf80ff04c>
f9000678:	00100a93          	li	s5,1
f900067c:	0157a423          	sw	s5,8(a5)

    write_u32(0, SERDES_APB_SLAVE + 8); // assert soft reset
    write_u32(0, APB_SLAVE + REG_VIDEO_RSTN);
    write_u32(0, APB_SLAVE + REG_HDMI_RESET);
    write_u32(1, SERDES_APB_SLAVE + 8); // deassert soft reset
    bsp_uDelay(1000*1000);  // WARNING: a long delay is need here
f9000680:	f8b00637          	lui	a2,0xf8b00
f9000684:	05f5e5b7          	lui	a1,0x5f5e
f9000688:	10058593          	addi	a1,a1,256 # 5f5e100 <__stack_size+0x5f5d100>
f900068c:	000f4537          	lui	a0,0xf4
f9000690:	24050513          	addi	a0,a0,576 # f4240 <__stack_size+0xf3240>
f9000694:	b25ff0ef          	jal	f90001b8 <clint_uDelay>

    bsp_printf("network initialization started\r\n");
f9000698:	f9004537          	lui	a0,0xf9004
f900069c:	6f450513          	addi	a0,a0,1780 # f90046f4 <_data+0x74>
f90006a0:	d7dff0ef          	jal	f900041c <bsp_printf>
f90006a4:	f81007b7          	lui	a5,0xf8100
f90006a8:	0527a823          	sw	s2,80(a5) # f8100050 <__stack_size+0xf80ff050>
f90006ac:	f81007b7          	lui	a5,0xf8100
f90006b0:	0497aa23          	sw	s1,84(a5) # f8100054 <__stack_size+0xf80ff054>
f90006b4:	f81007b7          	lui	a5,0xf8100
f90006b8:	0497ac23          	sw	s1,88(a5) # f8100058 <__stack_size+0xf80ff058>
f90006bc:	f81007b7          	lui	a5,0xf8100
f90006c0:	4d200713          	li	a4,1234
f90006c4:	04e7ae23          	sw	a4,92(a5) # f810005c <__stack_size+0xf80ff05c>
f90006c8:	f81007b7          	lui	a5,0xf8100
f90006cc:	4d300713          	li	a4,1235
f90006d0:	06e7a023          	sw	a4,96(a5) # f8100060 <__stack_size+0xf80ff060>
f90006d4:	f81007b7          	lui	a5,0xf8100
f90006d8:	46000713          	li	a4,1120
f90006dc:	06e7aa23          	sw	a4,116(a5) # f8100074 <__stack_size+0xf80ff074>
    write_u32(gateway.ip, APB_SLAVE + REG_GATEWAY_IP);
    write_u32(dest_ip.ip, APB_SLAVE + REG_DEST_IP);
    write_u32(1234, APB_SLAVE + REG_SOURCE_PORT);
    write_u32(1235, APB_SLAVE + REG_DEST_PORT);
    write_u32(floor((9000 - 20 - 8 - 8 - 4)/8), APB_SLAVE + REG_MSS);
    update_video_timing(timing_1080p30);
f90006e0:	f90057b7          	lui	a5,0xf9005
f90006e4:	b6c78793          	addi	a5,a5,-1172 # f9004b6c <timing_1080p30>
f90006e8:	0007ae03          	lw	t3,0(a5)
f90006ec:	0047a303          	lw	t1,4(a5)
f90006f0:	0087a883          	lw	a7,8(a5)
f90006f4:	00c7a803          	lw	a6,12(a5)
f90006f8:	0107a503          	lw	a0,16(a5)
f90006fc:	0147a583          	lw	a1,20(a5)
f9000700:	0187a603          	lw	a2,24(a5)
f9000704:	01c7a683          	lw	a3,28(a5)
f9000708:	0207a703          	lw	a4,32(a5)
f900070c:	0247a783          	lw	a5,36(a5)
f9000710:	01c12023          	sw	t3,0(sp)
f9000714:	00612223          	sw	t1,4(sp)
f9000718:	01112423          	sw	a7,8(sp)
f900071c:	01012623          	sw	a6,12(sp)
f9000720:	00a12823          	sw	a0,16(sp)
f9000724:	00b12a23          	sw	a1,20(sp)
f9000728:	00c12c23          	sw	a2,24(sp)
f900072c:	00d12e23          	sw	a3,28(sp)
f9000730:	02e12023          	sw	a4,32(sp)
f9000734:	02f12223          	sw	a5,36(sp)
f9000738:	00010513          	mv	a0,sp
f900073c:	e31ff0ef          	jal	f900056c <update_video_timing>
f9000740:	055a2623          	sw	s5,76(s4)
f9000744:	0359a023          	sw	s5,32(s3)
    write_u32(1, APB_SLAVE + REG_HDMI_RESET);
    write_u32(1, APB_SLAVE + REG_VIDEO_RSTN);

    for (int i=0 ; i<25 ; ++i) {
f9000748:	00000413          	li	s0,0
f900074c:	03c0006f          	j	f9000788 <reg_init+0x1a0>
        u32 val = read_u32(APB_SLAVE + i*4);
f9000750:	00241793          	slli	a5,s0,0x2
f9000754:	f8100737          	lui	a4,0xf8100
f9000758:	00e787b3          	add	a5,a5,a4
        return *((volatile u32*) address);
f900075c:	0007a483          	lw	s1,0(a5)
        bsp_printf("reg %d readback: ", i);
f9000760:	00040593          	mv	a1,s0
f9000764:	f9004537          	lui	a0,0xf9004
f9000768:	71850513          	addi	a0,a0,1816 # f9004718 <_data+0x98>
f900076c:	cb1ff0ef          	jal	f900041c <bsp_printf>
        bsp_printf_x(val);
f9000770:	00048513          	mv	a0,s1
f9000774:	c29ff0ef          	jal	f900039c <bsp_printf_x>
        bsp_printf("\r\n");
f9000778:	f9004537          	lui	a0,0xf9004
f900077c:	72c50513          	addi	a0,a0,1836 # f900472c <_data+0xac>
f9000780:	c9dff0ef          	jal	f900041c <bsp_printf>
    for (int i=0 ; i<25 ; ++i) {
f9000784:	00140413          	addi	s0,s0,1
f9000788:	01800793          	li	a5,24
f900078c:	fc87d2e3          	bge	a5,s0,f9000750 <reg_init+0x168>
    }

    bsp_printf("initialized!\r\n");
f9000790:	f9004537          	lui	a0,0xf9004
f9000794:	73050513          	addi	a0,a0,1840 # f9004730 <_data+0xb0>
f9000798:	c85ff0ef          	jal	f900041c <bsp_printf>
    bsp_uDelay(50*1000);
f900079c:	f8b00637          	lui	a2,0xf8b00
f90007a0:	05f5e5b7          	lui	a1,0x5f5e
f90007a4:	10058593          	addi	a1,a1,256 # 5f5e100 <__stack_size+0x5f5d100>
f90007a8:	0000c537          	lui	a0,0xc
f90007ac:	35050513          	addi	a0,a0,848 # c350 <__stack_size+0xb350>
f90007b0:	a09ff0ef          	jal	f90001b8 <clint_uDelay>
}
f90007b4:	04c12083          	lw	ra,76(sp)
f90007b8:	04812403          	lw	s0,72(sp)
f90007bc:	04412483          	lw	s1,68(sp)
f90007c0:	04012903          	lw	s2,64(sp)
f90007c4:	03c12983          	lw	s3,60(sp)
f90007c8:	03812a03          	lw	s4,56(sp)
f90007cc:	03412a83          	lw	s5,52(sp)
f90007d0:	05010113          	addi	sp,sp,80
f90007d4:	00008067          	ret

f90007d8 <uart_writeAvailability>:
f90007d8:	00452503          	lw	a0,4(a0)
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
f90007dc:	01055513          	srli	a0,a0,0x10
    }
f90007e0:	0ff57513          	zext.b	a0,a0
f90007e4:	00008067          	ret

f90007e8 <uart_write>:
    static void uart_write(u32 reg, char data){
f90007e8:	ff010113          	addi	sp,sp,-16
f90007ec:	00112623          	sw	ra,12(sp)
f90007f0:	00812423          	sw	s0,8(sp)
f90007f4:	00912223          	sw	s1,4(sp)
f90007f8:	00050413          	mv	s0,a0
f90007fc:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
f9000800:	00040513          	mv	a0,s0
f9000804:	fd5ff0ef          	jal	f90007d8 <uart_writeAvailability>
f9000808:	fe050ce3          	beqz	a0,f9000800 <uart_write+0x18>
        *((volatile u32*) address) = data;
f900080c:	00942023          	sw	s1,0(s0)
    }
f9000810:	00c12083          	lw	ra,12(sp)
f9000814:	00812403          	lw	s0,8(sp)
f9000818:	00412483          	lw	s1,4(sp)
f900081c:	01010113          	addi	sp,sp,16
f9000820:	00008067          	ret

f9000824 <uart_writeStr>:
*
* @note    The function iterates through each character of the string and writes
*          them one by one to the UART buffer using the uart_write function.
*
******************************************************************************/
    static void uart_writeStr(u32 reg, const char* str){
f9000824:	ff010113          	addi	sp,sp,-16
f9000828:	00112623          	sw	ra,12(sp)
f900082c:	00812423          	sw	s0,8(sp)
f9000830:	00912223          	sw	s1,4(sp)
f9000834:	00050493          	mv	s1,a0
f9000838:	00058413          	mv	s0,a1
        while(*str) uart_write(reg, *str++);
f900083c:	0100006f          	j	f900084c <uart_writeStr+0x28>
f9000840:	00140413          	addi	s0,s0,1
f9000844:	00048513          	mv	a0,s1
f9000848:	fa1ff0ef          	jal	f90007e8 <uart_write>
f900084c:	00044583          	lbu	a1,0(s0)
f9000850:	fe0598e3          	bnez	a1,f9000840 <uart_writeStr+0x1c>
    }
f9000854:	00c12083          	lw	ra,12(sp)
f9000858:	00812403          	lw	s0,8(sp)
f900085c:	00412483          	lw	s1,4(sp)
f9000860:	01010113          	addi	sp,sp,16
f9000864:	00008067          	ret

f9000868 <assert>:
    return read_u32(addr);
}


void assert(int cond){
    if(!cond) {
f9000868:	00050463          	beqz	a0,f9000870 <assert+0x8>
f900086c:	00008067          	ret
void assert(int cond){
f9000870:	ff010113          	addi	sp,sp,-16
f9000874:	00112623          	sw	ra,12(sp)
        uart_writeStr(BSP_UART_TERMINAL, "Assert failure\n");
f9000878:	f90045b7          	lui	a1,0xf9004
f900087c:	7b858593          	addi	a1,a1,1976 # f90047b8 <_data+0x138>
f9000880:	f8010537          	lui	a0,0xf8010
f9000884:	fa1ff0ef          	jal	f9000824 <uart_writeStr>
        while(1);
f9000888:	0000006f          	j	f9000888 <assert+0x20>

f900088c <uart_writeAvailability>:
        return *((volatile u32*) address);
f900088c:	00452503          	lw	a0,4(a0) # f8010004 <__stack_size+0xf800f004>
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
f9000890:	01055513          	srli	a0,a0,0x10
    }
f9000894:	0ff57513          	zext.b	a0,a0
f9000898:	00008067          	ret

f900089c <uart_write>:
    static void uart_write(u32 reg, char data){
f900089c:	ff010113          	addi	sp,sp,-16
f90008a0:	00112623          	sw	ra,12(sp)
f90008a4:	00812423          	sw	s0,8(sp)
f90008a8:	00912223          	sw	s1,4(sp)
f90008ac:	00050413          	mv	s0,a0
f90008b0:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
f90008b4:	00040513          	mv	a0,s0
f90008b8:	fd5ff0ef          	jal	f900088c <uart_writeAvailability>
f90008bc:	fe050ce3          	beqz	a0,f90008b4 <uart_write+0x18>
        *((volatile u32*) address) = data;
f90008c0:	00942023          	sw	s1,0(s0)
    }
f90008c4:	00c12083          	lw	ra,12(sp)
f90008c8:	00812403          	lw	s0,8(sp)
f90008cc:	00412483          	lw	s1,4(sp)
f90008d0:	01010113          	addi	sp,sp,16
f90008d4:	00008067          	ret

f90008d8 <clint_uDelay>:
        u32 mTimePerUsec = hz/1000000;
f90008d8:	000f47b7          	lui	a5,0xf4
f90008dc:	24078793          	addi	a5,a5,576 # f4240 <__stack_size+0xf3240>
f90008e0:	02f5d5b3          	divu	a1,a1,a5
    readReg_u32 (clint_getTimeLow , CLINT_TIME_ADDR)
f90008e4:	0000c7b7          	lui	a5,0xc
f90008e8:	ff878793          	addi	a5,a5,-8 # bff8 <__stack_size+0xaff8>
f90008ec:	00f60633          	add	a2,a2,a5
        return *((volatile u32*) address);
f90008f0:	00062783          	lw	a5,0(a2) # f8b00000 <__stack_size+0xf8aff000>
        u32 limit = clint_getTimeLow(reg) + usec*mTimePerUsec;
f90008f4:	02a585b3          	mul	a1,a1,a0
f90008f8:	00f58733          	add	a4,a1,a5
f90008fc:	00062783          	lw	a5,0(a2)
        while((int32_t)(limit-(clint_getTimeLow(reg))) >= 0);
f9000900:	40f707b3          	sub	a5,a4,a5
f9000904:	fe07dce3          	bgez	a5,f90008fc <clint_uDelay+0x24>
f9000908:	00008067          	ret

f900090c <_putchar>:
    static void _putchar(char character){
f900090c:	ff010113          	addi	sp,sp,-16
f9000910:	00112623          	sw	ra,12(sp)
f9000914:	00050593          	mv	a1,a0
            bsp_putChar(character);
f9000918:	f8010537          	lui	a0,0xf8010
f900091c:	f81ff0ef          	jal	f900089c <uart_write>
    }
f9000920:	00c12083          	lw	ra,12(sp)
f9000924:	01010113          	addi	sp,sp,16
f9000928:	00008067          	ret

f900092c <_putchar_s>:
    {
f900092c:	ff010113          	addi	sp,sp,-16
f9000930:	00112623          	sw	ra,12(sp)
f9000934:	00812423          	sw	s0,8(sp)
f9000938:	00050413          	mv	s0,a0
        while (*p)
f900093c:	00c0006f          	j	f9000948 <_putchar_s+0x1c>
            _putchar(*(p++));
f9000940:	00140413          	addi	s0,s0,1
f9000944:	fc9ff0ef          	jal	f900090c <_putchar>
        while (*p)
f9000948:	00044503          	lbu	a0,0(s0)
f900094c:	fe051ae3          	bnez	a0,f9000940 <_putchar_s+0x14>
    }
f9000950:	00c12083          	lw	ra,12(sp)
f9000954:	00812403          	lw	s0,8(sp)
f9000958:	01010113          	addi	sp,sp,16
f900095c:	00008067          	ret

f9000960 <bsp_printHex>:
    {
f9000960:	ff010113          	addi	sp,sp,-16
f9000964:	00112623          	sw	ra,12(sp)
f9000968:	00812423          	sw	s0,8(sp)
f900096c:	00912223          	sw	s1,4(sp)
f9000970:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9000974:	01c00413          	li	s0,28
f9000978:	0240006f          	j	f900099c <bsp_printHex+0x3c>
            _putchar("0123456789ABCDEF"[(val >> i) % 16]);
f900097c:	0084d733          	srl	a4,s1,s0
f9000980:	00f77713          	andi	a4,a4,15
f9000984:	f90047b7          	lui	a5,0xf9004
f9000988:	68078793          	addi	a5,a5,1664 # f9004680 <_data>
f900098c:	00e787b3          	add	a5,a5,a4
f9000990:	0007c503          	lbu	a0,0(a5)
f9000994:	f79ff0ef          	jal	f900090c <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9000998:	ffc40413          	addi	s0,s0,-4
f900099c:	fe0450e3          	bgez	s0,f900097c <bsp_printHex+0x1c>
    }
f90009a0:	00c12083          	lw	ra,12(sp)
f90009a4:	00812403          	lw	s0,8(sp)
f90009a8:	00412483          	lw	s1,4(sp)
f90009ac:	01010113          	addi	sp,sp,16
f90009b0:	00008067          	ret

f90009b4 <bsp_printHex_lower>:
    {
f90009b4:	ff010113          	addi	sp,sp,-16
f90009b8:	00112623          	sw	ra,12(sp)
f90009bc:	00812423          	sw	s0,8(sp)
f90009c0:	00912223          	sw	s1,4(sp)
f90009c4:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f90009c8:	01c00413          	li	s0,28
f90009cc:	0240006f          	j	f90009f0 <bsp_printHex_lower+0x3c>
            _putchar("0123456789abcdef"[(val >> i) % 16]);
f90009d0:	0084d733          	srl	a4,s1,s0
f90009d4:	00f77713          	andi	a4,a4,15
f90009d8:	f90047b7          	lui	a5,0xf9004
f90009dc:	69478793          	addi	a5,a5,1684 # f9004694 <_data+0x14>
f90009e0:	00e787b3          	add	a5,a5,a4
f90009e4:	0007c503          	lbu	a0,0(a5)
f90009e8:	f25ff0ef          	jal	f900090c <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f90009ec:	ffc40413          	addi	s0,s0,-4
f90009f0:	fe0450e3          	bgez	s0,f90009d0 <bsp_printHex_lower+0x1c>
    }
f90009f4:	00c12083          	lw	ra,12(sp)
f90009f8:	00812403          	lw	s0,8(sp)
f90009fc:	00412483          	lw	s1,4(sp)
f9000a00:	01010113          	addi	sp,sp,16
f9000a04:	00008067          	ret

f9000a08 <bsp_printf_c>:
    {
f9000a08:	ff010113          	addi	sp,sp,-16
f9000a0c:	00112623          	sw	ra,12(sp)
        _putchar(c);
f9000a10:	0ff57513          	zext.b	a0,a0
f9000a14:	ef9ff0ef          	jal	f900090c <_putchar>
    }
f9000a18:	00c12083          	lw	ra,12(sp)
f9000a1c:	01010113          	addi	sp,sp,16
f9000a20:	00008067          	ret

f9000a24 <bsp_printf_s>:
    {
f9000a24:	ff010113          	addi	sp,sp,-16
f9000a28:	00112623          	sw	ra,12(sp)
        _putchar_s(p);
f9000a2c:	f01ff0ef          	jal	f900092c <_putchar_s>
    }
f9000a30:	00c12083          	lw	ra,12(sp)
f9000a34:	01010113          	addi	sp,sp,16
f9000a38:	00008067          	ret

f9000a3c <bsp_printf_d>:
    {
f9000a3c:	fd010113          	addi	sp,sp,-48
f9000a40:	02112623          	sw	ra,44(sp)
f9000a44:	02812423          	sw	s0,40(sp)
f9000a48:	02912223          	sw	s1,36(sp)
f9000a4c:	00050493          	mv	s1,a0
        if (val < 0) {
f9000a50:	00054663          	bltz	a0,f9000a5c <bsp_printf_d+0x20>
    {
f9000a54:	00010413          	mv	s0,sp
f9000a58:	02c0006f          	j	f9000a84 <bsp_printf_d+0x48>
            bsp_printf_c('-');
f9000a5c:	02d00513          	li	a0,45
f9000a60:	fa9ff0ef          	jal	f9000a08 <bsp_printf_c>
            val = -val;
f9000a64:	409004b3          	neg	s1,s1
f9000a68:	fedff06f          	j	f9000a54 <bsp_printf_d+0x18>
            *(p++) = '0' + val % 10;
f9000a6c:	00a00713          	li	a4,10
f9000a70:	02e4e7b3          	rem	a5,s1,a4
f9000a74:	03078793          	addi	a5,a5,48
f9000a78:	00f40023          	sb	a5,0(s0)
            val = val / 10;
f9000a7c:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
f9000a80:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
f9000a84:	fe0494e3          	bnez	s1,f9000a6c <bsp_printf_d+0x30>
f9000a88:	00010793          	mv	a5,sp
f9000a8c:	fef400e3          	beq	s0,a5,f9000a6c <bsp_printf_d+0x30>
        while (p != buffer)
f9000a90:	00010793          	mv	a5,sp
f9000a94:	00f40a63          	beq	s0,a5,f9000aa8 <bsp_printf_d+0x6c>
            bsp_printf_c(*(--p));
f9000a98:	fff40413          	addi	s0,s0,-1
f9000a9c:	00044503          	lbu	a0,0(s0)
f9000aa0:	f69ff0ef          	jal	f9000a08 <bsp_printf_c>
f9000aa4:	fedff06f          	j	f9000a90 <bsp_printf_d+0x54>
    }
f9000aa8:	02c12083          	lw	ra,44(sp)
f9000aac:	02812403          	lw	s0,40(sp)
f9000ab0:	02412483          	lw	s1,36(sp)
f9000ab4:	03010113          	addi	sp,sp,48
f9000ab8:	00008067          	ret

f9000abc <bsp_printf_x>:
    {
f9000abc:	ff010113          	addi	sp,sp,-16
f9000ac0:	00112623          	sw	ra,12(sp)
        for(i=0;i<8;i++)
f9000ac4:	00000713          	li	a4,0
f9000ac8:	00700793          	li	a5,7
f9000acc:	02e7c063          	blt	a5,a4,f9000aec <bsp_printf_x+0x30>
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f9000ad0:	00271693          	slli	a3,a4,0x2
f9000ad4:	ff000793          	li	a5,-16
f9000ad8:	00d797b3          	sll	a5,a5,a3
f9000adc:	00f577b3          	and	a5,a0,a5
f9000ae0:	00078663          	beqz	a5,f9000aec <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
f9000ae4:	00170713          	addi	a4,a4,1 # f8100001 <__stack_size+0xf80ff001>
f9000ae8:	fe1ff06f          	j	f9000ac8 <bsp_printf_x+0xc>
        bsp_printHex_lower(val);
f9000aec:	ec9ff0ef          	jal	f90009b4 <bsp_printHex_lower>
    }
f9000af0:	00c12083          	lw	ra,12(sp)
f9000af4:	01010113          	addi	sp,sp,16
f9000af8:	00008067          	ret

f9000afc <bsp_printf_X>:
        {
f9000afc:	ff010113          	addi	sp,sp,-16
f9000b00:	00112623          	sw	ra,12(sp)
            for(i=0;i<8;i++)
f9000b04:	00000713          	li	a4,0
f9000b08:	00700793          	li	a5,7
f9000b0c:	02e7c063          	blt	a5,a4,f9000b2c <bsp_printf_X+0x30>
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f9000b10:	00271693          	slli	a3,a4,0x2
f9000b14:	ff000793          	li	a5,-16
f9000b18:	00d797b3          	sll	a5,a5,a3
f9000b1c:	00f577b3          	and	a5,a0,a5
f9000b20:	00078663          	beqz	a5,f9000b2c <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
f9000b24:	00170713          	addi	a4,a4,1
f9000b28:	fe1ff06f          	j	f9000b08 <bsp_printf_X+0xc>
            bsp_printHex(val);
f9000b2c:	e35ff0ef          	jal	f9000960 <bsp_printHex>
        }
f9000b30:	00c12083          	lw	ra,12(sp)
f9000b34:	01010113          	addi	sp,sp,16
f9000b38:	00008067          	ret

f9000b3c <i2c_masterBusy>:
f9000b3c:	04052503          	lw	a0,64(a0) # f8010040 <__stack_size+0xf800f040>
* @return      Returns 1 if the I2C master is busy, and 0 otherwise.
*
******************************************************************************/
    static int i2c_masterBusy(u32 reg){
        return (read_u32(reg + I2C_MASTER_STATUS) & I2C_MASTER_BUSY) != 0;
    }
f9000b40:	00157513          	andi	a0,a0,1
f9000b44:	00008067          	ret

f9000b48 <i2c_masterStartBlocking>:
        write_u32(I2C_MASTER_START | I2C_MASTER_START_DROPPED, reg + I2C_MASTER_STATUS);
f9000b48:	04050713          	addi	a4,a0,64
        *((volatile u32*) address) = data;
f9000b4c:	21000793          	li	a5,528
f9000b50:	04f52023          	sw	a5,64(a0)
        return *((volatile u32*) address);
f9000b54:	00072783          	lw	a5,0(a4)
* @return      None.
*
******************************************************************************/
    static void i2c_masterStartBlocking(u32 reg){
        i2c_masterStart(reg);
        while(i2c_getMasterStatus(reg) & I2C_MASTER_START);
f9000b58:	0107f793          	andi	a5,a5,16
f9000b5c:	fe079ce3          	bnez	a5,f9000b54 <i2c_masterStartBlocking+0xc>
    }
f9000b60:	00008067          	ret

f9000b64 <i2c_masterStopWait>:
* @param reg   The base address of the I2C registers.
*
* @return      None.
*
******************************************************************************/
    static void i2c_masterStopWait(u32 reg){
f9000b64:	ff010113          	addi	sp,sp,-16
f9000b68:	00112623          	sw	ra,12(sp)
f9000b6c:	00812423          	sw	s0,8(sp)
f9000b70:	00050413          	mv	s0,a0
        while(i2c_masterBusy(reg));
f9000b74:	00040513          	mv	a0,s0
f9000b78:	fc5ff0ef          	jal	f9000b3c <i2c_masterBusy>
f9000b7c:	fe051ce3          	bnez	a0,f9000b74 <i2c_masterStopWait+0x10>
    }
f9000b80:	00c12083          	lw	ra,12(sp)
f9000b84:	00812403          	lw	s0,8(sp)
f9000b88:	01010113          	addi	sp,sp,16
f9000b8c:	00008067          	ret

f9000b90 <i2c_masterStopBlocking>:
* @param reg   The base address of the I2C registers.
*
* @return      None.
*
******************************************************************************/
    static void i2c_masterStopBlocking(u32 reg){
f9000b90:	ff010113          	addi	sp,sp,-16
f9000b94:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
f9000b98:	42000713          	li	a4,1056
f9000b9c:	04e52023          	sw	a4,64(a0)
        i2c_masterStop(reg);
        i2c_masterStopWait(reg);
f9000ba0:	fc5ff0ef          	jal	f9000b64 <i2c_masterStopWait>
    }
f9000ba4:	00c12083          	lw	ra,12(sp)
f9000ba8:	01010113          	addi	sp,sp,16
f9000bac:	00008067          	ret

f9000bb0 <i2c_txAckWait>:
        return *((volatile u32*) address);
f9000bb0:	00452783          	lw	a5,4(a0)
*
* @return      None.
*
******************************************************************************/
    static void i2c_txAckWait(u32 reg){
        while(read_u32(reg + I2C_TX_ACK) & I2C_TX_VALID);
f9000bb4:	1007f793          	andi	a5,a5,256
f9000bb8:	fe079ce3          	bnez	a5,f9000bb0 <i2c_txAckWait>
    }
f9000bbc:	00008067          	ret

f9000bc0 <i2c_txNackBlocking>:
* @param reg   The base address of the I2C registers.
*
* @return      None.
*
******************************************************************************/
    static void i2c_txNackBlocking(u32 reg){
f9000bc0:	ff010113          	addi	sp,sp,-16
f9000bc4:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
f9000bc8:	30100713          	li	a4,769
f9000bcc:	00e52223          	sw	a4,4(a0)
        i2c_txNack(reg);
        i2c_txAckWait(reg);
f9000bd0:	fe1ff0ef          	jal	f9000bb0 <i2c_txAckWait>
    }
f9000bd4:	00c12083          	lw	ra,12(sp)
f9000bd8:	01010113          	addi	sp,sp,16
f9000bdc:	00008067          	ret

f9000be0 <i2c_rxData>:
        return *((volatile u32*) address);
f9000be0:	00852503          	lw	a0,8(a0)
*
******************************************************************************/

    static u32 i2c_rxData(u32 reg){
        return read_u32(reg + I2C_RX_DATA) & I2C_RX_VALUE;
    }
f9000be4:	0ff57513          	zext.b	a0,a0
f9000be8:	00008067          	ret

f9000bec <i2c_rxNack>:
f9000bec:	00c52503          	lw	a0,12(a0)
*
* @return      1 if NACK signal is detected, otherwise 0.
*
******************************************************************************/
    static int i2c_rxNack(u32 reg){
        return (read_u32(reg + I2C_RX_ACK) & I2C_RX_VALUE) != 0;
f9000bf0:	0ff57513          	zext.b	a0,a0
    }
f9000bf4:	00a03533          	snez	a0,a0
f9000bf8:	00008067          	ret

f9000bfc <i2c_rxAck>:
f9000bfc:	00c52503          	lw	a0,12(a0)
*
* @return      1 if ACK signal is detected, otherwise 0.
*
******************************************************************************/
    static int i2c_rxAck(u32 reg){
        return (read_u32(reg + I2C_RX_ACK) & I2C_RX_VALUE) == 0;
f9000c00:	0ff57513          	zext.b	a0,a0
    }
f9000c04:	00153513          	seqz	a0,a0
f9000c08:	00008067          	ret

f9000c0c <bsp_printf>:
    {
f9000c0c:	fc010113          	addi	sp,sp,-64
f9000c10:	00112e23          	sw	ra,28(sp)
f9000c14:	00812c23          	sw	s0,24(sp)
f9000c18:	00912a23          	sw	s1,20(sp)
f9000c1c:	00050493          	mv	s1,a0
f9000c20:	02b12223          	sw	a1,36(sp)
f9000c24:	02c12423          	sw	a2,40(sp)
f9000c28:	02d12623          	sw	a3,44(sp)
f9000c2c:	02e12823          	sw	a4,48(sp)
f9000c30:	02f12a23          	sw	a5,52(sp)
f9000c34:	03012c23          	sw	a6,56(sp)
f9000c38:	03112e23          	sw	a7,60(sp)
        va_start(ap, format);
f9000c3c:	02410793          	addi	a5,sp,36
f9000c40:	00f12623          	sw	a5,12(sp)
        for (i = 0; format[i]; i++)
f9000c44:	00000413          	li	s0,0
f9000c48:	01c0006f          	j	f9000c64 <bsp_printf+0x58>
                        bsp_printf_c(va_arg(ap,int));
f9000c4c:	00c12783          	lw	a5,12(sp)
f9000c50:	00478713          	addi	a4,a5,4
f9000c54:	00e12623          	sw	a4,12(sp)
f9000c58:	0007a503          	lw	a0,0(a5)
f9000c5c:	dadff0ef          	jal	f9000a08 <bsp_printf_c>
        for (i = 0; format[i]; i++)
f9000c60:	00140413          	addi	s0,s0,1
f9000c64:	008487b3          	add	a5,s1,s0
f9000c68:	0007c503          	lbu	a0,0(a5)
f9000c6c:	0a050e63          	beqz	a0,f9000d28 <bsp_printf+0x11c>
            if (format[i] == '%') {
f9000c70:	02500793          	li	a5,37
f9000c74:	06f50e63          	beq	a0,a5,f9000cf0 <bsp_printf+0xe4>
                bsp_printf_c(format[i]);
f9000c78:	d91ff0ef          	jal	f9000a08 <bsp_printf_c>
f9000c7c:	fe5ff06f          	j	f9000c60 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
f9000c80:	00c12783          	lw	a5,12(sp)
f9000c84:	00478713          	addi	a4,a5,4
f9000c88:	00e12623          	sw	a4,12(sp)
f9000c8c:	0007a503          	lw	a0,0(a5)
f9000c90:	d95ff0ef          	jal	f9000a24 <bsp_printf_s>
                        break;
f9000c94:	fcdff06f          	j	f9000c60 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
f9000c98:	00c12783          	lw	a5,12(sp)
f9000c9c:	00478713          	addi	a4,a5,4
f9000ca0:	00e12623          	sw	a4,12(sp)
f9000ca4:	0007a503          	lw	a0,0(a5)
f9000ca8:	d95ff0ef          	jal	f9000a3c <bsp_printf_d>
                        break;
f9000cac:	fb5ff06f          	j	f9000c60 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
f9000cb0:	00c12783          	lw	a5,12(sp)
f9000cb4:	00478713          	addi	a4,a5,4
f9000cb8:	00e12623          	sw	a4,12(sp)
f9000cbc:	0007a503          	lw	a0,0(a5)
f9000cc0:	e3dff0ef          	jal	f9000afc <bsp_printf_X>
                        break;
f9000cc4:	f9dff06f          	j	f9000c60 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
f9000cc8:	00c12783          	lw	a5,12(sp)
f9000ccc:	00478713          	addi	a4,a5,4
f9000cd0:	00e12623          	sw	a4,12(sp)
f9000cd4:	0007a503          	lw	a0,0(a5)
f9000cd8:	de5ff0ef          	jal	f9000abc <bsp_printf_x>
                        break;
f9000cdc:	f85ff06f          	j	f9000c60 <bsp_printf+0x54>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
f9000ce0:	f9004537          	lui	a0,0xf9004
f9000ce4:	6a850513          	addi	a0,a0,1704 # f90046a8 <_data+0x28>
f9000ce8:	d3dff0ef          	jal	f9000a24 <bsp_printf_s>
                        break;
f9000cec:	f75ff06f          	j	f9000c60 <bsp_printf+0x54>
                while (format[++i]) {
f9000cf0:	00140413          	addi	s0,s0,1
f9000cf4:	008487b3          	add	a5,s1,s0
f9000cf8:	0007c783          	lbu	a5,0(a5)
f9000cfc:	f60782e3          	beqz	a5,f9000c60 <bsp_printf+0x54>
                    if (format[i] == 'c') {
f9000d00:	fa878793          	addi	a5,a5,-88
f9000d04:	0ff7f693          	zext.b	a3,a5
f9000d08:	02000713          	li	a4,32
f9000d0c:	fed762e3          	bltu	a4,a3,f9000cf0 <bsp_printf+0xe4>
f9000d10:	00269793          	slli	a5,a3,0x2
f9000d14:	f9005737          	lui	a4,0xf9005
f9000d18:	b9470713          	addi	a4,a4,-1132 # f9004b94 <timing_1080p30+0x28>
f9000d1c:	00e787b3          	add	a5,a5,a4
f9000d20:	0007a783          	lw	a5,0(a5)
f9000d24:	00078067          	jr	a5
    }
f9000d28:	01c12083          	lw	ra,28(sp)
f9000d2c:	01812403          	lw	s0,24(sp)
f9000d30:	01412483          	lw	s1,20(sp)
f9000d34:	04010113          	addi	sp,sp,64
f9000d38:	00008067          	ret

f9000d3c <WriteRegData>:
		{IMX900_GAIN_LOW, 0x00},
};


void WriteRegData(u8 addr, u16 reg, u8 data)
{
f9000d3c:	fe010113          	addi	sp,sp,-32
f9000d40:	00112e23          	sw	ra,28(sp)
f9000d44:	00812c23          	sw	s0,24(sp)
f9000d48:	00912a23          	sw	s1,20(sp)
f9000d4c:	01212823          	sw	s2,16(sp)
f9000d50:	01312623          	sw	s3,12(sp)
f9000d54:	01412423          	sw	s4,8(sp)
f9000d58:	00050413          	mv	s0,a0
f9000d5c:	00058493          	mv	s1,a1
f9000d60:	00060993          	mv	s3,a2
	u8 outdata;

    i2c_masterStartBlocking(I2C_CTRL_CAM);
f9000d64:	f8016537          	lui	a0,0xf8016
f9000d68:	de1ff0ef          	jal	f9000b48 <i2c_masterStartBlocking>

    i2c_txByte(I2C_CTRL_CAM, addr<<1);
f9000d6c:	00141413          	slli	s0,s0,0x1
f9000d70:	0ff47413          	zext.b	s0,s0
        write_u32(byte | I2C_TX_VALID | I2C_TX_ENABLE | I2C_TX_DISABLE_ON_DATA_CONFLICT, reg + I2C_TX_DATA);
f9000d74:	00001937          	lui	s2,0x1
f9000d78:	b0090913          	addi	s2,s2,-1280 # b00 <CUSTOM2+0xaa5>
f9000d7c:	01246433          	or	s0,s0,s2
        *((volatile u32*) address) = data;
f9000d80:	f8016a37          	lui	s4,0xf8016
f9000d84:	008a2023          	sw	s0,0(s4) # f8016000 <__stack_size+0xf8015000>
	i2c_txNackBlocking(I2C_CTRL_CAM);
f9000d88:	f8016537          	lui	a0,0xf8016
f9000d8c:	e35ff0ef          	jal	f9000bc0 <i2c_txNackBlocking>
	assert(i2c_rxAck(I2C_CTRL_CAM)); // Optional check
f9000d90:	f8016537          	lui	a0,0xf8016
f9000d94:	e69ff0ef          	jal	f9000bfc <i2c_rxAck>
f9000d98:	ad1ff0ef          	jal	f9000868 <assert>

	i2c_txByte(I2C_CTRL_CAM, (reg>>8) & 0xFF);
f9000d9c:	0084d793          	srli	a5,s1,0x8
f9000da0:	0127e7b3          	or	a5,a5,s2
f9000da4:	00fa2023          	sw	a5,0(s4)
	i2c_txNackBlocking(I2C_CTRL_CAM);
f9000da8:	f8016537          	lui	a0,0xf8016
f9000dac:	e15ff0ef          	jal	f9000bc0 <i2c_txNackBlocking>
	assert(i2c_rxAck(I2C_CTRL_CAM)); // Optional check
f9000db0:	f8016537          	lui	a0,0xf8016
f9000db4:	e49ff0ef          	jal	f9000bfc <i2c_rxAck>
f9000db8:	ab1ff0ef          	jal	f9000868 <assert>

	i2c_txByte(I2C_CTRL_CAM, (reg) & 0xFF);
f9000dbc:	0ff4f493          	zext.b	s1,s1
f9000dc0:	0124e4b3          	or	s1,s1,s2
f9000dc4:	009a2023          	sw	s1,0(s4)
	i2c_txNackBlocking(I2C_CTRL_CAM);
f9000dc8:	f8016537          	lui	a0,0xf8016
f9000dcc:	df5ff0ef          	jal	f9000bc0 <i2c_txNackBlocking>
	assert(i2c_rxAck(I2C_CTRL_CAM)); // Optional check
f9000dd0:	f8016537          	lui	a0,0xf8016
f9000dd4:	e29ff0ef          	jal	f9000bfc <i2c_rxAck>
f9000dd8:	a91ff0ef          	jal	f9000868 <assert>
f9000ddc:	0129e9b3          	or	s3,s3,s2
f9000de0:	013a2023          	sw	s3,0(s4)

	i2c_txByte(I2C_CTRL_CAM, data & 0xFF);
	i2c_txNackBlocking(I2C_CTRL_CAM);
f9000de4:	f8016537          	lui	a0,0xf8016
f9000de8:	dd9ff0ef          	jal	f9000bc0 <i2c_txNackBlocking>
	assert(i2c_rxAck(I2C_CTRL_CAM)); // Optional check
f9000dec:	f8016537          	lui	a0,0xf8016
f9000df0:	e0dff0ef          	jal	f9000bfc <i2c_rxAck>
f9000df4:	a75ff0ef          	jal	f9000868 <assert>

	i2c_masterStopBlocking(I2C_CTRL_CAM);
f9000df8:	f8016537          	lui	a0,0xf8016
f9000dfc:	d95ff0ef          	jal	f9000b90 <i2c_masterStopBlocking>
}
f9000e00:	01c12083          	lw	ra,28(sp)
f9000e04:	01812403          	lw	s0,24(sp)
f9000e08:	01412483          	lw	s1,20(sp)
f9000e0c:	01012903          	lw	s2,16(sp)
f9000e10:	00c12983          	lw	s3,12(sp)
f9000e14:	00812a03          	lw	s4,8(sp)
f9000e18:	02010113          	addi	sp,sp,32
f9000e1c:	00008067          	ret

f9000e20 <ReadRegData>:

u8 ReadRegData(u8 addr, u16 reg)
{
f9000e20:	fe010113          	addi	sp,sp,-32
f9000e24:	00112e23          	sw	ra,28(sp)
f9000e28:	00812c23          	sw	s0,24(sp)
f9000e2c:	00912a23          	sw	s1,20(sp)
f9000e30:	01212823          	sw	s2,16(sp)
f9000e34:	01312623          	sw	s3,12(sp)
f9000e38:	00050413          	mv	s0,a0
f9000e3c:	00058493          	mv	s1,a1
	u8 outdata;

    i2c_masterStartBlocking(I2C_CTRL_CAM);
f9000e40:	f8016537          	lui	a0,0xf8016
f9000e44:	d05ff0ef          	jal	f9000b48 <i2c_masterStartBlocking>

    i2c_txByte(I2C_CTRL_CAM, addr<<1);
f9000e48:	00141793          	slli	a5,s0,0x1
f9000e4c:	0ff7f793          	zext.b	a5,a5
f9000e50:	00001937          	lui	s2,0x1
f9000e54:	b0090913          	addi	s2,s2,-1280 # b00 <CUSTOM2+0xaa5>
f9000e58:	0127e7b3          	or	a5,a5,s2
f9000e5c:	f80169b7          	lui	s3,0xf8016
f9000e60:	00f9a023          	sw	a5,0(s3) # f8016000 <__stack_size+0xf8015000>
	i2c_txNackBlocking(I2C_CTRL_CAM);
f9000e64:	f8016537          	lui	a0,0xf8016
f9000e68:	d59ff0ef          	jal	f9000bc0 <i2c_txNackBlocking>
	assert(i2c_rxAck(I2C_CTRL_CAM)); // Optional check
f9000e6c:	f8016537          	lui	a0,0xf8016
f9000e70:	d8dff0ef          	jal	f9000bfc <i2c_rxAck>
f9000e74:	9f5ff0ef          	jal	f9000868 <assert>

	i2c_txByte(I2C_CTRL_CAM, (reg>>8) & 0xFF);
f9000e78:	0084d793          	srli	a5,s1,0x8
f9000e7c:	0127e7b3          	or	a5,a5,s2
f9000e80:	00f9a023          	sw	a5,0(s3)
	i2c_txNackBlocking(I2C_CTRL_CAM);
f9000e84:	f8016537          	lui	a0,0xf8016
f9000e88:	d39ff0ef          	jal	f9000bc0 <i2c_txNackBlocking>
	assert(i2c_rxAck(I2C_CTRL_CAM)); // Optional check
f9000e8c:	f8016537          	lui	a0,0xf8016
f9000e90:	d6dff0ef          	jal	f9000bfc <i2c_rxAck>
f9000e94:	9d5ff0ef          	jal	f9000868 <assert>

	i2c_txByte(I2C_CTRL_CAM, (reg) & 0xFF);
f9000e98:	0ff4f493          	zext.b	s1,s1
f9000e9c:	0124e4b3          	or	s1,s1,s2
f9000ea0:	0099a023          	sw	s1,0(s3)
	i2c_txNackBlocking(I2C_CTRL_CAM);
f9000ea4:	f8016537          	lui	a0,0xf8016
f9000ea8:	d19ff0ef          	jal	f9000bc0 <i2c_txNackBlocking>
	assert(i2c_rxAck(I2C_CTRL_CAM)); // Optional check
f9000eac:	f8016537          	lui	a0,0xf8016
f9000eb0:	d4dff0ef          	jal	f9000bfc <i2c_rxAck>
f9000eb4:	9b5ff0ef          	jal	f9000868 <assert>

	i2c_masterStopBlocking(I2C_CTRL_CAM);
f9000eb8:	f8016537          	lui	a0,0xf8016
f9000ebc:	cd5ff0ef          	jal	f9000b90 <i2c_masterStopBlocking>
	i2c_masterStartBlocking(I2C_CTRL_CAM);
f9000ec0:	f8016537          	lui	a0,0xf8016
f9000ec4:	c85ff0ef          	jal	f9000b48 <i2c_masterStartBlocking>

	i2c_txByte(I2C_CTRL_CAM, (addr<<1) | 0x01);
f9000ec8:	00141413          	slli	s0,s0,0x1
f9000ecc:	00146413          	ori	s0,s0,1
f9000ed0:	0ff47413          	zext.b	s0,s0
f9000ed4:	01246433          	or	s0,s0,s2
f9000ed8:	0089a023          	sw	s0,0(s3)
	i2c_txNackBlocking(I2C_CTRL_CAM);
f9000edc:	f8016537          	lui	a0,0xf8016
f9000ee0:	ce1ff0ef          	jal	f9000bc0 <i2c_txNackBlocking>
	assert(i2c_rxAck(I2C_CTRL_CAM)); // Optional check
f9000ee4:	f8016537          	lui	a0,0xf8016
f9000ee8:	d15ff0ef          	jal	f9000bfc <i2c_rxAck>
f9000eec:	97dff0ef          	jal	f9000868 <assert>
f9000ef0:	000017b7          	lui	a5,0x1
f9000ef4:	bff78793          	addi	a5,a5,-1025 # bff <CUSTOM2+0xba4>
f9000ef8:	00f9a023          	sw	a5,0(s3)

	i2c_txByte(I2C_CTRL_CAM, 0xFF);
	i2c_txNackBlocking(I2C_CTRL_CAM);
f9000efc:	f8016537          	lui	a0,0xf8016
f9000f00:	cc1ff0ef          	jal	f9000bc0 <i2c_txNackBlocking>
	assert(i2c_rxNack(I2C_CTRL_CAM)); // Optional check
f9000f04:	f8016537          	lui	a0,0xf8016
f9000f08:	ce5ff0ef          	jal	f9000bec <i2c_rxNack>
f9000f0c:	95dff0ef          	jal	f9000868 <assert>
	outdata = i2c_rxData(I2C_CTRL_CAM);
f9000f10:	f8016537          	lui	a0,0xf8016
f9000f14:	ccdff0ef          	jal	f9000be0 <i2c_rxData>
f9000f18:	0ff57413          	zext.b	s0,a0

	i2c_masterStopBlocking(I2C_CTRL_CAM);
f9000f1c:	f8016537          	lui	a0,0xf8016
f9000f20:	c71ff0ef          	jal	f9000b90 <i2c_masterStopBlocking>

	return outdata;
}
f9000f24:	00040513          	mv	a0,s0
f9000f28:	01c12083          	lw	ra,28(sp)
f9000f2c:	01812403          	lw	s0,24(sp)
f9000f30:	01412483          	lw	s1,20(sp)
f9000f34:	01012903          	lw	s2,16(sp)
f9000f38:	00c12983          	lw	s3,12(sp)
f9000f3c:	02010113          	addi	sp,sp,32
f9000f40:	00008067          	ret

f9000f44 <IMX900_init>:
{
	PiCamV3_TestPattern(Enable, mode);
}


void IMX900_init(CameraRes_t res){
f9000f44:	fc010113          	addi	sp,sp,-64
f9000f48:	02112e23          	sw	ra,60(sp)
f9000f4c:	02812c23          	sw	s0,56(sp)
	u8 data;
	static int fun_num = 0;
    update_video_timing(videoParams[fun_num].timing);
f9000f50:	f90057b7          	lui	a5,0xf9005
f9000f54:	a6478793          	addi	a5,a5,-1436 # f9004a64 <videoParams>
f9000f58:	0007ae03          	lw	t3,0(a5)
f9000f5c:	0047a303          	lw	t1,4(a5)
f9000f60:	0087a883          	lw	a7,8(a5)
f9000f64:	00c7a803          	lw	a6,12(a5)
f9000f68:	0107a503          	lw	a0,16(a5)
f9000f6c:	0147a583          	lw	a1,20(a5)
f9000f70:	0187a603          	lw	a2,24(a5)
f9000f74:	01c7a683          	lw	a3,28(a5)
f9000f78:	0207a703          	lw	a4,32(a5)
f9000f7c:	0247a783          	lw	a5,36(a5)
f9000f80:	01c12023          	sw	t3,0(sp)
f9000f84:	00612223          	sw	t1,4(sp)
f9000f88:	01112423          	sw	a7,8(sp)
f9000f8c:	01012623          	sw	a6,12(sp)
f9000f90:	00a12823          	sw	a0,16(sp)
f9000f94:	00b12a23          	sw	a1,20(sp)
f9000f98:	00c12c23          	sw	a2,24(sp)
f9000f9c:	00d12e23          	sw	a3,28(sp)
f9000fa0:	02e12023          	sw	a4,32(sp)
f9000fa4:	02f12223          	sw	a5,36(sp)
f9000fa8:	00010513          	mv	a0,sp
f9000fac:	dc0ff0ef          	jal	f900056c <update_video_timing>

	WRITE_REGS_MODULE(module_common_regs);
f9000fb0:	00000413          	li	s0,0
f9000fb4:	0280006f          	j	f9000fdc <IMX900_init+0x98>
f9000fb8:	f90057b7          	lui	a5,0xf9005
f9000fbc:	00241713          	slli	a4,s0,0x2
f9000fc0:	c9478793          	addi	a5,a5,-876 # f9004c94 <module_common_regs>
f9000fc4:	00e787b3          	add	a5,a5,a4
    WriteRegData(0x10, reg, data);
f9000fc8:	0027c603          	lbu	a2,2(a5)
f9000fcc:	0007d583          	lhu	a1,0(a5)
f9000fd0:	01000513          	li	a0,16
f9000fd4:	d69ff0ef          	jal	f9000d3c <WriteRegData>
	WRITE_REGS_MODULE(module_common_regs);
f9000fd8:	00140413          	addi	s0,s0,1
f9000fdc:	00400793          	li	a5,4
f9000fe0:	fc87fce3          	bgeu	a5,s0,f9000fb8 <IMX900_init+0x74>
	data = ReadRegData(0x10, 0x0101);
f9000fe4:	10100593          	li	a1,257
f9000fe8:	01000513          	li	a0,16
f9000fec:	e35ff0ef          	jal	f9000e20 <ReadRegData>
	while(1){
		data = ReadRegData(0x10, 0x0101);
f9000ff0:	10100593          	li	a1,257
f9000ff4:	01000513          	li	a0,16
f9000ff8:	e29ff0ef          	jal	f9000e20 <ReadRegData>
		if (data == 0x80) {
f9000ffc:	08000793          	li	a5,128
f9001000:	00f50e63          	beq	a0,a5,f900101c <IMX900_init+0xd8>
			bsp_printf("CModule Init Passed\r\n");
			break;
		}else if (data == 0x01){
f9001004:	00100793          	li	a5,1
f9001008:	fef514e3          	bne	a0,a5,f9000ff0 <IMX900_init+0xac>
			bsp_printf("CModule Init Failed\r\n");
f900100c:	f9004537          	lui	a0,0xf9004
f9001010:	7e050513          	addi	a0,a0,2016 # f90047e0 <_data+0x160>
f9001014:	bf9ff0ef          	jal	f9000c0c <bsp_printf>
			break;
f9001018:	0100006f          	j	f9001028 <IMX900_init+0xe4>
			bsp_printf("CModule Init Passed\r\n");
f900101c:	f9004537          	lui	a0,0xf9004
f9001020:	7c850513          	addi	a0,a0,1992 # f90047c8 <_data+0x148>
f9001024:	be9ff0ef          	jal	f9000c0c <bsp_printf>
		}else{
		}
	}
	//bsp_uDelay(1000*1000);
	//WRITE_REGS_IMX900(imx900_common_regs);
	bsp_uDelay(1000*1000);
f9001028:	f8b00637          	lui	a2,0xf8b00
f900102c:	05f5e5b7          	lui	a1,0x5f5e
f9001030:	10058593          	addi	a1,a1,256 # 5f5e100 <__stack_size+0x5f5d100>
f9001034:	000f4537          	lui	a0,0xf4
f9001038:	24050513          	addi	a0,a0,576 # f4240 <__stack_size+0xf3240>
f900103c:	89dff0ef          	jal	f90008d8 <clint_uDelay>
	WRITE_REGS_IMX900(imx900_regs_0);
f9001040:	00000413          	li	s0,0
f9001044:	0280006f          	j	f900106c <IMX900_init+0x128>
f9001048:	f90057b7          	lui	a5,0xf9005
f900104c:	00241713          	slli	a4,s0,0x2
f9001050:	c1878793          	addi	a5,a5,-1000 # f9004c18 <imx900_regs_0>
f9001054:	00e787b3          	add	a5,a5,a4
    WriteRegData(0x1A, reg, data);
f9001058:	0027c603          	lbu	a2,2(a5)
f900105c:	0007d583          	lhu	a1,0(a5)
f9001060:	01a00513          	li	a0,26
f9001064:	cd9ff0ef          	jal	f9000d3c <WriteRegData>
	WRITE_REGS_IMX900(imx900_regs_0);
f9001068:	00140413          	addi	s0,s0,1
f900106c:	01e00793          	li	a5,30
f9001070:	fc87fce3          	bgeu	a5,s0,f9001048 <IMX900_init+0x104>
	bsp_uDelay(1000*1000);
f9001074:	f8b00637          	lui	a2,0xf8b00
f9001078:	05f5e5b7          	lui	a1,0x5f5e
f900107c:	10058593          	addi	a1,a1,256 # 5f5e100 <__stack_size+0x5f5d100>
f9001080:	000f4537          	lui	a0,0xf4
f9001084:	24050513          	addi	a0,a0,576 # f4240 <__stack_size+0xf3240>
f9001088:	851ff0ef          	jal	f90008d8 <clint_uDelay>

	 write_apb_reg(fun_num, REG_PIXEL_MODE);
f900108c:	07c00593          	li	a1,124
f9001090:	00000513          	li	a0,0
f9001094:	cc8ff0ef          	jal	f900055c <write_apb_reg>
}
f9001098:	03c12083          	lw	ra,60(sp)
f900109c:	03812403          	lw	s0,56(sp)
f90010a0:	04010113          	addi	sp,sp,64
f90010a4:	00008067          	ret

f90010a8 <Gainfilter>:

void Gainfilter(u16 AGain, u16 DGain)
{
f90010a8:	ff010113          	addi	sp,sp,-16
f90010ac:	00112623          	sw	ra,12(sp)
f90010b0:	00812423          	sw	s0,8(sp)
f90010b4:	00058413          	mv	s0,a1
    WriteRegData(0x1A, reg, data);
f90010b8:	0085d613          	srli	a2,a1,0x8
f90010bc:	000035b7          	lui	a1,0x3
f90010c0:	51558593          	addi	a1,a1,1301 # 3515 <__stack_size+0x2515>
f90010c4:	01a00513          	li	a0,26
f90010c8:	c75ff0ef          	jal	f9000d3c <WriteRegData>
f90010cc:	0ff47613          	zext.b	a2,s0
f90010d0:	000035b7          	lui	a1,0x3
f90010d4:	51458593          	addi	a1,a1,1300 # 3514 <__stack_size+0x2514>
f90010d8:	01a00513          	li	a0,26
f90010dc:	c61ff0ef          	jal	f9000d3c <WriteRegData>
	u8 ret=0;
	WriteRegData_1A(IMX900_REG_DIGITAL_GAIN, (u8)(DGain >> 8));    //MSB
	WriteRegData_1A(IMX900_REG_ANALOG_GAIN, (u8)(DGain & 0xff));  //LSB
}
f90010e0:	00c12083          	lw	ra,12(sp)
f90010e4:	00812403          	lw	s0,8(sp)
f90010e8:	01010113          	addi	sp,sp,16
f90010ec:	00008067          	ret

f90010f0 <clamp>:
    u32 cnt = read_u32(ISP_APB + 4);
    // *4 because 1 cycle = 4 pixels
    return sum/cnt;
}

static float clamp(float val, float min, float max) {
f90010f0:	ff010113          	addi	sp,sp,-16
f90010f4:	00112623          	sw	ra,12(sp)
f90010f8:	00812423          	sw	s0,8(sp)
f90010fc:	00912223          	sw	s1,4(sp)
f9001100:	01212023          	sw	s2,0(sp)
f9001104:	00050493          	mv	s1,a0
f9001108:	00058413          	mv	s0,a1
f900110c:	00060913          	mv	s2,a2
    return val < min ? min : val > max ? max : val;
f9001110:	1a1020ef          	jal	f9003ab0 <__lesf2>
f9001114:	00054c63          	bltz	a0,f900112c <clamp+0x3c>
f9001118:	00090593          	mv	a1,s2
f900111c:	00048513          	mv	a0,s1
f9001120:	0c9020ef          	jal	f90039e8 <__gesf2>
f9001124:	02a05263          	blez	a0,f9001148 <clamp+0x58>
f9001128:	00090413          	mv	s0,s2
}
f900112c:	00040513          	mv	a0,s0
f9001130:	00c12083          	lw	ra,12(sp)
f9001134:	00812403          	lw	s0,8(sp)
f9001138:	00412483          	lw	s1,4(sp)
f900113c:	00012903          	lw	s2,0(sp)
f9001140:	01010113          	addi	sp,sp,16
f9001144:	00008067          	ret
    return val < min ? min : val > max ? max : val;
f9001148:	00048413          	mv	s0,s1
f900114c:	fe1ff06f          	j	f900112c <clamp+0x3c>

f9001150 <update_incremental>:

static u32 update_incremental(PidIncremental *pid, u32 point) {
f9001150:	fe010113          	addi	sp,sp,-32
f9001154:	00112e23          	sw	ra,28(sp)
f9001158:	00812c23          	sw	s0,24(sp)
f900115c:	00912a23          	sw	s1,20(sp)
f9001160:	01212823          	sw	s2,16(sp)
f9001164:	01312623          	sw	s3,12(sp)
f9001168:	01412423          	sw	s4,8(sp)
f900116c:	00050413          	mv	s0,a0
    pid->err = pid->set_point - point;
f9001170:	00c52483          	lw	s1,12(a0)
f9001174:	00058513          	mv	a0,a1
f9001178:	368030ef          	jal	f90044e0 <__floatunsisf>
f900117c:	00050593          	mv	a1,a0
f9001180:	00048513          	mv	a0,s1
f9001184:	5dd020ef          	jal	f9003f60 <__subsf3>
f9001188:	00050493          	mv	s1,a0
f900118c:	00a42823          	sw	a0,16(s0)

    float increment_val = 
        pid->kp*(pid->err - pid->err_next) + 
f9001190:	01c42983          	lw	s3,28(s0)
f9001194:	01442903          	lw	s2,20(s0)
f9001198:	00090593          	mv	a1,s2
f900119c:	5c5020ef          	jal	f9003f60 <__subsf3>
f90011a0:	00050593          	mv	a1,a0
f90011a4:	00098513          	mv	a0,s3
f90011a8:	1d9020ef          	jal	f9003b80 <__mulsf3>
f90011ac:	00050993          	mv	s3,a0
        pid->ki*pid->err + 
f90011b0:	02042583          	lw	a1,32(s0)
f90011b4:	00048513          	mv	a0,s1
f90011b8:	1c9020ef          	jal	f9003b80 <__mulsf3>
f90011bc:	00050593          	mv	a1,a0
        pid->kp*(pid->err - pid->err_next) + 
f90011c0:	00098513          	mv	a0,s3
f90011c4:	34c020ef          	jal	f9003510 <__addsf3>
f90011c8:	00050993          	mv	s3,a0
        pid->kd*(pid->err - 2 * pid->err_next + pid->err_last);
f90011cc:	02442a03          	lw	s4,36(s0)
f90011d0:	00090593          	mv	a1,s2
f90011d4:	00090513          	mv	a0,s2
f90011d8:	338020ef          	jal	f9003510 <__addsf3>
f90011dc:	00050593          	mv	a1,a0
f90011e0:	00048513          	mv	a0,s1
f90011e4:	57d020ef          	jal	f9003f60 <__subsf3>
f90011e8:	01842583          	lw	a1,24(s0)
f90011ec:	324020ef          	jal	f9003510 <__addsf3>
f90011f0:	00050593          	mv	a1,a0
f90011f4:	000a0513          	mv	a0,s4
f90011f8:	189020ef          	jal	f9003b80 <__mulsf3>
f90011fc:	00050593          	mv	a1,a0
    float increment_val = 
f9001200:	00098513          	mv	a0,s3
f9001204:	30c020ef          	jal	f9003510 <__addsf3>

    increment_val = clamp(increment_val, -1*pid->incr_limit, pid->incr_limit);
f9001208:	00042603          	lw	a2,0(s0)
f900120c:	800009b7          	lui	s3,0x80000
f9001210:	00c9c5b3          	xor	a1,s3,a2
f9001214:	eddff0ef          	jal	f90010f0 <clamp>
f9001218:	00050593          	mv	a1,a0
    pid->actual_val += increment_val;
f900121c:	00842503          	lw	a0,8(s0)
f9001220:	2f0020ef          	jal	f9003510 <__addsf3>
f9001224:	00a42423          	sw	a0,8(s0)
    pid->actual_val = clamp(pid->actual_val, -1*pid->output_limit, pid->output_limit);
f9001228:	00442603          	lw	a2,4(s0)
f900122c:	00c9c5b3          	xor	a1,s3,a2
f9001230:	ec1ff0ef          	jal	f90010f0 <clamp>
f9001234:	00a42423          	sw	a0,8(s0)
    
    pid->err_last = pid->err_next;
f9001238:	01242c23          	sw	s2,24(s0)
    pid->err_next = pid->err;
f900123c:	00942a23          	sw	s1,20(s0)
    return pid->actual_val;
f9001240:	240030ef          	jal	f9004480 <__fixunssfsi>
}
f9001244:	01c12083          	lw	ra,28(sp)
f9001248:	01812403          	lw	s0,24(sp)
f900124c:	01412483          	lw	s1,20(sp)
f9001250:	01012903          	lw	s2,16(sp)
f9001254:	00c12983          	lw	s3,12(sp)
f9001258:	00812a03          	lw	s4,8(sp)
f900125c:	02010113          	addi	sp,sp,32
f9001260:	00008067          	ret

f9001264 <isp_set_color_balance>:
f9001264:	f81007b7          	lui	a5,0xf8100
f9001268:	00a7a423          	sw	a0,8(a5) # f8100008 <__stack_size+0xf80ff008>
f900126c:	f81007b7          	lui	a5,0xf8100
f9001270:	00b7a623          	sw	a1,12(a5) # f810000c <__stack_size+0xf80ff00c>
f9001274:	f81007b7          	lui	a5,0xf8100
f9001278:	00c7a823          	sw	a2,16(a5) # f8100010 <__stack_size+0xf80ff010>
}
f900127c:	00008067          	ret

f9001280 <isp_get_expose_avg>:
        return *((volatile u32*) address);
f9001280:	f81007b7          	lui	a5,0xf8100
f9001284:	0007a503          	lw	a0,0(a5) # f8100000 <__stack_size+0xf80ff000>
f9001288:	00478793          	addi	a5,a5,4
f900128c:	0007a783          	lw	a5,0(a5)
}
f9001290:	02f55533          	divu	a0,a0,a5
f9001294:	00008067          	ret

f9001298 <isp_update_gain>:
        output[i] = output[i-1] + (alpha*(input[i] - output[i-1])); 
    }
    return output[points-1];
}     

u32 isp_update_gain(u32 current_gain) {
f9001298:	ff010113          	addi	sp,sp,-16
f900129c:	00112623          	sw	ra,12(sp)
    // incremental pid
    static float input[10];
    static float output[10];
    u32 avg = isp_get_expose_avg();
f90012a0:	fe1ff0ef          	jal	f9001280 <isp_get_expose_avg>
f90012a4:	00050593          	mv	a1,a0
    // memcpy(input, input+1, sizeof(float)*9);
    // input[9] = avg;
    // s32 avg_filter = lowPassFrequency(input, output, 10);

    return update_incremental(&exp_pid, avg);
f90012a8:	86018513          	addi	a0,gp,-1952 # f9004f40 <exp_pid>
f90012ac:	ea5ff0ef          	jal	f9001150 <update_incremental>
}
f90012b0:	00c12083          	lw	ra,12(sp)
f90012b4:	01010113          	addi	sp,sp,16
f90012b8:	00008067          	ret

f90012bc <isp_set_setpoint>:
//         }
//         bsp_printf("\r\n");
//     }
// }

void isp_set_setpoint(u32 exp_setpoint) {
f90012bc:	ff010113          	addi	sp,sp,-16
f90012c0:	00112623          	sw	ra,12(sp)
f90012c4:	00812423          	sw	s0,8(sp)
    exp_pid.set_point = exp_setpoint;
f90012c8:	218030ef          	jal	f90044e0 <__floatunsisf>
f90012cc:	86018413          	addi	s0,gp,-1952 # f9004f40 <exp_pid>
f90012d0:	00a42623          	sw	a0,12(s0)
}
f90012d4:	00c12083          	lw	ra,12(sp)
f90012d8:	00812403          	lw	s0,8(sp)
f90012dc:	01010113          	addi	sp,sp,16
f90012e0:	00008067          	ret

f90012e4 <isp_init>:

void isp_init(u32 exp_setpoint) {
f90012e4:	ff010113          	addi	sp,sp,-16
f90012e8:	00112623          	sw	ra,12(sp)
f90012ec:	00812423          	sw	s0,8(sp)
f90012f0:	00912223          	sw	s1,4(sp)
    exp_pid.actual_val=0.0;
f90012f4:	86018413          	addi	s0,gp,-1952 # f9004f40 <exp_pid>
f90012f8:	00000493          	li	s1,0
f90012fc:	00942423          	sw	s1,8(s0)
    exp_pid.set_point=exp_setpoint;
f9001300:	1e0030ef          	jal	f90044e0 <__floatunsisf>
f9001304:	00a42623          	sw	a0,12(s0)
   // exp_pid.incr_limit = 1000.0;
   // exp_pid.output_limit = 4000.0;
    exp_pid.incr_limit = 100.0;
f9001308:	8281a783          	lw	a5,-2008(gp) # f9004f08 <prev_dig_gain.4+0x14>
f900130c:	00f42023          	sw	a5,0(s0)
    exp_pid.output_limit = 480.0;
f9001310:	82c1a783          	lw	a5,-2004(gp) # f9004f0c <prev_dig_gain.4+0x18>
f9001314:	00f42223          	sw	a5,4(s0)
    exp_pid.err_last = 0.0;
f9001318:	00942c23          	sw	s1,24(s0)
    // exp_pid.acc_err = 0.0;
    exp_pid.kp = 0.1;
f900131c:	8301a783          	lw	a5,-2000(gp) # f9004f10 <prev_dig_gain.4+0x1c>
f9001320:	00f42e23          	sw	a5,28(s0)
    exp_pid.ki = 0.11;
f9001324:	8341a783          	lw	a5,-1996(gp) # f9004f14 <prev_dig_gain.4+0x20>
f9001328:	02f42023          	sw	a5,32(s0)
    exp_pid.kd = 0.15;
f900132c:	8381a783          	lw	a5,-1992(gp) # f9004f18 <prev_dig_gain.4+0x24>
f9001330:	02f42223          	sw	a5,36(s0)
}
f9001334:	00c12083          	lw	ra,12(sp)
f9001338:	00812403          	lw	s0,8(sp)
f900133c:	00412483          	lw	s1,4(sp)
f9001340:	01010113          	addi	sp,sp,16
f9001344:	00008067          	ret

f9001348 <uart_writeAvailability>:
f9001348:	00452503          	lw	a0,4(a0)
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
f900134c:	01055513          	srli	a0,a0,0x10
    }
f9001350:	0ff57513          	zext.b	a0,a0
f9001354:	00008067          	ret

f9001358 <uart_readOccupancy>:
f9001358:	00452503          	lw	a0,4(a0)
    }
f900135c:	01855513          	srli	a0,a0,0x18
f9001360:	00008067          	ret

f9001364 <uart_write>:
    static void uart_write(u32 reg, char data){
f9001364:	ff010113          	addi	sp,sp,-16
f9001368:	00112623          	sw	ra,12(sp)
f900136c:	00812423          	sw	s0,8(sp)
f9001370:	00912223          	sw	s1,4(sp)
f9001374:	00050413          	mv	s0,a0
f9001378:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
f900137c:	00040513          	mv	a0,s0
f9001380:	fc9ff0ef          	jal	f9001348 <uart_writeAvailability>
f9001384:	fe050ce3          	beqz	a0,f900137c <uart_write+0x18>
        *((volatile u32*) address) = data;
f9001388:	00942023          	sw	s1,0(s0)
    }
f900138c:	00c12083          	lw	ra,12(sp)
f9001390:	00812403          	lw	s0,8(sp)
f9001394:	00412483          	lw	s1,4(sp)
f9001398:	01010113          	addi	sp,sp,16
f900139c:	00008067          	ret

f90013a0 <uart_read>:
* @note    The function waits until there is data available in the UART buffer
*          for reading. Once data is available, it reads the character data from
*          the UART data register and returns it.
*
******************************************************************************/
    static char uart_read(u32 reg){
f90013a0:	ff010113          	addi	sp,sp,-16
f90013a4:	00112623          	sw	ra,12(sp)
f90013a8:	00812423          	sw	s0,8(sp)
f90013ac:	00050413          	mv	s0,a0
        while(uart_readOccupancy(reg) == 0);
f90013b0:	00040513          	mv	a0,s0
f90013b4:	fa5ff0ef          	jal	f9001358 <uart_readOccupancy>
f90013b8:	fe050ce3          	beqz	a0,f90013b0 <uart_read+0x10>
        return *((volatile u32*) address);
f90013bc:	00042503          	lw	a0,0(s0)
        return read_u32(reg + UART_DATA);
    }
f90013c0:	0ff57513          	zext.b	a0,a0
f90013c4:	00c12083          	lw	ra,12(sp)
f90013c8:	00812403          	lw	s0,8(sp)
f90013cc:	01010113          	addi	sp,sp,16
f90013d0:	00008067          	ret

f90013d4 <uart_applyConfig>:
*          value using data length, parity, and stop bit settings from the configuration
*          structure, and writes this value to the UART frame configuration register.
*
******************************************************************************/
    static void uart_applyConfig(u32 reg, Uart_Config *config){
        write_u32(config->clockDivider, reg + UART_CLOCK_DIVIDER);
f90013d4:	00c5a783          	lw	a5,12(a1)
        *((volatile u32*) address) = data;
f90013d8:	00f52423          	sw	a5,8(a0)
        write_u32(((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16), reg + UART_FRAME_CONFIG);
f90013dc:	0005a783          	lw	a5,0(a1)
f90013e0:	fff78793          	addi	a5,a5,-1
f90013e4:	0045a703          	lw	a4,4(a1)
f90013e8:	00871713          	slli	a4,a4,0x8
f90013ec:	00e7e7b3          	or	a5,a5,a4
f90013f0:	0085a703          	lw	a4,8(a1)
f90013f4:	01071713          	slli	a4,a4,0x10
f90013f8:	00e7e7b3          	or	a5,a5,a4
f90013fc:	00f52623          	sw	a5,12(a0)
    }
f9001400:	00008067          	ret

f9001404 <clint_uDelay>:
        u32 mTimePerUsec = hz/1000000;
f9001404:	000f47b7          	lui	a5,0xf4
f9001408:	24078793          	addi	a5,a5,576 # f4240 <__stack_size+0xf3240>
f900140c:	02f5d5b3          	divu	a1,a1,a5
    readReg_u32 (clint_getTimeLow , CLINT_TIME_ADDR)
f9001410:	0000c7b7          	lui	a5,0xc
f9001414:	ff878793          	addi	a5,a5,-8 # bff8 <__stack_size+0xaff8>
f9001418:	00f60633          	add	a2,a2,a5
        return *((volatile u32*) address);
f900141c:	00062783          	lw	a5,0(a2) # f8b00000 <__stack_size+0xf8aff000>
        u32 limit = clint_getTimeLow(reg) + usec*mTimePerUsec;
f9001420:	02a585b3          	mul	a1,a1,a0
f9001424:	00f58733          	add	a4,a1,a5
f9001428:	00062783          	lw	a5,0(a2)
        while((int32_t)(limit-(clint_getTimeLow(reg))) >= 0);
f900142c:	40f707b3          	sub	a5,a4,a5
f9001430:	fe07dce3          	bgez	a5,f9001428 <clint_uDelay+0x24>
f9001434:	00008067          	ret

f9001438 <_putchar>:
    static void _putchar(char character){
f9001438:	ff010113          	addi	sp,sp,-16
f900143c:	00112623          	sw	ra,12(sp)
f9001440:	00050593          	mv	a1,a0
            bsp_putChar(character);
f9001444:	f8010537          	lui	a0,0xf8010
f9001448:	f1dff0ef          	jal	f9001364 <uart_write>
    }
f900144c:	00c12083          	lw	ra,12(sp)
f9001450:	01010113          	addi	sp,sp,16
f9001454:	00008067          	ret

f9001458 <_putchar_s>:
    {
f9001458:	ff010113          	addi	sp,sp,-16
f900145c:	00112623          	sw	ra,12(sp)
f9001460:	00812423          	sw	s0,8(sp)
f9001464:	00050413          	mv	s0,a0
        while (*p)
f9001468:	00c0006f          	j	f9001474 <_putchar_s+0x1c>
            _putchar(*(p++));
f900146c:	00140413          	addi	s0,s0,1
f9001470:	fc9ff0ef          	jal	f9001438 <_putchar>
        while (*p)
f9001474:	00044503          	lbu	a0,0(s0)
f9001478:	fe051ae3          	bnez	a0,f900146c <_putchar_s+0x14>
    }
f900147c:	00c12083          	lw	ra,12(sp)
f9001480:	00812403          	lw	s0,8(sp)
f9001484:	01010113          	addi	sp,sp,16
f9001488:	00008067          	ret

f900148c <bsp_printHex>:
    {
f900148c:	ff010113          	addi	sp,sp,-16
f9001490:	00112623          	sw	ra,12(sp)
f9001494:	00812423          	sw	s0,8(sp)
f9001498:	00912223          	sw	s1,4(sp)
f900149c:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f90014a0:	01c00413          	li	s0,28
f90014a4:	0240006f          	j	f90014c8 <bsp_printHex+0x3c>
            _putchar("0123456789ABCDEF"[(val >> i) % 16]);
f90014a8:	0084d733          	srl	a4,s1,s0
f90014ac:	00f77713          	andi	a4,a4,15
f90014b0:	f90047b7          	lui	a5,0xf9004
f90014b4:	68078793          	addi	a5,a5,1664 # f9004680 <_data>
f90014b8:	00e787b3          	add	a5,a5,a4
f90014bc:	0007c503          	lbu	a0,0(a5)
f90014c0:	f79ff0ef          	jal	f9001438 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f90014c4:	ffc40413          	addi	s0,s0,-4
f90014c8:	fe0450e3          	bgez	s0,f90014a8 <bsp_printHex+0x1c>
    }
f90014cc:	00c12083          	lw	ra,12(sp)
f90014d0:	00812403          	lw	s0,8(sp)
f90014d4:	00412483          	lw	s1,4(sp)
f90014d8:	01010113          	addi	sp,sp,16
f90014dc:	00008067          	ret

f90014e0 <bsp_printHex_lower>:
    {
f90014e0:	ff010113          	addi	sp,sp,-16
f90014e4:	00112623          	sw	ra,12(sp)
f90014e8:	00812423          	sw	s0,8(sp)
f90014ec:	00912223          	sw	s1,4(sp)
f90014f0:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f90014f4:	01c00413          	li	s0,28
f90014f8:	0240006f          	j	f900151c <bsp_printHex_lower+0x3c>
            _putchar("0123456789abcdef"[(val >> i) % 16]);
f90014fc:	0084d733          	srl	a4,s1,s0
f9001500:	00f77713          	andi	a4,a4,15
f9001504:	f90047b7          	lui	a5,0xf9004
f9001508:	69478793          	addi	a5,a5,1684 # f9004694 <_data+0x14>
f900150c:	00e787b3          	add	a5,a5,a4
f9001510:	0007c503          	lbu	a0,0(a5)
f9001514:	f25ff0ef          	jal	f9001438 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9001518:	ffc40413          	addi	s0,s0,-4
f900151c:	fe0450e3          	bgez	s0,f90014fc <bsp_printHex_lower+0x1c>
    }
f9001520:	00c12083          	lw	ra,12(sp)
f9001524:	00812403          	lw	s0,8(sp)
f9001528:	00412483          	lw	s1,4(sp)
f900152c:	01010113          	addi	sp,sp,16
f9001530:	00008067          	ret

f9001534 <bsp_printf_c>:
    {
f9001534:	ff010113          	addi	sp,sp,-16
f9001538:	00112623          	sw	ra,12(sp)
        _putchar(c);
f900153c:	0ff57513          	zext.b	a0,a0
f9001540:	ef9ff0ef          	jal	f9001438 <_putchar>
    }
f9001544:	00c12083          	lw	ra,12(sp)
f9001548:	01010113          	addi	sp,sp,16
f900154c:	00008067          	ret

f9001550 <bsp_printf_s>:
    {
f9001550:	ff010113          	addi	sp,sp,-16
f9001554:	00112623          	sw	ra,12(sp)
        _putchar_s(p);
f9001558:	f01ff0ef          	jal	f9001458 <_putchar_s>
    }
f900155c:	00c12083          	lw	ra,12(sp)
f9001560:	01010113          	addi	sp,sp,16
f9001564:	00008067          	ret

f9001568 <bsp_printf_d>:
    {
f9001568:	fd010113          	addi	sp,sp,-48
f900156c:	02112623          	sw	ra,44(sp)
f9001570:	02812423          	sw	s0,40(sp)
f9001574:	02912223          	sw	s1,36(sp)
f9001578:	00050493          	mv	s1,a0
        if (val < 0) {
f900157c:	00054663          	bltz	a0,f9001588 <bsp_printf_d+0x20>
    {
f9001580:	00010413          	mv	s0,sp
f9001584:	02c0006f          	j	f90015b0 <bsp_printf_d+0x48>
            bsp_printf_c('-');
f9001588:	02d00513          	li	a0,45
f900158c:	fa9ff0ef          	jal	f9001534 <bsp_printf_c>
            val = -val;
f9001590:	409004b3          	neg	s1,s1
f9001594:	fedff06f          	j	f9001580 <bsp_printf_d+0x18>
            *(p++) = '0' + val % 10;
f9001598:	00a00713          	li	a4,10
f900159c:	02e4e7b3          	rem	a5,s1,a4
f90015a0:	03078793          	addi	a5,a5,48
f90015a4:	00f40023          	sb	a5,0(s0)
            val = val / 10;
f90015a8:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
f90015ac:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
f90015b0:	fe0494e3          	bnez	s1,f9001598 <bsp_printf_d+0x30>
f90015b4:	00010793          	mv	a5,sp
f90015b8:	fef400e3          	beq	s0,a5,f9001598 <bsp_printf_d+0x30>
        while (p != buffer)
f90015bc:	00010793          	mv	a5,sp
f90015c0:	00f40a63          	beq	s0,a5,f90015d4 <bsp_printf_d+0x6c>
            bsp_printf_c(*(--p));
f90015c4:	fff40413          	addi	s0,s0,-1
f90015c8:	00044503          	lbu	a0,0(s0)
f90015cc:	f69ff0ef          	jal	f9001534 <bsp_printf_c>
f90015d0:	fedff06f          	j	f90015bc <bsp_printf_d+0x54>
    }
f90015d4:	02c12083          	lw	ra,44(sp)
f90015d8:	02812403          	lw	s0,40(sp)
f90015dc:	02412483          	lw	s1,36(sp)
f90015e0:	03010113          	addi	sp,sp,48
f90015e4:	00008067          	ret

f90015e8 <bsp_printf_x>:
    {
f90015e8:	ff010113          	addi	sp,sp,-16
f90015ec:	00112623          	sw	ra,12(sp)
        for(i=0;i<8;i++)
f90015f0:	00000713          	li	a4,0
f90015f4:	00700793          	li	a5,7
f90015f8:	02e7c063          	blt	a5,a4,f9001618 <bsp_printf_x+0x30>
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f90015fc:	00271693          	slli	a3,a4,0x2
f9001600:	ff000793          	li	a5,-16
f9001604:	00d797b3          	sll	a5,a5,a3
f9001608:	00f577b3          	and	a5,a0,a5
f900160c:	00078663          	beqz	a5,f9001618 <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
f9001610:	00170713          	addi	a4,a4,1
f9001614:	fe1ff06f          	j	f90015f4 <bsp_printf_x+0xc>
        bsp_printHex_lower(val);
f9001618:	ec9ff0ef          	jal	f90014e0 <bsp_printHex_lower>
    }
f900161c:	00c12083          	lw	ra,12(sp)
f9001620:	01010113          	addi	sp,sp,16
f9001624:	00008067          	ret

f9001628 <bsp_printf_X>:
        {
f9001628:	ff010113          	addi	sp,sp,-16
f900162c:	00112623          	sw	ra,12(sp)
            for(i=0;i<8;i++)
f9001630:	00000713          	li	a4,0
f9001634:	00700793          	li	a5,7
f9001638:	02e7c063          	blt	a5,a4,f9001658 <bsp_printf_X+0x30>
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f900163c:	00271693          	slli	a3,a4,0x2
f9001640:	ff000793          	li	a5,-16
f9001644:	00d797b3          	sll	a5,a5,a3
f9001648:	00f577b3          	and	a5,a0,a5
f900164c:	00078663          	beqz	a5,f9001658 <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
f9001650:	00170713          	addi	a4,a4,1
f9001654:	fe1ff06f          	j	f9001634 <bsp_printf_X+0xc>
            bsp_printHex(val);
f9001658:	e35ff0ef          	jal	f900148c <bsp_printHex>
        }
f900165c:	00c12083          	lw	ra,12(sp)
f9001660:	01010113          	addi	sp,sp,16
f9001664:	00008067          	ret

f9001668 <bsp_init>:
    *   1. UART baudrate
    *   2. 
    */
////////////////////////////////////////////////////////////////////////////////
    static void bsp_init()
    {
f9001668:	fe010113          	addi	sp,sp,-32
f900166c:	00112e23          	sw	ra,28(sp)
        Uart_Config uartConfig;
        uartConfig.dataLength   = BITS_8;
f9001670:	00800793          	li	a5,8
f9001674:	00f12023          	sw	a5,0(sp)
        uartConfig.parity       = NONE;
f9001678:	00012223          	sw	zero,4(sp)
        uartConfig.stop         = ONE;
f900167c:	00012423          	sw	zero,8(sp)
        uartConfig.clockDivider = BSP_CLINT_HZ/(BSP_UART_BAUDRATE*BSP_UART_DATA_LEN)-1;
f9001680:	06b00793          	li	a5,107
f9001684:	00f12623          	sw	a5,12(sp)
        uart_applyConfig(BSP_UART_TERMINAL, &uartConfig);    
f9001688:	00010593          	mv	a1,sp
f900168c:	f8010537          	lui	a0,0xf8010
f9001690:	d45ff0ef          	jal	f90013d4 <uart_applyConfig>
    }
f9001694:	01c12083          	lw	ra,28(sp)
f9001698:	02010113          	addi	sp,sp,32
f900169c:	00008067          	ret

f90016a0 <plic_set_priority>:
*          specified priority value to the calculated address, effectively
*          setting the priority for the specified interrupt gateway in the PLIC.
*
******************************************************************************/
    static void plic_set_priority(u32 plic, u32 gateway, u32 priority){
        write_u32(priority, plic + PLIC_PRIORITY_BASE + gateway*4);
f90016a0:	00259593          	slli	a1,a1,0x2
f90016a4:	00a585b3          	add	a1,a1,a0
        *((volatile u32*) address) = data;
f90016a8:	00c5a023          	sw	a2,0(a1)
    }
f90016ac:	00008067          	ret

f90016b0 <plic_set_enable>:
*          to the enable register.
*
******************************************************************************/

    static void plic_set_enable(u32 plic, u32 target,u32 gateway, u32 enable){
        u32 word = plic + PLIC_ENABLE_BASE + target * PLIC_ENABLE_PER_HART + (gateway / 32 * 4);
f90016b0:	00759593          	slli	a1,a1,0x7
f90016b4:	00a585b3          	add	a1,a1,a0
f90016b8:	00565793          	srli	a5,a2,0x5
f90016bc:	00279793          	slli	a5,a5,0x2
f90016c0:	00f587b3          	add	a5,a1,a5
f90016c4:	00002737          	lui	a4,0x2
f90016c8:	00e787b3          	add	a5,a5,a4
        u32 mask = 1 << (gateway % 32);
f90016cc:	00100713          	li	a4,1
f90016d0:	00c71633          	sll	a2,a4,a2
        if (enable)
f90016d4:	00068a63          	beqz	a3,f90016e8 <plic_set_enable+0x38>
        return *((volatile u32*) address);
f90016d8:	0007a703          	lw	a4,0(a5)
            write_u32(read_u32(word) | mask, word);
f90016dc:	00e66633          	or	a2,a2,a4
        *((volatile u32*) address) = data;
f90016e0:	00c7a023          	sw	a2,0(a5)
    }
f90016e4:	00008067          	ret
        return *((volatile u32*) address);
f90016e8:	0007a703          	lw	a4,0(a5)
        else
            write_u32(read_u32(word) & ~mask, word);
f90016ec:	fff64613          	not	a2,a2
f90016f0:	00e67633          	and	a2,a2,a4
        *((volatile u32*) address) = data;
f90016f4:	00c7a023          	sw	a2,0(a5)
    }
f90016f8:	00008067          	ret

f90016fc <plic_set_threshold>:
*          to the calculated address, effectively setting the threshold for the
*          specified target in the PLIC.
*
******************************************************************************/   
    static void plic_set_threshold(u32 plic, u32 target, u32 threshold){
        write_u32(threshold, plic + PLIC_THRESHOLD_BASE + target*PLIC_CONTEXT_PER_HART);
f90016fc:	00c59593          	slli	a1,a1,0xc
f9001700:	00a585b3          	add	a1,a1,a0
f9001704:	002007b7          	lui	a5,0x200
f9001708:	00f585b3          	add	a1,a1,a5
f900170c:	00c5a023          	sw	a2,0(a1)
    }
f9001710:	00008067          	ret

f9001714 <plic_claim>:
*          value from the calculated address, effectively claiming an interrupt
*          for the specified target in the PLIC.
*
******************************************************************************/
    static u32 plic_claim(u32 plic, u32 target){
        return read_u32(plic + PLIC_CLAIM_BASE + target*PLIC_CONTEXT_PER_HART);
f9001714:	00c59593          	slli	a1,a1,0xc
f9001718:	00a585b3          	add	a1,a1,a0
f900171c:	002007b7          	lui	a5,0x200
f9001720:	00478793          	addi	a5,a5,4 # 200004 <__stack_size+0x1ff004>
f9001724:	00f585b3          	add	a1,a1,a5
        return *((volatile u32*) address);
f9001728:	0005a503          	lw	a0,0(a1)
    }
f900172c:	00008067          	ret

f9001730 <plic_release>:
*          to the calculated address, effectively releasing the claimed interrupt
*          for the specified target in the PLIC.
*
******************************************************************************/
    static void plic_release(u32 plic, u32 target, u32 gateway){
        write_u32(gateway,plic + PLIC_CLAIM_BASE + target*PLIC_CONTEXT_PER_HART);
f9001730:	00c59593          	slli	a1,a1,0xc
f9001734:	00a585b3          	add	a1,a1,a0
f9001738:	002007b7          	lui	a5,0x200
f900173c:	00478793          	addi	a5,a5,4 # 200004 <__stack_size+0x1ff004>
f9001740:	00f585b3          	add	a1,a1,a5
        *((volatile u32*) address) = data;
f9001744:	00c5a023          	sw	a2,0(a1)
    }
f9001748:	00008067          	ret

f900174c <bsp_printf>:
    {
f900174c:	fc010113          	addi	sp,sp,-64
f9001750:	00112e23          	sw	ra,28(sp)
f9001754:	00812c23          	sw	s0,24(sp)
f9001758:	00912a23          	sw	s1,20(sp)
f900175c:	00050493          	mv	s1,a0
f9001760:	02b12223          	sw	a1,36(sp)
f9001764:	02c12423          	sw	a2,40(sp)
f9001768:	02d12623          	sw	a3,44(sp)
f900176c:	02e12823          	sw	a4,48(sp)
f9001770:	02f12a23          	sw	a5,52(sp)
f9001774:	03012c23          	sw	a6,56(sp)
f9001778:	03112e23          	sw	a7,60(sp)
        va_start(ap, format);
f900177c:	02410793          	addi	a5,sp,36
f9001780:	00f12623          	sw	a5,12(sp)
        for (i = 0; format[i]; i++)
f9001784:	00000413          	li	s0,0
f9001788:	01c0006f          	j	f90017a4 <bsp_printf+0x58>
                        bsp_printf_c(va_arg(ap,int));
f900178c:	00c12783          	lw	a5,12(sp)
f9001790:	00478713          	addi	a4,a5,4
f9001794:	00e12623          	sw	a4,12(sp)
f9001798:	0007a503          	lw	a0,0(a5)
f900179c:	d99ff0ef          	jal	f9001534 <bsp_printf_c>
        for (i = 0; format[i]; i++)
f90017a0:	00140413          	addi	s0,s0,1
f90017a4:	008487b3          	add	a5,s1,s0
f90017a8:	0007c503          	lbu	a0,0(a5)
f90017ac:	0a050e63          	beqz	a0,f9001868 <bsp_printf+0x11c>
            if (format[i] == '%') {
f90017b0:	02500793          	li	a5,37
f90017b4:	06f50e63          	beq	a0,a5,f9001830 <bsp_printf+0xe4>
                bsp_printf_c(format[i]);
f90017b8:	d7dff0ef          	jal	f9001534 <bsp_printf_c>
f90017bc:	fe5ff06f          	j	f90017a0 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
f90017c0:	00c12783          	lw	a5,12(sp)
f90017c4:	00478713          	addi	a4,a5,4
f90017c8:	00e12623          	sw	a4,12(sp)
f90017cc:	0007a503          	lw	a0,0(a5)
f90017d0:	d81ff0ef          	jal	f9001550 <bsp_printf_s>
                        break;
f90017d4:	fcdff06f          	j	f90017a0 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
f90017d8:	00c12783          	lw	a5,12(sp)
f90017dc:	00478713          	addi	a4,a5,4
f90017e0:	00e12623          	sw	a4,12(sp)
f90017e4:	0007a503          	lw	a0,0(a5)
f90017e8:	d81ff0ef          	jal	f9001568 <bsp_printf_d>
                        break;
f90017ec:	fb5ff06f          	j	f90017a0 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
f90017f0:	00c12783          	lw	a5,12(sp)
f90017f4:	00478713          	addi	a4,a5,4
f90017f8:	00e12623          	sw	a4,12(sp)
f90017fc:	0007a503          	lw	a0,0(a5)
f9001800:	e29ff0ef          	jal	f9001628 <bsp_printf_X>
                        break;
f9001804:	f9dff06f          	j	f90017a0 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
f9001808:	00c12783          	lw	a5,12(sp)
f900180c:	00478713          	addi	a4,a5,4
f9001810:	00e12623          	sw	a4,12(sp)
f9001814:	0007a503          	lw	a0,0(a5)
f9001818:	dd1ff0ef          	jal	f90015e8 <bsp_printf_x>
                        break;
f900181c:	f85ff06f          	j	f90017a0 <bsp_printf+0x54>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
f9001820:	f9004537          	lui	a0,0xf9004
f9001824:	6a850513          	addi	a0,a0,1704 # f90046a8 <_data+0x28>
f9001828:	d29ff0ef          	jal	f9001550 <bsp_printf_s>
                        break;
f900182c:	f75ff06f          	j	f90017a0 <bsp_printf+0x54>
                while (format[++i]) {
f9001830:	00140413          	addi	s0,s0,1
f9001834:	008487b3          	add	a5,s1,s0
f9001838:	0007c783          	lbu	a5,0(a5)
f900183c:	f60782e3          	beqz	a5,f90017a0 <bsp_printf+0x54>
                    if (format[i] == 'c') {
f9001840:	fa878793          	addi	a5,a5,-88
f9001844:	0ff7f693          	zext.b	a3,a5
f9001848:	02000713          	li	a4,32
f900184c:	fed762e3          	bltu	a4,a3,f9001830 <bsp_printf+0xe4>
f9001850:	00269793          	slli	a5,a3,0x2
f9001854:	f9005737          	lui	a4,0xf9005
f9001858:	ca870713          	addi	a4,a4,-856 # f9004ca8 <module_common_regs+0x14>
f900185c:	00e787b3          	add	a5,a5,a4
f9001860:	0007a783          	lw	a5,0(a5)
f9001864:	00078067          	jr	a5
    }
f9001868:	01c12083          	lw	ra,28(sp)
f900186c:	01812403          	lw	s0,24(sp)
f9001870:	01412483          	lw	s1,20(sp)
f9001874:	04010113          	addi	sp,sp,64
f9001878:	00008067          	ret

f900187c <crash>:
void crash(char* causeType, u32 cause){
f900187c:	ff010113          	addi	sp,sp,-16
f9001880:	00112623          	sw	ra,12(sp)
f9001884:	00058613          	mv	a2,a1
    bsp_printf("\r\n*** CRASH due to %s: %d***\r\n", causeType, cause);
f9001888:	00050593          	mv	a1,a0
f900188c:	f9004537          	lui	a0,0xf9004
f9001890:	7f850513          	addi	a0,a0,2040 # f90047f8 <_data+0x178>
f9001894:	eb9ff0ef          	jal	f900174c <bsp_printf>
    while(1);
f9001898:	0000006f          	j	f9001898 <crash+0x1c>

f900189c <poll_host_settings>:
void poll_host_settings() {
f900189c:	ff010113          	addi	sp,sp,-16
f90018a0:	00112623          	sw	ra,12(sp)
f90018a4:	00812423          	sw	s0,8(sp)
f90018a8:	00912223          	sw	s1,4(sp)
f90018ac:	01212023          	sw	s2,0(sp)
    u32 e_tmp = read_apb_reg(REG_OVERRIDE_EXPOSURE);
f90018b0:	06400513          	li	a0,100
f90018b4:	c99fe0ef          	jal	f900054c <read_apb_reg>
f90018b8:	00050913          	mv	s2,a0
    u32 r_tmp = read_apb_reg(REG_OVERRIDE_GAIN_R);
f90018bc:	06800513          	li	a0,104
f90018c0:	c8dfe0ef          	jal	f900054c <read_apb_reg>
f90018c4:	00050413          	mv	s0,a0
    u32 g_tmp = read_apb_reg(REG_OVERRIDE_GAIN_G);
f90018c8:	06c00513          	li	a0,108
f90018cc:	c81fe0ef          	jal	f900054c <read_apb_reg>
f90018d0:	00050493          	mv	s1,a0
    u32 b_tmp = read_apb_reg(REG_OVERRIDE_GAIN_B);
f90018d4:	07000513          	li	a0,112
f90018d8:	c75fe0ef          	jal	f900054c <read_apb_reg>
    if (e_tmp != e_raw || r_tmp != r_raw || g_tmp != g_raw || b_tmp != b_raw) {
f90018dc:	85c1a783          	lw	a5,-1956(gp) # f9004f3c <e_raw.8>
f90018e0:	01279663          	bne	a5,s2,f90018ec <poll_host_settings+0x50>
f90018e4:	8581a783          	lw	a5,-1960(gp) # f9004f38 <r_raw.7>
f90018e8:	08878c63          	beq	a5,s0,f9001980 <poll_host_settings+0xe4>
        e_raw = e_tmp;
f90018ec:	8521ae23          	sw	s2,-1956(gp) # f9004f3c <e_raw.8>
        r_raw = r_tmp;
f90018f0:	8481ac23          	sw	s0,-1960(gp) # f9004f38 <r_raw.7>
        g_raw = g_tmp;
f90018f4:	8491aa23          	sw	s1,-1964(gp) # f9004f34 <g_raw.6>
        b_raw = b_tmp;
f90018f8:	84a1a823          	sw	a0,-1968(gp) # f9004f30 <b_raw.5>
        s32 r = 420 + ((s32)r_raw - 128);
f90018fc:	12440413          	addi	s0,s0,292
        s32 g = 256 + ((s32)g_raw - 128);
f9001900:	08048493          	addi	s1,s1,128
        s32 b = 600 + ((s32)b_raw - 128)*1.5;
f9001904:	f8050513          	addi	a0,a0,-128
f9001908:	351010ef          	jal	f9003458 <__floatsidf>
f900190c:	8181a603          	lw	a2,-2024(gp) # f9004ef8 <prev_dig_gain.4+0x4>
f9001910:	81c1a683          	lw	a3,-2020(gp) # f9004efc <prev_dig_gain.4+0x8>
f9001914:	3e8010ef          	jal	f9002cfc <__muldf3>
f9001918:	8201a603          	lw	a2,-2016(gp) # f9004f00 <prev_dig_gain.4+0xc>
f900191c:	8241a683          	lw	a3,-2012(gp) # f9004f04 <prev_dig_gain.4+0x10>
f9001920:	315000ef          	jal	f9002434 <__adddf3>
f9001924:	2b1010ef          	jal	f90033d4 <__fixdfsi>
f9001928:	00050613          	mv	a2,a0
        r = r > 0 ? r : 0;
f900192c:	00040513          	mv	a0,s0
f9001930:	06044263          	bltz	s0,f9001994 <poll_host_settings+0xf8>
        g = g > 0 ? g : 0;
f9001934:	00048593          	mv	a1,s1
f9001938:	0604c263          	bltz	s1,f900199c <poll_host_settings+0x100>
        b = b > 0 ? b : 0;
f900193c:	06064463          	bltz	a2,f90019a4 <poll_host_settings+0x108>
        isp_set_color_balance(r, g, b);
f9001940:	925ff0ef          	jal	f9001264 <isp_set_color_balance>
        isp_set_setpoint(e);
f9001944:	00090513          	mv	a0,s2
f9001948:	975ff0ef          	jal	f90012bc <isp_set_setpoint>
        bsp_printf("target exposure value: %d, red gain: %d, green gain: %d, blue gain: %d\r\n", e_raw, r_raw, g_raw, b_raw);
f900194c:	8501a703          	lw	a4,-1968(gp) # f9004f30 <b_raw.5>
f9001950:	8541a683          	lw	a3,-1964(gp) # f9004f34 <g_raw.6>
f9001954:	8581a603          	lw	a2,-1960(gp) # f9004f38 <r_raw.7>
f9001958:	85c1a583          	lw	a1,-1956(gp) # f9004f3c <e_raw.8>
f900195c:	f9005537          	lui	a0,0xf9005
f9001960:	81850513          	addi	a0,a0,-2024 # f9004818 <_data+0x198>
f9001964:	de9ff0ef          	jal	f900174c <bsp_printf>
}
f9001968:	00c12083          	lw	ra,12(sp)
f900196c:	00812403          	lw	s0,8(sp)
f9001970:	00412483          	lw	s1,4(sp)
f9001974:	00012903          	lw	s2,0(sp)
f9001978:	01010113          	addi	sp,sp,16
f900197c:	00008067          	ret
    if (e_tmp != e_raw || r_tmp != r_raw || g_tmp != g_raw || b_tmp != b_raw) {
f9001980:	8541a783          	lw	a5,-1964(gp) # f9004f34 <g_raw.6>
f9001984:	f69794e3          	bne	a5,s1,f90018ec <poll_host_settings+0x50>
f9001988:	8501a783          	lw	a5,-1968(gp) # f9004f30 <b_raw.5>
f900198c:	f6a790e3          	bne	a5,a0,f90018ec <poll_host_settings+0x50>
f9001990:	fd9ff06f          	j	f9001968 <poll_host_settings+0xcc>
        r = r > 0 ? r : 0;
f9001994:	00000513          	li	a0,0
f9001998:	f9dff06f          	j	f9001934 <poll_host_settings+0x98>
        g = g > 0 ? g : 0;
f900199c:	00000593          	li	a1,0
f90019a0:	f9dff06f          	j	f900193c <poll_host_settings+0xa0>
        b = b > 0 ? b : 0;
f90019a4:	00000613          	li	a2,0
f90019a8:	f99ff06f          	j	f9001940 <poll_host_settings+0xa4>

f90019ac <timer_handler>:
void timer_handler() {
f90019ac:	ff010113          	addi	sp,sp,-16
f90019b0:	00112623          	sw	ra,12(sp)
f90019b4:	00812423          	sw	s0,8(sp)
    u32 new_gain = isp_update_gain(prev_dig_gain);
f90019b8:	8141d503          	lhu	a0,-2028(gp) # f9004ef4 <prev_dig_gain.4>
f90019bc:	8ddff0ef          	jal	f9001298 <isp_update_gain>
f90019c0:	00050413          	mv	s0,a0
    u32 exp_avg = isp_get_expose_avg();
f90019c4:	8bdff0ef          	jal	f9001280 <isp_get_expose_avg>
f90019c8:	00050593          	mv	a1,a0
    ++count;
f90019cc:	84c1a783          	lw	a5,-1972(gp) # f9004f2c <count.3>
f90019d0:	00178793          	addi	a5,a5,1
f90019d4:	84f1a623          	sw	a5,-1972(gp) # f9004f2c <count.3>
    if (count >= 10 || abs(prev_dig_gain - new_gain) > 10) {
f90019d8:	00900713          	li	a4,9
f90019dc:	02f76063          	bltu	a4,a5,f90019fc <timer_handler+0x50>
f90019e0:	8141d783          	lhu	a5,-2028(gp) # f9004ef4 <prev_dig_gain.4>
f90019e4:	408787b3          	sub	a5,a5,s0
f90019e8:	41f7d713          	srai	a4,a5,0x1f
f90019ec:	00f747b3          	xor	a5,a4,a5
f90019f0:	40e787b3          	sub	a5,a5,a4
f90019f4:	00a00713          	li	a4,10
f90019f8:	00f75e63          	bge	a4,a5,f9001a14 <timer_handler+0x68>
        bsp_printf("global average: %d, gain: %d, new gain: %d\r\n", exp_avg, prev_dig_gain, new_gain);
f90019fc:	00040693          	mv	a3,s0
f9001a00:	8141d603          	lhu	a2,-2028(gp) # f9004ef4 <prev_dig_gain.4>
f9001a04:	f9005537          	lui	a0,0xf9005
f9001a08:	86450513          	addi	a0,a0,-1948 # f9004864 <_data+0x1e4>
f9001a0c:	d41ff0ef          	jal	f900174c <bsp_printf>
        count = 0;
f9001a10:	8401a623          	sw	zero,-1972(gp) # f9004f2c <count.3>
    Gainfilter(ana_gain, new_gain);
f9001a14:	01041413          	slli	s0,s0,0x10
f9001a18:	01045413          	srli	s0,s0,0x10
f9001a1c:	00040593          	mv	a1,s0
f9001a20:	21c00513          	li	a0,540
f9001a24:	e84ff0ef          	jal	f90010a8 <Gainfilter>
    prev_dig_gain = new_gain;
f9001a28:	80819a23          	sh	s0,-2028(gp) # f9004ef4 <prev_dig_gain.4>
    poll_host_settings();
f9001a2c:	e71ff0ef          	jal	f900189c <poll_host_settings>
}
f9001a30:	00c12083          	lw	ra,12(sp)
f9001a34:	00812403          	lw	s0,8(sp)
f9001a38:	01010113          	addi	sp,sp,16
f9001a3c:	00008067          	ret

f9001a40 <externalInterrupt>:
void externalInterrupt() {
f9001a40:	ff010113          	addi	sp,sp,-16
f9001a44:	00112623          	sw	ra,12(sp)
f9001a48:	00812423          	sw	s0,8(sp)
    while(claim = plic_claim(BSP_PLIC, BSP_PLIC_CPU_0)){
f9001a4c:	00000593          	li	a1,0
f9001a50:	f8c00537          	lui	a0,0xf8c00
f9001a54:	cc1ff0ef          	jal	f9001714 <plic_claim>
f9001a58:	00050413          	mv	s0,a0
f9001a5c:	02050a63          	beqz	a0,f9001a90 <externalInterrupt+0x50>
        switch(claim){
f9001a60:	01300793          	li	a5,19
f9001a64:	00f41e63          	bne	s0,a5,f9001a80 <externalInterrupt+0x40>
        case USER_TIMER_0: timer_handler(); break;
f9001a68:	f45ff0ef          	jal	f90019ac <timer_handler>
        plic_release(BSP_PLIC, BSP_PLIC_CPU_0, claim); 
f9001a6c:	00040613          	mv	a2,s0
f9001a70:	00000593          	li	a1,0
f9001a74:	f8c00537          	lui	a0,0xf8c00
f9001a78:	cb9ff0ef          	jal	f9001730 <plic_release>
f9001a7c:	fd1ff06f          	j	f9001a4c <externalInterrupt+0xc>
        default: crash("claim", claim); break;
f9001a80:	00040593          	mv	a1,s0
f9001a84:	f9005537          	lui	a0,0xf9005
f9001a88:	89450513          	addi	a0,a0,-1900 # f9004894 <_data+0x214>
f9001a8c:	df1ff0ef          	jal	f900187c <crash>
}
f9001a90:	00c12083          	lw	ra,12(sp)
f9001a94:	00812403          	lw	s0,8(sp)
f9001a98:	01010113          	addi	sp,sp,16
f9001a9c:	00008067          	ret

f9001aa0 <trap>:
void trap(){
f9001aa0:	ff010113          	addi	sp,sp,-16
f9001aa4:	00112623          	sw	ra,12(sp)
    int32_t mcause = csr_read(mcause);
f9001aa8:	342027f3          	csrr	a5,mcause
    int32_t cause     = mcause & 0xF;
f9001aac:	00f7f593          	andi	a1,a5,15
    if(interrupt){
f9001ab0:	0207d463          	bgez	a5,f9001ad8 <trap+0x38>
        switch(cause){
f9001ab4:	00b00793          	li	a5,11
f9001ab8:	00f59a63          	bne	a1,a5,f9001acc <trap+0x2c>
        case CAUSE_MACHINE_EXTERNAL: externalInterrupt(); break;
f9001abc:	f85ff0ef          	jal	f9001a40 <externalInterrupt>
}
f9001ac0:	00c12083          	lw	ra,12(sp)
f9001ac4:	01010113          	addi	sp,sp,16
f9001ac8:	00008067          	ret
        default: crash("cause", cause); break;
f9001acc:	f9005537          	lui	a0,0xf9005
f9001ad0:	89c50513          	addi	a0,a0,-1892 # f900489c <_data+0x21c>
f9001ad4:	da9ff0ef          	jal	f900187c <crash>
        crash("cause", cause);
f9001ad8:	f9005537          	lui	a0,0xf9005
f9001adc:	89c50513          	addi	a0,a0,-1892 # f900489c <_data+0x21c>
f9001ae0:	d9dff0ef          	jal	f900187c <crash>

f9001ae4 <interrupt_set>:
void interrupt_set(u32 gateway, u32 enable) {
f9001ae4:	ff010113          	addi	sp,sp,-16
f9001ae8:	00112623          	sw	ra,12(sp)
f9001aec:	00050613          	mv	a2,a0
f9001af0:	00058693          	mv	a3,a1
    plic_set_enable(BSP_PLIC, BSP_PLIC_CPU_0, gateway, enable);
f9001af4:	00000593          	li	a1,0
f9001af8:	f8c00537          	lui	a0,0xf8c00
f9001afc:	bb5ff0ef          	jal	f90016b0 <plic_set_enable>
}
f9001b00:	00c12083          	lw	ra,12(sp)
f9001b04:	01010113          	addi	sp,sp,16
f9001b08:	00008067          	ret

f9001b0c <interrupt_init>:
void interrupt_init() {
f9001b0c:	ff010113          	addi	sp,sp,-16
f9001b10:	00112623          	sw	ra,12(sp)
    plic_set_threshold(BSP_PLIC, BSP_PLIC_CPU_0, 0); //cpu 0 accept all interrupts with priority above 0
f9001b14:	00000613          	li	a2,0
f9001b18:	00000593          	li	a1,0
f9001b1c:	f8c00537          	lui	a0,0xf8c00
f9001b20:	bddff0ef          	jal	f90016fc <plic_set_threshold>
    plic_set_enable(BSP_PLIC, BSP_PLIC_CPU_0, USER_TIMER_0, 1);
f9001b24:	00100693          	li	a3,1
f9001b28:	01300613          	li	a2,19
f9001b2c:	00000593          	li	a1,0
f9001b30:	f8c00537          	lui	a0,0xf8c00
f9001b34:	b7dff0ef          	jal	f90016b0 <plic_set_enable>
    plic_set_priority(BSP_PLIC, USER_TIMER_0, 2);
f9001b38:	00200613          	li	a2,2
f9001b3c:	01300593          	li	a1,19
f9001b40:	f8c00537          	lui	a0,0xf8c00
f9001b44:	b5dff0ef          	jal	f90016a0 <plic_set_priority>
    bsp_printf("plic initialized\r\n");
f9001b48:	f9005537          	lui	a0,0xf9005
f9001b4c:	8a450513          	addi	a0,a0,-1884 # f90048a4 <_data+0x224>
f9001b50:	bfdff0ef          	jal	f900174c <bsp_printf>
    csr_write(mtvec, trap_entry); 
f9001b54:	f90027b7          	lui	a5,0xf9002
f9001b58:	3a478793          	addi	a5,a5,932 # f90023a4 <trap_entry>
f9001b5c:	30579073          	csrw	mtvec,a5
    csr_set(mie, MIE_MEIE); //Enable external interrupts and core timer
f9001b60:	000017b7          	lui	a5,0x1
f9001b64:	80078793          	addi	a5,a5,-2048 # 800 <CUSTOM2+0x7a5>
f9001b68:	3047a073          	csrs	mie,a5
    csr_write(mstatus, MSTATUS_FS | MSTATUS_MPP | MSTATUS_MIE);
f9001b6c:	000087b7          	lui	a5,0x8
f9001b70:	80878793          	addi	a5,a5,-2040 # 7808 <__stack_size+0x6808>
f9001b74:	30079073          	csrw	mstatus,a5
    bsp_printf("Interrupt initialized\r\n");
f9001b78:	f9005537          	lui	a0,0xf9005
f9001b7c:	8b850513          	addi	a0,a0,-1864 # f90048b8 <_data+0x238>
f9001b80:	bcdff0ef          	jal	f900174c <bsp_printf>
}
f9001b84:	00c12083          	lw	ra,12(sp)
f9001b88:	01010113          	addi	sp,sp,16
f9001b8c:	00008067          	ret

f9001b90 <init>:
void init() {
f9001b90:	ff010113          	addi	sp,sp,-16
f9001b94:	00112623          	sw	ra,12(sp)
    reg_init();
f9001b98:	a51fe0ef          	jal	f90005e8 <reg_init>
    cam_i2c_init();
f9001b9c:	34c000ef          	jal	f9001ee8 <cam_i2c_init>
    interrupt_set(USER_TIMER_0, 0);
f9001ba0:	00000593          	li	a1,0
f9001ba4:	01300513          	li	a0,19
f9001ba8:	f3dff0ef          	jal	f9001ae4 <interrupt_set>
    IMX900_init(CameraRes_1080P);
f9001bac:	00100513          	li	a0,1
f9001bb0:	b94ff0ef          	jal	f9000f44 <IMX900_init>
    interrupt_set(USER_TIMER_0, 1);
f9001bb4:	00100593          	li	a1,1
f9001bb8:	01300513          	li	a0,19
f9001bbc:	f29ff0ef          	jal	f9001ae4 <interrupt_set>
    bsp_printf("Camera initialized\r\n");
f9001bc0:	f9005537          	lui	a0,0xf9005
f9001bc4:	8d050513          	addi	a0,a0,-1840 # f90048d0 <_data+0x250>
f9001bc8:	b85ff0ef          	jal	f900174c <bsp_printf>
    isp_init(0.0);
f9001bcc:	00000513          	li	a0,0
f9001bd0:	f14ff0ef          	jal	f90012e4 <isp_init>
    initTimer(SYSTEM_CLINT_HZ/10);
f9001bd4:	00989537          	lui	a0,0x989
f9001bd8:	68050513          	addi	a0,a0,1664 # 989680 <__stack_size+0x988680>
f9001bdc:	00000593          	li	a1,0
f9001be0:	704000ef          	jal	f90022e4 <initTimer>
    interrupt_init();
f9001be4:	f29ff0ef          	jal	f9001b0c <interrupt_init>
}
f9001be8:	00c12083          	lw	ra,12(sp)
f9001bec:	01010113          	addi	sp,sp,16
f9001bf0:	00008067          	ret

f9001bf4 <print_menu>:
{
f9001bf4:	ff010113          	addi	sp,sp,-16
f9001bf8:	00112623          	sw	ra,12(sp)
f9001bfc:	00812423          	sw	s0,8(sp)
    bsp_printf("---------------------------\r\n");
f9001c00:	f9005537          	lui	a0,0xf9005
f9001c04:	8e850513          	addi	a0,a0,-1816 # f90048e8 <_data+0x268>
f9001c08:	b45ff0ef          	jal	f900174c <bsp_printf>
    bsp_printf("Choose resolution and frame rate:\r\n");
f9001c0c:	f9005537          	lui	a0,0xf9005
f9001c10:	90850513          	addi	a0,a0,-1784 # f9004908 <_data+0x288>
f9001c14:	b39ff0ef          	jal	f900174c <bsp_printf>
    for (int tmp_i = 0; tmp_i < sizeof(videoParams)/sizeof(videoParams[0]); tmp_i++){
f9001c18:	00000413          	li	s0,0
f9001c1c:	0400006f          	j	f9001c5c <print_menu+0x68>
    	bsp_printf("%d: ", tmp_i);
f9001c20:	00040593          	mv	a1,s0
f9001c24:	f9005537          	lui	a0,0xf9005
f9001c28:	92c50513          	addi	a0,a0,-1748 # f900492c <_data+0x2ac>
f9001c2c:	b21ff0ef          	jal	f900174c <bsp_printf>
    	bsp_printf(videoParams[tmp_i].description);
f9001c30:	f90057b7          	lui	a5,0xf9005
f9001c34:	02c00713          	li	a4,44
f9001c38:	02e40733          	mul	a4,s0,a4
f9001c3c:	a6478793          	addi	a5,a5,-1436 # f9004a64 <videoParams>
f9001c40:	00e787b3          	add	a5,a5,a4
f9001c44:	0287a503          	lw	a0,40(a5)
f9001c48:	b05ff0ef          	jal	f900174c <bsp_printf>
    	bsp_printf("\r\n");
f9001c4c:	f9004537          	lui	a0,0xf9004
f9001c50:	72c50513          	addi	a0,a0,1836 # f900472c <_data+0xac>
f9001c54:	af9ff0ef          	jal	f900174c <bsp_printf>
    for (int tmp_i = 0; tmp_i < sizeof(videoParams)/sizeof(videoParams[0]); tmp_i++){
f9001c58:	00140413          	addi	s0,s0,1
f9001c5c:	00500793          	li	a5,5
f9001c60:	fc87f0e3          	bgeu	a5,s0,f9001c20 <print_menu+0x2c>
    bsp_printf("\r\n");
f9001c64:	f9004537          	lui	a0,0xf9004
f9001c68:	72c50513          	addi	a0,a0,1836 # f900472c <_data+0xac>
f9001c6c:	ae1ff0ef          	jal	f900174c <bsp_printf>
    bsp_printf("Choose pixel format:\r\n");
f9001c70:	f9005537          	lui	a0,0xf9005
f9001c74:	93450513          	addi	a0,a0,-1740 # f9004934 <_data+0x2b4>
f9001c78:	ad5ff0ef          	jal	f900174c <bsp_printf>
    for (int tmp_i = 0; tmp_i < sizeof(pixelFormat)/sizeof(pixelFormat[0]); tmp_i++){
f9001c7c:	00000413          	li	s0,0
f9001c80:	00200793          	li	a5,2
f9001c84:	0487e263          	bltu	a5,s0,f9001cc8 <print_menu+0xd4>
    	bsp_printf("%c: ", 'a' + tmp_i);
f9001c88:	06140593          	addi	a1,s0,97
f9001c8c:	f9005537          	lui	a0,0xf9005
f9001c90:	94c50513          	addi	a0,a0,-1716 # f900494c <_data+0x2cc>
f9001c94:	ab9ff0ef          	jal	f900174c <bsp_printf>
    	bsp_printf_s(pixelFormat[tmp_i]);
f9001c98:	00241793          	slli	a5,s0,0x2
f9001c9c:	008787b3          	add	a5,a5,s0
f9001ca0:	00279513          	slli	a0,a5,0x2
f9001ca4:	f90057b7          	lui	a5,0xf9005
f9001ca8:	eb078793          	addi	a5,a5,-336 # f9004eb0 <pixelFormat>
f9001cac:	00a78533          	add	a0,a5,a0
f9001cb0:	8a1ff0ef          	jal	f9001550 <bsp_printf_s>
    	bsp_printf("\r\n");
f9001cb4:	f9004537          	lui	a0,0xf9004
f9001cb8:	72c50513          	addi	a0,a0,1836 # f900472c <_data+0xac>
f9001cbc:	a91ff0ef          	jal	f900174c <bsp_printf>
    for (int tmp_i = 0; tmp_i < sizeof(pixelFormat)/sizeof(pixelFormat[0]); tmp_i++){
f9001cc0:	00140413          	addi	s0,s0,1
f9001cc4:	fbdff06f          	j	f9001c80 <print_menu+0x8c>
}
f9001cc8:	00c12083          	lw	ra,12(sp)
f9001ccc:	00812403          	lw	s0,8(sp)
f9001cd0:	01010113          	addi	sp,sp,16
f9001cd4:	00008067          	ret

f9001cd8 <console_main>:
{
f9001cd8:	fc010113          	addi	sp,sp,-64
f9001cdc:	02112e23          	sw	ra,60(sp)
    input = uart_read(BSP_UART_TERMINAL);
f9001ce0:	f8010537          	lui	a0,0xf8010
f9001ce4:	ebcff0ef          	jal	f90013a0 <uart_read>
f9001ce8:	84a18423          	sb	a0,-1976(gp) # f9004f28 <input.1>
    fun_num = input - '0';
f9001cec:	fd050513          	addi	a0,a0,-48 # f800ffd0 <__stack_size+0xf800efd0>
f9001cf0:	80a1a823          	sw	a0,-2032(gp) # f9004ef0 <fun_num.0>
    if ((fun_num >= 0 && fun_num <= 9) && (fun_num < sizeof(videoParams)/sizeof(videoParams[0]))) {
f9001cf4:	00500793          	li	a5,5
f9001cf8:	02a7f263          	bgeu	a5,a0,f9001d1c <console_main+0x44>
    fun_num = input - 'a';
f9001cfc:	8481c783          	lbu	a5,-1976(gp) # f9004f28 <input.1>
f9001d00:	f9f78793          	addi	a5,a5,-97
f9001d04:	80f1a823          	sw	a5,-2032(gp) # f9004ef0 <fun_num.0>
    if ((fun_num >= 0 && fun_num <= 9) && (fun_num < sizeof(pixelFormat)/sizeof(pixelFormat[0]))) {
f9001d08:	00200713          	li	a4,2
f9001d0c:	12f77e63          	bgeu	a4,a5,f9001e48 <console_main+0x170>
}
f9001d10:	03c12083          	lw	ra,60(sp)
f9001d14:	04010113          	addi	sp,sp,64
f9001d18:	00008067          	ret
f9001d1c:	02812c23          	sw	s0,56(sp)
f9001d20:	02912a23          	sw	s1,52(sp)
f9001d24:	03212823          	sw	s2,48(sp)
        bsp_printf("    using ");
f9001d28:	f9005537          	lui	a0,0xf9005
f9001d2c:	95450513          	addi	a0,a0,-1708 # f9004954 <_data+0x2d4>
f9001d30:	a1dff0ef          	jal	f900174c <bsp_printf>
        bsp_printf(videoParams[fun_num].description);
f9001d34:	8101a703          	lw	a4,-2032(gp) # f9004ef0 <fun_num.0>
f9001d38:	f90057b7          	lui	a5,0xf9005
f9001d3c:	a6478413          	addi	s0,a5,-1436 # f9004a64 <videoParams>
f9001d40:	02c00913          	li	s2,44
f9001d44:	032707b3          	mul	a5,a4,s2
f9001d48:	00f407b3          	add	a5,s0,a5
f9001d4c:	0287a503          	lw	a0,40(a5)
f9001d50:	9fdff0ef          	jal	f900174c <bsp_printf>
        bsp_printf("\r\n\r\n");
f9001d54:	f9005537          	lui	a0,0xf9005
f9001d58:	96050513          	addi	a0,a0,-1696 # f9004960 <_data+0x2e0>
f9001d5c:	9f1ff0ef          	jal	f900174c <bsp_printf>
        interrupt_set(USER_TIMER_0, 0);
f9001d60:	00000593          	li	a1,0
f9001d64:	01300513          	li	a0,19
f9001d68:	d7dff0ef          	jal	f9001ae4 <interrupt_set>
        update_video_timing(videoParams[fun_num].timing);
f9001d6c:	8101a783          	lw	a5,-2032(gp) # f9004ef0 <fun_num.0>
f9001d70:	032787b3          	mul	a5,a5,s2
f9001d74:	00f407b3          	add	a5,s0,a5
f9001d78:	0007ae03          	lw	t3,0(a5)
f9001d7c:	0047a303          	lw	t1,4(a5)
f9001d80:	0087a883          	lw	a7,8(a5)
f9001d84:	00c7a803          	lw	a6,12(a5)
f9001d88:	0107a503          	lw	a0,16(a5)
f9001d8c:	0147a583          	lw	a1,20(a5)
f9001d90:	0187a603          	lw	a2,24(a5)
f9001d94:	01c7a683          	lw	a3,28(a5)
f9001d98:	0207a703          	lw	a4,32(a5)
f9001d9c:	0247a783          	lw	a5,36(a5)
f9001da0:	01c12023          	sw	t3,0(sp)
f9001da4:	00612223          	sw	t1,4(sp)
f9001da8:	01112423          	sw	a7,8(sp)
f9001dac:	01012623          	sw	a6,12(sp)
f9001db0:	00a12823          	sw	a0,16(sp)
f9001db4:	00b12a23          	sw	a1,20(sp)
f9001db8:	00c12c23          	sw	a2,24(sp)
f9001dbc:	00d12e23          	sw	a3,28(sp)
f9001dc0:	02e12023          	sw	a4,32(sp)
f9001dc4:	02f12223          	sw	a5,36(sp)
f9001dc8:	00010513          	mv	a0,sp
f9001dcc:	fa0fe0ef          	jal	f900056c <update_video_timing>
        switch(fun_num) {
f9001dd0:	8101a783          	lw	a5,-2032(gp) # f9004ef0 <fun_num.0>
f9001dd4:	00300713          	li	a4,3
f9001dd8:	02f74e63          	blt	a4,a5,f9001e14 <console_main+0x13c>
f9001ddc:	00200713          	li	a4,2
f9001de0:	04e7d663          	bge	a5,a4,f9001e2c <console_main+0x154>
f9001de4:	00100713          	li	a4,1
f9001de8:	04f76863          	bltu	a4,a5,f9001e38 <console_main+0x160>
            	IMX900_init(CameraRes_1080P);
f9001dec:	00100513          	li	a0,1
f9001df0:	954ff0ef          	jal	f9000f44 <IMX900_init>
        interrupt_set(USER_TIMER_0, 1);
f9001df4:	00100593          	li	a1,1
f9001df8:	01300513          	li	a0,19
f9001dfc:	ce9ff0ef          	jal	f9001ae4 <interrupt_set>
        print_menu();
f9001e00:	df5ff0ef          	jal	f9001bf4 <print_menu>
f9001e04:	03812403          	lw	s0,56(sp)
f9001e08:	03412483          	lw	s1,52(sp)
f9001e0c:	03012903          	lw	s2,48(sp)
f9001e10:	eedff06f          	j	f9001cfc <console_main+0x24>
        switch(fun_num) {
f9001e14:	ffc78793          	addi	a5,a5,-4
f9001e18:	00100713          	li	a4,1
f9001e1c:	00f76e63          	bltu	a4,a5,f9001e38 <console_main+0x160>
            	IMX900_init(CameraRes_4K);
f9001e20:	00000513          	li	a0,0
f9001e24:	920ff0ef          	jal	f9000f44 <IMX900_init>
                break;
f9001e28:	fcdff06f          	j	f9001df4 <console_main+0x11c>
            	IMX900_init(CameraRes_1440P);
f9001e2c:	00200513          	li	a0,2
f9001e30:	914ff0ef          	jal	f9000f44 <IMX900_init>
                break;
f9001e34:	fc1ff06f          	j	f9001df4 <console_main+0x11c>
                bsp_printf("unexpected resolution & frame rate\r\n");
f9001e38:	f9005537          	lui	a0,0xf9005
f9001e3c:	96850513          	addi	a0,a0,-1688 # f9004968 <_data+0x2e8>
f9001e40:	90dff0ef          	jal	f900174c <bsp_printf>
                break;
f9001e44:	fb1ff06f          	j	f9001df4 <console_main+0x11c>
f9001e48:	02812c23          	sw	s0,56(sp)
        bsp_printf("    using ");
f9001e4c:	f9005537          	lui	a0,0xf9005
f9001e50:	95450513          	addi	a0,a0,-1708 # f9004954 <_data+0x2d4>
f9001e54:	8f9ff0ef          	jal	f900174c <bsp_printf>
        bsp_printf(pixelFormat[fun_num]);
f9001e58:	8101a703          	lw	a4,-2032(gp) # f9004ef0 <fun_num.0>
f9001e5c:	00271793          	slli	a5,a4,0x2
f9001e60:	00e787b3          	add	a5,a5,a4
f9001e64:	00279793          	slli	a5,a5,0x2
f9001e68:	f9005537          	lui	a0,0xf9005
f9001e6c:	eb050513          	addi	a0,a0,-336 # f9004eb0 <pixelFormat>
f9001e70:	00f50533          	add	a0,a0,a5
f9001e74:	8d9ff0ef          	jal	f900174c <bsp_printf>
        bsp_printf("\r\n\r\n");
f9001e78:	f9005537          	lui	a0,0xf9005
f9001e7c:	96050513          	addi	a0,a0,-1696 # f9004960 <_data+0x2e0>
f9001e80:	8cdff0ef          	jal	f900174c <bsp_printf>
        switch(fun_num) {
f9001e84:	8101a503          	lw	a0,-2032(gp) # f9004ef0 <fun_num.0>
f9001e88:	00200793          	li	a5,2
f9001e8c:	00a7ec63          	bltu	a5,a0,f9001ea4 <console_main+0x1cc>
                write_apb_reg(fun_num, REG_PIXEL_MODE);
f9001e90:	07c00593          	li	a1,124
f9001e94:	ec8fe0ef          	jal	f900055c <write_apb_reg>
        print_menu();
f9001e98:	d5dff0ef          	jal	f9001bf4 <print_menu>
f9001e9c:	03812403          	lw	s0,56(sp)
}
f9001ea0:	e71ff06f          	j	f9001d10 <console_main+0x38>
                bsp_printf("unsupported pixel format\r\n");
f9001ea4:	f9005537          	lui	a0,0xf9005
f9001ea8:	99050513          	addi	a0,a0,-1648 # f9004990 <_data+0x310>
f9001eac:	8a1ff0ef          	jal	f900174c <bsp_printf>
                break;
f9001eb0:	fe9ff06f          	j	f9001e98 <console_main+0x1c0>

f9001eb4 <i2c_applyConfig>:
        write_u32(config->samplingClockDivider, reg + I2C_SAMPLING_CLOCK_DIVIDER);
f9001eb4:	0005a783          	lw	a5,0(a1)
f9001eb8:	02f52423          	sw	a5,40(a0)
        write_u32(config->timeout, reg + I2C_TIMEOUT);
f9001ebc:	0045a783          	lw	a5,4(a1)
f9001ec0:	02f52623          	sw	a5,44(a0)
        write_u32(config->tsuDat, reg + I2C_TSUDAT);
f9001ec4:	0085a783          	lw	a5,8(a1)
f9001ec8:	02f52823          	sw	a5,48(a0)
        write_u32(config->tLow, reg + I2C_TLOW);
f9001ecc:	00c5a783          	lw	a5,12(a1)
f9001ed0:	04f52823          	sw	a5,80(a0)
        write_u32(config->tHigh, reg + I2C_THIGH);
f9001ed4:	0105a783          	lw	a5,16(a1)
f9001ed8:	04f52a23          	sw	a5,84(a0)
        write_u32(config->tBuf, reg + I2C_TBUF);
f9001edc:	0145a783          	lw	a5,20(a1)
f9001ee0:	04f52c23          	sw	a5,88(a0)
    }
f9001ee4:	00008067          	ret

f9001ee8 <cam_i2c_init>:

#include "i2c.h"
#include "peri.h"

void cam_i2c_init() {
f9001ee8:	fd010113          	addi	sp,sp,-48
f9001eec:	02112623          	sw	ra,44(sp)
    const int i2c_freq = 100000;
    I2c_Config i2c_mipi;
    i2c_mipi.samplingClockDivider = 3;
f9001ef0:	00300793          	li	a5,3
f9001ef4:	00f12423          	sw	a5,8(sp)
    i2c_mipi.timeout = I2C_CTRL_HZ/1000;
f9001ef8:	000187b7          	lui	a5,0x18
f9001efc:	6a078793          	addi	a5,a5,1696 # 186a0 <__stack_size+0x176a0>
f9001f00:	00f12623          	sw	a5,12(sp)
    i2c_mipi.tsuDat  = I2C_CTRL_HZ/(i2c_freq*5);
f9001f04:	0c800793          	li	a5,200
f9001f08:	00f12823          	sw	a5,16(sp)

    /* T_low & T_high = i2c period / 2  */
    i2c_mipi.tLow  = I2C_CTRL_HZ/(i2c_freq*2);
f9001f0c:	1f400793          	li	a5,500
f9001f10:	00f12a23          	sw	a5,20(sp)
    i2c_mipi.tHigh = I2C_CTRL_HZ/(i2c_freq*2);
f9001f14:	00f12c23          	sw	a5,24(sp)
    i2c_mipi.tBuf  = I2C_CTRL_HZ/(i2c_freq);
f9001f18:	3e800793          	li	a5,1000
f9001f1c:	00f12e23          	sw	a5,28(sp)

    i2c_applyConfig(I2C_CTRL_CAM, &i2c_mipi);
f9001f20:	00810593          	addi	a1,sp,8
f9001f24:	f8016537          	lui	a0,0xf8016
f9001f28:	f8dff0ef          	jal	f9001eb4 <i2c_applyConfig>
}
f9001f2c:	02c12083          	lw	ra,44(sp)
f9001f30:	03010113          	addi	sp,sp,48
f9001f34:	00008067          	ret

f9001f38 <uart_writeAvailability>:
        return *((volatile u32*) address);
f9001f38:	00452503          	lw	a0,4(a0) # f8016004 <__stack_size+0xf8015004>
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
f9001f3c:	01055513          	srli	a0,a0,0x10
    }
f9001f40:	0ff57513          	zext.b	a0,a0
f9001f44:	00008067          	ret

f9001f48 <uart_write>:
    static void uart_write(u32 reg, char data){
f9001f48:	ff010113          	addi	sp,sp,-16
f9001f4c:	00112623          	sw	ra,12(sp)
f9001f50:	00812423          	sw	s0,8(sp)
f9001f54:	00912223          	sw	s1,4(sp)
f9001f58:	00050413          	mv	s0,a0
f9001f5c:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
f9001f60:	00040513          	mv	a0,s0
f9001f64:	fd5ff0ef          	jal	f9001f38 <uart_writeAvailability>
f9001f68:	fe050ce3          	beqz	a0,f9001f60 <uart_write+0x18>
        *((volatile u32*) address) = data;
f9001f6c:	00942023          	sw	s1,0(s0)
    }
f9001f70:	00c12083          	lw	ra,12(sp)
f9001f74:	00812403          	lw	s0,8(sp)
f9001f78:	00412483          	lw	s1,4(sp)
f9001f7c:	01010113          	addi	sp,sp,16
f9001f80:	00008067          	ret

f9001f84 <_putchar>:
    static void _putchar(char character){
f9001f84:	ff010113          	addi	sp,sp,-16
f9001f88:	00112623          	sw	ra,12(sp)
f9001f8c:	00050593          	mv	a1,a0
            bsp_putChar(character);
f9001f90:	f8010537          	lui	a0,0xf8010
f9001f94:	fb5ff0ef          	jal	f9001f48 <uart_write>
    }
f9001f98:	00c12083          	lw	ra,12(sp)
f9001f9c:	01010113          	addi	sp,sp,16
f9001fa0:	00008067          	ret

f9001fa4 <_putchar_s>:
    {
f9001fa4:	ff010113          	addi	sp,sp,-16
f9001fa8:	00112623          	sw	ra,12(sp)
f9001fac:	00812423          	sw	s0,8(sp)
f9001fb0:	00050413          	mv	s0,a0
        while (*p)
f9001fb4:	00c0006f          	j	f9001fc0 <_putchar_s+0x1c>
            _putchar(*(p++));
f9001fb8:	00140413          	addi	s0,s0,1
f9001fbc:	fc9ff0ef          	jal	f9001f84 <_putchar>
        while (*p)
f9001fc0:	00044503          	lbu	a0,0(s0)
f9001fc4:	fe051ae3          	bnez	a0,f9001fb8 <_putchar_s+0x14>
    }
f9001fc8:	00c12083          	lw	ra,12(sp)
f9001fcc:	00812403          	lw	s0,8(sp)
f9001fd0:	01010113          	addi	sp,sp,16
f9001fd4:	00008067          	ret

f9001fd8 <bsp_printHex>:
    {
f9001fd8:	ff010113          	addi	sp,sp,-16
f9001fdc:	00112623          	sw	ra,12(sp)
f9001fe0:	00812423          	sw	s0,8(sp)
f9001fe4:	00912223          	sw	s1,4(sp)
f9001fe8:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9001fec:	01c00413          	li	s0,28
f9001ff0:	0240006f          	j	f9002014 <bsp_printHex+0x3c>
            _putchar("0123456789ABCDEF"[(val >> i) % 16]);
f9001ff4:	0084d733          	srl	a4,s1,s0
f9001ff8:	00f77713          	andi	a4,a4,15
f9001ffc:	f90047b7          	lui	a5,0xf9004
f9002000:	68078793          	addi	a5,a5,1664 # f9004680 <_data>
f9002004:	00e787b3          	add	a5,a5,a4
f9002008:	0007c503          	lbu	a0,0(a5)
f900200c:	f79ff0ef          	jal	f9001f84 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9002010:	ffc40413          	addi	s0,s0,-4
f9002014:	fe0450e3          	bgez	s0,f9001ff4 <bsp_printHex+0x1c>
    }
f9002018:	00c12083          	lw	ra,12(sp)
f900201c:	00812403          	lw	s0,8(sp)
f9002020:	00412483          	lw	s1,4(sp)
f9002024:	01010113          	addi	sp,sp,16
f9002028:	00008067          	ret

f900202c <bsp_printHex_lower>:
    {
f900202c:	ff010113          	addi	sp,sp,-16
f9002030:	00112623          	sw	ra,12(sp)
f9002034:	00812423          	sw	s0,8(sp)
f9002038:	00912223          	sw	s1,4(sp)
f900203c:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9002040:	01c00413          	li	s0,28
f9002044:	0240006f          	j	f9002068 <bsp_printHex_lower+0x3c>
            _putchar("0123456789abcdef"[(val >> i) % 16]);
f9002048:	0084d733          	srl	a4,s1,s0
f900204c:	00f77713          	andi	a4,a4,15
f9002050:	f90047b7          	lui	a5,0xf9004
f9002054:	69478793          	addi	a5,a5,1684 # f9004694 <_data+0x14>
f9002058:	00e787b3          	add	a5,a5,a4
f900205c:	0007c503          	lbu	a0,0(a5)
f9002060:	f25ff0ef          	jal	f9001f84 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9002064:	ffc40413          	addi	s0,s0,-4
f9002068:	fe0450e3          	bgez	s0,f9002048 <bsp_printHex_lower+0x1c>
    }
f900206c:	00c12083          	lw	ra,12(sp)
f9002070:	00812403          	lw	s0,8(sp)
f9002074:	00412483          	lw	s1,4(sp)
f9002078:	01010113          	addi	sp,sp,16
f900207c:	00008067          	ret

f9002080 <bsp_printf_c>:
    {
f9002080:	ff010113          	addi	sp,sp,-16
f9002084:	00112623          	sw	ra,12(sp)
        _putchar(c);
f9002088:	0ff57513          	zext.b	a0,a0
f900208c:	ef9ff0ef          	jal	f9001f84 <_putchar>
    }
f9002090:	00c12083          	lw	ra,12(sp)
f9002094:	01010113          	addi	sp,sp,16
f9002098:	00008067          	ret

f900209c <bsp_printf_s>:
    {
f900209c:	ff010113          	addi	sp,sp,-16
f90020a0:	00112623          	sw	ra,12(sp)
        _putchar_s(p);
f90020a4:	f01ff0ef          	jal	f9001fa4 <_putchar_s>
    }
f90020a8:	00c12083          	lw	ra,12(sp)
f90020ac:	01010113          	addi	sp,sp,16
f90020b0:	00008067          	ret

f90020b4 <bsp_printf_d>:
    {
f90020b4:	fd010113          	addi	sp,sp,-48
f90020b8:	02112623          	sw	ra,44(sp)
f90020bc:	02812423          	sw	s0,40(sp)
f90020c0:	02912223          	sw	s1,36(sp)
f90020c4:	00050493          	mv	s1,a0
        if (val < 0) {
f90020c8:	00054663          	bltz	a0,f90020d4 <bsp_printf_d+0x20>
    {
f90020cc:	00010413          	mv	s0,sp
f90020d0:	02c0006f          	j	f90020fc <bsp_printf_d+0x48>
            bsp_printf_c('-');
f90020d4:	02d00513          	li	a0,45
f90020d8:	fa9ff0ef          	jal	f9002080 <bsp_printf_c>
            val = -val;
f90020dc:	409004b3          	neg	s1,s1
f90020e0:	fedff06f          	j	f90020cc <bsp_printf_d+0x18>
            *(p++) = '0' + val % 10;
f90020e4:	00a00713          	li	a4,10
f90020e8:	02e4e7b3          	rem	a5,s1,a4
f90020ec:	03078793          	addi	a5,a5,48
f90020f0:	00f40023          	sb	a5,0(s0)
            val = val / 10;
f90020f4:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
f90020f8:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
f90020fc:	fe0494e3          	bnez	s1,f90020e4 <bsp_printf_d+0x30>
f9002100:	00010793          	mv	a5,sp
f9002104:	fef400e3          	beq	s0,a5,f90020e4 <bsp_printf_d+0x30>
        while (p != buffer)
f9002108:	00010793          	mv	a5,sp
f900210c:	00f40a63          	beq	s0,a5,f9002120 <bsp_printf_d+0x6c>
            bsp_printf_c(*(--p));
f9002110:	fff40413          	addi	s0,s0,-1
f9002114:	00044503          	lbu	a0,0(s0)
f9002118:	f69ff0ef          	jal	f9002080 <bsp_printf_c>
f900211c:	fedff06f          	j	f9002108 <bsp_printf_d+0x54>
    }
f9002120:	02c12083          	lw	ra,44(sp)
f9002124:	02812403          	lw	s0,40(sp)
f9002128:	02412483          	lw	s1,36(sp)
f900212c:	03010113          	addi	sp,sp,48
f9002130:	00008067          	ret

f9002134 <bsp_printf_x>:
    {
f9002134:	ff010113          	addi	sp,sp,-16
f9002138:	00112623          	sw	ra,12(sp)
        for(i=0;i<8;i++)
f900213c:	00000713          	li	a4,0
f9002140:	00700793          	li	a5,7
f9002144:	02e7c063          	blt	a5,a4,f9002164 <bsp_printf_x+0x30>
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f9002148:	00271693          	slli	a3,a4,0x2
f900214c:	ff000793          	li	a5,-16
f9002150:	00d797b3          	sll	a5,a5,a3
f9002154:	00f577b3          	and	a5,a0,a5
f9002158:	00078663          	beqz	a5,f9002164 <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
f900215c:	00170713          	addi	a4,a4,1
f9002160:	fe1ff06f          	j	f9002140 <bsp_printf_x+0xc>
        bsp_printHex_lower(val);
f9002164:	ec9ff0ef          	jal	f900202c <bsp_printHex_lower>
    }
f9002168:	00c12083          	lw	ra,12(sp)
f900216c:	01010113          	addi	sp,sp,16
f9002170:	00008067          	ret

f9002174 <bsp_printf_X>:
        {
f9002174:	ff010113          	addi	sp,sp,-16
f9002178:	00112623          	sw	ra,12(sp)
            for(i=0;i<8;i++)
f900217c:	00000713          	li	a4,0
f9002180:	00700793          	li	a5,7
f9002184:	02e7c063          	blt	a5,a4,f90021a4 <bsp_printf_X+0x30>
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f9002188:	00271693          	slli	a3,a4,0x2
f900218c:	ff000793          	li	a5,-16
f9002190:	00d797b3          	sll	a5,a5,a3
f9002194:	00f577b3          	and	a5,a0,a5
f9002198:	00078663          	beqz	a5,f90021a4 <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
f900219c:	00170713          	addi	a4,a4,1
f90021a0:	fe1ff06f          	j	f9002180 <bsp_printf_X+0xc>
            bsp_printHex(val);
f90021a4:	e35ff0ef          	jal	f9001fd8 <bsp_printHex>
        }
f90021a8:	00c12083          	lw	ra,12(sp)
f90021ac:	01010113          	addi	sp,sp,16
f90021b0:	00008067          	ret

f90021b4 <bsp_printf>:
    {
f90021b4:	fc010113          	addi	sp,sp,-64
f90021b8:	00112e23          	sw	ra,28(sp)
f90021bc:	00812c23          	sw	s0,24(sp)
f90021c0:	00912a23          	sw	s1,20(sp)
f90021c4:	00050493          	mv	s1,a0
f90021c8:	02b12223          	sw	a1,36(sp)
f90021cc:	02c12423          	sw	a2,40(sp)
f90021d0:	02d12623          	sw	a3,44(sp)
f90021d4:	02e12823          	sw	a4,48(sp)
f90021d8:	02f12a23          	sw	a5,52(sp)
f90021dc:	03012c23          	sw	a6,56(sp)
f90021e0:	03112e23          	sw	a7,60(sp)
        va_start(ap, format);
f90021e4:	02410793          	addi	a5,sp,36
f90021e8:	00f12623          	sw	a5,12(sp)
        for (i = 0; format[i]; i++)
f90021ec:	00000413          	li	s0,0
f90021f0:	01c0006f          	j	f900220c <bsp_printf+0x58>
                        bsp_printf_c(va_arg(ap,int));
f90021f4:	00c12783          	lw	a5,12(sp)
f90021f8:	00478713          	addi	a4,a5,4
f90021fc:	00e12623          	sw	a4,12(sp)
f9002200:	0007a503          	lw	a0,0(a5)
f9002204:	e7dff0ef          	jal	f9002080 <bsp_printf_c>
        for (i = 0; format[i]; i++)
f9002208:	00140413          	addi	s0,s0,1
f900220c:	008487b3          	add	a5,s1,s0
f9002210:	0007c503          	lbu	a0,0(a5)
f9002214:	0a050e63          	beqz	a0,f90022d0 <bsp_printf+0x11c>
            if (format[i] == '%') {
f9002218:	02500793          	li	a5,37
f900221c:	06f50e63          	beq	a0,a5,f9002298 <bsp_printf+0xe4>
                bsp_printf_c(format[i]);
f9002220:	e61ff0ef          	jal	f9002080 <bsp_printf_c>
f9002224:	fe5ff06f          	j	f9002208 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
f9002228:	00c12783          	lw	a5,12(sp)
f900222c:	00478713          	addi	a4,a5,4
f9002230:	00e12623          	sw	a4,12(sp)
f9002234:	0007a503          	lw	a0,0(a5)
f9002238:	e65ff0ef          	jal	f900209c <bsp_printf_s>
                        break;
f900223c:	fcdff06f          	j	f9002208 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
f9002240:	00c12783          	lw	a5,12(sp)
f9002244:	00478713          	addi	a4,a5,4
f9002248:	00e12623          	sw	a4,12(sp)
f900224c:	0007a503          	lw	a0,0(a5)
f9002250:	e65ff0ef          	jal	f90020b4 <bsp_printf_d>
                        break;
f9002254:	fb5ff06f          	j	f9002208 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
f9002258:	00c12783          	lw	a5,12(sp)
f900225c:	00478713          	addi	a4,a5,4
f9002260:	00e12623          	sw	a4,12(sp)
f9002264:	0007a503          	lw	a0,0(a5)
f9002268:	f0dff0ef          	jal	f9002174 <bsp_printf_X>
                        break;
f900226c:	f9dff06f          	j	f9002208 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
f9002270:	00c12783          	lw	a5,12(sp)
f9002274:	00478713          	addi	a4,a5,4
f9002278:	00e12623          	sw	a4,12(sp)
f900227c:	0007a503          	lw	a0,0(a5)
f9002280:	eb5ff0ef          	jal	f9002134 <bsp_printf_x>
                        break;
f9002284:	f85ff06f          	j	f9002208 <bsp_printf+0x54>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
f9002288:	f9004537          	lui	a0,0xf9004
f900228c:	6a850513          	addi	a0,a0,1704 # f90046a8 <_data+0x28>
f9002290:	e0dff0ef          	jal	f900209c <bsp_printf_s>
                        break;
f9002294:	f75ff06f          	j	f9002208 <bsp_printf+0x54>
                while (format[++i]) {
f9002298:	00140413          	addi	s0,s0,1
f900229c:	008487b3          	add	a5,s1,s0
f90022a0:	0007c783          	lbu	a5,0(a5)
f90022a4:	f60782e3          	beqz	a5,f9002208 <bsp_printf+0x54>
                    if (format[i] == 'c') {
f90022a8:	fa878793          	addi	a5,a5,-88
f90022ac:	0ff7f693          	zext.b	a3,a5
f90022b0:	02000713          	li	a4,32
f90022b4:	fed762e3          	bltu	a4,a3,f9002298 <bsp_printf+0xe4>
f90022b8:	00269793          	slli	a5,a3,0x2
f90022bc:	f9005737          	lui	a4,0xf9005
f90022c0:	d2c70713          	addi	a4,a4,-724 # f9004d2c <module_common_regs+0x98>
f90022c4:	00e787b3          	add	a5,a5,a4
f90022c8:	0007a783          	lw	a5,0(a5)
f90022cc:	00078067          	jr	a5
    }
f90022d0:	01c12083          	lw	ra,28(sp)
f90022d4:	01812403          	lw	s0,24(sp)
f90022d8:	01412483          	lw	s1,20(sp)
f90022dc:	04010113          	addi	sp,sp,64
f90022e0:	00008067          	ret

f90022e4 <initTimer>:
#define TIMER_CONFIG_WITH_PRESCALER     0x2
#define TIMER_CONFIG_WITHOUT_PRESCALER  0x1
#define TIMER_CONFIG_SELF_RESTART       0x10000


void initTimer(u64 interval){
f90022e4:	ff010113          	addi	sp,sp,-16
f90022e8:	00112623          	sw	ra,12(sp)
f90022ec:	f80177b7          	lui	a5,0xf8017
f90022f0:	06300713          	li	a4,99
f90022f4:	00e7a023          	sw	a4,0(a5) # f8017000 <__stack_size+0xf8016000>
f90022f8:	00010737          	lui	a4,0x10
f90022fc:	00270713          	addi	a4,a4,2 # 10002 <__stack_size+0xf002>
f9002300:	04e7a023          	sw	a4,64(a5)
    //Divide clock rate by 99+1
    write_u32(99, TIMER_PRESCALER_CTRL); 
    write_u32(TIMER_CONFIG_WITH_PRESCALER | TIMER_CONFIG_SELF_RESTART, TIMER_CTRL + 0x0);
    //Will tick each interval cycles (as it use the prescaler)
    write_u32(interval/100 - 1, TIMER_CTRL + 0x4);
f9002304:	001007b7          	lui	a5,0x100
f9002308:	fff78793          	addi	a5,a5,-1 # fffff <__stack_size+0xfefff>
f900230c:	00f57733          	and	a4,a0,a5
f9002310:	00c59613          	slli	a2,a1,0xc
f9002314:	01455693          	srli	a3,a0,0x14
f9002318:	00d666b3          	or	a3,a2,a3
f900231c:	00f6f6b3          	and	a3,a3,a5
f9002320:	00d70733          	add	a4,a4,a3
f9002324:	0085d693          	srli	a3,a1,0x8
f9002328:	00f6f7b3          	and	a5,a3,a5
f900232c:	00f70733          	add	a4,a4,a5
f9002330:	01c5d793          	srli	a5,a1,0x1c
f9002334:	00f70733          	add	a4,a4,a5
f9002338:	01900793          	li	a5,25
f900233c:	02f77733          	remu	a4,a4,a5
f9002340:	40e50733          	sub	a4,a0,a4
f9002344:	00e53533          	sltu	a0,a0,a4
f9002348:	40a587b3          	sub	a5,a1,a0
f900234c:	c28f6637          	lui	a2,0xc28f6
f9002350:	c2960613          	addi	a2,a2,-983 # c28f5c29 <__stack_size+0xc28f4c29>
f9002354:	02c787b3          	mul	a5,a5,a2
f9002358:	8f5c36b7          	lui	a3,0x8f5c3
f900235c:	8f568693          	addi	a3,a3,-1803 # 8f5c28f5 <__stack_size+0x8f5c18f5>
f9002360:	02d706b3          	mul	a3,a4,a3
f9002364:	00d787b3          	add	a5,a5,a3
f9002368:	02c706b3          	mul	a3,a4,a2
f900236c:	02c73733          	mulhu	a4,a4,a2
f9002370:	00e787b3          	add	a5,a5,a4
f9002374:	01e79793          	slli	a5,a5,0x1e
f9002378:	0026d713          	srli	a4,a3,0x2
f900237c:	00e7e733          	or	a4,a5,a4
f9002380:	fff70713          	addi	a4,a4,-1
f9002384:	f80177b7          	lui	a5,0xf8017
f9002388:	04e7a223          	sw	a4,68(a5) # f8017044 <__stack_size+0xf8016044>
    bsp_printf("user timer initialized!\r\n");
f900238c:	f9005537          	lui	a0,0xf9005
f9002390:	9c450513          	addi	a0,a0,-1596 # f90049c4 <_data+0x344>
f9002394:	e21ff0ef          	jal	f90021b4 <bsp_printf>
}
f9002398:	00c12083          	lw	ra,12(sp)
f900239c:	01010113          	addi	sp,sp,16
f90023a0:	00008067          	ret

f90023a4 <trap_entry>:

trap_entry:
#ifdef __riscv_flen
  addi sp, sp, -STACK_SIZE
#else
  addi sp, sp, -64
f90023a4:	fc010113          	addi	sp,sp,-64
#endif
  sw x1,   0*4(sp)
f90023a8:	00112023          	sw	ra,0(sp)
  sw x5,   1*4(sp)
f90023ac:	00512223          	sw	t0,4(sp)
  sw x6,   2*4(sp)
f90023b0:	00612423          	sw	t1,8(sp)
  sw x7,   3*4(sp)
f90023b4:	00712623          	sw	t2,12(sp)
  sw x10,  4*4(sp)
f90023b8:	00a12823          	sw	a0,16(sp)
  sw x11,  5*4(sp)
f90023bc:	00b12a23          	sw	a1,20(sp)
  sw x12,  6*4(sp)
f90023c0:	00c12c23          	sw	a2,24(sp)
  sw x13,  7*4(sp)
f90023c4:	00d12e23          	sw	a3,28(sp)
  sw x14,  8*4(sp)
f90023c8:	02e12023          	sw	a4,32(sp)
  sw x15,  9*4(sp)
f90023cc:	02f12223          	sw	a5,36(sp)
  sw x16, 10*4(sp)
f90023d0:	03012423          	sw	a6,40(sp)
  sw x17, 11*4(sp)
f90023d4:	03112623          	sw	a7,44(sp)
  sw x28, 12*4(sp)
f90023d8:	03c12823          	sw	t3,48(sp)
  sw x29, 13*4(sp)
f90023dc:	03d12a23          	sw	t4,52(sp)
  sw x30, 14*4(sp)
f90023e0:	03e12c23          	sw	t5,56(sp)
  sw x31, 15*4(sp)
f90023e4:	03f12e23          	sw	t6,60(sp)
  FSTORE f30, 64 + 18*FPR_SIZE(sp)
  FSTORE f31, 64 + 19*FPR_SIZE(sp)
  csrr t0, fcsr
  sw t0, 64 + 20*FPR_SIZE(sp)
#endif
  call trap
f90023e8:	eb8ff0ef          	jal	f9001aa0 <trap>
  FLOAD f28, 64 + 16*FPR_SIZE(sp)
  FLOAD f29, 64 + 17*FPR_SIZE(sp)
  FLOAD f30, 64 + 18*FPR_SIZE(sp)
  FLOAD f31, 64 + 19*FPR_SIZE(sp)
#endif
  lw x1 ,  0*4(sp)
f90023ec:	00012083          	lw	ra,0(sp)
  lw x5,   1*4(sp)
f90023f0:	00412283          	lw	t0,4(sp)
  lw x6,   2*4(sp)
f90023f4:	00812303          	lw	t1,8(sp)
  lw x7,   3*4(sp)
f90023f8:	00c12383          	lw	t2,12(sp)
  lw x10,  4*4(sp)
f90023fc:	01012503          	lw	a0,16(sp)
  lw x11,  5*4(sp)
f9002400:	01412583          	lw	a1,20(sp)
  lw x12,  6*4(sp)
f9002404:	01812603          	lw	a2,24(sp)
  lw x13,  7*4(sp)
f9002408:	01c12683          	lw	a3,28(sp)
  lw x14,  8*4(sp)
f900240c:	02012703          	lw	a4,32(sp)
  lw x15,  9*4(sp)
f9002410:	02412783          	lw	a5,36(sp)
  lw x16, 10*4(sp)
f9002414:	02812803          	lw	a6,40(sp)
  lw x17, 11*4(sp)
f9002418:	02c12883          	lw	a7,44(sp)
  lw x28, 12*4(sp)
f900241c:	03012e03          	lw	t3,48(sp)
  lw x29, 13*4(sp)
f9002420:	03412e83          	lw	t4,52(sp)
  lw x30, 14*4(sp)
f9002424:	03812f03          	lw	t5,56(sp)
  lw x31, 15*4(sp)
f9002428:	03c12f83          	lw	t6,60(sp)
#ifdef __riscv_flen
  addi sp, sp, STACK_SIZE
#else
  addi sp, sp, 64
f900242c:	04010113          	addi	sp,sp,64
#endif
f9002430:	30200073          	mret

f9002434 <__adddf3>:
f9002434:	001007b7          	lui	a5,0x100
f9002438:	fe010113          	addi	sp,sp,-32
f900243c:	fff78e93          	addi	t4,a5,-1 # fffff <__stack_size+0xfefff>
f9002440:	00bef833          	and	a6,t4,a1
f9002444:	00def7b3          	and	a5,t4,a3
f9002448:	0146d313          	srli	t1,a3,0x14
f900244c:	01212823          	sw	s2,16(sp)
f9002450:	0145d913          	srli	s2,a1,0x14
f9002454:	00379793          	slli	a5,a5,0x3
f9002458:	00812c23          	sw	s0,24(sp)
f900245c:	00381813          	slli	a6,a6,0x3
f9002460:	01f5d413          	srli	s0,a1,0x1f
f9002464:	01d55713          	srli	a4,a0,0x1d
f9002468:	01d65893          	srli	a7,a2,0x1d
f900246c:	7ff97913          	andi	s2,s2,2047
f9002470:	7ff37313          	andi	t1,t1,2047
f9002474:	00112e23          	sw	ra,28(sp)
f9002478:	00912a23          	sw	s1,20(sp)
f900247c:	01312623          	sw	s3,12(sp)
f9002480:	01f6d693          	srli	a3,a3,0x1f
f9002484:	00f8e8b3          	or	a7,a7,a5
f9002488:	01076733          	or	a4,a4,a6
f900248c:	00351593          	slli	a1,a0,0x3
f9002490:	00361f13          	slli	t5,a2,0x3
f9002494:	406907b3          	sub	a5,s2,t1
f9002498:	1ed40463          	beq	s0,a3,f9002680 <__adddf3+0x24c>
f900249c:	16f05263          	blez	a5,f9002600 <__adddf3+0x1cc>
f90024a0:	28030663          	beqz	t1,f900272c <__adddf3+0x2f8>
f90024a4:	7ff00693          	li	a3,2047
f90024a8:	42d90663          	beq	s2,a3,f90028d4 <__adddf3+0x4a0>
f90024ac:	03800693          	li	a3,56
f90024b0:	00100613          	li	a2,1
f90024b4:	02f6ce63          	blt	a3,a5,f90024f0 <__adddf3+0xbc>
f90024b8:	008006b7          	lui	a3,0x800
f90024bc:	00d8e8b3          	or	a7,a7,a3
f90024c0:	01f00693          	li	a3,31
f90024c4:	52f6ce63          	blt	a3,a5,f9002a00 <__adddf3+0x5cc>
f90024c8:	02000693          	li	a3,32
f90024cc:	40f686b3          	sub	a3,a3,a5
f90024d0:	00d89633          	sll	a2,a7,a3
f90024d4:	00ff5533          	srl	a0,t5,a5
f90024d8:	00df16b3          	sll	a3,t5,a3
f90024dc:	00a66633          	or	a2,a2,a0
f90024e0:	00d036b3          	snez	a3,a3
f90024e4:	00f8d8b3          	srl	a7,a7,a5
f90024e8:	00d66633          	or	a2,a2,a3
f90024ec:	41170733          	sub	a4,a4,a7
f90024f0:	40c58633          	sub	a2,a1,a2
f90024f4:	00c5b5b3          	sltu	a1,a1,a2
f90024f8:	00060493          	mv	s1,a2
f90024fc:	40b709b3          	sub	s3,a4,a1
f9002500:	00899793          	slli	a5,s3,0x8
f9002504:	3207da63          	bgez	a5,f9002838 <__adddf3+0x404>
f9002508:	008007b7          	lui	a5,0x800
f900250c:	fff78793          	addi	a5,a5,-1 # 7fffff <__stack_size+0x7fefff>
f9002510:	00f9f9b3          	and	s3,s3,a5
f9002514:	2c098863          	beqz	s3,f90027e4 <__adddf3+0x3b0>
f9002518:	00098513          	mv	a0,s3
f900251c:	0dc020ef          	jal	f90045f8 <__clzsi2>
f9002520:	ff850793          	addi	a5,a0,-8
f9002524:	02000693          	li	a3,32
f9002528:	40f68733          	sub	a4,a3,a5
f900252c:	00e4d733          	srl	a4,s1,a4
f9002530:	00f999b3          	sll	s3,s3,a5
f9002534:	01376733          	or	a4,a4,s3
f9002538:	00f494b3          	sll	s1,s1,a5
f900253c:	4b27c863          	blt	a5,s2,f90029ec <__adddf3+0x5b8>
f9002540:	412787b3          	sub	a5,a5,s2
f9002544:	00178793          	addi	a5,a5,1
f9002548:	40f686b3          	sub	a3,a3,a5
f900254c:	00d49633          	sll	a2,s1,a3
f9002550:	00f4d9b3          	srl	s3,s1,a5
f9002554:	00c03633          	snez	a2,a2
f9002558:	01366633          	or	a2,a2,s3
f900255c:	00d716b3          	sll	a3,a4,a3
f9002560:	00c6e4b3          	or	s1,a3,a2
f9002564:	00f759b3          	srl	s3,a4,a5
f9002568:	00000913          	li	s2,0
f900256c:	0074f793          	andi	a5,s1,7
f9002570:	02078063          	beqz	a5,f9002590 <__adddf3+0x15c>
f9002574:	00f4f793          	andi	a5,s1,15
f9002578:	00400713          	li	a4,4
f900257c:	00e78a63          	beq	a5,a4,f9002590 <__adddf3+0x15c>
f9002580:	00448793          	addi	a5,s1,4
f9002584:	0097b633          	sltu	a2,a5,s1
f9002588:	00c989b3          	add	s3,s3,a2
f900258c:	00078493          	mv	s1,a5
f9002590:	00899793          	slli	a5,s3,0x8
f9002594:	6e07da63          	bgez	a5,f9002c88 <__adddf3+0x854>
f9002598:	00190793          	addi	a5,s2,1
f900259c:	7ff00713          	li	a4,2047
f90025a0:	00040e13          	mv	t3,s0
f90025a4:	2ae78663          	beq	a5,a4,f9002850 <__adddf3+0x41c>
f90025a8:	ff800737          	lui	a4,0xff800
f90025ac:	fff70713          	addi	a4,a4,-1 # ff7fffff <__freertos_irq_stack_top+0x67fa08f>
f90025b0:	00e9f733          	and	a4,s3,a4
f90025b4:	7ff7f793          	andi	a5,a5,2047
f90025b8:	01d71813          	slli	a6,a4,0x1d
f90025bc:	0034d613          	srli	a2,s1,0x3
f90025c0:	00971713          	slli	a4,a4,0x9
f90025c4:	00c86833          	or	a6,a6,a2
f90025c8:	00c75713          	srli	a4,a4,0xc
f90025cc:	01c12083          	lw	ra,28(sp)
f90025d0:	01812403          	lw	s0,24(sp)
f90025d4:	01479793          	slli	a5,a5,0x14
f90025d8:	00e7e7b3          	or	a5,a5,a4
f90025dc:	01fe1713          	slli	a4,t3,0x1f
f90025e0:	00e7e7b3          	or	a5,a5,a4
f90025e4:	01412483          	lw	s1,20(sp)
f90025e8:	01012903          	lw	s2,16(sp)
f90025ec:	00c12983          	lw	s3,12(sp)
f90025f0:	00080513          	mv	a0,a6
f90025f4:	00078593          	mv	a1,a5
f90025f8:	02010113          	addi	sp,sp,32
f90025fc:	00008067          	ret
f9002600:	14078c63          	beqz	a5,f9002758 <__adddf3+0x324>
f9002604:	412307b3          	sub	a5,t1,s2
f9002608:	3c091263          	bnez	s2,f90029cc <__adddf3+0x598>
f900260c:	00b76533          	or	a0,a4,a1
f9002610:	4c050463          	beqz	a0,f9002ad8 <__adddf3+0x6a4>
f9002614:	fff78513          	addi	a0,a5,-1
f9002618:	60050263          	beqz	a0,f9002c1c <__adddf3+0x7e8>
f900261c:	7ff00813          	li	a6,2047
f9002620:	57078663          	beq	a5,a6,f9002b8c <__adddf3+0x758>
f9002624:	03800793          	li	a5,56
f9002628:	00100613          	li	a2,1
f900262c:	02a7cc63          	blt	a5,a0,f9002664 <__adddf3+0x230>
f9002630:	00050793          	mv	a5,a0
f9002634:	01f00613          	li	a2,31
f9002638:	56f64c63          	blt	a2,a5,f9002bb0 <__adddf3+0x77c>
f900263c:	02000513          	li	a0,32
f9002640:	40f50533          	sub	a0,a0,a5
f9002644:	00a71633          	sll	a2,a4,a0
f9002648:	00f5d833          	srl	a6,a1,a5
f900264c:	00a59533          	sll	a0,a1,a0
f9002650:	01066633          	or	a2,a2,a6
f9002654:	00a03533          	snez	a0,a0
f9002658:	00f75733          	srl	a4,a4,a5
f900265c:	00a66633          	or	a2,a2,a0
f9002660:	40e888b3          	sub	a7,a7,a4
f9002664:	40cf0633          	sub	a2,t5,a2
f9002668:	00cf3733          	sltu	a4,t5,a2
f900266c:	00060493          	mv	s1,a2
f9002670:	40e889b3          	sub	s3,a7,a4
f9002674:	00030913          	mv	s2,t1
f9002678:	00068413          	mv	s0,a3
f900267c:	e85ff06f          	j	f9002500 <__adddf3+0xcc>
f9002680:	1ef05063          	blez	a5,f9002860 <__adddf3+0x42c>
f9002684:	14031063          	bnez	t1,f90027c4 <__adddf3+0x390>
f9002688:	01e8e6b3          	or	a3,a7,t5
f900268c:	26068c63          	beqz	a3,f9002904 <__adddf3+0x4d0>
f9002690:	fff78693          	addi	a3,a5,-1
f9002694:	48068063          	beqz	a3,f9002b14 <__adddf3+0x6e0>
f9002698:	7ff00613          	li	a2,2047
f900269c:	22c78c63          	beq	a5,a2,f90028d4 <__adddf3+0x4a0>
f90026a0:	03800793          	li	a5,56
f90026a4:	00100993          	li	s3,1
f90026a8:	02d7cc63          	blt	a5,a3,f90026e0 <__adddf3+0x2ac>
f90026ac:	00068793          	mv	a5,a3
f90026b0:	01f00693          	li	a3,31
f90026b4:	4af6c063          	blt	a3,a5,f9002b54 <__adddf3+0x720>
f90026b8:	02000693          	li	a3,32
f90026bc:	40f686b3          	sub	a3,a3,a5
f90026c0:	00d899b3          	sll	s3,a7,a3
f90026c4:	00ff5633          	srl	a2,t5,a5
f90026c8:	00df16b3          	sll	a3,t5,a3
f90026cc:	00c9e9b3          	or	s3,s3,a2
f90026d0:	00d036b3          	snez	a3,a3
f90026d4:	00f8d8b3          	srl	a7,a7,a5
f90026d8:	00d9e9b3          	or	s3,s3,a3
f90026dc:	01170733          	add	a4,a4,a7
f90026e0:	00b985b3          	add	a1,s3,a1
f90026e4:	0135b9b3          	sltu	s3,a1,s3
f90026e8:	00058493          	mv	s1,a1
f90026ec:	00e989b3          	add	s3,s3,a4
f90026f0:	00899793          	slli	a5,s3,0x8
f90026f4:	1407d263          	bgez	a5,f9002838 <__adddf3+0x404>
f90026f8:	00190913          	addi	s2,s2,1
f90026fc:	7ff00793          	li	a5,2047
f9002700:	36f90c63          	beq	s2,a5,f9002a78 <__adddf3+0x644>
f9002704:	ff8007b7          	lui	a5,0xff800
f9002708:	fff78793          	addi	a5,a5,-1 # ff7fffff <__freertos_irq_stack_top+0x67fa08f>
f900270c:	0014f613          	andi	a2,s1,1
f9002710:	00f9f7b3          	and	a5,s3,a5
f9002714:	0014d713          	srli	a4,s1,0x1
f9002718:	00c76733          	or	a4,a4,a2
f900271c:	01f79613          	slli	a2,a5,0x1f
f9002720:	00e664b3          	or	s1,a2,a4
f9002724:	0017d993          	srli	s3,a5,0x1
f9002728:	e45ff06f          	j	f900256c <__adddf3+0x138>
f900272c:	01e8e6b3          	or	a3,a7,t5
f9002730:	1c068a63          	beqz	a3,f9002904 <__adddf3+0x4d0>
f9002734:	fff78693          	addi	a3,a5,-1
f9002738:	40068063          	beqz	a3,f9002b38 <__adddf3+0x704>
f900273c:	7ff00613          	li	a2,2047
f9002740:	18c78a63          	beq	a5,a2,f90028d4 <__adddf3+0x4a0>
f9002744:	03800793          	li	a5,56
f9002748:	00100613          	li	a2,1
f900274c:	dad7c2e3          	blt	a5,a3,f90024f0 <__adddf3+0xbc>
f9002750:	00068793          	mv	a5,a3
f9002754:	d6dff06f          	j	f90024c0 <__adddf3+0x8c>
f9002758:	00190813          	addi	a6,s2,1
f900275c:	7fe87813          	andi	a6,a6,2046
f9002760:	22081c63          	bnez	a6,f9002998 <__adddf3+0x564>
f9002764:	00b76333          	or	t1,a4,a1
f9002768:	01e8e833          	or	a6,a7,t5
f900276c:	38091063          	bnez	s2,f9002aec <__adddf3+0x6b8>
f9002770:	46030e63          	beqz	t1,f9002bec <__adddf3+0x7b8>
f9002774:	40080663          	beqz	a6,f9002b80 <__adddf3+0x74c>
f9002778:	41e589b3          	sub	s3,a1,t5
f900277c:	0135b533          	sltu	a0,a1,s3
f9002780:	41170633          	sub	a2,a4,a7
f9002784:	40a60633          	sub	a2,a2,a0
f9002788:	00861513          	slli	a0,a2,0x8
f900278c:	50055e63          	bgez	a0,f9002ca8 <__adddf3+0x874>
f9002790:	40bf05b3          	sub	a1,t5,a1
f9002794:	40e88733          	sub	a4,a7,a4
f9002798:	00bf3f33          	sltu	t5,t5,a1
f900279c:	41e70733          	sub	a4,a4,t5
f90027a0:	00871613          	slli	a2,a4,0x8
f90027a4:	00058493          	mv	s1,a1
f90027a8:	52065e63          	bgez	a2,f9002ce4 <__adddf3+0x8b0>
f90027ac:	ff8007b7          	lui	a5,0xff800
f90027b0:	fff78793          	addi	a5,a5,-1 # ff7fffff <__freertos_irq_stack_top+0x67fa08f>
f90027b4:	00f77733          	and	a4,a4,a5
f90027b8:	00068e13          	mv	t3,a3
f90027bc:	00100793          	li	a5,1
f90027c0:	df9ff06f          	j	f90025b8 <__adddf3+0x184>
f90027c4:	7ff00693          	li	a3,2047
f90027c8:	10d90663          	beq	s2,a3,f90028d4 <__adddf3+0x4a0>
f90027cc:	03800693          	li	a3,56
f90027d0:	00100993          	li	s3,1
f90027d4:	f0f6c6e3          	blt	a3,a5,f90026e0 <__adddf3+0x2ac>
f90027d8:	008006b7          	lui	a3,0x800
f90027dc:	00d8e8b3          	or	a7,a7,a3
f90027e0:	ed1ff06f          	j	f90026b0 <__adddf3+0x27c>
f90027e4:	00048513          	mv	a0,s1
f90027e8:	611010ef          	jal	f90045f8 <__clzsi2>
f90027ec:	01850793          	addi	a5,a0,24
f90027f0:	01f00693          	li	a3,31
f90027f4:	d2f6d8e3          	bge	a3,a5,f9002524 <__adddf3+0xf0>
f90027f8:	ff850713          	addi	a4,a0,-8
f90027fc:	00e49733          	sll	a4,s1,a4
f9002800:	2327c663          	blt	a5,s2,f9002a2c <__adddf3+0x5f8>
f9002804:	41278933          	sub	s2,a5,s2
f9002808:	00190793          	addi	a5,s2,1
f900280c:	48f6d663          	bge	a3,a5,f9002c98 <__adddf3+0x864>
f9002810:	fe190913          	addi	s2,s2,-31
f9002814:	02000693          	li	a3,32
f9002818:	012754b3          	srl	s1,a4,s2
f900281c:	00d78c63          	beq	a5,a3,f9002834 <__adddf3+0x400>
f9002820:	04000693          	li	a3,64
f9002824:	40f687b3          	sub	a5,a3,a5
f9002828:	00f71733          	sll	a4,a4,a5
f900282c:	00e03733          	snez	a4,a4
f9002830:	00e4e4b3          	or	s1,s1,a4
f9002834:	00000913          	li	s2,0
f9002838:	0074f793          	andi	a5,s1,7
f900283c:	d2079ce3          	bnez	a5,f9002574 <__adddf3+0x140>
f9002840:	00090793          	mv	a5,s2
f9002844:	0034d613          	srli	a2,s1,0x3
f9002848:	00098713          	mv	a4,s3
f900284c:	0c00006f          	j	f900290c <__adddf3+0x4d8>
f9002850:	7ff00793          	li	a5,2047
f9002854:	00000713          	li	a4,0
f9002858:	00000813          	li	a6,0
f900285c:	d71ff06f          	j	f90025cc <__adddf3+0x198>
f9002860:	0c078a63          	beqz	a5,f9002934 <__adddf3+0x500>
f9002864:	412307b3          	sub	a5,t1,s2
f9002868:	1e090263          	beqz	s2,f9002a4c <__adddf3+0x618>
f900286c:	7ff00693          	li	a3,2047
f9002870:	32d30863          	beq	t1,a3,f9002ba0 <__adddf3+0x76c>
f9002874:	03800693          	li	a3,56
f9002878:	00100993          	li	s3,1
f900287c:	02f6ce63          	blt	a3,a5,f90028b8 <__adddf3+0x484>
f9002880:	008006b7          	lui	a3,0x800
f9002884:	00d76733          	or	a4,a4,a3
f9002888:	01f00693          	li	a3,31
f900288c:	3cf6c863          	blt	a3,a5,f9002c5c <__adddf3+0x828>
f9002890:	02000693          	li	a3,32
f9002894:	40f686b3          	sub	a3,a3,a5
f9002898:	00d719b3          	sll	s3,a4,a3
f900289c:	00f5d633          	srl	a2,a1,a5
f90028a0:	00d596b3          	sll	a3,a1,a3
f90028a4:	00c9e9b3          	or	s3,s3,a2
f90028a8:	00d036b3          	snez	a3,a3
f90028ac:	00f75733          	srl	a4,a4,a5
f90028b0:	00d9e9b3          	or	s3,s3,a3
f90028b4:	00e888b3          	add	a7,a7,a4
f90028b8:	01e98733          	add	a4,s3,t5
f90028bc:	013739b3          	sltu	s3,a4,s3
f90028c0:	00070493          	mv	s1,a4
f90028c4:	011989b3          	add	s3,s3,a7
f90028c8:	00030913          	mv	s2,t1
f90028cc:	e25ff06f          	j	f90026f0 <__adddf3+0x2bc>
f90028d0:	02081063          	bnez	a6,f90028f0 <__adddf3+0x4bc>
f90028d4:	00351613          	slli	a2,a0,0x3
f90028d8:	00365613          	srli	a2,a2,0x3
f90028dc:	01d71813          	slli	a6,a4,0x1d
f90028e0:	00c86833          	or	a6,a6,a2
f90028e4:	00375713          	srli	a4,a4,0x3
f90028e8:	01076733          	or	a4,a4,a6
f90028ec:	18070663          	beqz	a4,f9002a78 <__adddf3+0x644>
f90028f0:	00000e13          	li	t3,0
f90028f4:	7ff00793          	li	a5,2047
f90028f8:	00080737          	lui	a4,0x80
f90028fc:	00000813          	li	a6,0
f9002900:	ccdff06f          	j	f90025cc <__adddf3+0x198>
f9002904:	00351613          	slli	a2,a0,0x3
f9002908:	00365613          	srli	a2,a2,0x3
f900290c:	01d71813          	slli	a6,a4,0x1d
f9002910:	7ff00693          	li	a3,2047
f9002914:	00c86833          	or	a6,a6,a2
f9002918:	00375713          	srli	a4,a4,0x3
f900291c:	fcd786e3          	beq	a5,a3,f90028e8 <__adddf3+0x4b4>
f9002920:	00c71713          	slli	a4,a4,0xc
f9002924:	00c75713          	srli	a4,a4,0xc
f9002928:	7ff7f793          	andi	a5,a5,2047
f900292c:	00040e13          	mv	t3,s0
f9002930:	c9dff06f          	j	f90025cc <__adddf3+0x198>
f9002934:	00190693          	addi	a3,s2,1
f9002938:	7fe6f813          	andi	a6,a3,2046
f900293c:	14081863          	bnez	a6,f9002a8c <__adddf3+0x658>
f9002940:	00b766b3          	or	a3,a4,a1
f9002944:	28091c63          	bnez	s2,f9002bdc <__adddf3+0x7a8>
f9002948:	30068263          	beqz	a3,f9002c4c <__adddf3+0x818>
f900294c:	01e8e6b3          	or	a3,a7,t5
f9002950:	22068863          	beqz	a3,f9002b80 <__adddf3+0x74c>
f9002954:	01e587b3          	add	a5,a1,t5
f9002958:	00b7b5b3          	sltu	a1,a5,a1
f900295c:	01170733          	add	a4,a4,a7
f9002960:	00b70733          	add	a4,a4,a1
f9002964:	0037d813          	srli	a6,a5,0x3
f9002968:	00871793          	slli	a5,a4,0x8
f900296c:	00040e13          	mv	t3,s0
f9002970:	3407de63          	bgez	a5,f9002ccc <__adddf3+0x898>
f9002974:	ff8007b7          	lui	a5,0xff800
f9002978:	fff78793          	addi	a5,a5,-1 # ff7fffff <__freertos_irq_stack_top+0x67fa08f>
f900297c:	00f77733          	and	a4,a4,a5
f9002980:	01d71793          	slli	a5,a4,0x1d
f9002984:	00375713          	srli	a4,a4,0x3
f9002988:	0107e833          	or	a6,a5,a6
f900298c:	01d77733          	and	a4,a4,t4
f9002990:	00100793          	li	a5,1
f9002994:	c39ff06f          	j	f90025cc <__adddf3+0x198>
f9002998:	41e58833          	sub	a6,a1,t5
f900299c:	0105b7b3          	sltu	a5,a1,a6
f90029a0:	411709b3          	sub	s3,a4,a7
f90029a4:	40f989b3          	sub	s3,s3,a5
f90029a8:	00899793          	slli	a5,s3,0x8
f90029ac:	00080493          	mv	s1,a6
f90029b0:	1007c663          	bltz	a5,f9002abc <__adddf3+0x688>
f90029b4:	01386833          	or	a6,a6,s3
f90029b8:	b4081ee3          	bnez	a6,f9002514 <__adddf3+0xe0>
f90029bc:	00000e13          	li	t3,0
f90029c0:	00000793          	li	a5,0
f90029c4:	00000713          	li	a4,0
f90029c8:	c05ff06f          	j	f90025cc <__adddf3+0x198>
f90029cc:	7ff00513          	li	a0,2047
f90029d0:	1aa30e63          	beq	t1,a0,f9002b8c <__adddf3+0x758>
f90029d4:	03800513          	li	a0,56
f90029d8:	00100613          	li	a2,1
f90029dc:	c8f544e3          	blt	a0,a5,f9002664 <__adddf3+0x230>
f90029e0:	00800637          	lui	a2,0x800
f90029e4:	00c76733          	or	a4,a4,a2
f90029e8:	c4dff06f          	j	f9002634 <__adddf3+0x200>
f90029ec:	ff8009b7          	lui	s3,0xff800
f90029f0:	fff98993          	addi	s3,s3,-1 # ff7fffff <__freertos_irq_stack_top+0x67fa08f>
f90029f4:	40f90933          	sub	s2,s2,a5
f90029f8:	013779b3          	and	s3,a4,s3
f90029fc:	b71ff06f          	j	f900256c <__adddf3+0x138>
f9002a00:	fe078693          	addi	a3,a5,-32
f9002a04:	02000613          	li	a2,32
f9002a08:	00d8d6b3          	srl	a3,a7,a3
f9002a0c:	00c78a63          	beq	a5,a2,f9002a20 <__adddf3+0x5ec>
f9002a10:	04000613          	li	a2,64
f9002a14:	40f607b3          	sub	a5,a2,a5
f9002a18:	00f897b3          	sll	a5,a7,a5
f9002a1c:	00ff6f33          	or	t5,t5,a5
f9002a20:	01e03633          	snez	a2,t5
f9002a24:	00d66633          	or	a2,a2,a3
f9002a28:	ac9ff06f          	j	f90024f0 <__adddf3+0xbc>
f9002a2c:	ff8006b7          	lui	a3,0xff800
f9002a30:	fff68693          	addi	a3,a3,-1 # ff7fffff <__freertos_irq_stack_top+0x67fa08f>
f9002a34:	40f907b3          	sub	a5,s2,a5
f9002a38:	00d77733          	and	a4,a4,a3
f9002a3c:	01d71813          	slli	a6,a4,0x1d
f9002a40:	01386833          	or	a6,a6,s3
f9002a44:	00375713          	srli	a4,a4,0x3
f9002a48:	ed9ff06f          	j	f9002920 <__adddf3+0x4ec>
f9002a4c:	00b766b3          	or	a3,a4,a1
f9002a50:	1e068663          	beqz	a3,f9002c3c <__adddf3+0x808>
f9002a54:	fff78693          	addi	a3,a5,-1
f9002a58:	0a068e63          	beqz	a3,f9002b14 <__adddf3+0x6e0>
f9002a5c:	7ff00513          	li	a0,2047
f9002a60:	14a78063          	beq	a5,a0,f9002ba0 <__adddf3+0x76c>
f9002a64:	03800793          	li	a5,56
f9002a68:	00100993          	li	s3,1
f9002a6c:	e4d7c6e3          	blt	a5,a3,f90028b8 <__adddf3+0x484>
f9002a70:	00068793          	mv	a5,a3
f9002a74:	e15ff06f          	j	f9002888 <__adddf3+0x454>
f9002a78:	00040e13          	mv	t3,s0
f9002a7c:	7ff00793          	li	a5,2047
f9002a80:	00000713          	li	a4,0
f9002a84:	00000813          	li	a6,0
f9002a88:	b45ff06f          	j	f90025cc <__adddf3+0x198>
f9002a8c:	7ff00793          	li	a5,2047
f9002a90:	fef684e3          	beq	a3,a5,f9002a78 <__adddf3+0x644>
f9002a94:	01e58f33          	add	t5,a1,t5
f9002a98:	00bf35b3          	sltu	a1,t5,a1
f9002a9c:	011707b3          	add	a5,a4,a7
f9002aa0:	00b787b3          	add	a5,a5,a1
f9002aa4:	01f79613          	slli	a2,a5,0x1f
f9002aa8:	001f5f13          	srli	t5,t5,0x1
f9002aac:	01e664b3          	or	s1,a2,t5
f9002ab0:	0017d993          	srli	s3,a5,0x1
f9002ab4:	00068913          	mv	s2,a3
f9002ab8:	ab5ff06f          	j	f900256c <__adddf3+0x138>
f9002abc:	40bf0633          	sub	a2,t5,a1
f9002ac0:	40e887b3          	sub	a5,a7,a4
f9002ac4:	00cf3733          	sltu	a4,t5,a2
f9002ac8:	00060493          	mv	s1,a2
f9002acc:	40e789b3          	sub	s3,a5,a4
f9002ad0:	00068413          	mv	s0,a3
f9002ad4:	a41ff06f          	j	f9002514 <__adddf3+0xe0>
f9002ad8:	00361613          	slli	a2,a2,0x3
f9002adc:	00365613          	srli	a2,a2,0x3
f9002ae0:	00068413          	mv	s0,a3
f9002ae4:	00088713          	mv	a4,a7
f9002ae8:	e25ff06f          	j	f900290c <__adddf3+0x4d8>
f9002aec:	de0312e3          	bnez	t1,f90028d0 <__adddf3+0x49c>
f9002af0:	1c080663          	beqz	a6,f9002cbc <__adddf3+0x888>
f9002af4:	0038d713          	srli	a4,a7,0x3
f9002af8:	00361613          	slli	a2,a2,0x3
f9002afc:	01d89893          	slli	a7,a7,0x1d
f9002b00:	01176733          	or	a4,a4,a7
f9002b04:	00365613          	srli	a2,a2,0x3
f9002b08:	00c76733          	or	a4,a4,a2
f9002b0c:	00068413          	mv	s0,a3
f9002b10:	dddff06f          	j	f90028ec <__adddf3+0x4b8>
f9002b14:	01e58f33          	add	t5,a1,t5
f9002b18:	011708b3          	add	a7,a4,a7
f9002b1c:	00bf35b3          	sltu	a1,t5,a1
f9002b20:	00b889b3          	add	s3,a7,a1
f9002b24:	00899793          	slli	a5,s3,0x8
f9002b28:	000f0493          	mv	s1,t5
f9002b2c:	0e07d463          	bgez	a5,f9002c14 <__adddf3+0x7e0>
f9002b30:	00200913          	li	s2,2
f9002b34:	bd1ff06f          	j	f9002704 <__adddf3+0x2d0>
f9002b38:	41e58f33          	sub	t5,a1,t5
f9002b3c:	411708b3          	sub	a7,a4,a7
f9002b40:	01e5b5b3          	sltu	a1,a1,t5
f9002b44:	000f0493          	mv	s1,t5
f9002b48:	40b889b3          	sub	s3,a7,a1
f9002b4c:	00100913          	li	s2,1
f9002b50:	9b1ff06f          	j	f9002500 <__adddf3+0xcc>
f9002b54:	fe078693          	addi	a3,a5,-32
f9002b58:	02000613          	li	a2,32
f9002b5c:	00d8d6b3          	srl	a3,a7,a3
f9002b60:	00c78a63          	beq	a5,a2,f9002b74 <__adddf3+0x740>
f9002b64:	04000613          	li	a2,64
f9002b68:	40f607b3          	sub	a5,a2,a5
f9002b6c:	00f897b3          	sll	a5,a7,a5
f9002b70:	00ff6f33          	or	t5,t5,a5
f9002b74:	01e039b3          	snez	s3,t5
f9002b78:	00d9e9b3          	or	s3,s3,a3
f9002b7c:	b65ff06f          	j	f90026e0 <__adddf3+0x2ac>
f9002b80:	00351613          	slli	a2,a0,0x3
f9002b84:	00365993          	srli	s3,a2,0x3
f9002b88:	eb5ff06f          	j	f9002a3c <__adddf3+0x608>
f9002b8c:	00361613          	slli	a2,a2,0x3
f9002b90:	00365613          	srli	a2,a2,0x3
f9002b94:	00068413          	mv	s0,a3
f9002b98:	00088713          	mv	a4,a7
f9002b9c:	d41ff06f          	j	f90028dc <__adddf3+0x4a8>
f9002ba0:	00361613          	slli	a2,a2,0x3
f9002ba4:	00365613          	srli	a2,a2,0x3
f9002ba8:	00088713          	mv	a4,a7
f9002bac:	d31ff06f          	j	f90028dc <__adddf3+0x4a8>
f9002bb0:	fe078513          	addi	a0,a5,-32
f9002bb4:	02000613          	li	a2,32
f9002bb8:	00a75533          	srl	a0,a4,a0
f9002bbc:	00c78a63          	beq	a5,a2,f9002bd0 <__adddf3+0x79c>
f9002bc0:	04000613          	li	a2,64
f9002bc4:	40f607b3          	sub	a5,a2,a5
f9002bc8:	00f717b3          	sll	a5,a4,a5
f9002bcc:	00f5e5b3          	or	a1,a1,a5
f9002bd0:	00b03633          	snez	a2,a1
f9002bd4:	00a66633          	or	a2,a2,a0
f9002bd8:	a8dff06f          	j	f9002664 <__adddf3+0x230>
f9002bdc:	fc0682e3          	beqz	a3,f9002ba0 <__adddf3+0x76c>
f9002be0:	01e8ef33          	or	t5,a7,t5
f9002be4:	d00f16e3          	bnez	t5,f90028f0 <__adddf3+0x4bc>
f9002be8:	cedff06f          	j	f90028d4 <__adddf3+0x4a0>
f9002bec:	dc0808e3          	beqz	a6,f90029bc <__adddf3+0x588>
f9002bf0:	00361813          	slli	a6,a2,0x3
f9002bf4:	01d89793          	slli	a5,a7,0x1d
f9002bf8:	00385813          	srli	a6,a6,0x3
f9002bfc:	0038d713          	srli	a4,a7,0x3
f9002c00:	00f86833          	or	a6,a6,a5
f9002c04:	01d77733          	and	a4,a4,t4
f9002c08:	00068e13          	mv	t3,a3
f9002c0c:	00000793          	li	a5,0
f9002c10:	9bdff06f          	j	f90025cc <__adddf3+0x198>
f9002c14:	00100793          	li	a5,1
f9002c18:	c2dff06f          	j	f9002844 <__adddf3+0x410>
f9002c1c:	40bf05b3          	sub	a1,t5,a1
f9002c20:	40e888b3          	sub	a7,a7,a4
f9002c24:	00bf3733          	sltu	a4,t5,a1
f9002c28:	00058493          	mv	s1,a1
f9002c2c:	40e889b3          	sub	s3,a7,a4
f9002c30:	00068413          	mv	s0,a3
f9002c34:	00100913          	li	s2,1
f9002c38:	8c9ff06f          	j	f9002500 <__adddf3+0xcc>
f9002c3c:	00361613          	slli	a2,a2,0x3
f9002c40:	00365613          	srli	a2,a2,0x3
f9002c44:	00088713          	mv	a4,a7
f9002c48:	cc5ff06f          	j	f900290c <__adddf3+0x4d8>
f9002c4c:	00361613          	slli	a2,a2,0x3
f9002c50:	00365993          	srli	s3,a2,0x3
f9002c54:	00088713          	mv	a4,a7
f9002c58:	de5ff06f          	j	f9002a3c <__adddf3+0x608>
f9002c5c:	fe078693          	addi	a3,a5,-32
f9002c60:	02000613          	li	a2,32
f9002c64:	00d756b3          	srl	a3,a4,a3
f9002c68:	00c78a63          	beq	a5,a2,f9002c7c <__adddf3+0x848>
f9002c6c:	04000613          	li	a2,64
f9002c70:	40f607b3          	sub	a5,a2,a5
f9002c74:	00f717b3          	sll	a5,a4,a5
f9002c78:	00f5e5b3          	or	a1,a1,a5
f9002c7c:	00b039b3          	snez	s3,a1
f9002c80:	00d9e9b3          	or	s3,s3,a3
f9002c84:	c35ff06f          	j	f90028b8 <__adddf3+0x484>
f9002c88:	0034d613          	srli	a2,s1,0x3
f9002c8c:	00090793          	mv	a5,s2
f9002c90:	00098713          	mv	a4,s3
f9002c94:	c79ff06f          	j	f900290c <__adddf3+0x4d8>
f9002c98:	02000693          	li	a3,32
f9002c9c:	40f686b3          	sub	a3,a3,a5
f9002ca0:	00000613          	li	a2,0
f9002ca4:	8b5ff06f          	j	f9002558 <__adddf3+0x124>
f9002ca8:	00c9e833          	or	a6,s3,a2
f9002cac:	d00808e3          	beqz	a6,f90029bc <__adddf3+0x588>
f9002cb0:	0039d993          	srli	s3,s3,0x3
f9002cb4:	00060713          	mv	a4,a2
f9002cb8:	d85ff06f          	j	f9002a3c <__adddf3+0x608>
f9002cbc:	00000e13          	li	t3,0
f9002cc0:	7ff00793          	li	a5,2047
f9002cc4:	00080737          	lui	a4,0x80
f9002cc8:	905ff06f          	j	f90025cc <__adddf3+0x198>
f9002ccc:	01d71793          	slli	a5,a4,0x1d
f9002cd0:	00375713          	srli	a4,a4,0x3
f9002cd4:	0107e833          	or	a6,a5,a6
f9002cd8:	01d77733          	and	a4,a4,t4
f9002cdc:	00000793          	li	a5,0
f9002ce0:	8edff06f          	j	f90025cc <__adddf3+0x198>
f9002ce4:	01d71813          	slli	a6,a4,0x1d
f9002ce8:	0035d593          	srli	a1,a1,0x3
f9002cec:	00b86833          	or	a6,a6,a1
f9002cf0:	00375713          	srli	a4,a4,0x3
f9002cf4:	00068413          	mv	s0,a3
f9002cf8:	c29ff06f          	j	f9002920 <__adddf3+0x4ec>

f9002cfc <__muldf3>:
f9002cfc:	fd010113          	addi	sp,sp,-48
f9002d00:	0145d793          	srli	a5,a1,0x14
f9002d04:	02812423          	sw	s0,40(sp)
f9002d08:	02912223          	sw	s1,36(sp)
f9002d0c:	03212023          	sw	s2,32(sp)
f9002d10:	01312e23          	sw	s3,28(sp)
f9002d14:	01512a23          	sw	s5,20(sp)
f9002d18:	00c59493          	slli	s1,a1,0xc
f9002d1c:	02112623          	sw	ra,44(sp)
f9002d20:	01412c23          	sw	s4,24(sp)
f9002d24:	01612823          	sw	s6,16(sp)
f9002d28:	01712623          	sw	s7,12(sp)
f9002d2c:	01812423          	sw	s8,8(sp)
f9002d30:	7ff7f793          	andi	a5,a5,2047
f9002d34:	00050413          	mv	s0,a0
f9002d38:	00060a93          	mv	s5,a2
f9002d3c:	00068993          	mv	s3,a3
f9002d40:	00c4d493          	srli	s1,s1,0xc
f9002d44:	01f5d913          	srli	s2,a1,0x1f
f9002d48:	42078463          	beqz	a5,f9003170 <__muldf3+0x474>
f9002d4c:	7ff00713          	li	a4,2047
f9002d50:	0ae78663          	beq	a5,a4,f9002dfc <__muldf3+0x100>
f9002d54:	00349693          	slli	a3,s1,0x3
f9002d58:	01d55713          	srli	a4,a0,0x1d
f9002d5c:	00d76733          	or	a4,a4,a3
f9002d60:	008006b7          	lui	a3,0x800
f9002d64:	00d764b3          	or	s1,a4,a3
f9002d68:	00351a13          	slli	s4,a0,0x3
f9002d6c:	c0178c13          	addi	s8,a5,-1023
f9002d70:	00000b13          	li	s6,0
f9002d74:	00000b93          	li	s7,0
f9002d78:	0149d793          	srli	a5,s3,0x14
f9002d7c:	00c99713          	slli	a4,s3,0xc
f9002d80:	7ff7f793          	andi	a5,a5,2047
f9002d84:	000a8f13          	mv	t5,s5
f9002d88:	00c75413          	srli	s0,a4,0xc
f9002d8c:	01f9d993          	srli	s3,s3,0x1f
f9002d90:	0a078063          	beqz	a5,f9002e30 <__muldf3+0x134>
f9002d94:	7ff00713          	li	a4,2047
f9002d98:	14e78e63          	beq	a5,a4,f9002ef4 <__muldf3+0x1f8>
f9002d9c:	00341713          	slli	a4,s0,0x3
f9002da0:	01dad593          	srli	a1,s5,0x1d
f9002da4:	00e5e5b3          	or	a1,a1,a4
f9002da8:	c0178793          	addi	a5,a5,-1023
f9002dac:	00800737          	lui	a4,0x800
f9002db0:	00e5e433          	or	s0,a1,a4
f9002db4:	003a9f13          	slli	t5,s5,0x3
f9002db8:	018788b3          	add	a7,a5,s8
f9002dbc:	00000313          	li	t1,0
f9002dc0:	00a00713          	li	a4,10
f9002dc4:	00188513          	addi	a0,a7,1
f9002dc8:	0b674c63          	blt	a4,s6,f9002e80 <__muldf3+0x184>
f9002dcc:	013945b3          	xor	a1,s2,s3
f9002dd0:	00200793          	li	a5,2
f9002dd4:	00058813          	mv	a6,a1
f9002dd8:	1567c663          	blt	a5,s6,f9002f24 <__muldf3+0x228>
f9002ddc:	fffb0b13          	addi	s6,s6,-1
f9002de0:	00100713          	li	a4,1
f9002de4:	17676063          	bltu	a4,s6,f9002f44 <__muldf3+0x248>
f9002de8:	3cf30a63          	beq	t1,a5,f90031bc <__muldf3+0x4c0>
f9002dec:	00040493          	mv	s1,s0
f9002df0:	000f0a13          	mv	s4,t5
f9002df4:	00030b93          	mv	s7,t1
f9002df8:	09c0006f          	j	f9002e94 <__muldf3+0x198>
f9002dfc:	00a4ea33          	or	s4,s1,a0
f9002e00:	3c0a1863          	bnez	s4,f90031d0 <__muldf3+0x4d4>
f9002e04:	0149d793          	srli	a5,s3,0x14
f9002e08:	00c99713          	slli	a4,s3,0xc
f9002e0c:	7ff7f793          	andi	a5,a5,2047
f9002e10:	00000493          	li	s1,0
f9002e14:	00800b13          	li	s6,8
f9002e18:	7ff00c13          	li	s8,2047
f9002e1c:	00200b93          	li	s7,2
f9002e20:	000a8f13          	mv	t5,s5
f9002e24:	00c75413          	srli	s0,a4,0xc
f9002e28:	01f9d993          	srli	s3,s3,0x1f
f9002e2c:	f60794e3          	bnez	a5,f9002d94 <__muldf3+0x98>
f9002e30:	015467b3          	or	a5,s0,s5
f9002e34:	3c078263          	beqz	a5,f90031f8 <__muldf3+0x4fc>
f9002e38:	4a040063          	beqz	s0,f90032d8 <__muldf3+0x5dc>
f9002e3c:	00040513          	mv	a0,s0
f9002e40:	7b8010ef          	jal	f90045f8 <__clzsi2>
f9002e44:	00050893          	mv	a7,a0
f9002e48:	ff550713          	addi	a4,a0,-11
f9002e4c:	01d00793          	li	a5,29
f9002e50:	ff888f13          	addi	t5,a7,-8
f9002e54:	40e787b3          	sub	a5,a5,a4
f9002e58:	00fad7b3          	srl	a5,s5,a5
f9002e5c:	01e41733          	sll	a4,s0,t5
f9002e60:	00e7e433          	or	s0,a5,a4
f9002e64:	01ea9f33          	sll	t5,s5,t5
f9002e68:	411c08b3          	sub	a7,s8,a7
f9002e6c:	c0d88893          	addi	a7,a7,-1011
f9002e70:	00a00713          	li	a4,10
f9002e74:	00000313          	li	t1,0
f9002e78:	00188513          	addi	a0,a7,1
f9002e7c:	f56758e3          	bge	a4,s6,f9002dcc <__muldf3+0xd0>
f9002e80:	00090593          	mv	a1,s2
f9002e84:	00200793          	li	a5,2
f9002e88:	32fb8a63          	beq	s7,a5,f90031bc <__muldf3+0x4c0>
f9002e8c:	00300793          	li	a5,3
f9002e90:	48fb8c63          	beq	s7,a5,f9003328 <__muldf3+0x62c>
f9002e94:	00100793          	li	a5,1
f9002e98:	00058813          	mv	a6,a1
f9002e9c:	46fb9a63          	bne	s7,a5,f9003310 <__muldf3+0x614>
f9002ea0:	00000793          	li	a5,0
f9002ea4:	00000693          	li	a3,0
f9002ea8:	00000713          	li	a4,0
f9002eac:	02c12083          	lw	ra,44(sp)
f9002eb0:	02812403          	lw	s0,40(sp)
f9002eb4:	01479793          	slli	a5,a5,0x14
f9002eb8:	00d7e7b3          	or	a5,a5,a3
f9002ebc:	01f81693          	slli	a3,a6,0x1f
f9002ec0:	00d7e7b3          	or	a5,a5,a3
f9002ec4:	02412483          	lw	s1,36(sp)
f9002ec8:	02012903          	lw	s2,32(sp)
f9002ecc:	01c12983          	lw	s3,28(sp)
f9002ed0:	01812a03          	lw	s4,24(sp)
f9002ed4:	01412a83          	lw	s5,20(sp)
f9002ed8:	01012b03          	lw	s6,16(sp)
f9002edc:	00c12b83          	lw	s7,12(sp)
f9002ee0:	00812c03          	lw	s8,8(sp)
f9002ee4:	00070513          	mv	a0,a4
f9002ee8:	00078593          	mv	a1,a5
f9002eec:	03010113          	addi	sp,sp,48
f9002ef0:	00008067          	ret
f9002ef4:	01546733          	or	a4,s0,s5
f9002ef8:	7ffc0893          	addi	a7,s8,2047
f9002efc:	30070a63          	beqz	a4,f9003210 <__muldf3+0x514>
f9002f00:	00001737          	lui	a4,0x1
f9002f04:	01394833          	xor	a6,s2,s3
f9002f08:	80070713          	addi	a4,a4,-2048 # 800 <CUSTOM2+0x7a5>
f9002f0c:	003b6b13          	ori	s6,s6,3
f9002f10:	00a00693          	li	a3,10
f9002f14:	00080593          	mv	a1,a6
f9002f18:	00ec0533          	add	a0,s8,a4
f9002f1c:	3966c063          	blt	a3,s6,f900329c <__muldf3+0x5a0>
f9002f20:	00300313          	li	t1,3
f9002f24:	00100613          	li	a2,1
f9002f28:	01661633          	sll	a2,a2,s6
f9002f2c:	53067713          	andi	a4,a2,1328
f9002f30:	f4071ae3          	bnez	a4,f9002e84 <__muldf3+0x188>
f9002f34:	24067793          	andi	a5,a2,576
f9002f38:	3c079463          	bnez	a5,f9003300 <__muldf3+0x604>
f9002f3c:	08867613          	andi	a2,a2,136
f9002f40:	2e061263          	bnez	a2,f9003224 <__muldf3+0x528>
f9002f44:	00010fb7          	lui	t6,0x10
f9002f48:	ffff8e93          	addi	t4,t6,-1 # ffff <__stack_size+0xefff>
f9002f4c:	01da77b3          	and	a5,s4,t4
f9002f50:	010a5693          	srli	a3,s4,0x10
f9002f54:	01df7eb3          	and	t4,t5,t4
f9002f58:	010f5e13          	srli	t3,t5,0x10
f9002f5c:	03d78733          	mul	a4,a5,t4
f9002f60:	03d68333          	mul	t1,a3,t4
f9002f64:	01075593          	srli	a1,a4,0x10
f9002f68:	02fe0633          	mul	a2,t3,a5
f9002f6c:	00660633          	add	a2,a2,t1
f9002f70:	00c585b3          	add	a1,a1,a2
f9002f74:	03c68f33          	mul	t5,a3,t3
f9002f78:	0065f463          	bgeu	a1,t1,f9002f80 <__muldf3+0x284>
f9002f7c:	01ff0f33          	add	t5,t5,t6
f9002f80:	000103b7          	lui	t2,0x10
f9002f84:	fff38613          	addi	a2,t2,-1 # ffff <__stack_size+0xefff>
f9002f88:	00c5f333          	and	t1,a1,a2
f9002f8c:	01045f93          	srli	t6,s0,0x10
f9002f90:	00c77733          	and	a4,a4,a2
f9002f94:	00c47433          	and	s0,s0,a2
f9002f98:	01031313          	slli	t1,t1,0x10
f9002f9c:	028782b3          	mul	t0,a5,s0
f9002fa0:	00e30333          	add	t1,t1,a4
f9002fa4:	0105d593          	srli	a1,a1,0x10
f9002fa8:	02868733          	mul	a4,a3,s0
f9002fac:	0102d613          	srli	a2,t0,0x10
f9002fb0:	02ff87b3          	mul	a5,t6,a5
f9002fb4:	00e787b3          	add	a5,a5,a4
f9002fb8:	00f60633          	add	a2,a2,a5
f9002fbc:	03f687b3          	mul	a5,a3,t6
f9002fc0:	00e67463          	bgeu	a2,a4,f9002fc8 <__muldf3+0x2cc>
f9002fc4:	007787b3          	add	a5,a5,t2
f9002fc8:	00010937          	lui	s2,0x10
f9002fcc:	fff90993          	addi	s3,s2,-1 # ffff <__stack_size+0xefff>
f9002fd0:	01367733          	and	a4,a2,s3
f9002fd4:	0104d393          	srli	t2,s1,0x10
f9002fd8:	0134f6b3          	and	a3,s1,s3
f9002fdc:	0132f2b3          	and	t0,t0,s3
f9002fe0:	01071713          	slli	a4,a4,0x10
f9002fe4:	02de84b3          	mul	s1,t4,a3
f9002fe8:	00570733          	add	a4,a4,t0
f9002fec:	01065613          	srli	a2,a2,0x10
f9002ff0:	00f60633          	add	a2,a2,a5
f9002ff4:	00e585b3          	add	a1,a1,a4
f9002ff8:	02de02b3          	mul	t0,t3,a3
f9002ffc:	0104d793          	srli	a5,s1,0x10
f9003000:	03d38eb3          	mul	t4,t2,t4
f9003004:	01d282b3          	add	t0,t0,t4
f9003008:	005787b3          	add	a5,a5,t0
f900300c:	027e0e33          	mul	t3,t3,t2
f9003010:	01d7f463          	bgeu	a5,t4,f9003018 <__muldf3+0x31c>
f9003014:	012e0e33          	add	t3,t3,s2
f9003018:	000109b7          	lui	s3,0x10
f900301c:	fff98e93          	addi	t4,s3,-1 # ffff <__stack_size+0xefff>
f9003020:	01d7f2b3          	and	t0,a5,t4
f9003024:	0107d793          	srli	a5,a5,0x10
f9003028:	01c787b3          	add	a5,a5,t3
f900302c:	01d4feb3          	and	t4,s1,t4
f9003030:	01029293          	slli	t0,t0,0x10
f9003034:	02d40933          	mul	s2,s0,a3
f9003038:	01d282b3          	add	t0,t0,t4
f900303c:	02838433          	mul	s0,t2,s0
f9003040:	01095e13          	srli	t3,s2,0x10
f9003044:	02df86b3          	mul	a3,t6,a3
f9003048:	008686b3          	add	a3,a3,s0
f900304c:	00de0e33          	add	t3,t3,a3
f9003050:	027f8eb3          	mul	t4,t6,t2
f9003054:	008e7463          	bgeu	t3,s0,f900305c <__muldf3+0x360>
f9003058:	013e8eb3          	add	t4,t4,s3
f900305c:	00010fb7          	lui	t6,0x10
f9003060:	ffff8f93          	addi	t6,t6,-1 # ffff <__stack_size+0xefff>
f9003064:	01fe76b3          	and	a3,t3,t6
f9003068:	01069693          	slli	a3,a3,0x10
f900306c:	01f97933          	and	s2,s2,t6
f9003070:	01e585b3          	add	a1,a1,t5
f9003074:	012686b3          	add	a3,a3,s2
f9003078:	00c68633          	add	a2,a3,a2
f900307c:	00e5b733          	sltu	a4,a1,a4
f9003080:	00e60733          	add	a4,a2,a4
f9003084:	00558f33          	add	t5,a1,t0
f9003088:	00f707b3          	add	a5,a4,a5
f900308c:	00bf35b3          	sltu	a1,t5,a1
f9003090:	00b785b3          	add	a1,a5,a1
f9003094:	00d636b3          	sltu	a3,a2,a3
f9003098:	00c73633          	sltu	a2,a4,a2
f900309c:	00c6e6b3          	or	a3,a3,a2
f90030a0:	00e7b733          	sltu	a4,a5,a4
f90030a4:	010e5e13          	srli	t3,t3,0x10
f90030a8:	00f5b7b3          	sltu	a5,a1,a5
f90030ac:	01c686b3          	add	a3,a3,t3
f90030b0:	00f76733          	or	a4,a4,a5
f90030b4:	009f1793          	slli	a5,t5,0x9
f90030b8:	00d70733          	add	a4,a4,a3
f90030bc:	0067e7b3          	or	a5,a5,t1
f90030c0:	01d70733          	add	a4,a4,t4
f90030c4:	00f037b3          	snez	a5,a5
f90030c8:	017f5613          	srli	a2,t5,0x17
f90030cc:	00971713          	slli	a4,a4,0x9
f90030d0:	0175d693          	srli	a3,a1,0x17
f90030d4:	00c7e7b3          	or	a5,a5,a2
f90030d8:	00959593          	slli	a1,a1,0x9
f90030dc:	00b7ea33          	or	s4,a5,a1
f90030e0:	00771793          	slli	a5,a4,0x7
f90030e4:	00d764b3          	or	s1,a4,a3
f90030e8:	0207d063          	bgez	a5,f9003108 <__muldf3+0x40c>
f90030ec:	001a5713          	srli	a4,s4,0x1
f90030f0:	001a7793          	andi	a5,s4,1
f90030f4:	01f49693          	slli	a3,s1,0x1f
f90030f8:	00f767b3          	or	a5,a4,a5
f90030fc:	00d7ea33          	or	s4,a5,a3
f9003100:	0014d493          	srli	s1,s1,0x1
f9003104:	00050893          	mv	a7,a0
f9003108:	3ff88613          	addi	a2,a7,1023
f900310c:	12c05663          	blez	a2,f9003238 <__muldf3+0x53c>
f9003110:	007a7793          	andi	a5,s4,7
f9003114:	02078063          	beqz	a5,f9003134 <__muldf3+0x438>
f9003118:	00fa7793          	andi	a5,s4,15
f900311c:	00400713          	li	a4,4
f9003120:	00e78a63          	beq	a5,a4,f9003134 <__muldf3+0x438>
f9003124:	004a0713          	addi	a4,s4,4
f9003128:	014737b3          	sltu	a5,a4,s4
f900312c:	00f484b3          	add	s1,s1,a5
f9003130:	00070a13          	mv	s4,a4
f9003134:	00749793          	slli	a5,s1,0x7
f9003138:	0007da63          	bgez	a5,f900314c <__muldf3+0x450>
f900313c:	ff0007b7          	lui	a5,0xff000
f9003140:	fff78793          	addi	a5,a5,-1 # feffffff <__freertos_irq_stack_top+0x5ffa08f>
f9003144:	00f4f4b3          	and	s1,s1,a5
f9003148:	40088613          	addi	a2,a7,1024
f900314c:	7fe00793          	li	a5,2046
f9003150:	1cc7c463          	blt	a5,a2,f9003318 <__muldf3+0x61c>
f9003154:	003a5793          	srli	a5,s4,0x3
f9003158:	01d49713          	slli	a4,s1,0x1d
f900315c:	00949693          	slli	a3,s1,0x9
f9003160:	00f76733          	or	a4,a4,a5
f9003164:	00c6d693          	srli	a3,a3,0xc
f9003168:	7ff67793          	andi	a5,a2,2047
f900316c:	d41ff06f          	j	f9002eac <__muldf3+0x1b0>
f9003170:	00a4ea33          	or	s4,s1,a0
f9003174:	060a0863          	beqz	s4,f90031e4 <__muldf3+0x4e8>
f9003178:	12048e63          	beqz	s1,f90032b4 <__muldf3+0x5b8>
f900317c:	00048513          	mv	a0,s1
f9003180:	478010ef          	jal	f90045f8 <__clzsi2>
f9003184:	00050613          	mv	a2,a0
f9003188:	ff550693          	addi	a3,a0,-11
f900318c:	01d00713          	li	a4,29
f9003190:	ff860793          	addi	a5,a2,-8 # 7ffff8 <__stack_size+0x7feff8>
f9003194:	40d70733          	sub	a4,a4,a3
f9003198:	00e45733          	srl	a4,s0,a4
f900319c:	00f496b3          	sll	a3,s1,a5
f90031a0:	00d764b3          	or	s1,a4,a3
f90031a4:	00f41a33          	sll	s4,s0,a5
f90031a8:	c0d00793          	li	a5,-1011
f90031ac:	40c78c33          	sub	s8,a5,a2
f90031b0:	00000b13          	li	s6,0
f90031b4:	00000b93          	li	s7,0
f90031b8:	bc1ff06f          	j	f9002d78 <__muldf3+0x7c>
f90031bc:	00058813          	mv	a6,a1
f90031c0:	7ff00793          	li	a5,2047
f90031c4:	00000693          	li	a3,0
f90031c8:	00000713          	li	a4,0
f90031cc:	ce1ff06f          	j	f9002eac <__muldf3+0x1b0>
f90031d0:	00050a13          	mv	s4,a0
f90031d4:	00c00b13          	li	s6,12
f90031d8:	7ff00c13          	li	s8,2047
f90031dc:	00300b93          	li	s7,3
f90031e0:	b99ff06f          	j	f9002d78 <__muldf3+0x7c>
f90031e4:	00000493          	li	s1,0
f90031e8:	00400b13          	li	s6,4
f90031ec:	00000c13          	li	s8,0
f90031f0:	00100b93          	li	s7,1
f90031f4:	b85ff06f          	j	f9002d78 <__muldf3+0x7c>
f90031f8:	001b6b13          	ori	s6,s6,1
f90031fc:	000c0893          	mv	a7,s8
f9003200:	00000413          	li	s0,0
f9003204:	00000f13          	li	t5,0
f9003208:	00100313          	li	t1,1
f900320c:	bb5ff06f          	j	f9002dc0 <__muldf3+0xc4>
f9003210:	002b6b13          	ori	s6,s6,2
f9003214:	00000413          	li	s0,0
f9003218:	00000f13          	li	t5,0
f900321c:	00200313          	li	t1,2
f9003220:	ba1ff06f          	j	f9002dc0 <__muldf3+0xc4>
f9003224:	00040493          	mv	s1,s0
f9003228:	000f0a13          	mv	s4,t5
f900322c:	00030b93          	mv	s7,t1
f9003230:	00098593          	mv	a1,s3
f9003234:	c51ff06f          	j	f9002e84 <__muldf3+0x188>
f9003238:	00100713          	li	a4,1
f900323c:	10061063          	bnez	a2,f900333c <__muldf3+0x640>
f9003240:	41e88893          	addi	a7,a7,1054
f9003244:	011a1633          	sll	a2,s4,a7
f9003248:	00c03633          	snez	a2,a2
f900324c:	011498b3          	sll	a7,s1,a7
f9003250:	00ea57b3          	srl	a5,s4,a4
f9003254:	01166633          	or	a2,a2,a7
f9003258:	00f66633          	or	a2,a2,a5
f900325c:	00767793          	andi	a5,a2,7
f9003260:	00e4d5b3          	srl	a1,s1,a4
f9003264:	02078063          	beqz	a5,f9003284 <__muldf3+0x588>
f9003268:	00f67793          	andi	a5,a2,15
f900326c:	00400713          	li	a4,4
f9003270:	00e78a63          	beq	a5,a4,f9003284 <__muldf3+0x588>
f9003274:	00460793          	addi	a5,a2,4
f9003278:	00c7b633          	sltu	a2,a5,a2
f900327c:	00c585b3          	add	a1,a1,a2
f9003280:	00078613          	mv	a2,a5
f9003284:	00859513          	slli	a0,a1,0x8
f9003288:	00100793          	li	a5,1
f900328c:	00000693          	li	a3,0
f9003290:	00000713          	li	a4,0
f9003294:	c0054ce3          	bltz	a0,f9002eac <__muldf3+0x1b0>
f9003298:	10c0006f          	j	f90033a4 <__muldf3+0x6a8>
f900329c:	00f00713          	li	a4,15
f90032a0:	12eb1063          	bne	s6,a4,f90033c0 <__muldf3+0x6c4>
f90032a4:	00000813          	li	a6,0
f90032a8:	000806b7          	lui	a3,0x80
f90032ac:	00000713          	li	a4,0
f90032b0:	bfdff06f          	j	f9002eac <__muldf3+0x1b0>
f90032b4:	344010ef          	jal	f90045f8 <__clzsi2>
f90032b8:	01550693          	addi	a3,a0,21
f90032bc:	01c00793          	li	a5,28
f90032c0:	02050613          	addi	a2,a0,32
f90032c4:	ecd7d4e3          	bge	a5,a3,f900318c <__muldf3+0x490>
f90032c8:	ff850513          	addi	a0,a0,-8
f90032cc:	00000a13          	li	s4,0
f90032d0:	00a414b3          	sll	s1,s0,a0
f90032d4:	ed5ff06f          	j	f90031a8 <__muldf3+0x4ac>
f90032d8:	000a8513          	mv	a0,s5
f90032dc:	31c010ef          	jal	f90045f8 <__clzsi2>
f90032e0:	01550713          	addi	a4,a0,21
f90032e4:	01c00793          	li	a5,28
f90032e8:	02050893          	addi	a7,a0,32
f90032ec:	b6e7d0e3          	bge	a5,a4,f9002e4c <__muldf3+0x150>
f90032f0:	ff850513          	addi	a0,a0,-8
f90032f4:	00000f13          	li	t5,0
f90032f8:	00aa9433          	sll	s0,s5,a0
f90032fc:	b6dff06f          	j	f9002e68 <__muldf3+0x16c>
f9003300:	00000813          	li	a6,0
f9003304:	7ff00793          	li	a5,2047
f9003308:	000806b7          	lui	a3,0x80
f900330c:	ba1ff06f          	j	f9002eac <__muldf3+0x1b0>
f9003310:	00050893          	mv	a7,a0
f9003314:	df5ff06f          	j	f9003108 <__muldf3+0x40c>
f9003318:	7ff00793          	li	a5,2047
f900331c:	00000693          	li	a3,0
f9003320:	00000713          	li	a4,0
f9003324:	b89ff06f          	j	f9002eac <__muldf3+0x1b0>
f9003328:	00000813          	li	a6,0
f900332c:	7ff00793          	li	a5,2047
f9003330:	000806b7          	lui	a3,0x80
f9003334:	00000713          	li	a4,0
f9003338:	b75ff06f          	j	f9002eac <__muldf3+0x1b0>
f900333c:	40c70733          	sub	a4,a4,a2
f9003340:	03800793          	li	a5,56
f9003344:	b4e7cee3          	blt	a5,a4,f9002ea0 <__muldf3+0x1a4>
f9003348:	01f00793          	li	a5,31
f900334c:	eee7dae3          	bge	a5,a4,f9003240 <__muldf3+0x544>
f9003350:	fe100793          	li	a5,-31
f9003354:	40c787b3          	sub	a5,a5,a2
f9003358:	02000693          	li	a3,32
f900335c:	00f4d7b3          	srl	a5,s1,a5
f9003360:	00d70863          	beq	a4,a3,f9003370 <__muldf3+0x674>
f9003364:	43e88893          	addi	a7,a7,1086
f9003368:	011498b3          	sll	a7,s1,a7
f900336c:	011a6a33          	or	s4,s4,a7
f9003370:	01403633          	snez	a2,s4
f9003374:	00f66633          	or	a2,a2,a5
f9003378:	00767713          	andi	a4,a2,7
f900337c:	00000693          	li	a3,0
f9003380:	02070863          	beqz	a4,f90033b0 <__muldf3+0x6b4>
f9003384:	00f67793          	andi	a5,a2,15
f9003388:	00400713          	li	a4,4
f900338c:	00000593          	li	a1,0
f9003390:	00e78a63          	beq	a5,a4,f90033a4 <__muldf3+0x6a8>
f9003394:	00460793          	addi	a5,a2,4
f9003398:	00c7b633          	sltu	a2,a5,a2
f900339c:	00c035b3          	snez	a1,a2
f90033a0:	00078613          	mv	a2,a5
f90033a4:	00959693          	slli	a3,a1,0x9
f90033a8:	01d59713          	slli	a4,a1,0x1d
f90033ac:	00c6d693          	srli	a3,a3,0xc
f90033b0:	00365613          	srli	a2,a2,0x3
f90033b4:	00e66733          	or	a4,a2,a4
f90033b8:	00000793          	li	a5,0
f90033bc:	af1ff06f          	j	f9002eac <__muldf3+0x1b0>
f90033c0:	00040493          	mv	s1,s0
f90033c4:	000a8a13          	mv	s4,s5
f90033c8:	00300b93          	li	s7,3
f90033cc:	00098593          	mv	a1,s3
f90033d0:	ab5ff06f          	j	f9002e84 <__muldf3+0x188>

f90033d4 <__fixdfsi>:
f90033d4:	0145d793          	srli	a5,a1,0x14
f90033d8:	001006b7          	lui	a3,0x100
f90033dc:	fff68713          	addi	a4,a3,-1 # fffff <__stack_size+0xfefff>
f90033e0:	7ff7f793          	andi	a5,a5,2047
f90033e4:	3fe00613          	li	a2,1022
f90033e8:	00b77733          	and	a4,a4,a1
f90033ec:	01f5d593          	srli	a1,a1,0x1f
f90033f0:	00f65e63          	bge	a2,a5,f900340c <__fixdfsi+0x38>
f90033f4:	41d00613          	li	a2,1053
f90033f8:	00f65e63          	bge	a2,a5,f9003414 <__fixdfsi+0x40>
f90033fc:	80000537          	lui	a0,0x80000
f9003400:	fff50513          	addi	a0,a0,-1 # 7fffffff <__stack_size+0x7fffefff>
f9003404:	00a58533          	add	a0,a1,a0
f9003408:	00008067          	ret
f900340c:	00000513          	li	a0,0
f9003410:	00008067          	ret
f9003414:	43300613          	li	a2,1075
f9003418:	40f60633          	sub	a2,a2,a5
f900341c:	01f00813          	li	a6,31
f9003420:	00d76733          	or	a4,a4,a3
f9003424:	02c85063          	bge	a6,a2,f9003444 <__fixdfsi+0x70>
f9003428:	41300693          	li	a3,1043
f900342c:	40f687b3          	sub	a5,a3,a5
f9003430:	00f75733          	srl	a4,a4,a5
f9003434:	40e00533          	neg	a0,a4
f9003438:	fc059ce3          	bnez	a1,f9003410 <__fixdfsi+0x3c>
f900343c:	00070513          	mv	a0,a4
f9003440:	00008067          	ret
f9003444:	bed78793          	addi	a5,a5,-1043
f9003448:	00f71733          	sll	a4,a4,a5
f900344c:	00c55533          	srl	a0,a0,a2
f9003450:	00a76733          	or	a4,a4,a0
f9003454:	fe1ff06f          	j	f9003434 <__fixdfsi+0x60>

f9003458 <__floatsidf>:
f9003458:	ff010113          	addi	sp,sp,-16
f900345c:	00112623          	sw	ra,12(sp)
f9003460:	00812423          	sw	s0,8(sp)
f9003464:	00912223          	sw	s1,4(sp)
f9003468:	04050a63          	beqz	a0,f90034bc <__floatsidf+0x64>
f900346c:	41f55713          	srai	a4,a0,0x1f
f9003470:	00a744b3          	xor	s1,a4,a0
f9003474:	40e484b3          	sub	s1,s1,a4
f9003478:	00050793          	mv	a5,a0
f900347c:	00048513          	mv	a0,s1
f9003480:	01f7d413          	srli	s0,a5,0x1f
f9003484:	174010ef          	jal	f90045f8 <__clzsi2>
f9003488:	41e00793          	li	a5,1054
f900348c:	40a787b3          	sub	a5,a5,a0
f9003490:	00a00713          	li	a4,10
f9003494:	7ff7f793          	andi	a5,a5,2047
f9003498:	06a74063          	blt	a4,a0,f90034f8 <__floatsidf+0xa0>
f900349c:	00b00713          	li	a4,11
f90034a0:	40a70733          	sub	a4,a4,a0
f90034a4:	00e4d733          	srl	a4,s1,a4
f90034a8:	01550513          	addi	a0,a0,21
f90034ac:	00c71713          	slli	a4,a4,0xc
f90034b0:	00a494b3          	sll	s1,s1,a0
f90034b4:	00c75713          	srli	a4,a4,0xc
f90034b8:	0140006f          	j	f90034cc <__floatsidf+0x74>
f90034bc:	00000413          	li	s0,0
f90034c0:	00000793          	li	a5,0
f90034c4:	00000713          	li	a4,0
f90034c8:	00000493          	li	s1,0
f90034cc:	01479793          	slli	a5,a5,0x14
f90034d0:	01f41413          	slli	s0,s0,0x1f
f90034d4:	00e7e7b3          	or	a5,a5,a4
f90034d8:	00c12083          	lw	ra,12(sp)
f90034dc:	0087e7b3          	or	a5,a5,s0
f90034e0:	00812403          	lw	s0,8(sp)
f90034e4:	00048513          	mv	a0,s1
f90034e8:	00078593          	mv	a1,a5
f90034ec:	00412483          	lw	s1,4(sp)
f90034f0:	01010113          	addi	sp,sp,16
f90034f4:	00008067          	ret
f90034f8:	ff550513          	addi	a0,a0,-11
f90034fc:	00a49733          	sll	a4,s1,a0
f9003500:	00c71713          	slli	a4,a4,0xc
f9003504:	00c75713          	srli	a4,a4,0xc
f9003508:	00000493          	li	s1,0
f900350c:	fc1ff06f          	j	f90034cc <__floatsidf+0x74>

f9003510 <__addsf3>:
f9003510:	008007b7          	lui	a5,0x800
f9003514:	ff010113          	addi	sp,sp,-16
f9003518:	01755693          	srli	a3,a0,0x17
f900351c:	0175d713          	srli	a4,a1,0x17
f9003520:	fff78793          	addi	a5,a5,-1 # 7fffff <__stack_size+0x7fefff>
f9003524:	00a7f633          	and	a2,a5,a0
f9003528:	0ff77813          	zext.b	a6,a4
f900352c:	00812423          	sw	s0,8(sp)
f9003530:	01212023          	sw	s2,0(sp)
f9003534:	01f55413          	srli	s0,a0,0x1f
f9003538:	0ff6f913          	zext.b	s2,a3
f900353c:	00b7f533          	and	a0,a5,a1
f9003540:	00112623          	sw	ra,12(sp)
f9003544:	01f5d593          	srli	a1,a1,0x1f
f9003548:	00060693          	mv	a3,a2
f900354c:	00040893          	mv	a7,s0
f9003550:	00361713          	slli	a4,a2,0x3
f9003554:	00351e13          	slli	t3,a0,0x3
f9003558:	41090333          	sub	t1,s2,a6
f900355c:	04b40863          	beq	s0,a1,f90035ac <__addsf3+0x9c>
f9003560:	02605263          	blez	t1,f9003584 <__addsf3+0x74>
f9003564:	06081863          	bnez	a6,f90035d4 <__addsf3+0xc4>
f9003568:	1e0e0463          	beqz	t3,f9003750 <__addsf3+0x240>
f900356c:	fff30793          	addi	a5,t1,-1
f9003570:	3c078e63          	beqz	a5,f900394c <__addsf3+0x43c>
f9003574:	0ff00693          	li	a3,255
f9003578:	1ed30463          	beq	t1,a3,f9003760 <__addsf3+0x250>
f900357c:	00078313          	mv	t1,a5
f9003580:	0640006f          	j	f90035e4 <__addsf3+0xd4>
f9003584:	14030463          	beqz	t1,f90036cc <__addsf3+0x1bc>
f9003588:	41280333          	sub	t1,a6,s2
f900358c:	28091263          	bnez	s2,f9003810 <__addsf3+0x300>
f9003590:	1a070c63          	beqz	a4,f9003748 <__addsf3+0x238>
f9003594:	fff30793          	addi	a5,t1,-1
f9003598:	3e078263          	beqz	a5,f900397c <__addsf3+0x46c>
f900359c:	0ff00693          	li	a3,255
f90035a0:	3ad30063          	beq	t1,a3,f9003940 <__addsf3+0x430>
f90035a4:	00078313          	mv	t1,a5
f90035a8:	2780006f          	j	f9003820 <__addsf3+0x310>
f90035ac:	1e605063          	blez	t1,f900378c <__addsf3+0x27c>
f90035b0:	16080463          	beqz	a6,f9003718 <__addsf3+0x208>
f90035b4:	0ff00793          	li	a5,255
f90035b8:	1af90463          	beq	s2,a5,f9003760 <__addsf3+0x250>
f90035bc:	040007b7          	lui	a5,0x4000
f90035c0:	00fe6e33          	or	t3,t3,a5
f90035c4:	01b00793          	li	a5,27
f90035c8:	2a67da63          	bge	a5,t1,f900387c <__addsf3+0x36c>
f90035cc:	00170713          	addi	a4,a4,1
f90035d0:	0900006f          	j	f9003660 <__addsf3+0x150>
f90035d4:	0ff00793          	li	a5,255
f90035d8:	18f90463          	beq	s2,a5,f9003760 <__addsf3+0x250>
f90035dc:	040007b7          	lui	a5,0x4000
f90035e0:	00fe6e33          	or	t3,t3,a5
f90035e4:	01b00693          	li	a3,27
f90035e8:	00100793          	li	a5,1
f90035ec:	0066ce63          	blt	a3,t1,f9003608 <__addsf3+0xf8>
f90035f0:	02000793          	li	a5,32
f90035f4:	406787b3          	sub	a5,a5,t1
f90035f8:	00fe17b3          	sll	a5,t3,a5
f90035fc:	006e56b3          	srl	a3,t3,t1
f9003600:	00f037b3          	snez	a5,a5
f9003604:	00f6e7b3          	or	a5,a3,a5
f9003608:	40f70733          	sub	a4,a4,a5
f900360c:	00571793          	slli	a5,a4,0x5
f9003610:	1607d863          	bgez	a5,f9003780 <__addsf3+0x270>
f9003614:	00912223          	sw	s1,4(sp)
f9003618:	040004b7          	lui	s1,0x4000
f900361c:	fff48493          	addi	s1,s1,-1 # 3ffffff <__stack_size+0x3ffefff>
f9003620:	009774b3          	and	s1,a4,s1
f9003624:	00048513          	mv	a0,s1
f9003628:	7d1000ef          	jal	f90045f8 <__clzsi2>
f900362c:	ffb50513          	addi	a0,a0,-5
f9003630:	00a494b3          	sll	s1,s1,a0
f9003634:	19254063          	blt	a0,s2,f90037b4 <__addsf3+0x2a4>
f9003638:	41250533          	sub	a0,a0,s2
f900363c:	00150513          	addi	a0,a0,1
f9003640:	02000713          	li	a4,32
f9003644:	40a70733          	sub	a4,a4,a0
f9003648:	00e49733          	sll	a4,s1,a4
f900364c:	00e03733          	snez	a4,a4
f9003650:	00a4d4b3          	srl	s1,s1,a0
f9003654:	00e4e733          	or	a4,s1,a4
f9003658:	00412483          	lw	s1,4(sp)
f900365c:	00000913          	li	s2,0
f9003660:	00777793          	andi	a5,a4,7
f9003664:	00078a63          	beqz	a5,f9003678 <__addsf3+0x168>
f9003668:	00f77793          	andi	a5,a4,15
f900366c:	00400613          	li	a2,4
f9003670:	00c78463          	beq	a5,a2,f9003678 <__addsf3+0x168>
f9003674:	00470713          	addi	a4,a4,4
f9003678:	00571793          	slli	a5,a4,0x5
f900367c:	0c07dc63          	bgez	a5,f9003754 <__addsf3+0x244>
f9003680:	00190793          	addi	a5,s2,1
f9003684:	0ff00693          	li	a3,255
f9003688:	00040893          	mv	a7,s0
f900368c:	0ed78463          	beq	a5,a3,f9003774 <__addsf3+0x264>
f9003690:	fc0006b7          	lui	a3,0xfc000
f9003694:	fff68693          	addi	a3,a3,-1 # fbffffff <__freertos_irq_stack_top+0x2ffa08f>
f9003698:	00d776b3          	and	a3,a4,a3
f900369c:	0ff7f513          	zext.b	a0,a5
f90036a0:	00669693          	slli	a3,a3,0x6
f90036a4:	0096d693          	srli	a3,a3,0x9
f90036a8:	00c12083          	lw	ra,12(sp)
f90036ac:	00812403          	lw	s0,8(sp)
f90036b0:	01751513          	slli	a0,a0,0x17
f90036b4:	00d56533          	or	a0,a0,a3
f90036b8:	01f89793          	slli	a5,a7,0x1f
f90036bc:	00012903          	lw	s2,0(sp)
f90036c0:	00f56533          	or	a0,a0,a5
f90036c4:	01010113          	addi	sp,sp,16
f90036c8:	00008067          	ret
f90036cc:	00190613          	addi	a2,s2,1
f90036d0:	0fe67613          	andi	a2,a2,254
f90036d4:	18061063          	bnez	a2,f9003854 <__addsf3+0x344>
f90036d8:	06091063          	bnez	s2,f9003738 <__addsf3+0x228>
f90036dc:	2a070863          	beqz	a4,f900398c <__addsf3+0x47c>
f90036e0:	00000513          	li	a0,0
f90036e4:	fc0e02e3          	beqz	t3,f90036a8 <__addsf3+0x198>
f90036e8:	41c706b3          	sub	a3,a4,t3
f90036ec:	00569613          	slli	a2,a3,0x5
f90036f0:	2a065e63          	bgez	a2,f90039ac <__addsf3+0x49c>
f90036f4:	40ee06b3          	sub	a3,t3,a4
f90036f8:	00569713          	slli	a4,a3,0x5
f90036fc:	2c075863          	bgez	a4,f90039cc <__addsf3+0x4bc>
f9003700:	fc0007b7          	lui	a5,0xfc000
f9003704:	fff78793          	addi	a5,a5,-1 # fbffffff <__freertos_irq_stack_top+0x2ffa08f>
f9003708:	00f6f6b3          	and	a3,a3,a5
f900370c:	00058893          	mv	a7,a1
f9003710:	00100513          	li	a0,1
f9003714:	f8dff06f          	j	f90036a0 <__addsf3+0x190>
f9003718:	020e0c63          	beqz	t3,f9003750 <__addsf3+0x240>
f900371c:	fff30793          	addi	a5,t1,-1
f9003720:	1e078a63          	beqz	a5,f9003914 <__addsf3+0x404>
f9003724:	0ff00693          	li	a3,255
f9003728:	02d30c63          	beq	t1,a3,f9003760 <__addsf3+0x250>
f900372c:	00078313          	mv	t1,a5
f9003730:	e95ff06f          	j	f90035c4 <__addsf3+0xb4>
f9003734:	20070863          	beqz	a4,f9003944 <__addsf3+0x434>
f9003738:	00000893          	li	a7,0
f900373c:	0ff00513          	li	a0,255
f9003740:	004006b7          	lui	a3,0x400
f9003744:	f65ff06f          	j	f90036a8 <__addsf3+0x198>
f9003748:	00058413          	mv	s0,a1
f900374c:	000e0713          	mv	a4,t3
f9003750:	00030913          	mv	s2,t1
f9003754:	0ff00793          	li	a5,255
f9003758:	00375613          	srli	a2,a4,0x3
f900375c:	1cf91863          	bne	s2,a5,f900392c <__addsf3+0x41c>
f9003760:	fc061ce3          	bnez	a2,f9003738 <__addsf3+0x228>
f9003764:	00040893          	mv	a7,s0
f9003768:	0ff00513          	li	a0,255
f900376c:	00000693          	li	a3,0
f9003770:	f39ff06f          	j	f90036a8 <__addsf3+0x198>
f9003774:	0ff00513          	li	a0,255
f9003778:	00000693          	li	a3,0
f900377c:	f2dff06f          	j	f90036a8 <__addsf3+0x198>
f9003780:	00777793          	andi	a5,a4,7
f9003784:	ee0792e3          	bnez	a5,f9003668 <__addsf3+0x158>
f9003788:	fcdff06f          	j	f9003754 <__addsf3+0x244>
f900378c:	04030063          	beqz	t1,f90037cc <__addsf3+0x2bc>
f9003790:	41280333          	sub	t1,a6,s2
f9003794:	12091c63          	bnez	s2,f90038cc <__addsf3+0x3bc>
f9003798:	fa070ae3          	beqz	a4,f900374c <__addsf3+0x23c>
f900379c:	fff30793          	addi	a5,t1,-1
f90037a0:	16078a63          	beqz	a5,f9003914 <__addsf3+0x404>
f90037a4:	0ff00693          	li	a3,255
f90037a8:	18d30e63          	beq	t1,a3,f9003944 <__addsf3+0x434>
f90037ac:	00078313          	mv	t1,a5
f90037b0:	12c0006f          	j	f90038dc <__addsf3+0x3cc>
f90037b4:	fc000737          	lui	a4,0xfc000
f90037b8:	fff70713          	addi	a4,a4,-1 # fbffffff <__freertos_irq_stack_top+0x2ffa08f>
f90037bc:	00e4f733          	and	a4,s1,a4
f90037c0:	40a90933          	sub	s2,s2,a0
f90037c4:	00412483          	lw	s1,4(sp)
f90037c8:	e99ff06f          	j	f9003660 <__addsf3+0x150>
f90037cc:	00190613          	addi	a2,s2,1
f90037d0:	0fe67593          	andi	a1,a2,254
f90037d4:	10059e63          	bnez	a1,f90038f0 <__addsf3+0x3e0>
f90037d8:	f4091ee3          	bnez	s2,f9003734 <__addsf3+0x224>
f90037dc:	1c070263          	beqz	a4,f90039a0 <__addsf3+0x490>
f90037e0:	00000513          	li	a0,0
f90037e4:	ec0e02e3          	beqz	t3,f90036a8 <__addsf3+0x198>
f90037e8:	01c70e33          	add	t3,a4,t3
f90037ec:	005e1713          	slli	a4,t3,0x5
f90037f0:	003e5693          	srli	a3,t3,0x3
f90037f4:	1c075063          	bgez	a4,f90039b4 <__addsf3+0x4a4>
f90037f8:	1f800737          	lui	a4,0x1f800
f90037fc:	fff70713          	addi	a4,a4,-1 # 1f7fffff <__stack_size+0x1f7fefff>
f9003800:	00e6f6b3          	and	a3,a3,a4
f9003804:	00f6f6b3          	and	a3,a3,a5
f9003808:	00100513          	li	a0,1
f900380c:	e9dff06f          	j	f90036a8 <__addsf3+0x198>
f9003810:	0ff00793          	li	a5,255
f9003814:	12f80663          	beq	a6,a5,f9003940 <__addsf3+0x430>
f9003818:	040007b7          	lui	a5,0x4000
f900381c:	00f76733          	or	a4,a4,a5
f9003820:	01b00693          	li	a3,27
f9003824:	00100793          	li	a5,1
f9003828:	0066ce63          	blt	a3,t1,f9003844 <__addsf3+0x334>
f900382c:	02000793          	li	a5,32
f9003830:	406787b3          	sub	a5,a5,t1
f9003834:	00f717b3          	sll	a5,a4,a5
f9003838:	00f037b3          	snez	a5,a5
f900383c:	00675733          	srl	a4,a4,t1
f9003840:	00f767b3          	or	a5,a4,a5
f9003844:	40fe0733          	sub	a4,t3,a5
f9003848:	00080913          	mv	s2,a6
f900384c:	00058413          	mv	s0,a1
f9003850:	dbdff06f          	j	f900360c <__addsf3+0xfc>
f9003854:	00912223          	sw	s1,4(sp)
f9003858:	41c704b3          	sub	s1,a4,t3
f900385c:	00549793          	slli	a5,s1,0x5
f9003860:	0a07c463          	bltz	a5,f9003908 <__addsf3+0x3f8>
f9003864:	dc0490e3          	bnez	s1,f9003624 <__addsf3+0x114>
f9003868:	00412483          	lw	s1,4(sp)
f900386c:	00000893          	li	a7,0
f9003870:	00000513          	li	a0,0
f9003874:	00000693          	li	a3,0
f9003878:	e31ff06f          	j	f90036a8 <__addsf3+0x198>
f900387c:	02000793          	li	a5,32
f9003880:	406787b3          	sub	a5,a5,t1
f9003884:	00fe17b3          	sll	a5,t3,a5
f9003888:	006e5333          	srl	t1,t3,t1
f900388c:	00f037b3          	snez	a5,a5
f9003890:	00f36333          	or	t1,t1,a5
f9003894:	00670733          	add	a4,a4,t1
f9003898:	00571793          	slli	a5,a4,0x5
f900389c:	ee07d2e3          	bgez	a5,f9003780 <__addsf3+0x270>
f90038a0:	00190913          	addi	s2,s2,1
f90038a4:	0ff00513          	li	a0,255
f90038a8:	00000693          	li	a3,0
f90038ac:	dea90ee3          	beq	s2,a0,f90036a8 <__addsf3+0x198>
f90038b0:	7e0006b7          	lui	a3,0x7e000
f90038b4:	00175793          	srli	a5,a4,0x1
f90038b8:	fff68693          	addi	a3,a3,-1 # 7dffffff <__stack_size+0x7dffefff>
f90038bc:	00177713          	andi	a4,a4,1
f90038c0:	00d7f7b3          	and	a5,a5,a3
f90038c4:	00e7e733          	or	a4,a5,a4
f90038c8:	d99ff06f          	j	f9003660 <__addsf3+0x150>
f90038cc:	0ff00793          	li	a5,255
f90038d0:	06f80a63          	beq	a6,a5,f9003944 <__addsf3+0x434>
f90038d4:	040007b7          	lui	a5,0x4000
f90038d8:	00f76733          	or	a4,a4,a5
f90038dc:	01b00793          	li	a5,27
f90038e0:	0667dc63          	bge	a5,t1,f9003958 <__addsf3+0x448>
f90038e4:	001e0713          	addi	a4,t3,1
f90038e8:	00080913          	mv	s2,a6
f90038ec:	d75ff06f          	j	f9003660 <__addsf3+0x150>
f90038f0:	0ff00793          	li	a5,255
f90038f4:	e8f600e3          	beq	a2,a5,f9003774 <__addsf3+0x264>
f90038f8:	01c70e33          	add	t3,a4,t3
f90038fc:	001e5713          	srli	a4,t3,0x1
f9003900:	00060913          	mv	s2,a2
f9003904:	d5dff06f          	j	f9003660 <__addsf3+0x150>
f9003908:	40ee04b3          	sub	s1,t3,a4
f900390c:	00058413          	mv	s0,a1
f9003910:	d15ff06f          	j	f9003624 <__addsf3+0x114>
f9003914:	01c70733          	add	a4,a4,t3
f9003918:	00571793          	slli	a5,a4,0x5
f900391c:	00200913          	li	s2,2
f9003920:	f807c8e3          	bltz	a5,f90038b0 <__addsf3+0x3a0>
f9003924:	00375613          	srli	a2,a4,0x3
f9003928:	00100913          	li	s2,1
f900392c:	00961613          	slli	a2,a2,0x9
f9003930:	00965693          	srli	a3,a2,0x9
f9003934:	0ff97513          	zext.b	a0,s2
f9003938:	00040893          	mv	a7,s0
f900393c:	d6dff06f          	j	f90036a8 <__addsf3+0x198>
f9003940:	00058413          	mv	s0,a1
f9003944:	00050613          	mv	a2,a0
f9003948:	e19ff06f          	j	f9003760 <__addsf3+0x250>
f900394c:	41c70733          	sub	a4,a4,t3
f9003950:	00100913          	li	s2,1
f9003954:	cb9ff06f          	j	f900360c <__addsf3+0xfc>
f9003958:	02000793          	li	a5,32
f900395c:	406787b3          	sub	a5,a5,t1
f9003960:	00f717b3          	sll	a5,a4,a5
f9003964:	00675333          	srl	t1,a4,t1
f9003968:	00f037b3          	snez	a5,a5
f900396c:	00f36333          	or	t1,t1,a5
f9003970:	01c30733          	add	a4,t1,t3
f9003974:	00080913          	mv	s2,a6
f9003978:	f21ff06f          	j	f9003898 <__addsf3+0x388>
f900397c:	40ee0733          	sub	a4,t3,a4
f9003980:	00058413          	mv	s0,a1
f9003984:	00100913          	li	s2,1
f9003988:	c85ff06f          	j	f900360c <__addsf3+0xfc>
f900398c:	020e0863          	beqz	t3,f90039bc <__addsf3+0x4ac>
f9003990:	00050693          	mv	a3,a0
f9003994:	00058893          	mv	a7,a1
f9003998:	00000513          	li	a0,0
f900399c:	d0dff06f          	j	f90036a8 <__addsf3+0x198>
f90039a0:	00050693          	mv	a3,a0
f90039a4:	00000513          	li	a0,0
f90039a8:	d01ff06f          	j	f90036a8 <__addsf3+0x198>
f90039ac:	02068863          	beqz	a3,f90039dc <__addsf3+0x4cc>
f90039b0:	0036d693          	srli	a3,a3,0x3
f90039b4:	00f6f6b3          	and	a3,a3,a5
f90039b8:	cf1ff06f          	j	f90036a8 <__addsf3+0x198>
f90039bc:	00000893          	li	a7,0
f90039c0:	00000513          	li	a0,0
f90039c4:	00000693          	li	a3,0
f90039c8:	ce1ff06f          	j	f90036a8 <__addsf3+0x198>
f90039cc:	0036d693          	srli	a3,a3,0x3
f90039d0:	00f6f6b3          	and	a3,a3,a5
f90039d4:	00058893          	mv	a7,a1
f90039d8:	cd1ff06f          	j	f90036a8 <__addsf3+0x198>
f90039dc:	00000893          	li	a7,0
f90039e0:	00000693          	li	a3,0
f90039e4:	cc5ff06f          	j	f90036a8 <__addsf3+0x198>

f90039e8 <__gesf2>:
f90039e8:	01755613          	srli	a2,a0,0x17
f90039ec:	00800737          	lui	a4,0x800
f90039f0:	fff70713          	addi	a4,a4,-1 # 7fffff <__stack_size+0x7fefff>
f90039f4:	0175d693          	srli	a3,a1,0x17
f90039f8:	0ff67613          	zext.b	a2,a2
f90039fc:	0ff00813          	li	a6,255
f9003a00:	00a778b3          	and	a7,a4,a0
f9003a04:	01f55793          	srli	a5,a0,0x1f
f9003a08:	00b77733          	and	a4,a4,a1
f9003a0c:	0ff6f513          	zext.b	a0,a3
f9003a10:	01f5d593          	srli	a1,a1,0x1f
f9003a14:	05060063          	beq	a2,a6,f9003a54 <__gesf2+0x6c>
f9003a18:	03050063          	beq	a0,a6,f9003a38 <__gesf2+0x50>
f9003a1c:	04061863          	bnez	a2,f9003a6c <__gesf2+0x84>
f9003a20:	02051063          	bnez	a0,f9003a40 <__gesf2+0x58>
f9003a24:	06070a63          	beqz	a4,f9003a98 <__gesf2+0xb0>
f9003a28:	08089063          	bnez	a7,f9003aa8 <__gesf2+0xc0>
f9003a2c:	00100513          	li	a0,1
f9003a30:	06058063          	beqz	a1,f9003a90 <__gesf2+0xa8>
f9003a34:	00008067          	ret
f9003a38:	06071463          	bnez	a4,f9003aa0 <__gesf2+0xb8>
f9003a3c:	00061463          	bnez	a2,f9003a44 <__gesf2+0x5c>
f9003a40:	fe0886e3          	beqz	a7,f9003a2c <__gesf2+0x44>
f9003a44:	04b78263          	beq	a5,a1,f9003a88 <__gesf2+0xa0>
f9003a48:	04079463          	bnez	a5,f9003a90 <__gesf2+0xa8>
f9003a4c:	00100513          	li	a0,1
f9003a50:	00008067          	ret
f9003a54:	04089663          	bnez	a7,f9003aa0 <__gesf2+0xb8>
f9003a58:	fec518e3          	bne	a0,a2,f9003a48 <__gesf2+0x60>
f9003a5c:	04071263          	bnez	a4,f9003aa0 <__gesf2+0xb8>
f9003a60:	feb794e3          	bne	a5,a1,f9003a48 <__gesf2+0x60>
f9003a64:	00000513          	li	a0,0
f9003a68:	00008067          	ret
f9003a6c:	fc050ee3          	beqz	a0,f9003a48 <__gesf2+0x60>
f9003a70:	fcb79ce3          	bne	a5,a1,f9003a48 <__gesf2+0x60>
f9003a74:	fcc54ae3          	blt	a0,a2,f9003a48 <__gesf2+0x60>
f9003a78:	00a64863          	blt	a2,a0,f9003a88 <__gesf2+0xa0>
f9003a7c:	fd1766e3          	bltu	a4,a7,f9003a48 <__gesf2+0x60>
f9003a80:	00000513          	li	a0,0
f9003a84:	fae8f8e3          	bgeu	a7,a4,f9003a34 <__gesf2+0x4c>
f9003a88:	00100513          	li	a0,1
f9003a8c:	fa0794e3          	bnez	a5,f9003a34 <__gesf2+0x4c>
f9003a90:	fff00513          	li	a0,-1
f9003a94:	00008067          	ret
f9003a98:	fa0898e3          	bnez	a7,f9003a48 <__gesf2+0x60>
f9003a9c:	00008067          	ret
f9003aa0:	ffe00513          	li	a0,-2
f9003aa4:	00008067          	ret
f9003aa8:	fcb78ae3          	beq	a5,a1,f9003a7c <__gesf2+0x94>
f9003aac:	f9dff06f          	j	f9003a48 <__gesf2+0x60>

f9003ab0 <__lesf2>:
f9003ab0:	01755613          	srli	a2,a0,0x17
f9003ab4:	00800737          	lui	a4,0x800
f9003ab8:	fff70713          	addi	a4,a4,-1 # 7fffff <__stack_size+0x7fefff>
f9003abc:	0175d693          	srli	a3,a1,0x17
f9003ac0:	0ff67613          	zext.b	a2,a2
f9003ac4:	0ff00813          	li	a6,255
f9003ac8:	00a778b3          	and	a7,a4,a0
f9003acc:	01f55793          	srli	a5,a0,0x1f
f9003ad0:	00b77733          	and	a4,a4,a1
f9003ad4:	0ff6f513          	zext.b	a0,a3
f9003ad8:	01f5d593          	srli	a1,a1,0x1f
f9003adc:	05060263          	beq	a2,a6,f9003b20 <__lesf2+0x70>
f9003ae0:	03050063          	beq	a0,a6,f9003b00 <__lesf2+0x50>
f9003ae4:	04061c63          	bnez	a2,f9003b3c <__lesf2+0x8c>
f9003ae8:	02051263          	bnez	a0,f9003b0c <__lesf2+0x5c>
f9003aec:	06070e63          	beqz	a4,f9003b68 <__lesf2+0xb8>
f9003af0:	08089463          	bnez	a7,f9003b78 <__lesf2+0xc8>
f9003af4:	00100513          	li	a0,1
f9003af8:	06058463          	beqz	a1,f9003b60 <__lesf2+0xb0>
f9003afc:	00008067          	ret
f9003b00:	00200513          	li	a0,2
f9003b04:	fe071ce3          	bnez	a4,f9003afc <__lesf2+0x4c>
f9003b08:	00061463          	bnez	a2,f9003b10 <__lesf2+0x60>
f9003b0c:	fe0884e3          	beqz	a7,f9003af4 <__lesf2+0x44>
f9003b10:	04b78463          	beq	a5,a1,f9003b58 <__lesf2+0xa8>
f9003b14:	04079663          	bnez	a5,f9003b60 <__lesf2+0xb0>
f9003b18:	00100513          	li	a0,1
f9003b1c:	00008067          	ret
f9003b20:	04089863          	bnez	a7,f9003b70 <__lesf2+0xc0>
f9003b24:	fec518e3          	bne	a0,a2,f9003b14 <__lesf2+0x64>
f9003b28:	00200513          	li	a0,2
f9003b2c:	fc0718e3          	bnez	a4,f9003afc <__lesf2+0x4c>
f9003b30:	feb792e3          	bne	a5,a1,f9003b14 <__lesf2+0x64>
f9003b34:	00000513          	li	a0,0
f9003b38:	00008067          	ret
f9003b3c:	fc050ce3          	beqz	a0,f9003b14 <__lesf2+0x64>
f9003b40:	fcb79ae3          	bne	a5,a1,f9003b14 <__lesf2+0x64>
f9003b44:	fcc548e3          	blt	a0,a2,f9003b14 <__lesf2+0x64>
f9003b48:	00a64863          	blt	a2,a0,f9003b58 <__lesf2+0xa8>
f9003b4c:	fd1764e3          	bltu	a4,a7,f9003b14 <__lesf2+0x64>
f9003b50:	00000513          	li	a0,0
f9003b54:	fae8f4e3          	bgeu	a7,a4,f9003afc <__lesf2+0x4c>
f9003b58:	00100513          	li	a0,1
f9003b5c:	fa0790e3          	bnez	a5,f9003afc <__lesf2+0x4c>
f9003b60:	fff00513          	li	a0,-1
f9003b64:	00008067          	ret
f9003b68:	fa0896e3          	bnez	a7,f9003b14 <__lesf2+0x64>
f9003b6c:	00008067          	ret
f9003b70:	00200513          	li	a0,2
f9003b74:	00008067          	ret
f9003b78:	fcb78ae3          	beq	a5,a1,f9003b4c <__lesf2+0x9c>
f9003b7c:	f99ff06f          	j	f9003b14 <__lesf2+0x64>

f9003b80 <__mulsf3>:
f9003b80:	fd010113          	addi	sp,sp,-48
f9003b84:	01755793          	srli	a5,a0,0x17
f9003b88:	03212023          	sw	s2,32(sp)
f9003b8c:	01412c23          	sw	s4,24(sp)
f9003b90:	02112623          	sw	ra,44(sp)
f9003b94:	00951a13          	slli	s4,a0,0x9
f9003b98:	02812423          	sw	s0,40(sp)
f9003b9c:	02912223          	sw	s1,36(sp)
f9003ba0:	01312e23          	sw	s3,28(sp)
f9003ba4:	01512a23          	sw	s5,20(sp)
f9003ba8:	01612823          	sw	s6,16(sp)
f9003bac:	0ff7f793          	zext.b	a5,a5
f9003bb0:	009a5a13          	srli	s4,s4,0x9
f9003bb4:	01f55913          	srli	s2,a0,0x1f
f9003bb8:	24078063          	beqz	a5,f9003df8 <__mulsf3+0x278>
f9003bbc:	0ff00713          	li	a4,255
f9003bc0:	16e78663          	beq	a5,a4,f9003d2c <__mulsf3+0x1ac>
f9003bc4:	003a1a13          	slli	s4,s4,0x3
f9003bc8:	04000737          	lui	a4,0x4000
f9003bcc:	00ea6a33          	or	s4,s4,a4
f9003bd0:	f8178993          	addi	s3,a5,-127 # 3ffff81 <__stack_size+0x3ffef81>
f9003bd4:	00000493          	li	s1,0
f9003bd8:	00000b13          	li	s6,0
f9003bdc:	0175d793          	srli	a5,a1,0x17
f9003be0:	00959a93          	slli	s5,a1,0x9
f9003be4:	0ff7f793          	zext.b	a5,a5
f9003be8:	009ada93          	srli	s5,s5,0x9
f9003bec:	01f5d413          	srli	s0,a1,0x1f
f9003bf0:	16078263          	beqz	a5,f9003d54 <__mulsf3+0x1d4>
f9003bf4:	0ff00713          	li	a4,255
f9003bf8:	1ce78a63          	beq	a5,a4,f9003dcc <__mulsf3+0x24c>
f9003bfc:	003a9a93          	slli	s5,s5,0x3
f9003c00:	f8178793          	addi	a5,a5,-127
f9003c04:	04000737          	lui	a4,0x4000
f9003c08:	00eaeab3          	or	s5,s5,a4
f9003c0c:	00f989b3          	add	s3,s3,a5
f9003c10:	00000593          	li	a1,0
f9003c14:	00a00793          	li	a5,10
f9003c18:	00198613          	addi	a2,s3,1
f9003c1c:	1497c863          	blt	a5,s1,f9003d6c <__mulsf3+0x1ec>
f9003c20:	00894533          	xor	a0,s2,s0
f9003c24:	00200793          	li	a5,2
f9003c28:	00050693          	mv	a3,a0
f9003c2c:	1e97d863          	bge	a5,s1,f9003e1c <__mulsf3+0x29c>
f9003c30:	00100713          	li	a4,1
f9003c34:	00971733          	sll	a4,a4,s1
f9003c38:	53077793          	andi	a5,a4,1328
f9003c3c:	12079a63          	bnez	a5,f9003d70 <__mulsf3+0x1f0>
f9003c40:	24077793          	andi	a5,a4,576
f9003c44:	26079863          	bnez	a5,f9003eb4 <__mulsf3+0x334>
f9003c48:	08877713          	andi	a4,a4,136
f9003c4c:	24071c63          	bnez	a4,f9003ea4 <__mulsf3+0x324>
f9003c50:	000108b7          	lui	a7,0x10
f9003c54:	fff88793          	addi	a5,a7,-1 # ffff <__stack_size+0xefff>
f9003c58:	010a5593          	srli	a1,s4,0x10
f9003c5c:	010ad813          	srli	a6,s5,0x10
f9003c60:	00fa7a33          	and	s4,s4,a5
f9003c64:	00faf7b3          	and	a5,s5,a5
f9003c68:	03478533          	mul	a0,a5,s4
f9003c6c:	02f587b3          	mul	a5,a1,a5
f9003c70:	01055713          	srli	a4,a0,0x10
f9003c74:	03480a33          	mul	s4,a6,s4
f9003c78:	00fa0a33          	add	s4,s4,a5
f9003c7c:	01470733          	add	a4,a4,s4
f9003c80:	030585b3          	mul	a1,a1,a6
f9003c84:	00f77463          	bgeu	a4,a5,f9003c8c <__mulsf3+0x10c>
f9003c88:	011585b3          	add	a1,a1,a7
f9003c8c:	00010837          	lui	a6,0x10
f9003c90:	fff80813          	addi	a6,a6,-1 # ffff <__stack_size+0xefff>
f9003c94:	010777b3          	and	a5,a4,a6
f9003c98:	01079793          	slli	a5,a5,0x10
f9003c9c:	01057533          	and	a0,a0,a6
f9003ca0:	00a787b3          	add	a5,a5,a0
f9003ca4:	01075713          	srli	a4,a4,0x10
f9003ca8:	00679a13          	slli	s4,a5,0x6
f9003cac:	00b70733          	add	a4,a4,a1
f9003cb0:	01a7d793          	srli	a5,a5,0x1a
f9003cb4:	00671713          	slli	a4,a4,0x6
f9003cb8:	01403a33          	snez	s4,s4
f9003cbc:	00fa6a33          	or	s4,s4,a5
f9003cc0:	00471793          	slli	a5,a4,0x4
f9003cc4:	01476a33          	or	s4,a4,s4
f9003cc8:	0007da63          	bgez	a5,f9003cdc <__mulsf3+0x15c>
f9003ccc:	001a5793          	srli	a5,s4,0x1
f9003cd0:	001a7a13          	andi	s4,s4,1
f9003cd4:	0147ea33          	or	s4,a5,s4
f9003cd8:	00060993          	mv	s3,a2
f9003cdc:	07f98793          	addi	a5,s3,127
f9003ce0:	1ef05263          	blez	a5,f9003ec4 <__mulsf3+0x344>
f9003ce4:	007a7713          	andi	a4,s4,7
f9003ce8:	00070a63          	beqz	a4,f9003cfc <__mulsf3+0x17c>
f9003cec:	00fa7713          	andi	a4,s4,15
f9003cf0:	00400613          	li	a2,4
f9003cf4:	00c70463          	beq	a4,a2,f9003cfc <__mulsf3+0x17c>
f9003cf8:	004a0a13          	addi	s4,s4,4
f9003cfc:	004a1713          	slli	a4,s4,0x4
f9003d00:	00075a63          	bgez	a4,f9003d14 <__mulsf3+0x194>
f9003d04:	f80007b7          	lui	a5,0xf8000
f9003d08:	fff78793          	addi	a5,a5,-1 # f7ffffff <__stack_size+0xf7ffefff>
f9003d0c:	00fa7a33          	and	s4,s4,a5
f9003d10:	08098793          	addi	a5,s3,128
f9003d14:	0fe00713          	li	a4,254
f9003d18:	22f74663          	blt	a4,a5,f9003f44 <__mulsf3+0x3c4>
f9003d1c:	006a1713          	slli	a4,s4,0x6
f9003d20:	00975713          	srli	a4,a4,0x9
f9003d24:	0ff7f793          	zext.b	a5,a5
f9003d28:	06c0006f          	j	f9003d94 <__mulsf3+0x214>
f9003d2c:	160a1463          	bnez	s4,f9003e94 <__mulsf3+0x314>
f9003d30:	0175d793          	srli	a5,a1,0x17
f9003d34:	00959a93          	slli	s5,a1,0x9
f9003d38:	0ff7f793          	zext.b	a5,a5
f9003d3c:	00800493          	li	s1,8
f9003d40:	0ff00993          	li	s3,255
f9003d44:	00200b13          	li	s6,2
f9003d48:	009ada93          	srli	s5,s5,0x9
f9003d4c:	01f5d413          	srli	s0,a1,0x1f
f9003d50:	ea0792e3          	bnez	a5,f9003bf4 <__mulsf3+0x74>
f9003d54:	100a9863          	bnez	s5,f9003e64 <__mulsf3+0x2e4>
f9003d58:	0014e493          	ori	s1,s1,1
f9003d5c:	00a00793          	li	a5,10
f9003d60:	00100593          	li	a1,1
f9003d64:	00198613          	addi	a2,s3,1
f9003d68:	ea97dce3          	bge	a5,s1,f9003c20 <__mulsf3+0xa0>
f9003d6c:	00090513          	mv	a0,s2
f9003d70:	00200793          	li	a5,2
f9003d74:	08fb0c63          	beq	s6,a5,f9003e0c <__mulsf3+0x28c>
f9003d78:	00300793          	li	a5,3
f9003d7c:	12fb0c63          	beq	s6,a5,f9003eb4 <__mulsf3+0x334>
f9003d80:	00100793          	li	a5,1
f9003d84:	00050693          	mv	a3,a0
f9003d88:	1afb1a63          	bne	s6,a5,f9003f3c <__mulsf3+0x3bc>
f9003d8c:	00000793          	li	a5,0
f9003d90:	00000713          	li	a4,0
f9003d94:	02c12083          	lw	ra,44(sp)
f9003d98:	02812403          	lw	s0,40(sp)
f9003d9c:	01779513          	slli	a0,a5,0x17
f9003da0:	00e56533          	or	a0,a0,a4
f9003da4:	01f69793          	slli	a5,a3,0x1f
f9003da8:	02412483          	lw	s1,36(sp)
f9003dac:	02012903          	lw	s2,32(sp)
f9003db0:	01c12983          	lw	s3,28(sp)
f9003db4:	01812a03          	lw	s4,24(sp)
f9003db8:	01412a83          	lw	s5,20(sp)
f9003dbc:	01012b03          	lw	s6,16(sp)
f9003dc0:	00f56533          	or	a0,a0,a5
f9003dc4:	03010113          	addi	sp,sp,48
f9003dc8:	00008067          	ret
f9003dcc:	0ff98713          	addi	a4,s3,255
f9003dd0:	0a0a8a63          	beqz	s5,f9003e84 <__mulsf3+0x304>
f9003dd4:	0034e493          	ori	s1,s1,3
f9003dd8:	00a00693          	li	a3,10
f9003ddc:	10098613          	addi	a2,s3,256
f9003de0:	1496c063          	blt	a3,s1,f9003f20 <__mulsf3+0x3a0>
f9003de4:	008946b3          	xor	a3,s2,s0
f9003de8:	00068513          	mv	a0,a3
f9003dec:	00070993          	mv	s3,a4
f9003df0:	00300593          	li	a1,3
f9003df4:	e3dff06f          	j	f9003c30 <__mulsf3+0xb0>
f9003df8:	040a1063          	bnez	s4,f9003e38 <__mulsf3+0x2b8>
f9003dfc:	00400493          	li	s1,4
f9003e00:	00000993          	li	s3,0
f9003e04:	00100b13          	li	s6,1
f9003e08:	dd5ff06f          	j	f9003bdc <__mulsf3+0x5c>
f9003e0c:	00050693          	mv	a3,a0
f9003e10:	0ff00793          	li	a5,255
f9003e14:	00000713          	li	a4,0
f9003e18:	f7dff06f          	j	f9003d94 <__mulsf3+0x214>
f9003e1c:	fff48493          	addi	s1,s1,-1
f9003e20:	00100713          	li	a4,1
f9003e24:	e29766e3          	bltu	a4,s1,f9003c50 <__mulsf3+0xd0>
f9003e28:	fef582e3          	beq	a1,a5,f9003e0c <__mulsf3+0x28c>
f9003e2c:	000a8a13          	mv	s4,s5
f9003e30:	00058b13          	mv	s6,a1
f9003e34:	f4dff06f          	j	f9003d80 <__mulsf3+0x200>
f9003e38:	000a0513          	mv	a0,s4
f9003e3c:	00b12623          	sw	a1,12(sp)
f9003e40:	7b8000ef          	jal	f90045f8 <__clzsi2>
f9003e44:	ffb50793          	addi	a5,a0,-5
f9003e48:	00fa1a33          	sll	s4,s4,a5
f9003e4c:	f8a00793          	li	a5,-118
f9003e50:	00c12583          	lw	a1,12(sp)
f9003e54:	40a789b3          	sub	s3,a5,a0
f9003e58:	00000493          	li	s1,0
f9003e5c:	00000b13          	li	s6,0
f9003e60:	d7dff06f          	j	f9003bdc <__mulsf3+0x5c>
f9003e64:	000a8513          	mv	a0,s5
f9003e68:	790000ef          	jal	f90045f8 <__clzsi2>
f9003e6c:	ffb50793          	addi	a5,a0,-5
f9003e70:	40a98533          	sub	a0,s3,a0
f9003e74:	00fa9ab3          	sll	s5,s5,a5
f9003e78:	f8a50993          	addi	s3,a0,-118
f9003e7c:	00000593          	li	a1,0
f9003e80:	d95ff06f          	j	f9003c14 <__mulsf3+0x94>
f9003e84:	0024e493          	ori	s1,s1,2
f9003e88:	00070993          	mv	s3,a4
f9003e8c:	00200593          	li	a1,2
f9003e90:	d85ff06f          	j	f9003c14 <__mulsf3+0x94>
f9003e94:	00c00493          	li	s1,12
f9003e98:	0ff00993          	li	s3,255
f9003e9c:	00300b13          	li	s6,3
f9003ea0:	d3dff06f          	j	f9003bdc <__mulsf3+0x5c>
f9003ea4:	000a8a13          	mv	s4,s5
f9003ea8:	00058b13          	mv	s6,a1
f9003eac:	00040513          	mv	a0,s0
f9003eb0:	ec1ff06f          	j	f9003d70 <__mulsf3+0x1f0>
f9003eb4:	00000693          	li	a3,0
f9003eb8:	0ff00793          	li	a5,255
f9003ebc:	00400737          	lui	a4,0x400
f9003ec0:	ed5ff06f          	j	f9003d94 <__mulsf3+0x214>
f9003ec4:	00100613          	li	a2,1
f9003ec8:	00078c63          	beqz	a5,f9003ee0 <__mulsf3+0x360>
f9003ecc:	40f60633          	sub	a2,a2,a5
f9003ed0:	01b00593          	li	a1,27
f9003ed4:	00000793          	li	a5,0
f9003ed8:	00000713          	li	a4,0
f9003edc:	eac5cce3          	blt	a1,a2,f9003d94 <__mulsf3+0x214>
f9003ee0:	09e98713          	addi	a4,s3,158
f9003ee4:	00ea1733          	sll	a4,s4,a4
f9003ee8:	00e03733          	snez	a4,a4
f9003eec:	00ca57b3          	srl	a5,s4,a2
f9003ef0:	00e7e7b3          	or	a5,a5,a4
f9003ef4:	0077f713          	andi	a4,a5,7
f9003ef8:	00070a63          	beqz	a4,f9003f0c <__mulsf3+0x38c>
f9003efc:	00f7f713          	andi	a4,a5,15
f9003f00:	00400613          	li	a2,4
f9003f04:	00c70463          	beq	a4,a2,f9003f0c <__mulsf3+0x38c>
f9003f08:	00478793          	addi	a5,a5,4
f9003f0c:	00579713          	slli	a4,a5,0x5
f9003f10:	04075063          	bgez	a4,f9003f50 <__mulsf3+0x3d0>
f9003f14:	00100793          	li	a5,1
f9003f18:	00000713          	li	a4,0
f9003f1c:	e79ff06f          	j	f9003d94 <__mulsf3+0x214>
f9003f20:	00f00593          	li	a1,15
f9003f24:	00000693          	li	a3,0
f9003f28:	00400737          	lui	a4,0x400
f9003f2c:	000a8a13          	mv	s4,s5
f9003f30:	00300b13          	li	s6,3
f9003f34:	e6b480e3          	beq	s1,a1,f9003d94 <__mulsf3+0x214>
f9003f38:	f75ff06f          	j	f9003eac <__mulsf3+0x32c>
f9003f3c:	00060993          	mv	s3,a2
f9003f40:	d9dff06f          	j	f9003cdc <__mulsf3+0x15c>
f9003f44:	0ff00793          	li	a5,255
f9003f48:	00000713          	li	a4,0
f9003f4c:	e49ff06f          	j	f9003d94 <__mulsf3+0x214>
f9003f50:	00679793          	slli	a5,a5,0x6
f9003f54:	0097d713          	srli	a4,a5,0x9
f9003f58:	00000793          	li	a5,0
f9003f5c:	e39ff06f          	j	f9003d94 <__mulsf3+0x214>

f9003f60 <__subsf3>:
f9003f60:	008007b7          	lui	a5,0x800
f9003f64:	ff010113          	addi	sp,sp,-16
f9003f68:	fff78793          	addi	a5,a5,-1 # 7fffff <__stack_size+0x7fefff>
f9003f6c:	0175d693          	srli	a3,a1,0x17
f9003f70:	00a7f833          	and	a6,a5,a0
f9003f74:	00b7f733          	and	a4,a5,a1
f9003f78:	00812423          	sw	s0,8(sp)
f9003f7c:	00912223          	sw	s1,4(sp)
f9003f80:	01755413          	srli	s0,a0,0x17
f9003f84:	01f55493          	srli	s1,a0,0x1f
f9003f88:	00112623          	sw	ra,12(sp)
f9003f8c:	0ff6f693          	zext.b	a3,a3
f9003f90:	0ff00513          	li	a0,255
f9003f94:	00080613          	mv	a2,a6
f9003f98:	0ff47413          	zext.b	s0,s0
f9003f9c:	00048313          	mv	t1,s1
f9003fa0:	00381793          	slli	a5,a6,0x3
f9003fa4:	01f5d593          	srli	a1,a1,0x1f
f9003fa8:	00371e13          	slli	t3,a4,0x3
f9003fac:	04a68a63          	beq	a3,a0,f9004000 <__subsf3+0xa0>
f9003fb0:	0015c893          	xori	a7,a1,1
f9003fb4:	40d405b3          	sub	a1,s0,a3
f9003fb8:	03148263          	beq	s1,a7,f9003fdc <__subsf3+0x7c>
f9003fbc:	48b05263          	blez	a1,f9004440 <__subsf3+0x4e0>
f9003fc0:	06069663          	bnez	a3,f900402c <__subsf3+0xcc>
f9003fc4:	1c0e0c63          	beqz	t3,f900419c <__subsf3+0x23c>
f9003fc8:	fff58713          	addi	a4,a1,-1
f9003fcc:	3c070c63          	beqz	a4,f90043a4 <__subsf3+0x444>
f9003fd0:	1ca58e63          	beq	a1,a0,f90041ac <__subsf3+0x24c>
f9003fd4:	00070593          	mv	a1,a4
f9003fd8:	0600006f          	j	f9004038 <__subsf3+0xd8>
f9003fdc:	48b05263          	blez	a1,f9004460 <__subsf3+0x500>
f9003fe0:	18068e63          	beqz	a3,f900417c <__subsf3+0x21c>
f9003fe4:	1ca40463          	beq	s0,a0,f90041ac <__subsf3+0x24c>
f9003fe8:	04000737          	lui	a4,0x4000
f9003fec:	00ee6e33          	or	t3,t3,a4
f9003ff0:	01b00713          	li	a4,27
f9003ff4:	2cb75c63          	bge	a4,a1,f90042cc <__subsf3+0x36c>
f9003ff8:	00178793          	addi	a5,a5,1
f9003ffc:	0b80006f          	j	f90040b4 <__subsf3+0x154>
f9004000:	f0140513          	addi	a0,s0,-255
f9004004:	100e1e63          	bnez	t3,f9004120 <__subsf3+0x1c0>
f9004008:	0015c893          	xori	a7,a1,1
f900400c:	29148063          	beq	s1,a7,f900428c <__subsf3+0x32c>
f9004010:	1a050e63          	beqz	a0,f90041cc <__subsf3+0x26c>
f9004014:	00088493          	mv	s1,a7
f9004018:	10040c63          	beqz	s0,f9004130 <__subsf3+0x1d0>
f900401c:	0014f313          	andi	t1,s1,1
f9004020:	0ff00513          	li	a0,255
f9004024:	00000613          	li	a2,0
f9004028:	0d40006f          	j	f90040fc <__subsf3+0x19c>
f900402c:	18a40063          	beq	s0,a0,f90041ac <__subsf3+0x24c>
f9004030:	04000737          	lui	a4,0x4000
f9004034:	00ee6e33          	or	t3,t3,a4
f9004038:	01b00693          	li	a3,27
f900403c:	00100713          	li	a4,1
f9004040:	00b6ce63          	blt	a3,a1,f900405c <__subsf3+0xfc>
f9004044:	02000713          	li	a4,32
f9004048:	40b70733          	sub	a4,a4,a1
f900404c:	00ee1733          	sll	a4,t3,a4
f9004050:	00be56b3          	srl	a3,t3,a1
f9004054:	00e03733          	snez	a4,a4
f9004058:	00e6e733          	or	a4,a3,a4
f900405c:	40e787b3          	sub	a5,a5,a4
f9004060:	00579713          	slli	a4,a5,0x5
f9004064:	14075e63          	bgez	a4,f90041c0 <__subsf3+0x260>
f9004068:	01212023          	sw	s2,0(sp)
f900406c:	04000937          	lui	s2,0x4000
f9004070:	fff90913          	addi	s2,s2,-1 # 3ffffff <__stack_size+0x3ffefff>
f9004074:	0127f933          	and	s2,a5,s2
f9004078:	00090513          	mv	a0,s2
f900407c:	57c000ef          	jal	f90045f8 <__clzsi2>
f9004080:	ffb50513          	addi	a0,a0,-5
f9004084:	00a91933          	sll	s2,s2,a0
f9004088:	18854863          	blt	a0,s0,f9004218 <__subsf3+0x2b8>
f900408c:	40850533          	sub	a0,a0,s0
f9004090:	00150513          	addi	a0,a0,1
f9004094:	02000793          	li	a5,32
f9004098:	40a787b3          	sub	a5,a5,a0
f900409c:	00f917b3          	sll	a5,s2,a5
f90040a0:	00f037b3          	snez	a5,a5
f90040a4:	00a95933          	srl	s2,s2,a0
f90040a8:	00f967b3          	or	a5,s2,a5
f90040ac:	00012903          	lw	s2,0(sp)
f90040b0:	00000413          	li	s0,0
f90040b4:	0077f713          	andi	a4,a5,7
f90040b8:	00070a63          	beqz	a4,f90040cc <__subsf3+0x16c>
f90040bc:	00f7f713          	andi	a4,a5,15
f90040c0:	00400693          	li	a3,4
f90040c4:	00d70463          	beq	a4,a3,f90040cc <__subsf3+0x16c>
f90040c8:	00478793          	addi	a5,a5,4
f90040cc:	00579713          	slli	a4,a5,0x5
f90040d0:	0c075863          	bgez	a4,f90041a0 <__subsf3+0x240>
f90040d4:	00140413          	addi	s0,s0,1
f90040d8:	0ff00713          	li	a4,255
f90040dc:	f4e400e3          	beq	s0,a4,f900401c <__subsf3+0xbc>
f90040e0:	fc000637          	lui	a2,0xfc000
f90040e4:	fff60613          	addi	a2,a2,-1 # fbffffff <__freertos_irq_stack_top+0x2ffa08f>
f90040e8:	00c7f633          	and	a2,a5,a2
f90040ec:	0ff47513          	zext.b	a0,s0
f90040f0:	00661613          	slli	a2,a2,0x6
f90040f4:	00965613          	srli	a2,a2,0x9
f90040f8:	0014f313          	andi	t1,s1,1
f90040fc:	00c12083          	lw	ra,12(sp)
f9004100:	00812403          	lw	s0,8(sp)
f9004104:	01751513          	slli	a0,a0,0x17
f9004108:	00c56533          	or	a0,a0,a2
f900410c:	01f31793          	slli	a5,t1,0x1f
f9004110:	00412483          	lw	s1,4(sp)
f9004114:	00f56533          	or	a0,a0,a5
f9004118:	01010113          	addi	sp,sp,16
f900411c:	00008067          	ret
f9004120:	00058893          	mv	a7,a1
f9004124:	12b48a63          	beq	s1,a1,f9004258 <__subsf3+0x2f8>
f9004128:	0a050263          	beqz	a0,f90041cc <__subsf3+0x26c>
f900412c:	20041263          	bnez	s0,f9004330 <__subsf3+0x3d0>
f9004130:	0ff00593          	li	a1,255
f9004134:	06078063          	beqz	a5,f9004194 <__subsf3+0x234>
f9004138:	fff58613          	addi	a2,a1,-1
f900413c:	28060c63          	beqz	a2,f90043d4 <__subsf3+0x474>
f9004140:	0ff00513          	li	a0,255
f9004144:	00088493          	mv	s1,a7
f9004148:	24a58a63          	beq	a1,a0,f900439c <__subsf3+0x43c>
f900414c:	01b00593          	li	a1,27
f9004150:	00100713          	li	a4,1
f9004154:	00c5ce63          	blt	a1,a2,f9004170 <__subsf3+0x210>
f9004158:	02000713          	li	a4,32
f900415c:	40c70733          	sub	a4,a4,a2
f9004160:	00e79733          	sll	a4,a5,a4
f9004164:	00c7d633          	srl	a2,a5,a2
f9004168:	00e03733          	snez	a4,a4
f900416c:	00e66733          	or	a4,a2,a4
f9004170:	40ee07b3          	sub	a5,t3,a4
f9004174:	00068413          	mv	s0,a3
f9004178:	ee9ff06f          	j	f9004060 <__subsf3+0x100>
f900417c:	020e0063          	beqz	t3,f900419c <__subsf3+0x23c>
f9004180:	fff58713          	addi	a4,a1,-1
f9004184:	1e070463          	beqz	a4,f900436c <__subsf3+0x40c>
f9004188:	02a58263          	beq	a1,a0,f90041ac <__subsf3+0x24c>
f900418c:	00070593          	mv	a1,a4
f9004190:	e61ff06f          	j	f9003ff0 <__subsf3+0x90>
f9004194:	00088493          	mv	s1,a7
f9004198:	000e0793          	mv	a5,t3
f900419c:	00058413          	mv	s0,a1
f90041a0:	0ff00713          	li	a4,255
f90041a4:	0037d813          	srli	a6,a5,0x3
f90041a8:	1ce41e63          	bne	s0,a4,f9004384 <__subsf3+0x424>
f90041ac:	e60808e3          	beqz	a6,f900401c <__subsf3+0xbc>
f90041b0:	00000313          	li	t1,0
f90041b4:	0ff00513          	li	a0,255
f90041b8:	00400637          	lui	a2,0x400
f90041bc:	f41ff06f          	j	f90040fc <__subsf3+0x19c>
f90041c0:	0077f713          	andi	a4,a5,7
f90041c4:	ee071ce3          	bnez	a4,f90040bc <__subsf3+0x15c>
f90041c8:	fd9ff06f          	j	f90041a0 <__subsf3+0x240>
f90041cc:	00140693          	addi	a3,s0,1
f90041d0:	0fe6f693          	andi	a3,a3,254
f90041d4:	04069e63          	bnez	a3,f9004230 <__subsf3+0x2d0>
f90041d8:	fc041ce3          	bnez	s0,f90041b0 <__subsf3+0x250>
f90041dc:	20078463          	beqz	a5,f90043e4 <__subsf3+0x484>
f90041e0:	00000513          	li	a0,0
f90041e4:	f00e0ce3          	beqz	t3,f90040fc <__subsf3+0x19c>
f90041e8:	41c78733          	sub	a4,a5,t3
f90041ec:	00571693          	slli	a3,a4,0x5
f90041f0:	2206d263          	bgez	a3,f9004414 <__subsf3+0x4b4>
f90041f4:	40fe0633          	sub	a2,t3,a5
f90041f8:	00561793          	slli	a5,a2,0x5
f90041fc:	2207d463          	bgez	a5,f9004424 <__subsf3+0x4c4>
f9004200:	fc0007b7          	lui	a5,0xfc000
f9004204:	fff78793          	addi	a5,a5,-1 # fbffffff <__freertos_irq_stack_top+0x2ffa08f>
f9004208:	00f67633          	and	a2,a2,a5
f900420c:	00088493          	mv	s1,a7
f9004210:	00100513          	li	a0,1
f9004214:	eddff06f          	j	f90040f0 <__subsf3+0x190>
f9004218:	fc0007b7          	lui	a5,0xfc000
f900421c:	fff78793          	addi	a5,a5,-1 # fbffffff <__freertos_irq_stack_top+0x2ffa08f>
f9004220:	00f977b3          	and	a5,s2,a5
f9004224:	40a40433          	sub	s0,s0,a0
f9004228:	00012903          	lw	s2,0(sp)
f900422c:	e89ff06f          	j	f90040b4 <__subsf3+0x154>
f9004230:	01212023          	sw	s2,0(sp)
f9004234:	41c78933          	sub	s2,a5,t3
f9004238:	00591713          	slli	a4,s2,0x5
f900423c:	12074263          	bltz	a4,f9004360 <__subsf3+0x400>
f9004240:	e2091ce3          	bnez	s2,f9004078 <__subsf3+0x118>
f9004244:	00012903          	lw	s2,0(sp)
f9004248:	00000313          	li	t1,0
f900424c:	00000513          	li	a0,0
f9004250:	00000613          	li	a2,0
f9004254:	ea9ff06f          	j	f90040fc <__subsf3+0x19c>
f9004258:	02050c63          	beqz	a0,f9004290 <__subsf3+0x330>
f900425c:	14041063          	bnez	s0,f900439c <__subsf3+0x43c>
f9004260:	0ff00593          	li	a1,255
f9004264:	f2078ae3          	beqz	a5,f9004198 <__subsf3+0x238>
f9004268:	fff58613          	addi	a2,a1,-1
f900426c:	10060063          	beqz	a2,f900436c <__subsf3+0x40c>
f9004270:	0ff00513          	li	a0,255
f9004274:	12a58463          	beq	a1,a0,f900439c <__subsf3+0x43c>
f9004278:	01b00713          	li	a4,27
f900427c:	12c75a63          	bge	a4,a2,f90043b0 <__subsf3+0x450>
f9004280:	001e0793          	addi	a5,t3,1
f9004284:	00068413          	mv	s0,a3
f9004288:	e2dff06f          	j	f90040b4 <__subsf3+0x154>
f900428c:	08051c63          	bnez	a0,f9004324 <__subsf3+0x3c4>
f9004290:	00140693          	addi	a3,s0,1
f9004294:	0fe6f593          	andi	a1,a3,254
f9004298:	0a059863          	bnez	a1,f9004348 <__subsf3+0x3e8>
f900429c:	0e041e63          	bnez	s0,f9004398 <__subsf3+0x438>
f90042a0:	14078c63          	beqz	a5,f90043f8 <__subsf3+0x498>
f90042a4:	00000513          	li	a0,0
f90042a8:	e40e0ae3          	beqz	t3,f90040fc <__subsf3+0x19c>
f90042ac:	01c78e33          	add	t3,a5,t3
f90042b0:	003e5793          	srli	a5,t3,0x3
f90042b4:	00979793          	slli	a5,a5,0x9
f90042b8:	005e1713          	slli	a4,t3,0x5
f90042bc:	0097d613          	srli	a2,a5,0x9
f90042c0:	e2075ee3          	bgez	a4,f90040fc <__subsf3+0x19c>
f90042c4:	00100513          	li	a0,1
f90042c8:	e35ff06f          	j	f90040fc <__subsf3+0x19c>
f90042cc:	02000713          	li	a4,32
f90042d0:	40b70733          	sub	a4,a4,a1
f90042d4:	00ee1733          	sll	a4,t3,a4
f90042d8:	00be55b3          	srl	a1,t3,a1
f90042dc:	00e03733          	snez	a4,a4
f90042e0:	00e5e5b3          	or	a1,a1,a4
f90042e4:	00b787b3          	add	a5,a5,a1
f90042e8:	00579713          	slli	a4,a5,0x5
f90042ec:	ec075ae3          	bgez	a4,f90041c0 <__subsf3+0x260>
f90042f0:	00140413          	addi	s0,s0,1
f90042f4:	0ff00713          	li	a4,255
f90042f8:	00e41863          	bne	s0,a4,f9004308 <__subsf3+0x3a8>
f90042fc:	0ff00513          	li	a0,255
f9004300:	00000613          	li	a2,0
f9004304:	df9ff06f          	j	f90040fc <__subsf3+0x19c>
f9004308:	7e0006b7          	lui	a3,0x7e000
f900430c:	0017d713          	srli	a4,a5,0x1
f9004310:	fff68693          	addi	a3,a3,-1 # 7dffffff <__stack_size+0x7dffefff>
f9004314:	0017f793          	andi	a5,a5,1
f9004318:	00d77733          	and	a4,a4,a3
f900431c:	00f767b3          	or	a5,a4,a5
f9004320:	d95ff06f          	j	f90040b4 <__subsf3+0x154>
f9004324:	ce041ce3          	bnez	s0,f900401c <__subsf3+0xbc>
f9004328:	0ff00593          	li	a1,255
f900432c:	f39ff06f          	j	f9004264 <__subsf3+0x304>
f9004330:	00058493          	mv	s1,a1
f9004334:	00070813          	mv	a6,a4
f9004338:	e75ff06f          	j	f90041ac <__subsf3+0x24c>
f900433c:	00140693          	addi	a3,s0,1
f9004340:	0fe6f593          	andi	a1,a3,254
f9004344:	f4058ee3          	beqz	a1,f90042a0 <__subsf3+0x340>
f9004348:	0ff00713          	li	a4,255
f900434c:	fae688e3          	beq	a3,a4,f90042fc <__subsf3+0x39c>
f9004350:	01c78e33          	add	t3,a5,t3
f9004354:	001e5793          	srli	a5,t3,0x1
f9004358:	00068413          	mv	s0,a3
f900435c:	d59ff06f          	j	f90040b4 <__subsf3+0x154>
f9004360:	40fe0933          	sub	s2,t3,a5
f9004364:	00088493          	mv	s1,a7
f9004368:	d11ff06f          	j	f9004078 <__subsf3+0x118>
f900436c:	01c787b3          	add	a5,a5,t3
f9004370:	00579713          	slli	a4,a5,0x5
f9004374:	00200413          	li	s0,2
f9004378:	f80748e3          	bltz	a4,f9004308 <__subsf3+0x3a8>
f900437c:	0037d813          	srli	a6,a5,0x3
f9004380:	00100413          	li	s0,1
f9004384:	00981813          	slli	a6,a6,0x9
f9004388:	00985613          	srli	a2,a6,0x9
f900438c:	0ff47513          	zext.b	a0,s0
f9004390:	0014f313          	andi	t1,s1,1
f9004394:	d69ff06f          	j	f90040fc <__subsf3+0x19c>
f9004398:	e0079ce3          	bnez	a5,f90041b0 <__subsf3+0x250>
f900439c:	00070813          	mv	a6,a4
f90043a0:	e0dff06f          	j	f90041ac <__subsf3+0x24c>
f90043a4:	41c787b3          	sub	a5,a5,t3
f90043a8:	00100413          	li	s0,1
f90043ac:	cb5ff06f          	j	f9004060 <__subsf3+0x100>
f90043b0:	02000713          	li	a4,32
f90043b4:	40c70733          	sub	a4,a4,a2
f90043b8:	00e79733          	sll	a4,a5,a4
f90043bc:	00c7d633          	srl	a2,a5,a2
f90043c0:	00e037b3          	snez	a5,a4
f90043c4:	00f66633          	or	a2,a2,a5
f90043c8:	01c607b3          	add	a5,a2,t3
f90043cc:	00068413          	mv	s0,a3
f90043d0:	f19ff06f          	j	f90042e8 <__subsf3+0x388>
f90043d4:	40fe07b3          	sub	a5,t3,a5
f90043d8:	00088493          	mv	s1,a7
f90043dc:	00100413          	li	s0,1
f90043e0:	c81ff06f          	j	f9004060 <__subsf3+0x100>
f90043e4:	020e0063          	beqz	t3,f9004404 <__subsf3+0x4a4>
f90043e8:	00088313          	mv	t1,a7
f90043ec:	00070613          	mv	a2,a4
f90043f0:	00000513          	li	a0,0
f90043f4:	d09ff06f          	j	f90040fc <__subsf3+0x19c>
f90043f8:	00070613          	mv	a2,a4
f90043fc:	00000513          	li	a0,0
f9004400:	cfdff06f          	j	f90040fc <__subsf3+0x19c>
f9004404:	00000313          	li	t1,0
f9004408:	00000513          	li	a0,0
f900440c:	00000613          	li	a2,0
f9004410:	cedff06f          	j	f90040fc <__subsf3+0x19c>
f9004414:	02070063          	beqz	a4,f9004434 <__subsf3+0x4d4>
f9004418:	00671713          	slli	a4,a4,0x6
f900441c:	00975613          	srli	a2,a4,0x9
f9004420:	cddff06f          	j	f90040fc <__subsf3+0x19c>
f9004424:	00661613          	slli	a2,a2,0x6
f9004428:	00088313          	mv	t1,a7
f900442c:	00965613          	srli	a2,a2,0x9
f9004430:	ccdff06f          	j	f90040fc <__subsf3+0x19c>
f9004434:	00000313          	li	t1,0
f9004438:	00000613          	li	a2,0
f900443c:	cc1ff06f          	j	f90040fc <__subsf3+0x19c>
f9004440:	d80586e3          	beqz	a1,f90041cc <__subsf3+0x26c>
f9004444:	40868633          	sub	a2,a3,s0
f9004448:	00060593          	mv	a1,a2
f900444c:	ce0404e3          	beqz	s0,f9004134 <__subsf3+0x1d4>
f9004450:	04000737          	lui	a4,0x4000
f9004454:	00e7e7b3          	or	a5,a5,a4
f9004458:	00088493          	mv	s1,a7
f900445c:	cf1ff06f          	j	f900414c <__subsf3+0x1ec>
f9004460:	ec058ee3          	beqz	a1,f900433c <__subsf3+0x3dc>
f9004464:	40868633          	sub	a2,a3,s0
f9004468:	00041663          	bnez	s0,f9004474 <__subsf3+0x514>
f900446c:	00060593          	mv	a1,a2
f9004470:	df5ff06f          	j	f9004264 <__subsf3+0x304>
f9004474:	04000737          	lui	a4,0x4000
f9004478:	00e7e7b3          	or	a5,a5,a4
f900447c:	dfdff06f          	j	f9004278 <__subsf3+0x318>

f9004480 <__fixunssfsi>:
f9004480:	01755713          	srli	a4,a0,0x17
f9004484:	00800637          	lui	a2,0x800
f9004488:	fff60793          	addi	a5,a2,-1 # 7fffff <__stack_size+0x7fefff>
f900448c:	0ff77713          	zext.b	a4,a4
f9004490:	07e00593          	li	a1,126
f9004494:	00a7f6b3          	and	a3,a5,a0
f9004498:	01f55793          	srli	a5,a0,0x1f
f900449c:	00000513          	li	a0,0
f90044a0:	00e5d463          	bge	a1,a4,f90044a8 <__fixunssfsi+0x28>
f90044a4:	00078463          	beqz	a5,f90044ac <__fixunssfsi+0x2c>
f90044a8:	00008067          	ret
f90044ac:	09e00793          	li	a5,158
f90044b0:	fff00513          	li	a0,-1
f90044b4:	fee7cae3          	blt	a5,a4,f90044a8 <__fixunssfsi+0x28>
f90044b8:	09500593          	li	a1,149
f90044bc:	00c6e7b3          	or	a5,a3,a2
f90044c0:	00e5d863          	bge	a1,a4,f90044d0 <__fixunssfsi+0x50>
f90044c4:	f6a70713          	addi	a4,a4,-150 # 3ffff6a <__stack_size+0x3ffef6a>
f90044c8:	00e79533          	sll	a0,a5,a4
f90044cc:	00008067          	ret
f90044d0:	09600513          	li	a0,150
f90044d4:	40e50533          	sub	a0,a0,a4
f90044d8:	00a7d533          	srl	a0,a5,a0
f90044dc:	00008067          	ret

f90044e0 <__floatunsisf>:
f90044e0:	ff010113          	addi	sp,sp,-16
f90044e4:	00112623          	sw	ra,12(sp)
f90044e8:	00812423          	sw	s0,8(sp)
f90044ec:	04050863          	beqz	a0,f900453c <__floatunsisf+0x5c>
f90044f0:	00050413          	mv	s0,a0
f90044f4:	104000ef          	jal	f90045f8 <__clzsi2>
f90044f8:	09e00793          	li	a5,158
f90044fc:	40a787b3          	sub	a5,a5,a0
f9004500:	09600713          	li	a4,150
f9004504:	04f74c63          	blt	a4,a5,f900455c <__floatunsisf+0x7c>
f9004508:	00800713          	li	a4,8
f900450c:	0ce50e63          	beq	a0,a4,f90045e8 <__floatunsisf+0x108>
f9004510:	ff850513          	addi	a0,a0,-8
f9004514:	00a41433          	sll	s0,s0,a0
f9004518:	00941413          	slli	s0,s0,0x9
f900451c:	0ff7f513          	zext.b	a0,a5
f9004520:	00945413          	srli	s0,s0,0x9
f9004524:	01751513          	slli	a0,a0,0x17
f9004528:	00c12083          	lw	ra,12(sp)
f900452c:	00856533          	or	a0,a0,s0
f9004530:	00812403          	lw	s0,8(sp)
f9004534:	01010113          	addi	sp,sp,16
f9004538:	00008067          	ret
f900453c:	00000513          	li	a0,0
f9004540:	00000413          	li	s0,0
f9004544:	01751513          	slli	a0,a0,0x17
f9004548:	00c12083          	lw	ra,12(sp)
f900454c:	00856533          	or	a0,a0,s0
f9004550:	00812403          	lw	s0,8(sp)
f9004554:	01010113          	addi	sp,sp,16
f9004558:	00008067          	ret
f900455c:	09900713          	li	a4,153
f9004560:	06f74463          	blt	a4,a5,f90045c8 <__floatunsisf+0xe8>
f9004564:	ffb50713          	addi	a4,a0,-5
f9004568:	00e41733          	sll	a4,s0,a4
f900456c:	fc0006b7          	lui	a3,0xfc000
f9004570:	fff68693          	addi	a3,a3,-1 # fbffffff <__freertos_irq_stack_top+0x2ffa08f>
f9004574:	00777613          	andi	a2,a4,7
f9004578:	00d77433          	and	s0,a4,a3
f900457c:	02060463          	beqz	a2,f90045a4 <__floatunsisf+0xc4>
f9004580:	00f77713          	andi	a4,a4,15
f9004584:	00400613          	li	a2,4
f9004588:	00c70e63          	beq	a4,a2,f90045a4 <__floatunsisf+0xc4>
f900458c:	00440413          	addi	s0,s0,4
f9004590:	00541713          	slli	a4,s0,0x5
f9004594:	00075863          	bgez	a4,f90045a4 <__floatunsisf+0xc4>
f9004598:	09f00793          	li	a5,159
f900459c:	00d47433          	and	s0,s0,a3
f90045a0:	40a787b3          	sub	a5,a5,a0
f90045a4:	00641413          	slli	s0,s0,0x6
f90045a8:	0ff7f513          	zext.b	a0,a5
f90045ac:	00945413          	srli	s0,s0,0x9
f90045b0:	01751513          	slli	a0,a0,0x17
f90045b4:	00c12083          	lw	ra,12(sp)
f90045b8:	00856533          	or	a0,a0,s0
f90045bc:	00812403          	lw	s0,8(sp)
f90045c0:	01010113          	addi	sp,sp,16
f90045c4:	00008067          	ret
f90045c8:	01b50713          	addi	a4,a0,27
f90045cc:	00500693          	li	a3,5
f90045d0:	00e41733          	sll	a4,s0,a4
f90045d4:	40a686b3          	sub	a3,a3,a0
f90045d8:	00e03733          	snez	a4,a4
f90045dc:	00d45433          	srl	s0,s0,a3
f90045e0:	00876733          	or	a4,a4,s0
f90045e4:	f89ff06f          	j	f900456c <__floatunsisf+0x8c>
f90045e8:	00941413          	slli	s0,s0,0x9
f90045ec:	00945413          	srli	s0,s0,0x9
f90045f0:	09600513          	li	a0,150
f90045f4:	f51ff06f          	j	f9004544 <__floatunsisf+0x64>

f90045f8 <__clzsi2>:
f90045f8:	000107b7          	lui	a5,0x10
f90045fc:	02f57a63          	bgeu	a0,a5,f9004630 <__clzsi2+0x38>
f9004600:	10053793          	sltiu	a5,a0,256
f9004604:	0017b793          	seqz	a5,a5
f9004608:	00379793          	slli	a5,a5,0x3
f900460c:	02000713          	li	a4,32
f9004610:	40f70733          	sub	a4,a4,a5
f9004614:	00f55533          	srl	a0,a0,a5
f9004618:	00000797          	auipc	a5,0x0
f900461c:	79878793          	addi	a5,a5,1944 # f9004db0 <__clz_tab>
f9004620:	00a787b3          	add	a5,a5,a0
f9004624:	0007c503          	lbu	a0,0(a5)
f9004628:	40a70533          	sub	a0,a4,a0
f900462c:	00008067          	ret
f9004630:	010007b7          	lui	a5,0x1000
f9004634:	02f57463          	bgeu	a0,a5,f900465c <__clzsi2+0x64>
f9004638:	01000793          	li	a5,16
f900463c:	00f55533          	srl	a0,a0,a5
f9004640:	00000797          	auipc	a5,0x0
f9004644:	77078793          	addi	a5,a5,1904 # f9004db0 <__clz_tab>
f9004648:	00a787b3          	add	a5,a5,a0
f900464c:	0007c503          	lbu	a0,0(a5)
f9004650:	01000713          	li	a4,16
f9004654:	40a70533          	sub	a0,a4,a0
f9004658:	00008067          	ret
f900465c:	01800793          	li	a5,24
f9004660:	00f55533          	srl	a0,a0,a5
f9004664:	00000797          	auipc	a5,0x0
f9004668:	74c78793          	addi	a5,a5,1868 # f9004db0 <__clz_tab>
f900466c:	00a787b3          	add	a5,a5,a0
f9004670:	0007c503          	lbu	a0,0(a5)
f9004674:	00800713          	li	a4,8
f9004678:	40a70533          	sub	a0,a4,a0
f900467c:	00008067          	ret

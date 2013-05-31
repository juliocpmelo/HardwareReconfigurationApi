/*
 * Copyright (c) 2008 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */

#include "lwip/sys.h"
#include "prot_malloc.h"

/* 
 * In lwip-1.2.0, mem_malloc has some bugs. As a result, lwIP v3.00.a 
 * uses libc's malloc() by defining MEM_LIBC_MALLOC in lwipopts.h
 * However, libc's malloc is not thread safe. All lwIP routines 
 * that call malloc() protect it by calling malloc() only when interrupts
 * are disabled. As a result, applications need to do the same.
 *
 * The following two functions show how to call malloc and free after
 * disabling interrupts
 */

void *prot_mem_malloc(mem_size_t n)
{
	void *p;
	SYS_ARCH_DECL_PROTECT(lev);
	SYS_ARCH_PROTECT(lev);
	p = mem_malloc(n);
	SYS_ARCH_UNPROTECT(lev);

	return p;
}

void *prot_mem_free(void *a)
{
	SYS_ARCH_DECL_PROTECT(lev);
	SYS_ARCH_PROTECT(lev);
	mem_free(a);
	SYS_ARCH_UNPROTECT(lev);
}

/*
 * Copyright 2015 Erik Van Hamme
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <sys/types.h>

/* Chip list copied from stm32f4xx.h. Update if new types appear in stm32cubef4 library. */
#if defined (STM32F405xx) || defined (STM32F415xx) || defined (STM32F407xx) || defined (STM32F417xx) || \
    defined (STM32F427xx) || defined (STM32F437xx) || defined (STM32F429xx) || defined (STM32F439xx) || \
    defined (STM32F401xC) || defined (STM32F401xE) || defined (STM32F411xE) || defined (STM32F446xx)
#include "stm32f4xx.h"
#endif

/* TODO: Find out what other NewLib syscalls should be implemented. (List: http://wiki.osdev.org/Porting_Newlib#newlib.2Flibc.2Fsys.2Fmyos.2Fsyscalls.c ) */

#undef errno
extern int errno;
extern int _heap_start;

inline void abort(void) {
	while (1) {
	}
}

caddr_t _sbrk(int incr) {
	static unsigned char *heap_end = NULL;
	unsigned char *prev_heap;

	if (heap_end == NULL) {
		heap_end = (unsigned char *) &_heap_start;
	}
	
	unsigned char *stack_bottom = (unsigned char *) __get_MSP();
	
	if (heap_end + incr >  stack_bottom) {
		abort(); /* Heap and stack collision. */
	}
	
	prev_heap = heap_end;
	heap_end += incr;

	return (caddr_t) prev_heap;
}

/* 
 * _init() is implemented here to allow linking with -nostartfiles. Doing this avoids that the startup of the application
 * builds support for destruction of the static C++ objects. Destruction support is not needed because embedded apps should
 * never return from main().
 */
void _init() {
}


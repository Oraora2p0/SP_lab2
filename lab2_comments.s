.data
print_format: //вывод оригинального массива
 .string "%d "
//вывод знаков
//pol: 
// .string "+\n"
//neg:
// .string "-\n"
print_format_upd: //вывод изменённых значений
 .string " %d\n"

array: //задаём массив
 .long -16, 42, 17, 168, 4, 85, -219, 171, 182, -15
array_end:
.text
.global main
.type main, @function
main:
 //movl $0, %edx
 //movl $0, %ecx /*ecx - результат, сумма*/
 movl $array,%ebx /*ebx - адрес текущего элемента массива*/
 movl (%ebx), %eax /*eax - значение текущего элемента массива,
 потом XOR, AND*/
 jmp ch_bound /*переходим в на проверку на конец массива*/
loop_start:
 //movl (%ebx), %eax
 //pushl %ecx /*магия вуду для вывода элемента массива*/
 pushl (%ebx)
 pushl $print_format
 call printf
 addl $8, %esp
 //popl %ecx /*магия кончилась*/
 //movl (%ebx), %eax
 //movl $20, %ecx
 
 cmpl $0, (%ebx)
 //cmpl $0, %eax /*сравнивает число в массиве с 0 (??)*/
 jle less /*не больше, значит отрицательное, переходим в less, иначе дальше по коду*/
 /*тут логика для положительного*/
 //pushl $pol
 //call printf
 movl (%ebx), %eax
 //or $17, %eax
 //xor $17, %eax
 btr $0, %eax /*если больше, сбрасываем 0 и 4 биты (что во втором операнде)*/
 btr $4, %eax
 //popl $pol
 pushl %eax
 pushl $print_format_upd
 call printf
 addl $8, %esp
 jmp nextmove /*прыгаем на логику для перехода в следующий элемент массива*/
  /*логика для отрицательного*/
less:
 //pushl $neg
 //call printf
 movl (%ebx), %eax
 sar $2, %eax /*арифметический сдвиг вправо на два элемента*/
 pushl %eax
 pushl $print_format_upd
 call printf
 addl $8, %esp
 jmp nextmove /*прыгаем на логику для перехода в следующий элемент массива*/
 
	/*следующий элемент*/
nextmove:
 
 addl $4, %ebx /* переходим на следующий элемент массива*/
 movl (%ebx), %eax
ch_bound:
 cmpl $array_end, %ebx /*сравнить адрес текущего элемента и адреc конца массива*/
 jne loop_start /*если не равны, то повторить цикл снова*/
 //pushl %ecx
 //pushl $print_format
 //call printf
 //addl $8, %esp
 //movl $0, %ecx
 //movl $0, %ebx
 //movl $0, %eax
 //ret
//exit:
  //ret
 /* 4 и 0 биты (???) 00010001 */
 
 /* btr - сброс бита, sar - арифметический сдвиг */

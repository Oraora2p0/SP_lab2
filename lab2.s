.data
print_format: //вывод оригинального массива
 .string "%d "
print_format_upd: //вывод изменённых значений
 .string " %d\n"

array: //задаём массив
 .long -16, 42, 17, 4, 85, -219, 171, 182, -15
array_end:
.text
.global main
.type main, @function
main:
 movl $array,%ebx /*ebx - адрес текущего элемента массива*/
 movl (%ebx), %eax /*eax - значение текущего элемента массива*/
 jmp ch_bound /*переходим в на проверку на конец массива*/
loop_start:
/*магия вуду для вывода элемента массива*/
 pushl (%ebx)
 pushl $print_format
 call printf
 addl $8, %esp
/*магия кончилась*/
 
 
 cmpl $0, (%ebx) /*сравнивает число в массиве с 0 (??)*/
 jle less /*не больше, значит отрицательное, переходим в less, иначе дальше по коду*/
/*тут логика для положительного*/
 movl (%ebx), %eax
 btr $0, %eax /*если больше, сбрасываем 0 и 4 биты (что во втором операнде)*/
 btr $4, %eax
 pushl %eax
 pushl $print_format_upd /*вывод числа*/
 call printf
 addl $8, %esp
 jmp nextmove /*прыгаем на логику для перехода в следующий элемент массива*/
/*логика для отрицательного*/
less:
  movl (%ebx), %eax
 sar $2, %eax /*арифметический сдвиг вправо на два элемента*/
 pushl %eax
 pushl $print_format_upd /*вывод числа*/
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
 movl $0, %ecx
 movl $0, %ebx
 movl $0, %eax
 
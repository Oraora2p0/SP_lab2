#1.s
.data
msg:
.ascii "abcd text\n"
#.byte 0x61, 0x61, 0x61, 0x61, 0x61, 0x61, 0x61, 0x61, 0x61, 0x0A #aaaaaaaaa
len = . - msg # символу len присваивается длина строки
.text
.global _start # точка входа в программу
_start:
movl $4, %eax # системный вызов № 4 — sys_write
movl $1, %ebx # поток № 1 — stdout
movl $msg, %ecx # указатель на выводимую строку
movl $len, %edx # длина строки
int $0x80 # прерывание, вызов ядра
movl $1, %eax # системный вызов № 1 — sys_exit
xorl %ebx, %ebx # выход с кодом 0
int $0x80 # прерывание, вызов ядра

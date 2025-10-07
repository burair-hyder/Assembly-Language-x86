INCLUDE Irvine32.inc

.data
	counter DWORD 4
	Chr BYTE ' '
	i DWORD 0;
	x DWORD 3
	a DWORD 1
	temp DWORD ?
	temp1 DWORD ?

.code
main PROC

	mov ecx,counter


	mainloop:
		
		mov counter,ecx
		mov eax,3
		sub eax,i
		mov ecx,eax
		cmp ecx,0
		je here
		spaceloop:
			mov temp,eax

			movzx eax,Chr
			Call WriteChar
			mov eax,temp
			

		loop spaceloop
		here:
		inc i

		mov ecx,a
		printloop:
			

			mov eax,6
			Call Writedec

			


			
		loop printloop

			add a,2
			Call Crlf
			
			mov ecx,counter

		loop mainloop


		mov ecx,4

		loop1:
			mov counter,ecx

			mov ecx,2
			loop3:
				movzx eax,Chr
				Call WriteChar
			loop loop3
			mov ecx,3

			loop2:
				mov eax,8
				Call Writedec
			loop loop2
			mov ecx,counter
			Call Crlf
		loop loop1

exitt:

exit 
main ENDP
END main

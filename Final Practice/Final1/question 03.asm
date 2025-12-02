INCLUDE Irvine32.inc

.data
	arr DWORD 5 dup (?)
	len =5
	Tsum DWORD ?
	Count50 DWORD ?
	L30 DWORD ?
	msg BYTE  30 dup(0)
	l BYTE "Light",0
	m byte "Moderate",0
	h byte "high",0
.code
CreateFunc PROTO Tpara:PTR DWORD, Cpara : PTR DWORD,LL : PTR DWORD
ndFunc PROTO Tpara : PTR DWORD , Cpara : PTR DWORD , LL : PTR DWORD , msgp:PTR BYTE

main PROC 
	mov ecx,len
	mov esi,0
	
	l1:
		Call Readint
		mov arr[esi],eax  ; 1 weigtage
		add esi,TYPE arr
		push eax
	loop l1

	INVOKE CreateFunc , addr Tsum, addr Count50,addr L30
	INVOKE ndFunc,addr Tsum, addr Count50,addr L30, offset msg
	
	mov eax,Tsum
	call WRiteint
	Call crlf
	mov eax,Count50
	call Writeint 
	Call crlf


	mov eax,L30
	call WRiteint 
	call crlf

	mov edx,oFFSET msg
	call Writestring

exit 
main ENDP
CreateFunc PROC  Tpara:PTR DWORD, Cpara : PTR DWORD ,LL : PTR DWORD
			LOCAL sum:DWORD
			LOCAL counter:DWORD
			local lesser:DWORD
			
				lea esi,[ebp+20]
				mov edi,esi
			mov ecx,len
			mov sum,0
			mov counter,0

			l2:
				mov eax,[esi]
				add sum,eax
				
				
				cmp eax,50
				jng SKIP
				inc counter
			SKIP:
				add esi,4

			loop l2

			mov ecx,len
			loop2:
				mov ebx,[edi]
				cmp ebx,30
				jl Cond
				jmp skipp
				Cond:
					mov lesser,ebx

				skipp:
				add edi,4
			loop loop2
			
				
				
			mov esi,Tpara
			mov eax,sum
			mov  DWORD PTR [esi],eax
	
			mov esi,Cpara
			mov eax,counter
			
			mov  DWORD PTR [esi],eax

			mov esi,LL
			mov eax,lesser
			mov DWORD PTR [esi],eax








	RET 

CreateFunc ENDP

ndFunc PROC  Tpara : PTR DWORD , Cpara : PTR DWORD , LL : PTR DWORD , msgp:PTR BYTE
		
		mov esi,LL
		mov esi,Tpara
		mov eax,[esi]
		
		mov esi,Cpara
		mov ebx,[esi]
		mov edx,0
		div ebx

		

		cmp eax,30
		jle LOW1

		cmp eax,50
		jle MOD1

		jmp HIG1


		LOW1:
			
			INVOKE str_copy,offset l,msgp
			jmp exe1

		MOD1:
			
			INVOKE str_copy,offset m,msgp
			jmp exe1
	
		HIG1:
		
			INVOKE str_copy,offset h,msgp
			jmp exe1
exe1:
	ret
ndFunc ENDP


END main

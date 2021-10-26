TITLE Ends In Seven
; Program Description : checks whether a number has seven at the end
; Author: Faissal Hamdi
; Creation Date : 04/07/2021
; Revisions:
; Date: 08 / 07 / 2021







INCLUDE irvine32.inc
.data
msgInput BYTE "enter a value n enter 0 to end the program ",0

msgOutput BYTE "The number ends With 7  ", 0

inputVal SDWORD ?

.code
main PROC

L1 :
mov edx, OFFSET msgInput
call WriteString   ; show message
call ReadInt      ; read input
mov  inputVal,eax
.IF inputVal ==0
jmp quit
.ENDIF
call Crlf
call looking_for_7
call Crlf
call Crlf

loop L1

quit : exit
main ENDP


looking_for_7 PROC USES  edx
.code

compare :

.IF inputVal == 7 || inputVal == -7         ; check if number is equal to 7 or -7
jmp seven_found

.ELSEIF  inputVal < 0 && inputVal < -7       ; check whether a number is negativeand less than - 7

add inputVal, 10
cmp inputVal, -7                        ; compare inserted value and -7
je seven_found                          ; jump if equal - 7 to seven_found
jl compare                              ; start the comparison again
jg end_proc


.ELSEIF inputVal > 7           ; check whether is greater than 7

sub inputVal, 10               ;subtract 10 from the inserted value
cmp inputVal, 7                ;compare 7 and inputValu;
je seven_found                 ;jump to seven_found if equal
jl end_proc
jg compare
.ELSE
jmp end_proc

.ENDIF

seven_found :
mov edx, OFFSET msgOutput
call WriteString

end_proc :
ret

looking_for_7 ENDP

END main

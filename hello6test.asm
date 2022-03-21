                                                                                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



DATA SEGMENT
;variables to keep track of port data
	PORTA_VAL DB 0
    PORTB_VAL DB 0
    PORTC_VAL DB 0
    
;Used strings
    MYSTR	DB	"Welcome to Morse$"      ; Main menu
    MYSTR2	DB	"Code Translator$"  
    MYSTR3	DB	"Press 1 : Table$" 
    MYSTR4	DB	"Press 2 : Encode$" 
    MYSTR5	DB	"Press 3 : Decode$" 
    MYSTR6	DB	"Press 4 : Exit$" 
       
    STR1	DB	"A = .-$"                   ;Table
    STR2	DB	"B = -...$"   
    STR3	DB	"C = -.-.$"
    STR4	DB	"D = -..$"
    STR5    DB "E = .$"
    STR6    DB "F = ..-.$"
    STR7    DB "G = --.$"
    STR8    DB "H = ....$"
    STR9    DB "I = ..$"
    STR10   DB "J = .---$"
    STR11   DB "K = -.-$"
    STR12   DB "L = .-..$"
    STR13   DB "M = --$"
    STR14   DB "N = -.$"
    STR15   DB "0 = ---$"
    STR16   DB "P = .--.$"
    STR17   DB "Q = --.-$"
    STR18   DB "R = .-.$"
    STR19   DB "S = ...$"
    STR20   DB "T = -$"
    STR21   DB "U = ..-$"
    STR22   DB "V = ...-$"
    STR23   DB "W = .--$"
    STR24   DB "X = -..-$"
    STR25   DB "Y = -.--$"
    STR26   DB "Z = --..$" 
    
    
    STAR0	 DB	" .- $"                  ;Encode
    STAR1	 DB	" -... $"   
    STAR2	 DB	" -.-. $"
    STAR3	 DB	" -.. $"
    STAR4    DB " . $"
    STAR5    DB " ..-. $"   
    STAR6    DB " --. $" 
       
    STARR0    DB " E $"                     ;Decode
    STARR1    DB " T $"      
    STARend  DB " Thank You $"             ;End

    
    
;port addresses  
    PORTA EQU 00H 	;PORTA IS CONNECTED TO THE D7-D0
	PORTB EQU 02H 	;PORTB0 IS RW, PORTB1 IS RS, PORTB2 IS EN
	PORTC EQU 04H
	PCW   EQU 06H	;PORT FOR IO CONTROL
    
ENDS

STACK SEGMENT
    DW   128  DUP(0)
ENDS

CODE SEGMENT
START:
; set segment registers: 
    MOV AX, DATA
    MOV DS, AX
    MOV ES, AX  
    
;define IO ports
    MOV DX,PCW
    MOV AL,10001001B   ;to make A,B out and C in 
    OUT DX,AL  
    
	   
	CALL LCD_INIT	
		
	MOV DL,1
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,MYSTR
	CALL LCD_PRINTSTR   
	
	
	MOV DL,2
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,MYSTR2
	CALL LCD_PRINTSTR	
	MOV CX,60000
	CALL DELAY
	CALL LCD_CLEAR 
	     
	MOV DL,1
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,MYSTR3
	CALL LCD_PRINTSTR   
	
	
	MOV DL,2
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,MYSTR4
	CALL LCD_PRINTSTR	
	MOV CX,60000
	CALL DELAY
	MOV CX,60000
	CALL DELAY
 

	CALL LCD_CLEAR 
	     
	MOV DL,1
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,MYSTR5
	CALL LCD_PRINTSTR   
	
	
	MOV DL,2
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,MYSTR6
	CALL LCD_PRINTSTR	
	MOV CX,60000
	CALL DELAY
	MOV CX,60000
	CALL DELAY	
	;;;;;;;;;;;; take input 
	MOV DX, PORTC
	IN AL,DX 
	
	; check input
	CMP AL, 11111110B
	jz Table
	CMP AL, 11111101B 
	jz Mencode
	CMP AL, 11111011B
	jz Mdecode 
	CMP AL, 11110111B
	jz END 	
	jmp START


Table: 
    CALL LCD_CLEAR
	
	MOV DL,1
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STR1
	CALL LCD_PRINTSTR
	
	
	MOV DL,2
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STR2
	CALL LCD_PRINTSTR
	
	MOV CX,60000
	CALL DELAY
	
	CALL LCD_CLEAR
	 	
    MOV DL,1
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STR3
	CALL LCD_PRINTSTR
	
	
	MOV DL,2
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STR4
	CALL LCD_PRINTSTR
	
	;;;;;;;;;;;;;; 
	
	MOV CX,60000
	CALL DELAY
	
	CALL LCD_CLEAR
	 	
    MOV DL,1
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STR5
	CALL LCD_PRINTSTR
	
	MOV DL,2
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STR6
	CALL LCD_PRINTSTR 
	
	MOV CX,60000
	CALL DELAY
	
	CALL LCD_CLEAR
	 	
    MOV DL,1
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STR7
	CALL LCD_PRINTSTR
	
	
	MOV DL,2
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STR8
	CALL LCD_PRINTSTR
	
	MOV CX,60000
	CALL DELAY
	
	CALL LCD_CLEAR
	 	
    MOV DL,1
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STR9
	CALL LCD_PRINTSTR
	
	
	MOV DL,2
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STR10
	CALL LCD_PRINTSTR
	
	MOV CX,60000
	CALL DELAY
	
	CALL LCD_CLEAR
	 	
    MOV DL,1
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STR11
	CALL LCD_PRINTSTR
	
	
	MOV DL,2
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STR12
	CALL LCD_PRINTSTR
	
	MOV CX,60000
	CALL DELAY
	
	CALL LCD_CLEAR
	 	
    MOV DL,1
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STR13
	CALL LCD_PRINTSTR
	
	
	MOV DL,2
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STR14
	CALL LCD_PRINTSTR
	
	MOV CX,60000
	CALL DELAY
	
	CALL LCD_CLEAR
	 	
    MOV DL,1
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STR15
	CALL LCD_PRINTSTR
	
	
	MOV DL,2
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STR16
	CALL LCD_PRINTSTR
	
	MOV CX,60000
	CALL DELAY
	
	CALL LCD_CLEAR
	 	
    MOV DL,1
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STR17
	CALL LCD_PRINTSTR
	
	
	MOV DL,2
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STR18
	CALL LCD_PRINTSTR
	
	MOV CX,60000
	CALL DELAY
	
	CALL LCD_CLEAR
	 	
    MOV DL,1
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STR19
	CALL LCD_PRINTSTR
	
	
	MOV DL,2
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STR20
	CALL LCD_PRINTSTR
	
	MOV CX,60000
	CALL DELAY
	
	CALL LCD_CLEAR
	 	
    MOV DL,1
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STR21
	CALL LCD_PRINTSTR
	
	
	MOV DL,2
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STR22
	CALL LCD_PRINTSTR
	
	MOV CX,60000
	CALL DELAY
	
	CALL LCD_CLEAR
	 	
    MOV DL,1
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STR23
	CALL LCD_PRINTSTR
	
	
	MOV DL,2
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STR24
	CALL LCD_PRINTSTR
	
	MOV CX,60000
	CALL DELAY
	
	CALL LCD_CLEAR
	 	
    MOV DL,1
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STR25
	CALL LCD_PRINTSTR
	
	
	MOV DL,2
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STR26
	CALL LCD_PRINTSTR 
	
	
	MOV CX,60000
	CALL DELAY
	CALL LCD_CLEAR 
	
	jmp START
	
Mencode:
	CALL LCD_CLEAR
    MOV DX, PORTC
	IN AL,DX  
	; check input
	CMP AL, 11111110B
	JNE Not_A
	JMP print_A
Not_A:
	CMP AL, 11111101B  
	JNE NOt_B
	JMP print_B
Not_B:
	CMP AL, 11111011B  
	JNE Not_C
	JMP print_C
Not_C:  
	CMP AL, 11110111B  
	JNE Not_D
	JMP print_D
Not_D: 
	CMP AL, 11101111B  
	JNE Not_E
	JMP print_E
Not_E: 
	CMP AL, 11011111B  
	JNE Not_F
	JMP print_F
Not_F: 
	CMP AL, 10111111B  
	JNE Not_G
	JMP print_G
Not_G:                   
	CMP AL,  01111111B 	 
    jNE Mencode    
    JMP START
    
print_A:  
    CALL LCD_CLEAR 	
    MOV DL,1
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STAR0
	CALL LCD_PRINTSTR		
	MOV CX,60000
	CALL DELAY 
	JMP Mencode
print_B: 
    CALL LCD_CLEAR 	
    MOV DL,1
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STAR1
    CALL LCD_PRINTSTR  	
	MOV CX,60000
	CALL DELAY
    JMP Mencode

print_C:
    CALL LCD_CLEAR 
    MOV DL,1
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STAR2
    CALL LCD_PRINTSTR
    	
	MOV CX,60000
	CALL DELAY	
	JMP Mencode
print_D:  
    CALL LCD_CLEAR 	
	 	
    MOV DL,1
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STAR3
    CALL LCD_PRINTSTR   
                      	
	MOV CX,60000
	CALL DELAY
	JMP Mencode	    

print_E: 
    CALL LCD_CLEAR 	
    MOV DL,1
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STAR4
    CALL LCD_PRINTSTR 
    	
	MOV CX,60000
	CALL DELAY
	JMP Mencode    
print_F:
    CALL LCD_CLEAR 
	 	
    MOV DL,1
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STAR5
    CALL LCD_PRINTSTR  	
	MOV CX,60000
	CALL DELAY 	
	jmp Mencode 
print_G:
    CALL LCD_CLEAR  	
    MOV DL,1
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STAR6
    CALL LCD_PRINTSTR  	
	MOV CX,60000
	CALL DELAY 	
	jmp Mencode      
	
	
	
Mdecode:  
    CALL LCD_CLEAR
    MOV DX, PORTC
	IN AL,DX  
	; check input
	CMP AL, 11111110B    
	JNE not_de_E
	JMP de_E  
not_de_E:     
	CMP AL, 11111101B    
	JNE not_de_T
	JMP de_T 
not_de_T:
    CMP AL,  01111111B 	 
    jNE Mdecode    
    JMP START
	          
	          
de_E:
    CALL LCD_CLEAR  	
    MOV DL,1
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STARR0
    CALL LCD_PRINTSTR  	
	MOV CX,60000
	CALL DELAY 	
	jmp Mdecode      

de_T:
    CALL LCD_CLEAR  	
    MOV DL,1
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STARR1
    CALL LCD_PRINTSTR  	
	MOV CX,60000
	CALL DELAY 	
	jmp Mdecode  	          
    
End: 
    CALL LCD_CLEAR
	 	
    MOV DL,1
	MOV DH,1
	CALL LCD_SET_CUR
	LEA SI,STARend
    CALL LCD_PRINTSTR 
	
	HLT
;end of main procedure





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                    ;
;		LCD function library.        ;
;                                    ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PROC DELAY
;input: CX, this value controls the delay. CX=50 means 1ms
;output: none
	JCXZ @DELAY_END
	@DEL_LOOP:
	LOOP @DEL_LOOP	
	@DELAY_END:
	RET
ENDP DELAY



; LCD initialization
PROC LCD_INIT
;input: none
;output: none

;make RS=En=RW=0
	MOV AL,0
	CALL OUT_B
;delay 20ms
	MOV CX,1000
	CALL DELAY
;reset sequence
	MOV AH,30H
	CALL LCD_CMD
	MOV CX,250
	CALL DELAY
	
	MOV AH,30H
	CALL LCD_CMD
	MOV CX,50
	CALL DELAY
	
	MOV AH,30H
	CALL LCD_CMD
	MOV CX,500
	CALL DELAY
	
;function set
	MOV AH,38H
	CALL LCD_CMD
	
	MOV AH,0CH
	CALL LCD_CMD
	
	MOV AH,01H
	CALL LCD_CMD
	
	MOV AH,06H
	CALL LCD_CMD
	
	RET	
ENDP LCD_INIT




;sends commands to LCD
PROC LCD_CMD
;input: AH = command code
;output: none

;save registers
	PUSH DX
	PUSH AX
;make rs=0
	MOV AL,PORTB_VAL
	AND AL,0FDH		;En-RS-RW
	CALL OUT_B
;set out data pins
	MOV AL,AH
	CALL OUT_A
;make En=1
	MOV AL,PORTB_VAL
	OR	AL,100B		;En-RS-RW
	CALL OUT_B
;delay 1ms
	MOV CX,50
	CALL DELAY
;make En=0
	MOV AL,PORTB_VAL
	AND AL,0FBH		;En-RS-RW
	CALL OUT_B
;delay 1ms
	MOV CX,50
	CALL DELAY
;restore registers
	POP AX
	POP DX	
	RET
ENDP LCD_CMD




PROC LCD_CLEAR
	MOV AH,1
	CALL LCD_CMD
	RET	
ENDP LCD_CLEAR



;writes a character on current cursor position
PROC LCD_WRITE_CHAR
;input: AH
;output: none

;save registers
	PUSH AX
;set RS=1
	MOV AL,PORTB_VAL
	OR	AL,10B		;EN-RS-RW
	CALL OUT_B
;set out the data pins
	MOV AL,AH
	CALL OUT_A
;set En=1
	MOV AL,PORTB_VAL
	OR	AL,100B		;EN-RS-RW
	CALL OUT_B
;delay 1ms
	MOV CX,50
	CALL DELAY
;set En=0
	MOV AL,PORTB_VAL
	AND	AL,0FBH		;EN-RS-RW
	CALL OUT_B
;return
	POP AX
	RET	
ENDP LCD_WRITE_CHAR





;prints a string on current cursor position
PROC LCD_PRINTSTR
;input: SI=string address, string should end with '$'
;output: none

;save registers
	PUSH SI
	PUSH AX
;read and write character
	@LCD_PRINTSTR_LT:
		LODSB
		CMP AL,'$'
		JE @LCD_PRINTSTR_EXIT
		MOV AH,AL
		CALL LCD_WRITE_CHAR	
	JMP @LCD_PRINTSTR_LT
	
;return
	@LCD_PRINTSTR_EXIT:
	POP AX
	POP SI
	RET	
ENDP LCD_PRINTSTR




;sets the cursor
PROC LCD_SET_CUR
;input: DL=ROW, DH=COL
;		DL = 1, means upper row
;		DL = 2, means lower row
;		DH = 1-8, 1st column is 1
;output: none

;save registers
	PUSH AX
;LCD uses 0 based column index
	DEC DH
;select case	
	CMP DL,1
	JE	@ROW1
	CMP DL,2
	JE	@ROW2
	JMP @LCD_SET_CUR_END
	
;if DL==1 then
	@ROW1:
		MOV AH,80H
	JMP @LCD_SET_CUR_ENDCASE
	
;if DL==2 then
	@ROW2:
		MOV AH,0C0H
	JMP @LCD_SET_CUR_ENDCASE
		
;execute the command
	@LCD_SET_CUR_ENDCASE:	
	ADD AH,DH
	CALL LCD_CMD
	
;exit from procedure
	@LCD_SET_CUR_END:
	POP AX
	RET
ENDP LCD_SET_CUR






PROC LCD_SHOW_CUR
;input: none
;output: none
	PUSH AX
	MOV AH,0FH
	CALL LCD_CMD
	POP AX
	RET
ENDP LCD_SHOW_CUR




PROC LCD_HIDE_CUR
;input: none
;output: none
	PUSH AX
	MOV AH,0CH
	CALL LCD_CMD
	POP AX
	RET
ENDP LCD_HIDE_CUR



;sends data to output port and saves them in a variable
PROC OUT_A
;input: AL
;output: PORTA_VAL
	PUSH DX
	MOV DX,PORTA
	OUT DX,AL
	MOV PORTA_VAL,AL
	POP DX
	RET	
ENDP OUT_A


PROC OUT_B
;input: AL
;output: PORTB_VAL	
	PUSH DX
	MOV DX,PORTB
	OUT DX,AL
	MOV PORTB_VAL,AL
	POP DX
	RET
ENDP OUT_B

PROC OUT_C
;input: AL
;output: PORTC_VAL	
	PUSH DX
	MOV DX,PORTC
	OUT DX,AL
	MOV PORTC_VAL,AL
	POP DX
	RET
ENDP OUT_C
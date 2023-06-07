.ORIG   x3000

            AND     R2, R2, #0  ; Set values for R2 
            LD      R3, FILE    ; file pointer into R3
COUNT       LDR     R0, R3, #0  ; next file item into R0
            BRZ     ENDCOUNT    ; loop until file item is 0
            ADD     R3, R3, #1  ; add file pointer
            ADD     R2, R2, #1  ; add counter
            BRNZP   COUNT       ; Counter loop
ENDCOUNT   ADD     R4, R2, #0   ; Store total values in R4
            BRZ     SORTED      ; Empty file

; bubble sort code start

OUTERLOOP   ADD     R4, R4, #-1 ; loop n - 1 times
            BRNZ    SORTED      ; Looping complete
            ADD     R5, R4, #0  ; set inner loop counter to outer
            LD      R3, FILE    ; file pointer to beginning of file
INNERLOOP   LDR     R0, R3, #0  ; Get item from file pointer
            LDR     R1, R3, #1  ; Get next item
            NOT     R2, R1      ; Negate
            ADD     R2, R2, #1  ; next item
            ADD     R2, R0, R2  ; swap 
            BRNZ    SWAP 
            STR     R1, R3, #0  ; Perform 
            STR     R0, R3, #1  ; swap
SWAP        ADD     R3, R3, #1  ; add file pointer
            ADD     R5, R5, #-1 ; dereased inner loop counter
            BRP     INNERLOOP   ; End of loop
            BRNZP   OUTERLOOP   ; End of loop
SORTED      HALT

FILE        .FILL   x3500
            .END

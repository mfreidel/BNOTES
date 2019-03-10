REM ******** BN-INPUT.BAS ********
REM **                          **
REM ** BNOTES module for        **
REM ** user input processing.   **
REM **                          **
REM ******************************

'$INCLUDE: 'BN-DECLR.BI'

SUB AnyKey
        PRINT "Press the any key to continue..."
        DO
        LOOP UNTIL INKEY$ <> ""
END SUB

FUNCTION ChkFile% (FileName AS STRING)
        OPEN FileName$ FOR BINARY AS #1
      
        IF LOF(1) = 0 THEN
          LET ChkFile% = 0
        ELSE
          LET ChkFile% = 1
        END IF
      
        CLOSE #1
END FUNCTION

FUNCTION setOF$ (dirOF AS STRING, nameOF AS STRING, extOF AS STRING)
        DIM DotCount AS INTEGER
        DIM DotPos AS INTEGER
        DIM GoodDir AS INTEGER
        DIM GoodName AS INTEGER
        DIM GoodExt AS INTEGER
       

        LET GoodDir = 0
        LET GoodName = 0
        LET GoodExt = 0
      
        DO UNTIL GoodDir = 1
                IF dirOF = "" THEN
                  INPUT "Enter directory name: ", dirOF
                END IF

                DotCount = CountSubstr%(dirOF$, ".")

                IF LEN(dirOF) > 8 THEN
                  PRINT "Directory name too long! Try again."
                  LET dirOF = ""
                ELSEIF DotCount > 0 THEN
                  PRINT "Don't put dots in your directory names!"
                  LET dirOF = ""
                ELSE
                  LET GoodDir = 1
                END IF
               
        LOOP

        DO UNTIL GoodName% = 1
                IF nameOF = "" THEN
                  INPUT "Enter file name: ", nameOF
                END IF

                LET DotPos = INSTR(1, nameOF, ".")
                IF DotPos > 0 THEN
                  IF LEN(nameOF) > 12 THEN
                    PRINT "Filename too long! Try again."
                    LET nameOF = ""
                  ELSEIF DotPos > 9 THEN
                    PRINT "Filename too long! Try again."
                    LET nameOF = ""
                  ELSEIF LEN(nameOF) < 3 THEN
                    PRINT "Filename is malformed! Try again."
                    LET nameOF = ""
                  ELSEIF DotPos = LEN(nameOF) THEN
                    PRINT "Filename is malformed! Try again."
                    LET nameOF = ""
                  ELSEIF CountSubstr%(nameOF, ".") > 1 THEN
                    PRINT "Too many dots! Try again."
                    LET nameOF = ""
                  ELSE
                    extPos% = DotPos% + 1
                    NewExt$ = MID$(nameOF$, extPos%, 3)
                    LET extOF = NewExt$
                   
                    nameEnd% = DotPos - 1
                    NewName$ = MID$(nameOF, 1, nameEnd%)
                    LET nameOF = NewName$

                    LET GoodName = 1
                  END IF
                ELSEIF LEN(nameOF) > 8 THEN
                  PRINT "Filename too long! Try again."
                  LET nameOF = ""
                ELSE
                  LET GoodName = 1
                END IF
        LOOP
                   
        DO UNTIL GoodExt% = 1
                IF extOF = "" THEN
                 INPUT "Enter file extension (1-3 chars): .", extOF
                END IF

                LET DotPos% = INSTR(1, extOF, ".")
                IF LEN(extOF) > 3 THEN
                 PRINT "Extension too long! Try again."
                 LET extOF = ""
                ELSEIF DotPos% <> 0 THEN
                 PRINT "Dots (.) are forbidden!"
                 LET extOF = ""
                ELSE
                 LET GoodExt% = 1
                END IF
        LOOP

        LET setOF$ = ".\" + dirOF + "\" + nameOF + "." + extOF
END FUNCTION


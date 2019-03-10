REM !! BNOTES.BAS - The main program module for BNOTES.
REM !! Michael J. Freidel, 2019
REM !! View README.MD for a simple walkthrough of the code.

'$INCLUDE: 'BN-DECLR.BI'
'$INCLUDE: 'BN-VER.BI'

REM !! ---- Start init section ---- !!


REM !! Check to see if the setup script was run.
REM !! End the program if it was not.
IF ChkFile%("SETUP.LOG") = 0 THEN
  END
END IF


OutFile$ = setOF$("DAILY", ISO8601Date$(DATE$), "TXT")

CLS
PRINT "Welcome to BNOTES! (v"; bnVer!; ")"
PRINT "A BASIC program to write daily notes in AsciiDoc format."
PRINT
IF ChkFile%(OutFile$) = 0 THEN
        PRINT "Couldn't find the note for today. Let's make a new one..."
       OPEN OutFile$ FOR APPEND AS #1
        PRINT #1, ISO8601Date$(DATE$)
        PRINT #1, CharLine$("=", LEN(ISO8601Date$(DATE$)))
        PRINT #1, ""
       CLOSE #1
        PRINT "Created new note file: "; OutFile$
END IF
AnyKey

REM !! ---- End init section ---- !!



REM !! ---- Start interface section ---- !!

DO
        MenuInput$ = MainMenu$(OutFile$)
       
        REM !! Menu input processing is handled by this case statement.
        REM !!
        SELECT CASE UCASE$(MenuInput$)
         CASE "C"
                otherfile$ = setOF("MYNOTES", "", "")
                IF ChkFile(otherfile$) = 0 THEN
                  PRINT "File does not exist!"
                  INPUT "Make a new one? (y or N): ", action$
                  IF UCASE$(action$) = "Y" THEN
                    LET OutFile$ = otherfile$
                    NewNote (OutFile$)
                  END IF
                ELSE
                  LET OutFile$ = otherfile$
                END IF
                        
         CASE "E"
                NewEntry (OutFile$)
        
         CASE "S"
                NewSection (OutFile$)

         CASE "V"
                ReadNote (OutFile$)

         CASE "H"
                ShowHelp
        
         CASE "QUIT"
                PRINT "Good bye, world!"
        
         CASE ELSE
                PRINT "Bad option ("; UCASE$(Menu$); ")!"
        END SELECT
       
        REM !! Wait for keypress after every command.
        AnyKey

LOOP UNTIL UCASE$(MenuInput$) = "QUIT"

REM !! ---- End interface section ---- !!

REM !! ---- End of the program ---- !!
END
                          


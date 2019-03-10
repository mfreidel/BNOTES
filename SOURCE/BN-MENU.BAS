REM ************* BN-MENU.BAS *************
REM **                                   **
REM ** BNOTES module for code that       **
REM ** is used by the menu.              **
REM **                                   **
REM ***************************************

'$INCLUDE: 'BN-DECLR.BI'

FUNCTION MainMenu$ (FileName AS STRING)
        CLS
        bnPrompt$ = "Note:" + FileName + "> "
        PRINT bnPrompt$
        PRINT "--------------------(C)hange-(V)iew-(E)ntry-(S)ection-(H)elp--"
      
        REM !! Set input prompt to appear according
        REM !!  to the inconsistent prompt-length.
        prmptlen% = LEN(bnPrompt$) + 1
        LOCATE 1, prmptlen%
        INPUT "", UserInput$
  
  
        REM !! Reset print location to normal
        LOCATE 2, 1
        PRINT "!- Opt: "; UCASE$(UserInput$); " -!"

        LET MainMenu$ = UserInput$

END FUNCTION

SUB ReadNote (FileName AS STRING)
        CLS
       OPEN FileName$ FOR INPUT AS 1
        lines = 0
        DO WHILE NOT EOF(1)
         LINE INPUT #1, l$
         PRINT l$
         lines = lines + 1
       
         LET scroll = lines MOD 22
         IF scroll = 0 THEN
          AnyKey
          CLS
         END IF
        
        LOOP
       CLOSE #1
       PRINT "!!! End of file !!!"
END SUB

SUB ShowHelp
        REM !! Left column
        PRINT "> (C)hange note file."
        PRINT "> [PLACEHOLDER]"
        PRINT "> (V)iew note"
                      
        REM !! Center column
        LOCATE 3, 25
        PRINT "> Add a (S)ection."
        LOCATE 4, 25
        PRINT "> Add an (E)ntry."
        LOCATE 5, 25
        PRINT "> (QUIT) the program"
       
        REM !! Right column
        LOCATE 3, 50
        PRINT "> [PLACEHOLDER]"
        LOCATE 4, 50
        PRINT "> [PLACEHOLDER]"
        LOCATE 5, 50
        PRINT "> [PLACEHOLDER]"
              
        REM !! Reset print location
        LOCATE 5, 1
        PRINT ""
END SUB


REM *********** BN-FOUT.BAS ************
REM **                                **
REM ** BNOTES module for code that    **
REM ** handles file output tasks.     **
REM **                                **
REM ************************************

'$INCLUDE: 'BN-DECLR.BI'

SUB NewEntry (FileName AS STRING)
        CLS
       OPEN FileName FOR APPEND AS #1
        INPUT "Timestamp your entry? (y or N): ", action$
        IF UCASE$(action$) = "Y" THEN
         PRINT #1, TIME$; " - ";
        END IF
      
        PRINT "Type your entry (Blank line ends the entry):"
        DO
         INPUT "", content$
         PRINT #1, content$
        LOOP UNTIL content$ = ""
       CLOSE #1
END SUB

SUB NewNote (FileName AS STRING)
       OPEN FileName FOR APPEND AS #1
        INPUT "Enter the title for new note: ", title$
        PRINT #1, title$
        PRINT #1, CharLine$("=", LEN(title$))
        PRINT #1, ""
       CLOSE #1

        INPUT "Write a pramble? (Y or n)", action$
        IF UCASE$(action$) <> "N" THEN
         NewEntry (FileName)
        END IF
END SUB

SUB NewSection (FileName AS STRING)
       OPEN FileName FOR APPEND AS #1
        INPUT "Section Title: ", title$
        PRINT #1, ""
        PRINT #1, title$
        PRINT #1, CharLine$("-", LEN(title$))
       CLOSE #1
END SUB


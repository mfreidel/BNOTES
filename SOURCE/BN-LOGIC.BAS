REM *********** BN-LOGIC.BAS ***********
REM **                                **
REM ** BNOTES module for code that    **
REM ** is more general in nature.     **
REM **                                **
REM ************************************

'$INCLUDE: 'BN-DECLR.BI'

FUNCTION CharLine$ (MyChar AS STRING, LineLength AS INTEGER)
        IF LEN(MyChar) <> 1 THEN
          PRINT "You must enter a single character to draw!"
        ELSE
          count% = 0
          DO WHILE count% < LineLength
            LET MyLine$ = MyLine$ + MyChar
            LET count% = count% + 1
          LOOP
        END IF
        LET CharLine$ = MyLine$
END FUNCTION

FUNCTION CountSubstr% (aString AS STRING, LookFor AS STRING)
    REM !! This function checks if a string (aString)
    REM !!  contains a matching substring (LookFor), and returns
    REM !!  the number of occurences of the substing.
        DIM x AS INTEGER
        DIM y AS INTEGER
        DIM n AS INTEGER
        LET n = 0
        LET y = LEN(LookFor)
    
        FOR x = 1 TO LEN(aString)
          IF MID$(aString, x, y) = LookFor THEN
            LET n = n + 1
          END IF
        NEXT x
     
        LET CountSubstr% = n
END FUNCTION

FUNCTION ISO8601Date$ (aDate AS STRING)
  REM !! This function converts a date string (MM-DD-YYYY)
  REM !! to ISO8601 format (YYYYMMDD)
      
        day$ = MID$(aDate, 4, 2)
        month$ = MID$(aDate, 1, 2)
        year$ = MID$(aDate, 7, 4)
        LET ISO8601Date$ = year$ + month$ + day$
END FUNCTION


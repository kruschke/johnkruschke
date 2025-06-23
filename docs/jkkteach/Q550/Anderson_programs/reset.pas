PROGRAM Reset (Input, Output);  {Resets terminal.}
PROCEDURE Restore_scrolling;
    BEGIN
    WRITE (CHR(27), '[1;24r');
    END;

PROCEDURE Clear_screen;
    BEGIN
    WRITE (CHR(27), '[f', CHR (27), '[2J');
    END;

BEGIN
Restore_scrolling;
Clear_screen;
END.

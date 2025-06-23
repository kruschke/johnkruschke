{This is a series of screen control commands for a VT100  }
{terminal or equivalent.  It should work on most terminals}
{or common terminal emulators.                            }


PROCEDURE Clear_screen;  {Erase screen, leave cursor at home.}
        BEGIN
        IF VT100 THEN
           WRITE (CHR (27), '[f', CHR (27),'[2J');
        END;

PROCEDURE Clear_box;  {Clear first five rows, leave cursor at home.'}
        BEGIN
        IF VT100 THEN 
           BEGIN
           WRITE (CHR (27), '[5;80f', CHR (27), '[1J');
           WRITE (CHR (27), '[f');
           END;
        IF NOT VT100 THEN WRITELN;
        END;

PROCEDURE Scroll_box; {Scroll only first five lines. Cursor starts at home.}
        BEGIN
        IF VT100 THEN
           WRITE (CHR (27), '[1;5r', CHR (27), '[f');
        END;

PROCEDURE Clear_block; {Clears lines 6 through 24. Leaves cursor at 6,0.}
       BEGIN
       IF VT100 THEN
          WRITE  (CHR (27), '[6;0f', CHR (27), '[0J');
       END;

PROCEDURE Erase_line;  {Erases line to end.}
       BEGIN
       IF VT100 THEN
          WRITE (CHR (27), '[K');
       END;

PROCEDURE Top_of_block; {Moves cursor to line 6.}
       BEGIN
       IF VT100 THEN
          WRITE (CHR(27), '[6;1f');
       END;

PROCEDURE Bottom_of_block; {Moves cursor to line 23.}
       BEGIN
       IF VT100 THEN
          WRITE (CHR(27), '[23;1f');
       END;

PROCEDURE Scroll_block; {Scrolls lines 6 through 23. Cursor starts at line 6.}
        BEGIN
        IF VT100 THEN
           WRITE (CHR (27), '[6;23r', CHR (27), '[6;1f');
        END;

PROCEDURE Save_cursor;
        BEGIN
        IF VT100 THEN
           WRITE (CHR (27), '7');
        END;

PROCEDURE Restore_cursor;
        BEGIN
        IF VT100 THEN
           WRITE (CHR (27), '8');
        END;

PROCEDURE Erase_to_end;
        BEGIN
        IF VT100 THEN
           WRITE (CHR (27), '[K');
        END;

PROCEDURE Bottom_line; {Clears and writes on bottom line.}
        BEGIN
        IF VT100 THEN
           WRITE (CHR (27), '[24;1f', CHR (27), '[0K');
        WRITELN;   {To avoid problems with WRITE's exceeding line limits.}
        END;

PROCEDURE Restore_scrolling; {Returns scrolling over whole screen.}
        BEGIN
        IF VT100 THEN
           WRITE (CHR (27), '[1;24r');
        END;

PROCEDURE GoToXY (X,Y: INTEGER);  {X = column number, Y = row number.}
        BEGIN
        IF VT100 THEN
           BEGIN
           WRITELN;
           WRITE (CHR (27), '[');
           IF Y<10 THEN WRITE (Y:1) ELSE WRITE (Y:2);
           WRITE (';');
           IF X<10 THEN WRITE (X:1) ELSE WRITE (X:2);
           WRITE ('H');
           END;
        END;


@echo off
for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined MyDate set MyDate=%%x
set today=%MyDate:~0,4%_%MyDate:~4,2%_%MyDate:~6,2%_H%MyDate:~8,2%_M%MyDate:~10,2%_S%MyDate:~12,2%
echo %today%
pause

@echo off
C:\postgresql\bin\pg_ctl -D "C:\postgresql\data" stop
echo Database arrestato.
set LOG_FILE="C:\Users\SBTJCP76P\OneDrive - DEDAGROUP SPA\Desktop\develops\PostgressDB\log_postgres.txt"

if exist %LOG_FILE% (
    del /f /q %LOG_FILE%
    echo File di log eliminato.
) else (
    echo Nessun file di log trovato.
)

pause
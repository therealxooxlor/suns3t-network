@echo off
echo Assigning the ID...
:gen ssnid
set ssnid=%random%.%random%.%random%.%random%.%random%.%random%.%random%.%random%.%random%.%random%.%random%.%random%
echo starting PassTheData...
ftp 
echo what file would you like to put in circulation?
set /p choice=FILE: 
:zipup
7za a -t7z %counter%-%%file%.7z %file%
set counter=counter + 1
if %counter%==15 goto :zipout
goto zipup
:zipout
echo Sending the file

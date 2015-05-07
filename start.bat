@echo off
echo Assigning the ID...
:gen ssnid
echo What do you want your id to be? 
set /p IDprefix=IDPREFIX: 
echo Do you want to have a fixed id to host files? MUST BE SAME EVERYTIME OR BROKEN LINKS WILL OCCUR!
set /p choiceofssnid=Y/n:
if %choiceofssnid% == Y goto :setfixed
set ssnid=%IDprefix%
if %choiceofssnid% == n goto :setssnidtemp
:setssnidtemp
echo %ssnid% is your ID.
echo what file would you like to put in circulation?
set /p choice=FILE: 
:zipup
7za a -t7z %counter%-%%file%.7z %file%
set counter=counter + 1
if %counter%==15 goto :zipout
goto zipup
:zipout
echo starting PassTheData...
set /p ipofserver=IP: 
if exist C:/Suns3tNetwork/servers.dat goto :configed
if NOT exist C:/Suns3tNetwork/servers.dat goto :setupconfiged
:setupconfiged
echo please install servers file.
:configed
ftp -s:C:/Suns3tNetwork/servers.dat %ipofserver%

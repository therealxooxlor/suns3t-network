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
echo starting PassTheData...
echo If you don't know a ip use "$Servers.dat"
set /p ipofserver=IP:
if %ipofserver% == $Servers.dat goto :serverdatinstall
:serverdatinstall
echo Will add when more servers come out.
if exist C:/Suns3tNetwork/servers.dat goto :configed
if NOT exist C:/Suns3tNetwork/servers.dat goto :setupconfiged
:setupconfiged
echo NOINSTRUSTIONS!!
:configed
ftp -s:C:/Suns3tNetwork/servers.dat %ipofserver%
Echo Connected
:menu
echo host or browse or PEER?
set /p hob=H/b: 
if %hob% == browse goto :browse
if %hob% == host goto :host
if %hob% == peer goto :idle
:browse
set /p link=LINK: 
Echo Searching for %link%...
set BrowseToken=%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo put request_%link%_.ssnfe.part file_%link%.ssnfe.part  >C:/Suns3tNetwork/%BrowseToken%.Browseforlink
echo disconnect >C:/Suns3tNetwork/%BrowseToken%.Browseforlink
ftp -s:C:/Suns3tNetwork/%BrowseToken%.Browseforlink %ipofserver%
echo 
:host
echo what file would you like to put in circulation?
set /p choice=FILE: 
set counter=1
7za a -t7z %counter%-%2bshiped%.7z %file%
set /p netfilename=NAME: 
set 2bshiped=%file%
:zipup
7za a -t7z %counter%-%netfilename%.7z %file%
set counter=%counter% + 1
set file=%counter%-%netfilename%.7z
Delete %file%
if %counter%==15 goto :zipout
goto zipup
:zipout
rename 15-%netfilename%.7z raw-%netfilename%.ssnfe
certutil encode raw-%netfilename%.ssnfe %netfilename%.ssnfe
echo b64 and file compress done.
echo spitting ssnfe...
echo %cd%\%netfilename%.ssnfe | clip
echo Sending into servers...
echo Path copyied to your clipboard
ftp -s:Send%netfilename%toserver.ssnfe.instructions
echo File sent to server. Access key: %AK%
pause
goto :menu
:idle
echo Peering...

echo setting up network adhoc.

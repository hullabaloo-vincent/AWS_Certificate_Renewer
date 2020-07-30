@echo off
::
::author: Vincent Giuseppe Aliquo
::email:vincega13@gmail.com
::

:: *** remove old file *** 
del temp.txt

:: *** get info *** 
okta-awscli >temp.txt

:: 
set /a count=0

SETLOCAL enabledelayedexpansion

::set parentDirRAW=%0
::set parentDirNoQuotes=%parentDirRAW:"=%
::set parentDir=%parentDirNoQuotes:LAUNCH.bat=%
set textFileLoc=temp.txt

for /F "tokens=* delims=" %%a in (%textFileLoc%) do (

         Set /a count+=1

         Set "output[!count!]=%%a"    

)
:: *****************   Get Keys From TXT   *****************

set keys[0]=%output[1]:export =%
set keys[1]=%output[2]:export =%
set keys[2]=%output[3]:export =%

set equals==

for /f "tokens=1,2 delims='%equals%'" %%a in ("%keys[0]%") do (
  set values[0]=%%b
)
for /f "tokens=1,2 delims='%equals%'" %%a in ("%keys[1]%") do (
  set values[1]=%%b
)
for /f "tokens=1,2 delims='%equals%'" %%a in ("%keys[2]%") do (
  set values[2]=%%b
)

echo UPDATING....
::echo KEY NAME: %keys[0]% - KEY VALUE: %values[0]%
::echo KEY NAME: %keys[1]% - KEY VALUE: %values[1]%
::echo KEY NAME: %keys[2]% - KEY VALUE: %values[2]%


:: *****************   Set ENV Variables   *****************

echo Setting Environment Variables

set firstVal=%values[0]%
set secondVal=%values[1]%
set thirdVal=%values[2]%

setX AWS_ACCESS_KEY_ID "%firstVal%" /m
setX AWS_SECRET_ACCESS_KEY "%secondVal%" /m
setX AWS_SESSION_TOKEN "%thirdVal%" /m

echo Environment Variables Saved
::del %HOMEPATH%\.aws\credentials
echo [default] >%HOMEPATH%\.aws\credentials
echo aws_access_key_id=%firstVal% >>%HOMEPATH%\.aws\credentials
echo aws_secret_access_key=%secondVal% >>%HOMEPATH%\.aws\credentials
echo aws_session_token=%thirdVal% >>%HOMEPATH%\.aws\credentials

echo .aws\credentials saved
echo done

pause

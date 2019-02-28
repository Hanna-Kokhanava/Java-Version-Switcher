@echo off
setlocal

if "%*"=="" (
  echo Choose an appropriate option :
  echo 1. for JDK 1.8
  echo 2. for JDK 1.11

  choice /C 12 /M "Print your choice : "
  if %ERRORLEVEL% EQU 2 (
  	set PARAM=1.11
  )
  if %ERRORLEVEL% EQU 1 (
  	set PARAM=1.8
  )
) else (
	set PARAM=%1
)

echo ----------------------------
echo JDK version : %PARAM%

if "%PARAM%"=="1.11" (
	set JAVA_VERSION=jdk-11.0.2
) else (
	if "%PARAM%"=="1.8" (
		set JAVA_VERSION=jdk1.8.0_201
	) else (
		echo Version was not set correctly
    echo Use command "jdk version" instead to specify jdk version directly
		exit /b
	)
)

echo JAVA-Version: %JAVA_VERSION%
echo ----------------------------

echo Setting JAVA_HOME
set JAVA_HOME="C:\Program Files\Java\%JAVA_VERSION%"
setx JAVA_HOME "C:\Program Files\Java\%JAVA_VERSION%" /m

set PATH=%JAVA_HOME%\bin;%PATH%
setx PATH "%PATH%;%JAVA_HOME%\\bin" /m

echo Display current java version
java -version

:End
cmd /k

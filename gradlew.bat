```batch
@REM
@REM Gradle wrapper script for windows.
@REM
@REM To use this script, add it to the root of your project and run it.
@REM It will download the appropriate gradle distribution and execute it.
@REM
@REM

@echo off

setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%

@REM Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass options to the JVM.
set DEFAULT_JVM_OPTS=

@REM Find java.exe
if defined JAVA_HOME (
    set JAVA_EXE="%JAVA_HOME%\bin\java.exe"
) else (
    set JAVA_EXE=java.exe
    where java.exe > NUL 2> NUL
    if %ERRORLEVEL% neq 0 (
        echo.
        echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
        echo.
        echo Please set the JAVA_HOME variable in your environment to match the
        echo location of your Java installation.
        echo.
        goto :fail
    )
)

@REM Execute gradle
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %GRADLE_OPTS% "-Dorg.gradle.appname=%APP_BASE_NAME%" "-Dorg.gradle.home=%APP_HOME%\gradle" -classpath "%APP_HOME%\gradle\wrapper\gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain %*

:exit
exit /b %errorlevel%

:fail
pause
exit /b 1
```
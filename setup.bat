@echo off
REM iOS Setup Script für Minute Master (Windows)
REM Dieser Script bereitet das Projekt vor für die Entwicklung

echo ========================================
echo  Minute Master - Flutter Setup
echo ========================================
echo.

REM Check if Flutter is installed
where flutter >nul 2>nul
if %errorlevel% neq 0 (
    echo [X] Flutter ist nicht installiert!
    echo.
    echo Bitte installiere Flutter zuerst:
    echo   Besuche: https://flutter.dev/docs/get-started/install/windows
    echo.
    pause
    exit /b 1
)

echo [OK] Flutter gefunden
flutter --version | findstr /C:"Flutter"
echo.

REM Run Flutter doctor
echo [*] Flutter Setup pruefen...
flutter doctor
echo.

REM Install dependencies
echo [*] Dependencies installieren...
flutter pub get
echo.

REM Create/update platform files
echo [*] Plattform-Struktur erstellen...
flutter create --platforms=android,ios .
echo.

echo ========================================
echo  Setup abgeschlossen!
echo ========================================
echo.
echo Naechste Schritte:
echo.
echo   Windows - Android Studio:
echo     1. Android Studio oeffnen
echo     2. File -^> Open
echo     3. Minute-Master Ordner waehlen
echo     4. Run druecken
echo.
echo   Windows - VS Code:
echo     1. VS Code oeffnen
echo     2. File -^> Open Folder
echo     3. Minute-Master Ordner waehlen
echo     4. F5 druecken oder: flutter run
echo.
echo   Mac - Xcode (fuer deinen Kollegen):
echo     cd ios
echo     open Runner.xcworkspace
echo.
echo ========================================
echo.
pause

;Include Modern UI
!include "MUI2.nsh"

;--------------------------------
;Styling
!define MUI_ICON "C:\etherpad-lite-new\src\static\img\brand.ico"
BrandingText "Etherpad Foundation"
Name "Etherpad Server"
OutFile "etherpad-server-windows.exe"

!insertmacro MUI_LANGUAGE "English"

Page directory
Page instfiles

; The default installation directory
InstallDir "$PROGRAMFILES\Etherpad Foundation\Etherpad Server"

Section
  SectionIn RO

  ; Set output path to the installation directory.
  SetOutPath $INSTDIR

  ; Put files there
  File /r "\etherpad-lite-new\*"

SectionEnd

Section
  CreateDirectory "$SMPROGRAMS\Etherpad Foundation"
  CreateShortCut "$SMPROGRAMS\Etherpad Foundation\Etherpad Server.lnk" "$INSTDIR\start.bat" \
  "some command line parameters" "$INSTDIR\start.bat" 2 SW_SHOWNORMAL \
  ALT|CONTROL|SHIFT|F5 "Etherpad Server"
  CreateShortCut "$SMPROGRAMS\Etherpad Foundation\Etherpad.lnk" "http://127.0.0.1:9001" \
  "some command line parameters" "http://127.0.0.1:9001" 2 SW_SHOWNORMAL \
  ALT|CONTROL|SHIFT|F5 "Etherpad"

  WriteRegStr HKEY_LOCAL_MACHINE "Software\Microsoft\Windows\CurrentVersion\Run" \
"Etherpad" "C:\etherpad-lite-new\start.bat"
  MessageBox MB_OK "Starting Etherpad"
SectionEnd

;Include Modern UI
!include "MUI2.nsh"

;--------------------------------
;Styling
!define MUI_ICON "brand.ico"
Icon "brand.ico"
BrandingText "Etherpad Foundation"
Name "Etherpad Server"
OutFile "etherpad-server-windows.exe"

!insertmacro MUI_LANGUAGE "English"

Page directory
Page instfiles

; The default installation directory
InstallDir "$LocalAppData\Programs\Etherpad Foundation\Etherpad Server"

Section
  SectionIn RO

  ; Set output path to the installation directory.
  SetOutPath $INSTDIR

  ; Put files there
  File /r "..\etherpad-lite-new"
  WriteUninstaller "$INSTDIR\uninstall.exe"

SectionEnd

Section
  CreateDirectory "$SMPROGRAMS\Etherpad Foundation"
  CreateShortCut "$SMPROGRAMS\Etherpad Foundation\Etherpad Server.lnk" "$INSTDIR\start.bat" "brand.ico" "Etherpad Server"
  CreateShortCut "$SMPROGRAMS\Etherpad Foundation\Etherpad.lnk" "http://127.0.0.1:9001" "brand.ico" "Etherpad"
  CreateShortCut "$SMPROGRAMS\Etherpad Foundation\Etherpad.lnk" "http://127.0.0.1:9001/admin" "brand.ico" "Etherpad Admin"
  CreateShortCut "$SMPROGRAMS\Etherpad Foundation\Uninstall.lnk" "$INSTDIR\uninstall.exe"
  Exec '$INSTDIR\start.bat'
SectionEnd

UninstPage confirm
UninstPage instfiles

Section Uninstall
  Delete -r "$INSTDIR\"
  Delete "$INSTDIR\uninstall.exe"
  RMDir "$INSTDIR"
  SetAutoClose false
SectionEnd

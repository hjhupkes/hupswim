;Setup For Office 2003/2007

;Requires non-public directory bin_priv
;To obtain this directory, contact hjhupkes

[Setup]
AppName=Hupsoft voor Office 2003/2007
AppID=Hupsoft voor Office 2003
AppVerName=Hupsoft
AppPublisher=H.J. Hupkes - Hupsoft
AppPublisherURL=http://home.kpn.nl/wimhupke/hupsoft
AppSupportURL=http://home.kpn.nl/wimhupke/hupsoft
AppUpdatesURL=http://home.kpn.nl/wimhupke/hupsoft
DefaultDirName=c:\zwem
DefaultGroupName=Hupswim
Compression=lzma
SolidCompression=yes
UsePreviousTasks=no
AllowNoIcons=yes

;Make sure that AlwaysUsePersonalGroup = true, so that icons are installed correctly.
AlwaysUsePersonalGroup = yes

OutputDir=..\..\..\release
OutputBaseFileName=setup_hupsoft_office_2003_2007


[Dirs]
Name: "{app}\backups"
Name: "{app}\diskette"
Name: "{app}\output"


[Files]



;Database files

Source: "..\..\..\rel_db\off2003\hupsw97.mde"; DestDir: "{app}\database"; Flags: ignoreversion recursesubdirs overwritereadonly; Check: MakeBackup(ExpandConstant('{app}\database'));
Source: "..\..\..\rel_db\off2003\wedstr97.mde"; DestDir: "{app}\database"; Flags: ignoreversion recursesubdirs overwritereadonly; Check: MakeBackup(ExpandConstant('{app}\database'));

Source: "..\..\..\bin\huppay\off2003\huppay.mde"; DestDir: "{app}\database"; Flags: ignoreversion recursesubdirs overwritereadonly; Check:MakeBackup(ExpandConstant('{app}\database'));

Source: "..\..\..\bin\inst\system.mdw"; DestDir: "{app}\database"; Flags: ignoreversion recursesubdirs overwritereadonly;  Check: MakeBackup(ExpandConstant('{app}\database'))



;Mail Merge files - only if not already present
Source: "..\..\..\bin\mm\*"; DestDir: "{app}\mailmerge"; Flags: onlyifdoesntexist recursesubdirs; Check: MakeBackup(ExpandConstant('{app}\database'));

;Handleidingen - always overwrite
Source: "..\..\..\doc\man\*"; DestDir: "{app}"; Flags: ignoreversion;  Check: MakeBackup(ExpandConstant('{app}\database'));

;Homepage files - only if not already present
Source: "..\..\..\bin\img\blauw.jpg"; DestDir: "{app}\homepage"; Flags: onlyifdoesntexist recursesubdirs; Check: MakeBackup(ExpandConstant('{app}\database'));

;Template files - only if not already present
Source: "..\..\..\bin\template\*"; DestDir: "{app}\template"; Flags: onlyifdoesntexist recursesubdirs; Check: MakeBackup(ExpandConstant('{app}\database'));


;Dll system files
Source: "..\..\..\bin_priv\dll\hupswim_strstorage.dll" ; DestDir: "{sys}"; Flags: ignoreversion recursesubdirs; Check: MakeBackup(ExpandConstant('{app}\database'));
Source: "..\..\..\bin\dll\hupswim.dll" ; DestDir: "{sys}"; Flags: ignoreversion recursesubdirs ; Check: MakeBackup(ExpandConstant('{app}\database'));
Source: "..\..\..\bin\dll\hupswim_unzip32.dll" ; DestDir: "{sys}"; Flags: ignoreversion recursesubdirs; Check: MakeBackup(ExpandConstant('{app}\database'));
Source: "..\..\..\bin\dll\richdll.dll" ; DestDir: "{sys}"; Flags: ignoreversion recursesubdirs    ; Check: MakeBackup(ExpandConstant('{app}\database'));
Source: "..\..\..\bin\dll\huptel.dll" ; DestDir: "{sys}"; Flags: ignoreversion recursesubdirs   ; Check: MakeBackup(ExpandConstant('{app}\database'));
Source: "..\..\..\bin\dll\hupswim_zip32.dll" ; DestDir: "{sys}"; Flags: ignoreversion recursesubdirs  ; Check: MakeBackup(ExpandConstant('{app}\database'));

;Dll file for database folder
Source: "..\..\..\bin_priv\dll\dynapdf.dll"; DestDir: "{app}\database"; Flags: ignoreversion recursesubdirs ; Check: MakeBackup(ExpandConstant('{app}\database'));

;Icon for database folder
Source: "..\..\..\bin\img\hzzian2.ico"; DestDir: "{app}\database"; Flags: ignoreversion recursesubdirs ; Check: MakeBackup(ExpandConstant('{app}\database'));










; NOTE: Don't use "Flags: ignoreversion" on any shared system files



[Tasks]
Name: useAcc2003; Description: "Access 2003 gebruiken [aanbevolen]"; GroupDescription: "Access 2003 en Access 2007 werden beiden aangetroffen. Kies de versie om te gebruiken:"; Flags: exclusive;  Check: ShouldPromptVersion();
Name: useAcc2007; Description: "Access 2007 gebruiken"; GroupDescription: "Access 2003 en Access 2007 werden beiden aangetroffen. Kies de versie om te gebruiken:"; Flags: exclusive unchecked; Check: ShouldPromptVersion();
Name: desktopicon; Description: "Create a &desktop icon"; GroupDescription: "Additional icons:";
Name: restorebackups; Description: "&Restore data from current version of Hupswim and Hupprog"; GroupDescription: "Restore data:"; Check: ShouldRestore(ExpandConstant('{app}\database'))



[Icons]
Name: "{group}\Handleiding Hupswim "; Filename: "{app}\handleid.doc"
Name: "{group}\Handleiding Hupprog "; Filename: "{app}\handprog.doc"
Name: "{group}\Handleiding Huppay"; Filename: "{app}\huppay.doc"
Name: "{group}\Handleiding Mailmerge functie"; Filename: "{app}\mailmerge.doc"
Name: "{group}\Handleiding Printer Instellingen"; Filename: "{app}\prntinst.doc"
;Name: "{group}\WAS2000 -> Hupswim (Office 2000) (Conversie)"; Filename: "{app}\database\WAS2000-hupsw.mde"; IconFileName: "{app}\database\hzzian2.ico"
;
;Acc 2003 hoofd-programma's
Name: "{group}\Hupswim (Tijden administratie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\11.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\hupsw97.mde"""; IconFileName: "{app}\database\hzzian2.ico"; Check: UseAcc2003();
Name: "{group}\Hupprog (Wedstrijd organisatie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\11.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\wedstr97.mde"""; IconFileName: "{app}\database\hzzian2.ico"; Check: UseAcc2003();
Name: "{group}\Hupswim [safe mode]"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\11.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\hupsw97.mde"" /cmd ""SafeMode"""; IconFileName: "{app}\database\hzzian2.ico"; Check: UseAcc2003();
Name: "{group}\Hupprog [safe mode]"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\11.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\wedstr97.mde"" /cmd ""SafeMode"""; IconFileName: "{app}\database\hzzian2.ico"; Check: UseAcc2003();
Name: "{group}\Huppay (Contributie administratie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\11.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\huppay.mde"""; IconFileName: "{app}\database\hzzian2.ico"; Check: UseAcc2003();
;Acc 2003 support:
Name: "{group}\Onderhoud Hupswim"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\11.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/compact /repair ""{app}\database\hupsw97.mde"""; IconFileName: "{app}\database\hzzian2.ico"; Check: UseAcc2003();
Name: "{group}\Onderhoud Hupprog"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\11.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/compact /repair ""{app}\database\wedstr97.mde"""; IconFileName: "{app}\database\hzzian2.ico"; Check: UseAcc2003();
Name: "{group}\Onderhoud Huppay"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\11.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/compact /repair ""{app}\database\huppay.mde"""; IconFileName: "{app}\database\hzzian2.ico"; Check: UseAcc2003();
;Acc 2003 desktop icons:
Name: "{userdesktop}\Hupswim (Tijden administratie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\11.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\hupsw97.mde"""; IconFileName: "{app}\database\hzzian2.ico"; Tasks: desktopicon; Check: UseAcc2003();
Name: "{userdesktop}\Hupprog (Wedstrijd organisatie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\11.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\wedstr97.mde"""; IconFileName: "{app}\database\hzzian2.ico"; Tasks: desktopicon; Check: UseAcc2003();
;
;
;Acc 2007 hoofd-programma's
Name: "{group}\Hupswim (Tijden administratie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\12.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\hupsw97.mde"""; IconFileName: "{app}\database\hzzian2.ico";  Check: UseAcc2007();
Name: "{group}\Hupprog (Wedstrijd organisatie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\12.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\wedstr97.mde"""; IconFileName: "{app}\database\hzzian2.ico";  Check: UseAcc2007();
Name: "{group}\Hupswim [safe mode]"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\12.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\hupsw97.mde"" /cmd ""SafeMode"""; IconFileName: "{app}\database\hzzian2.ico"; Check: UseAcc2007();
Name: "{group}\Hupprog [safe mode]"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\12.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\wedstr97.mde"" /cmd ""SafeMode"""; IconFileName: "{app}\database\hzzian2.ico"; Check: UseAcc2007();
Name: "{group}\Huppay (Contributie administratie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\12.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\huppay.mde"""; IconFileName: "{app}\database\hzzian2.ico";  Check: UseAcc2007();
;Acc 2007 support:
Name: "{group}\Onderhoud Hupswim"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\12.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/compact /repair ""{app}\database\hupsw97.mde"""; IconFileName: "{app}\database\hzzian2.ico";  Check: UseAcc2007();
Name: "{group}\Onderhoud Hupprog"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\12.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/compact /repair ""{app}\database\wedstr97.mde"""; IconFileName: "{app}\database\hzzian2.ico";  Check: UseAcc2007();
Name: "{group}\Onderhoud Huppay"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\12.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/compact /repair ""{app}\database\huppay.mde"""; IconFileName: "{app}\database\hzzian2.ico";  Check: UseAcc2007();
;Acc 2007 desktop icons:
Name: "{userdesktop}\Hupswim (Tijden administratie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\12.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\hupsw97.mde"""; IconFileName: "{app}\database\hzzian2.ico"; Tasks: desktopicon;  Check: UseAcc2007();
Name: "{userdesktop}\Hupprog (Wedstrijd organisatie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\12.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\wedstr97.mde"""; IconFileName: "{app}\database\hzzian2.ico"; Tasks: desktopicon;  Check: UseAcc2007();



[Run]
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\11.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\hupsw97.mde"" /x gRestoreSetupBackup";  StatusMsg: "Restoring Hupswim data...";  Tasks: restorebackups; Check: ShouldRestore(ExpandConstant('{app}\database')) and UseAcc2003();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\11.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\wedstr97.mde"" /x gRestoreSetupBackup"; StatusMsg: "Restoring Hupprog data...";  Tasks: restorebackups;  Check: ShouldRestore(ExpandConstant('{app}\database')) and UseAcc2003();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\12.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\hupsw97.mde"" /x gRestoreSetupBackup";  StatusMsg: "Restoring Hupswim data...";  Tasks: restorebackups; Check: ShouldRestore(ExpandConstant('{app}\database')) and UseAcc2007();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\12.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\wedstr97.mde"" /x gRestoreSetupBackup"; StatusMsg: "Restoring Hupprog data...";  Tasks: restorebackups;  Check: ShouldRestore(ExpandConstant('{app}\database')) and UseAcc2007();





[Code]
var
  prvVersionFound:boolean;
  backupAttempted:boolean;
  backupOK:boolean;
  blFoundAcc2003:boolean;
  blFoundAcc2007:boolean;

function InitializeSetup(): Boolean;
begin
  prvVersionFound:=false;
  backupAttempted:=false;
  backupOK:=false;
  result:=true;
  
  blFoundAcc2003:= RegKeyExists(HKEY_LOCAL_MACHINE, 'Software\microsoft\office\11.0\Access');
  blFoundAcc2007:= RegKeyExists(HKEY_LOCAL_MACHINE, 'Software\microsoft\office\12.0\Access');
  
  
  if (not (blFoundAcc2003 or blFoundAcc2007) ) then begin
    msgBox('Hupswim kon geen geinstalleerde versie van Access 2003/2007 vinden. Download eerst de runtime versie van Access 2003 van de Hupsoft website (http://home.kpn.nl/wimhupke/hupsoft)', mbInformation, MB_OK);
    result:=false;
  end;
end;

function ShouldPromptVersion(): Boolean;
begin
  result:=false;
  if (blFoundAcc2003 and blFoundAcc2007) then begin
    result:=true;
  end;
end;

function UseAcc2003(): Boolean;
begin
  result:=false;
  if (blFoundAcc2003) then begin
    if (not blFoundAcc2007) then begin
      result:=true;
    end else begin
      if IsTaskSelected('useAcc2003') then begin
        result:=true;
      end;
    end;
  end;
end;

function UseAcc2007(): Boolean;
begin
  result:=false;
  if (blFoundAcc2007) then begin
    if (not blFoundAcc2003) then begin
      result:=true;
    end else begin
      if IsTaskSelected('useAcc2007') then begin
        result:=true;
      end;
    end;
  end;
end;

  
function backupFile(DirName: String; fName:string):boolean;
var
  nFName:string;
  nNameDet:boolean;
  i:integer;
begin
  result:=false;
  
  if (not FileExists(DirName + '\' + fName)) then begin
    result:=true;
    exit;
  end;
  
  prvVersionFound:=true;
  
  nNameDet:=false;
  i:=0;
  while (not nNameDet) do begin
    nFName:=fName+'.backup' + inttostr(i) + '.mde';
    if (not FileExists(dirName + '\setupbackups\' + nFName)) then begin
      nNameDet:=true;
    end;
    i:=i+1;
  end;
  if not FileCopy(DirName + '\' + fName, DirName + '\setupbackups\' + nFName, false) then begin
    MsgBox('De volgende fout is opgetreden bij het maken van een backup: ' + 'Het bestand: ' + DirName + '\setupbackups\' + nFName + ' kon niet worden aangemaakt.' ,  mbError, MB_OK);
    exit;
  end;
  
  

  result:=true;
  
end;






function MakeBackup(DirName: String): Boolean;
begin

  result:=false;

  if (backupAttempted) then begin
    result:=backupOK;
    exit;
  end;
  
  backupAttempted:=true;
  
  try

    if (not DirExists(DirName + '\setupbackups')) then begin
      CreateDir(DirName + '\setupbackups');
    end;
    if not backupFile(DirName, 'hupsw97.mde') then begin
      exit;
    end;
    if not backupFile(DirName, 'wedstr97.mde') then begin
      exit;
    end;
    if not backupFile(DirName, 'huppay.mde') then begin
      exit;
    end;
    
    backupOK:=true;
    result:=true;
    
  except
    MsgBox('De volgende fout is opgetreden bij het maken van een backup: ' + AddPeriod(GetExceptionMessage),  mbError, MB_OK);
  end;
end;

function ShouldRestore(sDBDirName:string): Boolean;
begin
  if (backupAttempted) then begin
    if (not backupOK) then begin
      result:=false;
    end else begin
      if (prvVersionFound) then begin
        result:=true;
      end else begin
        result:=false;
      end;
    end;
  end else begin
    if fileExists( sDBDirName  + '\hupsw97.mde') then begin
      result:=true;
    end else begin
      result:=false;
    end;
  end;
end;





procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var
  sRegValue:string;
begin

  if (curUninstallStep=usUninstall) then begin

    //Need to delete potential registry links for lxf files
    if RegKeyExists( HKEY_CLASSES_ROOT, '.lxf' ) then begin
      if RegQueryStringValue( HKEY_CLASSES_ROOT, '.lxf', '' , sRegValue) then begin
        if (sRegValue = 'LXF.HUPSOFT.5x' ) then begin
          RegDeleteValue( HKEY_CLASSES_ROOT, '.lxf', '');
          RegDeleteKeyIfEmpty(HKEY_CLASSES_ROOT, '.lxf');
        end;
      end;
    end;


    RegDeleteKeyIncludingSubkeys(HKEY_CLASSES_ROOT, 'LXF.HUPSOFT.5x');

  end;


end;

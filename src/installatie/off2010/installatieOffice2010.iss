;Setup For Office 2010/2013/2016

;Requires non-public directory bin_priv
;To obtain this directory, contact hjhupkes

[Setup]
AppName=Hupsoft voor Office 2010/2013/2016
AppID=Hupsoft voor Office 2010/2013/2016
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
OutputBaseFileName=setup_hupsoft_office_2010_plus


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

;Dll files for database folder
Source: "..\..\..\bin_priv\dll\dynapdf.dll"; DestDir: "{app}\database"; Flags: ignoreversion recursesubdirs ; Check: MakeBackup(ExpandConstant('{app}\database'));
Source: "..\..\..\bin_priv\dll\hupswim_mouse.dll"; DestDir: "{app}\database"; Flags: ignoreversion recursesubdirs ; Check: MakeBackup(ExpandConstant('{app}\database'));
;Exe file for database folder
Source: "..\..\..\bin_priv\exe\winscp425.exe"; DestDir: "{app}\database"; Flags: ignoreversion recursesubdirs ; Check: MakeBackup(ExpandConstant('{app}\database'));

;Icon for database folder
Source: "..\..\..\bin\img\hzzian2.ico"; DestDir: "{app}\database"; Flags: ignoreversion recursesubdirs ; Check: MakeBackup(ExpandConstant('{app}\database'));










; NOTE: Don't use "Flags: ignoreversion" on any shared system files



[Tasks]
Name: useAcc2016; Description: "Access 2016 gebruiken"; GroupDescription: "Meerdere versies van Access werden aangetroffen. Kies de versie om te gebruiken:"; Flags: exclusive unchecked; Check: ShouldPromptVersion() and IsAcc2016Present();
Name: useAcc2013; Description: "Access 2013 gebruiken"; GroupDescription: "Meerdere versies van Access werden aangetroffen. Kies de versie om te gebruiken:"; Flags: exclusive unchecked; Check: ShouldPromptVersion() and IsAcc2013Present();
Name: useAcc2010; Description: "Access 2010 gebruiken [aanbevolen]"; GroupDescription: "Meerdere versies van Access werden aangetroffen. Kies de versie om te gebruiken:"; Flags: exclusive; Check: ShouldPromptVersion() and IsAcc2010Present();


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


;Acc 2010 hoofd-programma's
Name: "{group}\Hupswim (Tijden administratie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\14.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\hupsw97.mde"""; IconFileName: "{app}\database\hzzian2.ico";  Check: UseAcc2010();
Name: "{group}\Hupprog (Wedstrijd organisatie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\14.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\wedstr97.mde"""; IconFileName: "{app}\database\hzzian2.ico";  Check: UseAcc2010();
Name: "{group}\Hupswim [safe mode]"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\14.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\hupsw97.mde"" /cmd ""SafeMode"""; IconFileName: "{app}\database\hzzian2.ico"; Check: UseAcc2010();
Name: "{group}\Hupprog [safe mode]"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\14.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\wedstr97.mde"" /cmd ""SafeMode"""; IconFileName: "{app}\database\hzzian2.ico"; Check: UseAcc2010();
Name: "{group}\Huppay (Contributie administratie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\14.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\huppay.mde"""; IconFileName: "{app}\database\hzzian2.ico";  Check: UseAcc2010();
;Acc 2010 support:
Name: "{group}\Onderhoud Hupswim"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\14.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/compact /repair ""{app}\database\hupsw97.mde"""; IconFileName: "{app}\database\hzzian2.ico";  Check: UseAcc2010();
Name: "{group}\Onderhoud Hupprog"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\14.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/compact /repair ""{app}\database\wedstr97.mde"""; IconFileName: "{app}\database\hzzian2.ico";  Check: UseAcc2010();
Name: "{group}\Onderhoud Huppay"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\14.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/compact /repair ""{app}\database\huppay.mde"""; IconFileName: "{app}\database\hzzian2.ico";  Check: UseAcc2010();
;Acc 2010 desktop icons:
Name: "{userdesktop}\Hupswim (Tijden administratie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\14.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\hupsw97.mde"""; IconFileName: "{app}\database\hzzian2.ico"; Tasks: desktopicon;  Check: UseAcc2010();
Name: "{userdesktop}\Hupprog (Wedstrijd organisatie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\14.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\wedstr97.mde"""; IconFileName: "{app}\database\hzzian2.ico"; Tasks: desktopicon;  Check: UseAcc2010();

;Acc 2013 hoofd-programma's
Name: "{group}\Hupswim (Tijden administratie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\15.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\hupsw97.mde"""; IconFileName: "{app}\database\hzzian2.ico";  Check: UseAcc2013();
Name: "{group}\Hupprog (Wedstrijd organisatie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\15.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\wedstr97.mde"""; IconFileName: "{app}\database\hzzian2.ico";  Check: UseAcc2013();
Name: "{group}\Hupswim [safe mode]"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\15.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\hupsw97.mde"" /cmd ""SafeMode"""; IconFileName: "{app}\database\hzzian2.ico"; Check: UseAcc2013();
Name: "{group}\Hupprog [safe mode]"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\15.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\wedstr97.mde"" /cmd ""SafeMode"""; IconFileName: "{app}\database\hzzian2.ico"; Check: UseAcc2013();
Name: "{group}\Huppay (Contributie administratie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\15.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\huppay.mde"""; IconFileName: "{app}\database\hzzian2.ico";  Check: UseAcc2013();
;Acc 2013 support:
Name: "{group}\Onderhoud Hupswim"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\15.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/compact /repair ""{app}\database\hupsw97.mde"""; IconFileName: "{app}\database\hzzian2.ico";  Check: UseAcc2013();
Name: "{group}\Onderhoud Hupprog"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\15.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/compact /repair ""{app}\database\wedstr97.mde"""; IconFileName: "{app}\database\hzzian2.ico";  Check: UseAcc2013();
Name: "{group}\Onderhoud Huppay"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\15.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/compact /repair ""{app}\database\huppay.mde"""; IconFileName: "{app}\database\hzzian2.ico";  Check: UseAcc2013();
;Acc 2013 desktop icons:
Name: "{userdesktop}\Hupswim (Tijden administratie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\15.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\hupsw97.mde"""; IconFileName: "{app}\database\hzzian2.ico"; Tasks: desktopicon;  Check: UseAcc2013();
Name: "{userdesktop}\Hupprog (Wedstrijd organisatie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\15.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\wedstr97.mde"""; IconFileName: "{app}\database\hzzian2.ico"; Tasks: desktopicon;  Check: UseAcc2013();

;Acc 2016 hoofd-programma's
Name: "{group}\Hupswim (Tijden administratie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\16.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\hupsw97.mde"""; IconFileName: "{app}\database\hzzian2.ico";  Check: UseAcc2013();
Name: "{group}\Hupprog (Wedstrijd organisatie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\16.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\wedstr97.mde"""; IconFileName: "{app}\database\hzzian2.ico";  Check: UseAcc2013();
Name: "{group}\Hupswim [safe mode]"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\16.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\hupsw97.mde"" /cmd ""SafeMode"""; IconFileName: "{app}\database\hzzian2.ico"; Check: UseAcc2013();
Name: "{group}\Hupprog [safe mode]"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\16.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\wedstr97.mde"" /cmd ""SafeMode"""; IconFileName: "{app}\database\hzzian2.ico"; Check: UseAcc2013();
Name: "{group}\Huppay (Contributie administratie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\16.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\huppay.mde"""; IconFileName: "{app}\database\hzzian2.ico";  Check: UseAcc2013();
;Acc 2016 support:
Name: "{group}\Onderhoud Hupswim"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\16.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/compact /repair ""{app}\database\hupsw97.mde"""; IconFileName: "{app}\database\hzzian2.ico";  Check: UseAcc2016();
Name: "{group}\Onderhoud Hupprog"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\16.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/compact /repair ""{app}\database\wedstr97.mde"""; IconFileName: "{app}\database\hzzian2.ico";  Check: UseAcc2016();
Name: "{group}\Onderhoud Huppay"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\16.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/compact /repair ""{app}\database\huppay.mde"""; IconFileName: "{app}\database\hzzian2.ico";  Check: UseAcc2016();
;Acc 2016 desktop icons:
Name: "{userdesktop}\Hupswim (Tijden administratie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\16.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\hupsw97.mde"""; IconFileName: "{app}\database\hzzian2.ico"; Tasks: desktopicon;  Check: UseAcc2016();
Name: "{userdesktop}\Hupprog (Wedstrijd organisatie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\16.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\wedstr97.mde"""; IconFileName: "{app}\database\hzzian2.ico"; Tasks: desktopicon;  Check: UseAcc2016();



[Run]
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\14.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\hupsw97.mde"" /x gRestoreSetupBackup";  StatusMsg: "Restoring Hupswim data...";  Tasks: restorebackups; Check: ShouldRestore(ExpandConstant('{app}\database')) and UseAcc2010();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\14.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\wedstr97.mde"" /x gRestoreSetupBackup"; StatusMsg: "Restoring Hupprog data...";  Tasks: restorebackups;  Check: ShouldRestore(ExpandConstant('{app}\database')) and UseAcc2010();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\15.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\hupsw97.mde"" /x gRestoreSetupBackup";  StatusMsg: "Restoring Hupswim data...";  Tasks: restorebackups; Check: ShouldRestore(ExpandConstant('{app}\database')) and UseAcc2013();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\15.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\wedstr97.mde"" /x gRestoreSetupBackup"; StatusMsg: "Restoring Hupprog data...";  Tasks: restorebackups;  Check: ShouldRestore(ExpandConstant('{app}\database')) and UseAcc2013();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\16.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\hupsw97.mde"" /x gRestoreSetupBackup";  StatusMsg: "Restoring Hupswim data...";  Tasks: restorebackups; Check: ShouldRestore(ExpandConstant('{app}\database')) and UseAcc2016();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\16.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{app}\database\wedstr97.mde"" /x gRestoreSetupBackup"; StatusMsg: "Restoring Hupprog data...";  Tasks: restorebackups;  Check: ShouldRestore(ExpandConstant('{app}\database')) and UseAcc2016();





[Code]
var
  prvVersionFound:boolean;
  backupAttempted:boolean;
  backupOK:boolean;
  
  blFoundAcc2010:boolean;
  blFoundAcc2013:boolean;
  blFoundAcc2016:boolean;
  nAccVersionsFound:integer;


function InitializeSetup(): Boolean;
begin
  prvVersionFound:=false;
  backupAttempted:=false;
  backupOK:=false;
  result:=true;
  
  blFoundAcc2010:= RegKeyExists(HKEY_LOCAL_MACHINE, 'Software\microsoft\office\14.0\Access');
  blFoundAcc2013:= RegKeyExists(HKEY_LOCAL_MACHINE, 'Software\microsoft\office\15.0\Access');
  blFoundAcc2016:= RegKeyExists(HKEY_LOCAL_MACHINE, 'Software\microsoft\office\16.0\Access');

  nAccVersionsFound:=0;
  if (blFoundAcc2010) then begin
    nAccVersionsFound:=nAccVersionsFound+1;
  end;
  if (blFoundAcc2013) then begin
    nAccVersionsFound:=nAccVersionsFound+1;
  end;
  if (blFoundAcc2016) then begin
    nAccVersionsFound:=nAccVersionsFound+1;
  end;

  
  if (nAccVersionsFound = 0 ) then begin
    msgBox('Hupswim kon geen geinstalleerde versie van Access 2010/2013/2016 vinden. Download eerst de runtime versie van Access 2010 van de Hupsoft website (http://home.kpn.nl/wimhupke/hupsoft)', mbInformation, MB_OK);
    result:=false;
  end;
end;

function ShouldPromptVersion(): Boolean;
var
  nVerFound:integer;
begin
 result:=false;
  if (nAccVersionsFound > 1) then begin
    result:=true;
  end;
end;

function IsAcc2010Present(): Boolean;
begin
  result:=blFoundAcc2010;
end;

function IsAcc2013Present(): Boolean;
begin
  result:=blFoundAcc2013;
end;

function IsAcc2016Present(): Boolean;
begin
  result:=blFoundAcc2016;
end;



function UseAcc2010(): Boolean;
begin
  result:=false;
  if (blFoundAcc2010) then begin
    if ( nAccVersionsFound <= 1) then begin
      result:=true;
    end else begin
      if IsTaskSelected('useAcc2010') then begin
        result:=true;
      end;
    end;
  end;
end;

function UseAcc2013(): Boolean;
begin
  result:=false;
  if (blFoundAcc2013) then begin
    if ( nAccVersionsFound <= 1) then begin
      result:=true;
    end else begin
      if IsTaskSelected('useAcc2013') then begin
        result:=true;
      end;
    end;
  end;
end;

function UseAcc2016(): Boolean;
begin
  result:=false;
  if (blFoundAcc2016) then begin
    if ( nAccVersionsFound <= 1) then begin
      result:=true;
    end else begin
      if IsTaskSelected('useAcc2016') then begin
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
    
    //Need to delete potential registry links for lef files
    if RegKeyExists( HKEY_CLASSES_ROOT, '.lef' ) then begin
      if RegQueryStringValue( HKEY_CLASSES_ROOT, '.lef', '' , sRegValue) then begin
        if (sRegValue = 'LEF.HUPSOFT.5x' ) then begin
          RegDeleteValue( HKEY_CLASSES_ROOT, '.lef', '');
          RegDeleteKeyIfEmpty(HKEY_CLASSES_ROOT, '.lef');
        end;
      end;
    end;


    RegDeleteKeyIncludingSubkeys(HKEY_CLASSES_ROOT, 'LXF.HUPSOFT.5x');
    RegDeleteKeyIncludingSubkeys(HKEY_CLASSES_ROOT, 'LEF.HUPSOFT.5x');

  end;


end;

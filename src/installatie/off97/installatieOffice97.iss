;Setup For Office 97

;Requires non-public directory bin_priv
;To obtain this directory, contact hjhupkes

[Setup]
AppName=Hupsoft voor Office 97
AppVerName=Hupsoft
AppPublisher=H.J. Hupkes - Hupsoft
AppPublisherURL=http://home.kpn.nl/wimhupke/hupsoft
AppSupportURL=http://home.kpn.nl/wimhupke/hupsoft
AppUpdatesURL=http://home.kpn.nl/wimhupke/hupsoft
DefaultDirName=c:\zwem
DefaultGroupName=Hupswim
Compression=lzma
SolidCompression=yes
;DisableFinishedPage=yes

;Make sure that icons are installed in personal group
AlwaysUsePersonalGroup = yes

OutputDir=..\..\..\release
OutputBaseFileName=setup_hupsoft_office_97

;Need to block program group page and usePreviousGroup, since the acme setup can only install to group hupswim
DisableProgramGroupPage=yes
UsePreviousGroup=no

UsePreviousTasks=no

[Dirs]
Name: "{app}\backups"
Name: "{app}\diskette"
Name: "{app}\output"


[Files]


;First setup the files for the acme setup program to handle
Source: "..\..\..\bin\inst\system.mdw"; DestDir: "{app}\setupNieuw"; Flags: ignoreversion recursesubdirs overwritereadonly;  Check: (not IsAcc97Present()) and MakeBackup(ExpandConstant('{app}\database'))
Source: "..\..\..\bin_priv\rtAcc97\*"; DestDir: "{app}\setupNieuw"; Flags: ignoreversion recursesubdirs overwritereadonly;  Check: (not IsAcc97Present()) and MakeBackup(ExpandConstant('{app}\database'))
Source: ".\admin.inf"; DestDir: "{app}\setupNieuw"; Flags: ignoreversion recursesubdirs overwritereadonly; Check: (not IsAcc97Present()) and MakeBackup(ExpandConstant('{app}\database'))
Source: ".\setup.inf"; DestDir: "{app}\setupNieuw"; Flags: ignoreversion recursesubdirs overwritereadonly; Check: (not IsAcc97Present()) and MakeBackup(ExpandConstant('{app}\database'))
Source: ".\setup.lst"; DestDir: "{app}\setupNieuw"; Flags: ignoreversion recursesubdirs overwritereadonly; Check: (not IsAcc97Present()) and MakeBackup(ExpandConstant('{app}\database'))
Source: ".\setup.stf"; DestDir: "{app}\setupNieuw"; DestName:"setup_prlm.stf"; Flags: ignoreversion recursesubdirs overwritereadonly; Check: (not IsAcc97Present()) and MakeBackup(ExpandConstant('{app}\database'))

;Icon for database folder
Source: "..\..\..\bin\img\hzzian2.ico"; DestDir: "{app}\setupNieuw"; Flags: ignoreversion recursesubdirs ; Check: (not IsAcc97Present()) and MakeBackup(ExpandConstant('{app}\database'))

;Built databases
Source: "..\..\..\rel_db\off97\hupsw97.mde"; DestDir: "{app}\setupNieuw"; Flags: ignoreversion recursesubdirs overwritereadonly;   Check: (not IsAcc97Present()) and MakeBackup(ExpandConstant('{app}\database'))
Source: "..\..\..\rel_db\off97\wedstr97.mde"; DestDir: "{app}\setupNieuw"; Flags: ignoreversion recursesubdirs overwritereadonly;  Check: (not IsAcc97Present()) and MakeBackup(ExpandConstant('{app}\database'))

Source: "..\..\..\bin\huppay\off97\huppay.mde"; DestDir: "{app}\setupNieuw"; Flags: ignoreversion recursesubdirs overwritereadonly;  Check: (not IsAcc97Present()) and MakeBackup(ExpandConstant('{app}\database'))

;End acme setup portion


;Direct copy of database files in case acc97 is already present.
Source: "..\..\..\rel_db\off97\hupsw97.mde"; DestDir: "{app}\database"; Flags: ignoreversion recursesubdirs overwritereadonly; Check: IsAcc97Present() and MakeBackup(ExpandConstant('{app}\database'));
Source: "..\..\..\rel_db\off97\wedstr97.mde"; DestDir: "{app}\database"; Flags: ignoreversion recursesubdirs overwritereadonly; Check: IsAcc97Present() and MakeBackup(ExpandConstant('{app}\database'));

Source: "..\..\..\bin\huppay\off97\huppay.mde"; DestDir: "{app}\database"; Flags: ignoreversion recursesubdirs overwritereadonly; Check: IsAcc97Present() and MakeBackup(ExpandConstant('{app}\database'));

Source: "..\..\..\bin\inst\system.mdw"; DestDir: "{app}\database"; Flags: ignoreversion recursesubdirs overwritereadonly;  Check: IsAcc97Present() and MakeBackup(ExpandConstant('{app}\database'))

;End direct copy of database files in case acc97 is already present





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


[UninstallDelete]
Type: Files; Name: "{app}\setup\setup.stf";
Type: Files; Name: "{app}\setup\mscreate.dir";
Type: Files; Name: "{app}\setup\32autole.dll";
Type: Files; Name: "{app}\setup\acmsetup.hlp";
Type: Files; Name: "{app}\setup\msacccah.dll";
Type: Files; Name: "{app}\setup\msodeusa.dll";
Type: Files; Name: "{app}\setup\mssetup.dll";
Type: Files; Name: "{app}\setup\setup.exe";
Type: Files; Name: "{app}\setup\setup.inf";
Type: Files; Name: "{app}\setup\setup.ini";
Type: Files; Name: "{app}\setup\setup.tdf";

Type: Files; Name: "{app}\setupNieuw\setup.tdf";
Type: Files; Name: "{app}\setupNieuw\setup.stf";

;Delete icons created by acme installer
Type: Files; Name: "{group}\Hupswim (Tijden administratie).lnk";
Type: Files; Name: "{group}\Hupprog (Wedstrijd organisatie).lnk";
Type: Files; Name: "{group}\Huppay (Contributie administratie).lnk";
Type: Files; Name: "{group}\Onderhoud Hupswim.lnk";
Type: Files; Name: "{group}\Onderhoud Hupprog.lnk";
Type: Files; Name: "{group}\Onderhoud Huppay.lnk";
Type: Files; Name: "{group}\mscreate.dir";


Type: dirifempty; Name: "{app}\setup";
Type: dirifempty; Name: "{app}\setupNieuw";
Type: dirifempty; Name: "{group}";




[Tasks]
Name: restorebackups; Description: "&Restore data from current version of Hupswim and Hupprog"; GroupDescription: "Restore data:"; Check: ShouldRestore(ExpandConstant('{app}\database'))

[Run]
FileName: "{app}\setupNieuw\setup.exe"; Parameters: "/q1"; StatusMsg: "Installing runtime version...";   Check: (not IsAcc97Present()) and PrepareAcmeSetup();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\8.0\Common\InstallRoot,OfficeBin}\msaccess.exe"; Parameters: "/runtime /wrkgrp ""{app}\database\system.mdw"" ""{app}\database\hupsw97.mde"" /x gRestoreSetupBackup";  StatusMsg: "Restoring Hupswim data...";  Tasks: restorebackups; Check: ShouldRestore(ExpandConstant('{app}\database'));
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\8.0\Common\InstallRoot,OfficeBin}\msaccess.exe"; Parameters: "/runtime /wrkgrp ""{app}\database\system.mdw"" ""{app}\database\wedstr97.mde"" /x gRestoreSetupBackup"; StatusMsg: "Restoring Hupprog data...";  Tasks: restorebackups;  Check: ShouldRestore(ExpandConstant('{app}\database'));


[Icons]
;Documentation icons
Name: "{group}\Handleiding Hupswim "; Filename: "{app}\handleid.doc"
Name: "{group}\Handleiding Hupprog "; Filename: "{app}\handprog.doc"
Name: "{group}\Handleiding Huppay"; Filename: "{app}\huppay.doc"
Name: "{group}\Handleiding Mailmerge functie"; Filename: "{app}\mailmerge.doc"
Name: "{group}\Handleiding Printer Instellingen"; Filename: "{app}\prntinst.doc"
;End documentation icons


;Acc 97 hoofd-programma's
;Only install if acc97 is already present
Name: "{group}\Hupswim (Tijden administratie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\8.0\Common\InstallRoot,OfficeBin}\msaccess.exe"; Parameters: "/runtime /wrkgrp ""{app}\database\system.mdw"" ""{app}\database\hupsw97.mde"""; IconFileName: "{app}\database\hzzian2.ico"; Check: IsAcc97Present();
Name: "{group}\Hupprog (Wedstrijd organisatie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\8.0\Common\InstallRoot,OfficeBin}\msaccess.exe"; Parameters: "/runtime /wrkgrp ""{app}\database\system.mdw"" ""{app}\database\wedstr97.mde"""; IconFileName: "{app}\database\hzzian2.ico"; Check: IsAcc97Present();
Name: "{group}\Hupswim [safe mode]"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\8.0\Common\InstallRoot,OfficeBin}\msaccess.exe"; Parameters: "/runtime /wrkgrp ""{app}\database\system.mdw"" ""{app}\database\hupsw97.mde"" /cmd ""SafeMode"""; IconFileName: "{app}\database\hzzian2.ico"; Check: IsAcc97Present();
Name: "{group}\Hupprog [safe mode]"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\8.0\Common\InstallRoot,OfficeBin}\msaccess.exe"; Parameters: "/runtime /wrkgrp ""{app}\database\system.mdw"" ""{app}\database\wedstr97.mde"" /cmd ""SafeMode"""; IconFileName: "{app}\database\hzzian2.ico"; Check: IsAcc97Present();
Name: "{group}\Huppay (Contributie administratie)"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\8.0\Common\InstallRoot,OfficeBin}\msaccess.exe"; Parameters: "/runtime /wrkgrp ""{app}\database\system.mdw"" ""{app}\database\huppay.mde"""; IconFileName: "{app}\database\hzzian2.ico"; Check: IsAcc97Present();
;Acc 97 support
;Only install if acc97 is already present
Name: "{group}\Onderhoud Hupswim"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\8.0\Common\InstallRoot,OfficeBin}\msaccess.exe"; Parameters: "/wrkgrp ""{app}\database\system.mdw"" /repair ""{app}\database\hupsw97.mde"" /compact"; IconFileName: "{app}\database\hzzian2.ico"; Check: IsAcc97Present();
Name: "{group}\Onderhoud Hupprog"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\8.0\Common\InstallRoot,OfficeBin}\msaccess.exe"; Parameters: "/wrkgrp ""{app}\database\system.mdw"" /repair ""{app}\database\wedstr97.mde"" /compact"; IconFileName: "{app}\database\hzzian2.ico"; Check: IsAcc97Present();
Name: "{group}\Onderhoud Huppay"; Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\8.0\Common\InstallRoot,OfficeBin}\msaccess.exe"; Parameters: "/wrkgrp ""{app}\database\system.mdw"" /repair ""{app}\database\huppay.mde"" /compact" ; IconFileName: "{app}\database\hzzian2.ico"; Check: IsAcc97Present();




[Code]
var
  prvVersionFound:boolean;
  backupAttempted:boolean;
  backupOK:boolean;

  blFoundAcc97:boolean;
  blAcmeSetupPrepared:boolean;

function InitializeSetup(): Boolean;
var
  sAccLoc:string;
begin
  prvVersionFound:=false;
  backupAttempted:=false;
  backupOK:=false;
  result:=true;


  blAcmeSetupPrepared:=false;
  blFoundAcc97:= RegKeyExists(HKEY_LOCAL_MACHINE, 'Software\microsoft\office\8.0\Access');
  
  if (blFoundAcc97) then begin
    if not RegQueryStringValue(HKEY_LOCAL_MACHINE, 'software\microsoft\office\8.0\common\InstallRoot','OfficeBin', sAccLoc) then begin
      blFoundAcc97:=false;
    end else begin
      sAccLoc:=sAccLoc + '\msaccess.exe';
      if not fileExists(sAccLoc) then begin
         blFoundAcc97:=false;
      end;
    end;
  end;
end;

function IsAcc97Present(): Boolean;
begin
  result:=blFoundAcc97;
end;

function PrepareAcmeSetup(): Boolean;
var
  sTpStfName:string;
  sNewStfName:string;
  sAppDirName:string;
  tpFIn:TFileStream;
  tpFOut:TFileStream;
  sBuffer:string;
  lFLen:longint;
begin
  result:=false;
  if (not blAcmeSetupPrepared) then begin
  
  
    //First need to remove potential previous installations.
    if RegValueExists( HKEY_LOCAL_MACHINE, 'Software\microsoft\MS Setup (ACME)\Table Files' , 'Hupswim@v2.01.usa' ) then begin
      RegDeleteValue( HKEY_LOCAL_MACHINE, 'Software\microsoft\MS Setup (ACME)\Table Files', 'Hupswim@v2.01.usa' );
    end;
  
  
  
    if (DirExists(expandConstant('{app}\setup'))) then begin
      DeleteFile(expandConstant('{app}\setup\32autole.dll'));
      DeleteFile(expandConstant('{app}\setup\acmsetup.hlp'));
      DeleteFile(expandConstant('{app}\setup\msacccah.dll'));
      DeleteFile(expandConstant('{app}\setup\mscreate.dir'));
      DeleteFile(expandConstant('{app}\setup\msodeusa.dll'));
      DeleteFile(expandConstant('{app}\setup\mssetup.dll'));
      DeleteFile(expandConstant('{app}\setup\setup.exe'));
      DeleteFile(expandConstant('{app}\setup\setup.inf'));
      DeleteFile(expandConstant('{app}\setup\setup.ini'));
      DeleteFile(expandConstant('{app}\setup\setup.stf'));
      DeleteFile(expandConstant('{app}\setup\setup.tdf'));
    end;
  
  
  
  
  
  
  
    sTpStfName:=ExpandConstant('{app}\setupNieuw\setup_prlm.stf');
    sNewStfName:=ExpandConstant('{app}\setupNieuw\setup.stf');
    sAppDirName:=expandConstant('{app}');
    
    tpFIn:=TFileStream.create(sTpSTFName  , fmOpenReadWrite);
    try
    
      lFLen:=tpFIn.size;

      if (lFLen > 20000) then begin
        msgBox('Setup failed: het bestand ' + sTpStfName + ' is onverwacht groot.', mbInformation, MB_OK);
        exit;
      end;
      SetLength(sBuffer, lFLen);


      tpFIn.ReadBuffer(sBuffer , lFLen);

      StringChangeEx(sBuffer, '<C:\zwem>',expandConstant('<{app}>') , false);

      tpFOut:=TFileStream.create(sNewSTFName, fmCreate);
      try
        tpFOut.writeBuffer(sBuffer, length(sBuffer));
      finally
        tpFOut.Free;
      end;
    finally
      tpFIn.Free;
    end;
    
    blAcmeSetupPrepared:=true;
  end;
  result:=true;
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


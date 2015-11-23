; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
AppName=Build hupswim/hupprog/packager from source
AppVerName=Build hupswim/hupprog/packager from source
AppPublisher=H.J. Hupkes - Hupsoft
AppPublisherURL=http://home.kpn.nl/wimhupke/hupsoft
AppSupportURL=http://home.kpn.nl/wimhupke/hupsoft
AppUpdatesURL=http://home.kpn.nl/wimhupke/hupsoft
DefaultDirName=c:\zwem
DefaultGroupName=Hupswim
Compression=lzma
SolidCompression=yes
AlwaysUsePersonalGroup = yes
UsePreviousTasks=no
AllowNoIcons=yes
CreateAppDir=no
Uninstallable=no
DisableProgramGroupPage=yes
DisableStartupPrompt=yes
DisableReadyMemo=yes
DisableReadyPage=no
DisableFinishedPage=yes

OutputDir=..\..\..
OutputBaseFileName=buildMDBs


[Files]
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Messages]
SetupWindowTitle=Build hupswim / hupprog / packager from source
WelcomeLabel1=Welcome to the build routines for hupswim / hupprog / packager
WelcomeLabel2=This will build hupswim / hupprog / packager from source.%n%nIt is recommended that you close all other applications before continuing.

WizardSelectTasks=Select Build options
SelectTasksDesc=Which applications do you want to build?
SelectTasksLabel2=Select the applications you would like to build, then click Next.


ButtonInstall=&Build

WizardReady=Ready to Build
ReadyLabel1=Ready to build selected applications.
ReadyLabel2b=Click Build to continue the build process.

WizardInstalling=Building
InstallingLabel=Please wait while the selected applications are being built.






[Tasks]
Name: useAcc2016; Description: "Access 2016 gebruiken"; GroupDescription: "Meerdere versies van Access werden aangetroffen. Kies de versie om te gebruiken:"; Flags: exclusive; Check: ShouldPromptVersion() and IsAcc2016Present();
Name: useAcc2013; Description: "Access 2013 gebruiken"; GroupDescription: "Meerdere versies van Access werden aangetroffen. Kies de versie om te gebruiken:"; Flags: exclusive unchecked; Check: ShouldPromptVersion() and IsAcc2013Present();
Name: useAcc2010; Description: "Access 2010 gebruiken"; GroupDescription: "Meerdere versies van Access werden aangetroffen. Kies de versie om te gebruiken:"; Flags: exclusive unchecked; Check: ShouldPromptVersion() and IsAcc2010Present();
Name: useAcc2007; Description: "Access 2007 gebruiken (niet aangeraden)"; GroupDescription: "Meerdere versies van Access werden aangetroffen. Kies de versie om te gebruiken:"; Flags: exclusive unchecked; Check: ShouldPromptVersion() and IsAcc2007Present();
Name: useAcc2003; Description: "Access 2003 gebruiken (niet aangeraden)"; GroupDescription: "Meerdere versies van Access werden aangetroffen. Kies de versie om te gebruiken:"; Flags: exclusive unchecked;  Check: ShouldPromptVersion() and IsAcc2003Present();

Name: buildHupswim; Description: "Build Hupswim"; GroupDescription: "Build options";  Check: not isHupswimFound();
Name: buildHupprog; Description: "Build Hupprog"; GroupDescription: "Build options";  Check: not isHupprogFound();
Name: buildPackager; Description: "Build Packager"; GroupDescription: "Build options";  Check: not isPackagerFound();
Name: buildPackager2010; Description: "Build Packager 2010"; GroupDescription: "Build options";  Check: not isPackager2010Found();

[Run]
;acc2003
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\11.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\hupsw97.mdb""  /x ""__stbSys_Restore_Tree"" /cmd ""{src}\src\hupswim""";  StatusMsg: "Building hupswim...";  Tasks: buildHupswim; Check: PrepareBuildHupswim() and UseAcc2003();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\11.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\wedstr97.mdb"" /x ""__stbSys_Restore_Tree"" /cmd ""{src}\src\hupprog"""; StatusMsg: "Building hupprog...";  Tasks: buildHupprog; Check: PrepareBuildHupprog() and UseAcc2003();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\11.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\packager.mdb"" /x ""__stbSys_Restore_Tree"" /cmd ""{src}\src\packager"""; StatusMsg: "Building packager...";  Tasks: buildPackager; Check: PrepareBuildPackager() and UseAcc2003();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\11.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\packager2010.mdb"" /x ""__stbSys_Restore_Tree"" /cmd ""{src}\src\packager2010"""; StatusMsg: "Building packager 2010...";  Tasks: buildPackager2010; Check: PrepareBuildPackager2010() and UseAcc2003();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\11.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\hupsw97.mdb"" /compact  ";  StatusMsg: "Compacting hupswim..."; Tasks: buildHupswim; Check: IsHupswimBuilt() and UseAcc2003();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\11.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\wedstr97.mdb"" /compact "; StatusMsg: "Compacting hupprog...";  Tasks: buildHupprog; Check: IsHupprogBuilt() and UseAcc2003();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\11.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\packager.mdb"" /compact "; StatusMsg: "Compacting packager...";  Tasks: buildPackager; Check: IsPackagerBuilt() and UseAcc2003();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\11.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\packager2010.mdb"" /compact "; StatusMsg: "Compacting packager 2010...";  Tasks: buildPackager2010; Check: IsPackager2010Built() and UseAcc2003();

;acc2007
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\12.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\hupsw97.mdb""  /x ""__stbSys_Restore_Tree"" /cmd ""{src}\src\hupswim""";  StatusMsg: "Building hupswim...";  Tasks: buildHupswim; Check: PrepareBuildHupswim() and UseAcc2007();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\12.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\wedstr97.mdb"" /x ""__stbSys_Restore_Tree"" /cmd ""{src}\src\hupprog"""; StatusMsg: "Building hupprog...";  Tasks: buildHupprog; Check: PrepareBuildHupprog() and UseAcc2007();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\12.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\packager.mdb"" /x ""__stbSys_Restore_Tree"" /cmd ""{src}\src\packager"""; StatusMsg: "Building packager...";  Tasks: buildPackager; Check: PrepareBuildPackager() and UseAcc2007();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\12.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\packager2010.mdb"" /x ""__stbSys_Restore_Tree"" /cmd ""{src}\src\packager2010"""; StatusMsg: "Building packager 2010...";  Tasks: buildPackager2010; Check: PrepareBuildPackager2010() and UseAcc2007();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\12.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\hupsw97.mdb"" /compact ";  StatusMsg: "Compacting hupswim..."; Tasks: buildHupswim; Check: IsHupswimBuilt() and UseAcc2007();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\12.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\wedstr97.mdb"" /compact  "; StatusMsg: "Compacting hupprog...";  Tasks: buildHupprog; Check: IsHupprogBuilt() and UseAcc2007();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\12.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\packager.mdb"" /compact "; StatusMsg: "Compacting packager...";  Tasks: buildPackager; Check: IsPackagerBuilt() and UseAcc2007();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\12.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\packager2010.mdb"" /compact "; StatusMsg: "Compacting packager 2010...";  Tasks: buildPackager2010; Check: IsPackager2010Built() and UseAcc2007();

;acc2010
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\14.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\hupsw97.mdb""  /x ""__stbSys_Restore_Tree"" /cmd ""{src}\src\hupswim""";  StatusMsg: "Building hupswim...";  Tasks: buildHupswim; Check: PrepareBuildHupswim() and UseAcc2010();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\14.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\wedstr97.mdb"" /x ""__stbSys_Restore_Tree"" /cmd ""{src}\src\hupprog"""; StatusMsg: "Building hupprog...";  Tasks: buildHupprog; Check: PrepareBuildHupprog() and UseAcc2010();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\14.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\packager.mdb"" /x ""__stbSys_Restore_Tree"" /cmd ""{src}\src\packager"""; StatusMsg: "Building packager...";  Tasks: buildPackager; Check: PrepareBuildPackager() and UseAcc2010();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\14.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\packager2010.mdb"" /x ""__stbSys_Restore_Tree"" /cmd ""{src}\src\packager2010"""; StatusMsg: "Building packager 2010...";  Tasks: buildPackager2010; Check: PrepareBuildPackager2010() and UseAcc2010();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\14.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\hupsw97.mdb"" /compact ";  StatusMsg: "Compacting hupswim..."; Tasks: buildHupswim; Check: IsHupswimBuilt() and UseAcc2010();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\14.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\wedstr97.mdb"" /compact  "; StatusMsg: "Compacting hupprog...";  Tasks: buildHupprog; Check: IsHupprogBuilt() and UseAcc2010();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\14.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\packager.mdb"" /compact "; StatusMsg: "Compacting packager...";  Tasks: buildPackager; Check: IsPackagerBuilt() and UseAcc2010();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\14.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\packager2010.mdb"" /compact "; StatusMsg: "Compacting packager 2010...";  Tasks: buildPackager2010; Check: IsPackager2010Built() and UseAcc2010();

;acc2013
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\15.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\hupsw97.mdb""  /x ""__stbSys_Restore_Tree"" /cmd ""{src}\src\hupswim""";  StatusMsg: "Building hupswim...";  Tasks: buildHupswim; Check: PrepareBuildHupswim() and UseAcc2013();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\15.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\wedstr97.mdb"" /x ""__stbSys_Restore_Tree"" /cmd ""{src}\src\hupprog"""; StatusMsg: "Building hupprog...";  Tasks: buildHupprog; Check: PrepareBuildHupprog() and UseAcc2013();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\15.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\packager.mdb"" /x ""__stbSys_Restore_Tree"" /cmd ""{src}\src\packager"""; StatusMsg: "Building packager...";  Tasks: buildPackager; Check: PrepareBuildPackager() and UseAcc2013();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\15.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\packager2010.mdb"" /x ""__stbSys_Restore_Tree"" /cmd ""{src}\src\packager2010"""; StatusMsg: "Building packager 2010...";  Tasks: buildPackager2010; Check: PrepareBuildPackager2010() and UseAcc2013();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\15.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\hupsw97.mdb"" /compact ";  StatusMsg: "Compacting hupswim..."; Tasks: buildHupswim; Check: IsHupswimBuilt() and UseAcc2013();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\15.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\wedstr97.mdb"" /compact  "; StatusMsg: "Compacting hupprog...";  Tasks: buildHupprog; Check: IsHupprogBuilt() and UseAcc2013();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\15.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\packager.mdb"" /compact "; StatusMsg: "Compacting packager...";  Tasks: buildPackager; Check: IsPackagerBuilt() and UseAcc2013();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\15.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\packager2010.mdb"" /compact "; StatusMsg: "Compacting packager 2010...";  Tasks: buildPackager2010; Check: IsPackager2010Built() and UseAcc2013();

;acc2016
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\16.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\hupsw97.mdb""  /x ""__stbSys_Restore_Tree"" /cmd ""{src}\src\hupswim""";  StatusMsg: "Building hupswim...";  Tasks: buildHupswim; Check: PrepareBuildHupswim() and UseAcc2016();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\16.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\wedstr97.mdb"" /x ""__stbSys_Restore_Tree"" /cmd ""{src}\src\hupprog"""; StatusMsg: "Building hupprog...";  Tasks: buildHupprog; Check: PrepareBuildHupprog() and UseAcc2016();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\16.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\packager.mdb"" /x ""__stbSys_Restore_Tree"" /cmd ""{src}\src\packager"""; StatusMsg: "Building packager...";  Tasks: buildPackager; Check: PrepareBuildPackager() and UseAcc2016();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\16.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\packager2010.mdb"" /x ""__stbSys_Restore_Tree"" /cmd ""{src}\src\packager2010"""; StatusMsg: "Building packager 2010...";  Tasks: buildPackager2010; Check: PrepareBuildPackager2010() and UseAcc2016();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\16.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\hupsw97.mdb"" /compact ";  StatusMsg: "Compacting hupswim..."; Tasks: buildHupswim; Check: IsHupswimBuilt() and UseAcc2016();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\16.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\wedstr97.mdb"" /compact  "; StatusMsg: "Compacting hupprog...";  Tasks: buildHupprog; Check: IsHupprogBuilt() and UseAcc2016();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\16.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\packager.mdb"" /compact "; StatusMsg: "Compacting packager...";  Tasks: buildPackager; Check: IsPackagerBuilt() and UseAcc2016();
Filename: "{reg:HKLM\SOFTWARE\Microsoft\Office\16.0\Access\InstallRoot,Path}msaccess.exe"; Parameters: "/runtime ""{src}\packager2010.mdb"" /compact "; StatusMsg: "Compacting packager 2010...";  Tasks: buildPackager2010; Check: IsPackager2010Built() and UseAcc2016();



[Code]
var
  blHupswimFound:boolean;
  blHupprogFound:boolean;
  blPackagerFound:boolean;
  blPackager2010Found:boolean;
  
  blHupswimPrepared:boolean;
  blHupprogPrepared:boolean;
  blPackagerPrepared:boolean;
  blPackager2010Prepared:boolean;
  
  blFoundAcc2003:boolean;
  blFoundAcc2007:boolean;
  blFoundAcc2010:boolean;
  blFoundAcc2013:boolean;
  blFoundAcc2016:boolean;
  nAccVersionsFound:integer;

function InitializeSetup(): Boolean;
begin
  blHupswimFound:=FileExists(expandConstant('{src}\hupsw97.mdb'));
  blHupprogFound:=FileExists(expandConstant('{src}\wedstr97.mdb'));
  blPackagerFound:=FileExists(expandConstant('{src}\packager.mdb'));
  blPackager2010Found:=FileExists(expandConstant('{src}\packager2010.mdb'));
  
  blHupswimPrepared:=false;
  blHupprogPrepared:=false;
  blPackagerPrepared:=false;
  

  result:=true;

  if (blHupswimFound and blHupprogFound and blPackagerFound) then begin
    msgbox('Build failed: hupswim [hupsw97.mdb], hupprog [wedstr97.mdb] and packager [packager.mdb] are already present in this directory.' , mbInformation, MB_OK);
    result:=false;
    exit;
  end;

  blFoundAcc2003:= RegKeyExists(HKEY_LOCAL_MACHINE, 'Software\microsoft\office\11.0\Access');
  blFoundAcc2007:= RegKeyExists(HKEY_LOCAL_MACHINE, 'Software\microsoft\office\12.0\Access');
  blFoundAcc2010:= RegKeyExists(HKEY_LOCAL_MACHINE, 'Software\microsoft\office\14.0\Access');
  blFoundAcc2013:= RegKeyExists(HKEY_LOCAL_MACHINE, 'Software\microsoft\office\15.0\Access');
  blFoundAcc2016:= RegKeyExists(HKEY_LOCAL_MACHINE, 'Software\microsoft\office\16.0\Access');
  
  nAccVersionsFound:=0;
  if (blFoundAcc2003) then begin
    nAccVersionsFound:=nAccVersionsFound+1;
  end;
  if (blFoundAcc2007) then begin
    nAccVersionsFound:=nAccVersionsFound+1;
  end;
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
    msgBox('Build failed: could not find installed version of Access 2003/2007/2010/2013/2016.' , mbInformation, MB_OK);
    result:=false;
    exit;
  end;
  
  if not (dirExists(ExpandConstant('{src}\src\hupswim'))) then begin
    msgbox('Build failed: could not find required subdirectory: src\hupswim' , mbInformation, MB_OK);
    result:=false;
    exit;
  end;
  
  if not (dirExists(ExpandConstant('{src}\src\hupprog'))) then begin
    msgbox('Build failed: could not find required subdirectory: src\hupprog' , mbInformation, MB_OK);
    result:=false;
    exit;
  end;
  
  if not (dirExists(ExpandConstant('{src}\src\packager'))) then begin
    msgbox('Build failed: could not find required subdirectory: src\packager' , mbInformation, MB_OK);
    result:=false;
    exit;
  end;
  
  if not (dirExists(ExpandConstant('{src}\src\packager2010'))) then begin
    msgbox('Build failed: could not find required subdirectory: src\packager2010' , mbInformation, MB_OK);
    result:=false;
    exit;
  end;
  
  if not (FileExists(ExpandConstant('{src}\bin\empty_stub_acc2003.mdb'))) then begin
    msgbox('Build failed: could not find required file: bin\empty_stub_acc2003.mdb' , mbInformation, MB_OK);
    result:=false;
    exit;
  end;
  
end;





function IsHupswimFound():boolean;
begin
  result:=blHupswimFound;
end;

function IsHupprogFound():boolean;
begin
  result:=blHupprogFound;
end;

function IsPackagerFound():boolean;
begin
  result:=blPackagerFound;
end;

function IsPackager2010Found():boolean;
begin
  result:=blPackager2010Found;
end;




function IsHupswimBuilt():boolean;
begin
  result:=FileExists(expandConstant('{src}\hupsw97.mdb'));
end;

function IsHupprogBuilt():boolean;
begin
  result:=FileExists(expandConstant('{src}\wedstr97.mdb'));
end;

function IsPackagerBuilt():boolean;
begin
  result:=FileExists(expandConstant('{src}\packager.mdb'));
end;

function IsPackager2010Built():boolean;
begin
  result:=FileExists(expandConstant('{src}\packager2010.mdb'));
end;



function ShouldPromptVersion(): Boolean;
begin
  result:=false;
  if (nAccVersionsFound > 1) then begin
    result:=true;
  end;
end;

function IsAcc2003Present(): Boolean;
begin
  result:=blFoundAcc2003;
end;

function IsAcc2007Present(): Boolean;
begin
  result:=blFoundAcc2007;
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

function UseAcc2003(): Boolean;
begin
  result:=false;
  if (blFoundAcc2003) then begin
    if ( nAccVersionsFound <= 1) then begin
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
    if ( nAccVersionsFound <= 1) then begin
      result:=true;
    end else begin
      if IsTaskSelected('useAcc2007') then begin
        result:=true;
      end;
    end;
  end;
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


function PrepareBuildHupswim(): boolean;
begin
  result:=true;
  if (not blHupswimPrepared) then begin
    blHupswimPrepared:=true;
    if not FileCopy(expandConstant('{src}\bin\empty_stub_acc2003.mdb'), expandConstant('{src}\hupsw97.mdb') , true ) then begin
      blHupswimPrepared:=false;
      result:=false;
    end;
  end;
end;

function PrepareBuildHupprog(): boolean;
begin
  result:=true;
  if (not blHupprogPrepared) then begin
    blHupprogPrepared:=true;
    if not FileCopy(expandConstant('{src}\bin\empty_stub_acc2003.mdb'), expandConstant('{src}\wedstr97.mdb') , true ) then begin
      blHupprogPrepared:=false;
      result:=false;
    end;
  end;
end;

function PrepareBuildPackager(): boolean;
begin
  result:=true;
  if (not blPackagerPrepared) then begin
    blPackagerPrepared:=true;
    if not FileCopy(expandConstant('{src}\bin\empty_stub_acc2003.mdb'), expandConstant('{src}\packager.mdb') , true ) then begin
      blPackagerPrepared:=false;
      result:=false;
    end;
  end;
end;

function PrepareBuildPackager2010(): boolean;
begin
  result:=true;
  if (not blPackager2010Prepared) then begin
    blPackager2010Prepared:=true;
    if not FileCopy(expandConstant('{src}\bin\empty_stub_acc2003.mdb'), expandConstant('{src}\packager2010.mdb') , true ) then begin
      blPackager2010Prepared:=false;
      result:=false;
    end;
  end;
end;





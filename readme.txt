The hupswim project source code comes in a number of parts:

* The directory src\hupswim contains the files for building the main application database hupsw97.mdb.
* The directory src\hupprog contains the files for building the main application database wedstr97.mdb.
* The directory src\packager contains the files for building the database packager.mdb.
* The directory src\installatie contains the inno setup scripts that are used by packager.mdb to build the final setup files for a release.

* The directory doc contains the manuals that are included in a release.
* The directory bin contains a number of binary files used to build a release and to build the main application databases.


-----------------------------------
Downloading the source files
-----------------------------------
The source files can be acquired by using a subversion client to check out the project

http://hupswim.googlecode.com/svn/trunk

The subversion client that I recommend is TortoiseSVN [tortoisesvn.net],
which is free and ideally suited for the hupswim project due to its implementation
as a Windows shell extension. This makes all the options available from the right-click
context-menu in any explorer-type program.


--------------------------------------------------------
Building hupsw97.mdb, wedstr97.mdb and packager.mdb
--------------------------------------------------------
After downloading the source files, you will find the executable buildMDBs.exe
in the top-level directory. Open this program to build hupsw97.mdb, wedstr97.mdb and packager.mdb
from the source files contained in src\hupswim, src\hupprog and src\packager.

The following program is necessary for this to work:
- microsoft access 2003 or microsoft access 2007


----------------------------------------
The files hupsw97.mdb and wedstr97.mdb
----------------------------------------
After completing the build process mentioned above, you will find the files hupsw97.mdb and wedstr97.mdb
in the top level directory.
The file hupsw97.mdb is the hupswim database, while wedstr97.mde is the hupprog database.
You can now make any changes you want to these files using microsoft access 2003 or 2007.
After making your changes, open the immediate window in microsoft access [ctrl + g]
and execute the command:

sysExportSourceTree

This will export the entire structure of the database to the directory src\hupswim or src\hupprog.
Note that these directories are under subversion control, while the binary files hupsw97.mdb and wedstr97.mdb are not.

If desired, you can therefore contribute to the development process by submitting your changes
as a patch, by using the tortoise-svn create patch command. 
To do this, open windows explorer ( or you favorite file-browser program), 
navigate to the top level directory of the hupswim project on your computer, 
use the right mouse button, find the tortoise-svn submenu,
and choose the create path command.


-------------------------
The file packager.mdb
-------------------------
The packager.mdb database is specifically meant for the building and packaging of 
the hupsw97.mde and wedstr97.mde files for release. 

The final output of this build and packaging process are the files: 
  - release\setup_hupsoft_office_2003_2007.exe
  - release\setup_office2003 (identical to release\setup_hupsoft_office_2003_2007.exe)
  - release\setup_hupsoft_office_97.exe
  - release\rss_feed.rss

Please note that the build process works directly from the files in src\hupswim and src\hupprog.
If you made any changes to hupsw97.mdb or wedstr97.mdb, you will need to use the command
sysExportSourceTree as explained above to export your changes to the directories src\hupswim and src\hupprog.

For the packaging process to work correctly, the directory bin_priv is required, which is not distributed
as part of the hupswim project. This is due to legal copyright constraints. For example, I have a license
to distribute the access97 and access2003 runtimes together with hupswim, 
but this license does not allow me to publish these binaries under a gpl-license.
If you need to obtain the bin_priv directory, please contact me at hjhupkes _at_ gmail.com .

Besides the bin_priv directory, the following programs are necessary for the packaging process to work.
- microsoft access 97
- microsoft access 2003
- inno setup compiler 5.2.2 (or higher) [freely available]
   

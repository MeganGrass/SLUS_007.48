# Resident Evil 2 Assembly Programming
An open-source modification of Resident Evil 2 Dual Shock [SLUS-00748] using MIPS R3000A assembly customizations.

# Prerequisite
[Kingcom/armips](https://github.com/Kingcom/armips)

[Lameguy64/mkpsxiso](https://github.com/Lameguy64/mkpsxiso)

[Toolchain](https://drive.google.com/open?id=1UNfnZ25LdRhkM3ps29e28KgGgnBHhNgg) Lameguy64's mkpsxiso is built into "test.exe"

[github005 build](https://drive.google.com/open?id=1hzkO6FwNGXOeWKFrVlBe0liW4-pvijwo)

# Build Instructions
01 -- Extract contents of the following to C:\BioDSZ
utility.zip
"armips-v0.10.0-windows-x86.7z\\armips.exe"
"SLUS_007.48-master.zip\\SLUS_007.48-master"

02 -- Copy following files from the Sony PlayStation PSYQ SDK (not included) to C:\BioDSZ\utility
LICENSEA.DAT
LICENSEE.DAT
LICENSEJ.DAT

03 -- Extract contents of "github005.7z\\disc.bin" ISO to C:\BioDSZ\disc

04 -- Copy and rename "SLUS_007.48" from original Resident Evil 2 Dual Shock ISO (not included) to C:\BioDSZ\original\PSX.EXE

05 -- Copy all files from COMMON\BIN from original Resident Evil 2 Dual Shock ISO (not included) to C:\BioDSZ\original\overlay

06 -- Run "ExecBuild.bat" in C:\BioDSZ

07 -- Play/Debug

*** Steps 3, 4 and 5 are deprecated and these instructions will be updated soon

# Version
005, 2018-06-05		Updated Readme, Bugfixes
001, 2018-06-04		Initial Release

# Example
[Test Builds](https://drive.google.com/open?id=1kJJg2AaBf3CexkkPqAhNYf5x_-0q7i6x)

[YouTube](https://www.youtube.com/channel/UCGA0gJMStIiYJXGaUq6sMDA/videos?view_as=subscriber)

# Information

[The-Horror](http://www.the-horror.com/forums/showthread.php?10487-Bio2-Bio1-5-Mix)
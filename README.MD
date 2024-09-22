# Resident Evil 2 Dual Shock (SLUS_007.48) Research Project
An open-source modification of Resident Evil 2 Dual Shock [SLUS-00748] using MIPS R3000A assembly customizations.

IMPORTANT: this project is outdated and has been converted to C language in [Resident Evil 2 Starter Kit](https://github.com/MeganGrass/Resident-Evil-2-Starter-Kit)

# Prerequisite
- Kingcom's [armips](https://github.com/Kingcom/armips)
- Lameguy64's [mkpsxiso](https://github.com/Lameguy64/mkpsxiso)
- [Toolchain](https://drive.google.com/open?id=1UNfnZ25LdRhkM3ps29e28KgGgnBHhNgg)
- [test.exe (2018-06-17)](https://drive.google.com/open?id=1KLoF-RZK8mFB-cVdWLs-nSXCeuYIC6Zw)

# Build Instructions
01 -- Extract contents of the following to C:\BioDSZ

utility.zip

"Testing Utility.7z\\test.exe"

"armips-v0.10.0-windows-x86.7z\\armips.exe"

"SLUS_007.48-master.zip\\SLUS_007.48-master"

02 -- Copy following files from the Sony PlayStation PSYQ SDK (not included) to C:\BioDSZ\utility

LICENSEA.DAT

LICENSEE.DAT

LICENSEJ.DAT

03 -- Extract contents of "github009.7z\\disc.bin" ISO to C:\BioDSZ\disc

04 -- Copy and rename "SLUS_007.48" from original Resident Evil 2 Dual Shock ISO (not included) to C:\BioDSZ\original\PSX.EXE

05 -- Copy all files from COMMON\BIN from original Resident Evil 2 Dual Shock ISO (not included) to C:\BioDSZ\original\overlay

06 -- Run "Build.bat" in C:\BioDSZ

07 -- Play/Debug

*** Steps 3, 4 and 5 are deprecated and these instructions will be updated soon

# Version

2018-06-18
Consolidation of toolchain into single executable, "test.exe"
Reimplemented "Printing for pSX Console", allowing for real-time debug stats
Reimplemented the original Title Screen menu and all corresponding overlay code & runtime data
Minor cleanup and bugfixes

2018-06-14
Load Task functionality patched to avoid redundancy
toolchain updated mkpsxiso 1.19 from 1.15, added miscellaneous utilities for building custom ISO images
Batch files (*.bat) and miscellaneous source fixes

2018-06-05
Updated Readme, Bugfixes

2018-06-04
Initial Release

# Example
[Older Test Builds](https://drive.google.com/open?id=1kJJg2AaBf3CexkkPqAhNYf5x_-0q7i6x)

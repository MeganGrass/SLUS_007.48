

;; PROJECT
.erroronwarning on
.psx

.include ".\\r3000a\\Executable.map"			;; 
.include ".\\r3000a\\DualShock.map"				;; 

NULL:			equ 0xFF

;; BIO1
.open ".\\DISC\\BIO1\\BSS01.CDX",0x80000000
.include ".\\r3000a\\Bio1\\Stage1.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO1\\BSS02.CDX",0x80000000
.include ".\\r3000a\\Bio1\\Stage2.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO1\\BSS03.CDX",0x80000000
.include ".\\r3000a\\Bio1\\Stage3.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO1\\BSS04.CDX",0x80000000
.include ".\\r3000a\\Bio1\\Stage4.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO1\\BSS05.CDX",0x80000000
.include ".\\r3000a\\Bio1\\Stage5.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO1\\BSS06.CDX",0x80000000
.include ".\\r3000a\\Bio1\\Stage6.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO1\\BSS07.CDX",0x80000000
.include ".\\r3000a\\Bio1\\Stage7.s"		;; BGM TABLE
.close

;; BIO2P
.open ".\\DISC\\BIO2P\\BSS01.CDX",0x80000000
.include ".\\r3000a\\Bio2P\\Stage1.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO2P\\BSS02.CDX",0x80000000
.include ".\\r3000a\\Bio2P\\Stage2.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO2P\\BSS03.CDX",0x80000000
.include ".\\r3000a\\Bio2P\\Stage3.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO2P\\BSS04.CDX",0x80000000
.include ".\\r3000a\\Bio2P\\Stage4.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO2P\\BSS05.CDX",0x80000000
.include ".\\r3000a\\Bio2P\\Stage5.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO2P\\BSS06.CDX",0x80000000
.include ".\\r3000a\\Bio2P\\Stage6.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO2P\\BSS07.CDX",0x80000000
.include ".\\r3000a\\Bio2P\\Stage7.s"		;; BGM TABLE
.close

;; BIO2
.open ".\\DISC\\BIO2\\BSS01.CDX",0x80000000
.include ".\\r3000a\\Bio2\\Stage1.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO2\\BSS02.CDX",0x80000000
.include ".\\r3000a\\Bio2\\Stage2.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO2\\BSS03.CDX",0x80000000
.include ".\\r3000a\\Bio2\\Stage3.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO2\\BSS04.CDX",0x80000000
.include ".\\r3000a\\Bio2\\Stage4.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO2\\BSS05.CDX",0x80000000
.include ".\\r3000a\\Bio2\\Stage5.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO2\\BSS06.CDX",0x80000000
.include ".\\r3000a\\Bio2\\Stage6.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO2\\BSS07.CDX",0x80000000
.include ".\\r3000a\\Bio2\\Stage7.s"		;; BGM TABLE
.close

;; Bio3
.open ".\\DISC\\BIO3\\BSS01.CDX",0x80000000
.include ".\\r3000a\\Bio3\\Stage1.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO3\\BSS02.CDX",0x80000000
.include ".\\r3000a\\Bio3\\Stage2.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO3\\BSS03.CDX",0x80000000
.include ".\\r3000a\\Bio3\\Stage3.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO3\\BSS04.CDX",0x80000000
.include ".\\r3000a\\Bio3\\Stage4.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO3\\BSS05.CDX",0x80000000
.include ".\\r3000a\\Bio3\\Stage5.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO3\\BSS06.CDX",0x80000000
.include ".\\r3000a\\Bio3\\Stage6.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO3\\BSS07.CDX",0x80000000
.include ".\\r3000a\\Bio3\\Stage7.s"		;; BGM TABLE
.close

;; Zero
.open ".\\DISC\\BIO0\\BSS01.CDX",0x80000000
.include ".\\r3000a\\Bio0\\Stage1.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO0\\BSS02.CDX",0x80000000
.include ".\\r3000a\\Bio0\\Stage2.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO0\\BSS03.CDX",0x80000000
.include ".\\r3000a\\Bio0\\Stage3.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO0\\BSS04.CDX",0x80000000
.include ".\\r3000a\\Bio0\\Stage4.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO0\\BSS05.CDX",0x80000000
.include ".\\r3000a\\Bio0\\Stage5.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO0\\BSS06.CDX",0x80000000
.include ".\\r3000a\\Bio0\\Stage6.s"		;; BGM TABLE
.close
.open ".\\DISC\\BIO0\\BSS07.CDX",0x80000000
.include ".\\r3000a\\Bio0\\Stage7.s"		;; BGM TABLE
.close

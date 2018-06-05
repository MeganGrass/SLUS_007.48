
.erroronwarning on
.psx
.open "DIEDEMO.BIN",0x80190000
.include ".\\r3000a\\Executable.map"			;; Original Variables and Prototypes
.include ".\\r3000a\\Bio2P\\diedemo\\main.s"
.close

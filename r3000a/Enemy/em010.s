

.erroronwarning on
.psx
.open "EM1000.BIN",0x8010D000
.include "C:\\BioDSZ\\r3000a\\Executable.map"					;; Original Variables and Prototypes
.include "C:\\BioDSZ\\r3000a\\DualShock.map"						;; New Variables and Prototypes
.include "C:\\BioDSZ\\asset\\Enemy\\em010\\Em10Mv01.s"		;; 
.include "C:\\BioDSZ\\asset\\Enemy\\em010\\Em10Mv02.s"		;; 

Em10Die00:	equ 0x80115530
Em10Die01:	equ 0x80115A14
Em10Die02:	equ 0x80115BEC
Em10Die03:	equ 0x801162C4
Em10Die04:	equ 0x80116610
Em10Die05:	equ 0x801169E4

Em10Firedm:	.include "C:\\BioDSZ\\asset\\Enemy\\em010\\Dm\\Em10Firedm.s"
Em10Ryudm:	.include "C:\\BioDSZ\\asset\\Enemy\\em010\\Dm\\Em10Ryudm.s"
Em10Tudm:	.include "C:\\BioDSZ\\asset\\Enemy\\em010\\Dm\\Em10Tudm.s"
Em10Spdm:	.include "C:\\BioDSZ\\asset\\Enemy\\em010\\Dm\\Em10Spdm.s"

.include "C:\\BioDSZ\\asset\\Enemy\\em010\\Dm\\Em10Dm01.s"
.include "C:\\BioDSZ\\asset\\Enemy\\em010\\Dm\\Em10Dm02.s"
.include "C:\\BioDSZ\\asset\\Enemy\\em010\\Dm\\Em10Dm03.s"
Em10Dm07:	equ 0x80114A78
.include "C:\\BioDSZ\\asset\\Enemy\\em010\\Dm\\Em10Damage.s"

.org 0x80119600	;; Em10Life
				.dh 120
                .dh 141
                .dh 192
                .dh 113
                .dh 90
                .dh 143
                .dh 87
                .dh 113
                .dh 75
                .dh 125
                .dh 119
                .dh 99
                .dh 120
                .dh 98
                .dh 123
                .dh 98
				;; Em10LifeEasy
				.dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
				;; Em23Life
				.dh 300
				;; Em23LifeEasy
				.dh 300
				;; Em2aLife
				.dh 250
                .dh 450
                .dh 300
                .dh 300
                .dh 220
                .dh 300
                .dh 400
                .dh 300
                .dh 400
                .dh 350
				;; Em2aLifeEasy
				.dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
				;; Em2bLife
				.dh 120
                .dh 141
                .dh 192
                .dh 113
                .dh 90
                .dh 143
                .dh 87
                .dh 113
                .dh 75
                .dh 125
                .dh 119
                .dh 99
                .dh 120
                .dh 98
                .dh 123
                .dh 98
				;; Em2bLifeEasy
				.dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
                .dh 0
				;; 
                .dh 240
                .dh 240
                .dh 250
                .dh 450
                .dh 300
                .dh 300
                .dh 220
                .dh 300
                .dh 400
                .dh 300
                .dh 400
                .dh 350
                .dh 180
                .dh 340
                .dh 220
                .dh 240
                .dh 175
                .dh 240
                .dh 310
                .dh 240
                .dh 310
                .dh 300
                .dh 250
                .dh 200

.close

.erroronwarning on
.psx
.open "EM1001.BIN",0x8010D000

.close
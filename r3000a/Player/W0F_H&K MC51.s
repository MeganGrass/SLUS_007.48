

;; Aesthetic Fixture
;; Replacing PLW0F (Sub Machine Gun/MAC10)
.org 0x80045398
		li      $v0, 72			;; Fire Z			// signed short	// 0x28+var_18($sp)
.org 0x800453A4
		li      $v0, 1320		;; Fire Y			// signed short	// 0x28+var_16($sp)
.org 0x800453C8
		li      $v0, 80			;; Fire X (Pt.1)	// signed short	// 0x28+var_14($sp)
.org 0x800453CC
		li      $v0, 112		;; Fire X (Pt.2)	// signed short	// 0x28+var_14($sp)
.org 0x8004545C
		li      $v0, 152		;; Bullet Z			// signed short	// 0x28+var_18($sp)
.org 0x80045464
		li      $v0, 512		;; Bullet Y			// signed short	// 0x28+var_16($sp)
.org 0x8004546C
		li      $v0, 80			;; Bullet X			// signed short	// 0x28+var_14($sp)

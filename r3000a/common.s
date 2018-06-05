

				;; Reset Controller
				sh		$0, G_Padd1
				sh		$0, G_Padd1Trg
				lui     $v0, 0xFFFF
				sw      $v0, G_PaddData
				sw      $v0, G_PaddData+0x24

				;; Reset Buffer
				sb		$0, @iCursor
				li		$v0, 0x10
				sb		$v0, @CursorPos

				Cursor UP/DOWN/LEFT/RIGHT functionality would be useful as well.
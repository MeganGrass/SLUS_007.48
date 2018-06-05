

				sh		$0, G_Padd1
				sh		$0, G_Padd1Trg
				lui     $a0, 0xFFFF
				sw      $a0, G_PaddData
				sw      $a0, G_PaddData+0x24

				jr      $ra
				nop
extends CanvasLayer

#NOTE: MaterialDifference has not been worked out at all

signal board1_button
signal board2_button
signal board3_button

func _on_board_1_button_down():
	board1_button.emit()
	
func _on_board_2_button_down():
	board2_button.emit()

func _on_board_3_button_down():
	board3_button.emit()

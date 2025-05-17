extends Node2D

	
	
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if get_tree().paused: 
			resume_game()		
		else: pause_game()
		
		
func resume_game():
	$PauseMenu/PauseMusic.stop()
	get_tree().paused = false
	$PauseMenu.visible = false 	
	
	
func pause_game():
	get_tree().paused = true
	$PauseMenu/PauseMusic.play()
	$PauseMenu.visible = true 	
	
	
func _on_button_pressed() -> void:
	resume_game()


func _on_button_2_pressed() -> void:
	get_tree().paused = false
	$PauseMenu.visible = false
	get_tree().change_scene_to_file("res://Scenes/test_menu.tscn")

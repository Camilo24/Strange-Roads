extends Control

func _input(event):
	if event.is_action_pressed("pause"):
		visible = not get_tree().paused
		get_tree().paused = not get_tree().paused
		
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit();

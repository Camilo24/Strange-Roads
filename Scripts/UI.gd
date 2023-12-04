extends CanvasLayer

func _physics_process(delta):
	
	$CoinsCollectedText.text = str(Singleton.coins)
	
	if Singleton.coins == 3:
		var currentSceneName = str(get_tree().current_scene.name)
		var currentSceneNumber = int(currentSceneName)
		get_tree().change_scene_to_file("res://Scenes/World" + str(currentSceneNumber + 1) + ".tscn")
		Singleton.coins = 0




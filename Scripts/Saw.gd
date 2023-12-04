extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("RotationSaw");


func _on_area_2d_body_entered(body):
	if body.get_name() == "Player":
		get_tree().reload_current_scene()
		Singleton.coins = 0;

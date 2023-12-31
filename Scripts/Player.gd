extends CharacterBody2D

const moveSpeed = 25
const maxSpeed = 50
const jumpHeight = -300
const gravity = 15

@onready var sprite = $Sprite2D
@onready var animationPlayer = $AnimationPlayer

func _physics_process(_delta):
	velocity.y += gravity
	var friction = false

	if Input.is_action_pressed("ui_right"):
		sprite.flip_h = true
		animationPlayer.play("Walk")
		velocity.x = min(velocity.x + moveSpeed, maxSpeed)

	elif Input.is_action_pressed("ui_left"):
		sprite.flip_h = false
		animationPlayer.play("Walk")
		velocity.x = max(velocity.x - moveSpeed, -maxSpeed)

	else:
		animationPlayer.play("Idle")
		friction = true

	if is_on_floor():
		if Input.is_action_pressed("ui_accept"):
			velocity.y = jumpHeight
		if friction:
			velocity.x = lerp(velocity.x, 0.0, 0.5)
			
	else:
		if friction:
			velocity.x = lerp(velocity.x, 0.0, 0.01)

	move_and_slide()


func _on_spikes_area_2d_body_entered(body):
	if body.get_name() == "Player":
		loseLife();
		
func loseLife():
	get_tree().reload_current_scene()
	Singleton.coins = 0;

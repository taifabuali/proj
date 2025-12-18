extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -700.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


	if velocity == Vector2.ZERO:
		animated_sprite.play("idel")
	else:
		if not is_on_floor():
			if velocity.y > 0:
				animated_sprite.play("jump_down")
			else:
				animated_sprite.play("jump_up")
		else:
			animated_sprite.play("walk")
		animated_sprite.flip_h = velocity.x <0










	move_and_slide()

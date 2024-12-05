extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var _animated_sprite = $AnimatedSprite2D

var speed = SPEED

func _physics_process(delta: float) -> void:
	if (int(abs(get_global_mouse_position().x - position.x)) <= 5):
		_animated_sprite.play("stay")
	else:
		velocity.x = move_toward(velocity.x, speed, SPEED)
		move_and_slide()
		if (get_global_mouse_position().x > position.x):
			speed = SPEED
			_animated_sprite.play("run")
		else:
			speed = SPEED*-1
			_animated_sprite.play("run")

	if (get_global_mouse_position().x > position.x):
		_animated_sprite.flip_h = false
	else:
		_animated_sprite.flip_h = true

func _ready() -> void:
	_animated_sprite.play("stay")
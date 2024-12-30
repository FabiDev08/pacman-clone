extends CharacterBody2D

@onready var sprite_character: Sprite2D = $Sprite2D

@export var speed: float = 200.0
var direction: Vector2 = Vector2.RIGHT #(1, 0)

func _process(_delta: float) -> void:
	input_controller()

func _physics_process(delta: float) -> void:
	move_character(delta)

func input_controller():
	if Input.is_action_just_pressed("top"):
		direction = Vector2(0, -1)
		sprite_character.rotation_degrees = -90
	elif Input.is_action_just_pressed("bottom"):
		direction = Vector2(0, 1)
		sprite_character.rotation_degrees = 90
	elif Input.is_action_just_pressed("left"):
		direction = Vector2(-1, 0)
		sprite_character.rotation_degrees = 180
	elif Input.is_action_just_pressed("right"):
		direction = Vector2(1, 0)
		sprite_character.rotation_degrees = 0
		
func move_character(delta):
	velocity = direction * speed
	position += velocity * delta

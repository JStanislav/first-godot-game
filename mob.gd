extends CharacterBody2D

var hp = 3

# shortcut decorator to not write the _ready() function
# @onready var player = get_node("/root/Game/Player")

var player

func _ready():
	$Slime.play_walk()
	player = get_node("/root/Game/Player")

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 400
	move_and_slide()
	
func take_damage():
	hp -= 1
	$Slime.play_hurt()
	if hp <= 0:
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		queue_free()
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position

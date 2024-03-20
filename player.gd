extends CharacterBody2D

signal health_depleted 
var hp = 100.0

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 300
	move_and_slide()

	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else: 
		get_node("HappyBoo").play_idle_animation()
	
	const DAMAGE_RATE = 5.0
	var overlapping_bodies = %HurtBox.get_overlapping_bodies()
	if overlapping_bodies.size() > 0:
		hp -= DAMAGE_RATE * %HurtBox.get_overlapping_bodies().size() * delta
		
		$HealthBar.value = hp
		
		if hp <= 0.0:
			health_depleted.emit()

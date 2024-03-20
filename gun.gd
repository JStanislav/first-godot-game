extends Area2D


func _physics_process(delta):
	var enemies_within = get_overlapping_bodies()
	if enemies_within.size() > 0:
		var enemy = enemies_within.front()
		look_at(enemy.global_position)
		

func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)


func _on_timer_timeout():
	shoot() # Replace with function body.

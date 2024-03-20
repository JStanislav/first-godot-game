extends Node2D

func spawn_mob():
	var mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	mob.global_position = %PathFollow2D.global_position
	add_child(mob)


func _on_timer_timeout():
	spawn_mob()
	


func _on_player_health_depleted():
	%GameOverScreen.visible = true
	get_tree().paused = true

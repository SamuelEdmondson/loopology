extends Node2D

@onready var spawn_timer : Timer = $SpawnTimer
@onready var asteroid_scene = preload("res://asteroid.tscn")


func _ready() -> void:
	spawn_timer.wait_time = randf_range(.1, .5)
	spawn_timer.start()

func _process(delta: float) -> void:
	var asteroids = get_tree().get_nodes_in_group("Asteroids")
	
	for asteroid in asteroids:
		if asteroid.position.y > (get_viewport_rect().size.y + 50):
			asteroid.queue_free()
	
func _on_spawn_timer_timeout() -> void:
	spawn_asteroid_at_random_location()
	
func spawn_asteroid_at_random_location() -> void:
	var next_spawn_location : float = randf_range(-50, get_viewport_rect().end.x)
	var instance = asteroid_scene.instantiate()
	get_tree().current_scene.add_child(instance)
	instance.position = Vector2(next_spawn_location, 0)
	
	# Reset the timer
	spawn_timer.wait_time = randf_range(.4, 1)
	spawn_timer.start()


	pass #spawn asteroid here

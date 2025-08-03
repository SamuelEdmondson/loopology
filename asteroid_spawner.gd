extends Node2D

@onready var spawn_timer : Timer = $SpawnTimer

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
	
func _on_spawn_timer_timeout() -> void:
	spawn_asteroid_at_random_location()
	
func spawn_asteroid_at_random_location() -> void:
	var next_spawn_location : float = randf_range(0, get_viewport_rect().end.x)
	pass #spawn asteroid here

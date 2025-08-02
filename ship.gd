extends RigidBody2D

@export var G = 1000000
@export var asteroid_field = 80
@onready var mesh = $MeshInstance2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var superposition = calculate_gravity_superposition()
	self.apply_force(superposition)
	
	self.rotation = self.linear_velocity.angle() - PI/2
	
	
func calculate_gravity_superposition() -> Vector2:
	var asteroids = get_tree().get_nodes_in_group("Asteroids")
	var superposition = Vector2(0, 0)
	for asteroid in asteroids:
		superposition += calculate_gravity_with_asteroid(asteroid)
	return superposition
	
func calculate_gravity_with_asteroid(asteroid: Node) -> Vector2:
	var m1: float = asteroid.mass
	var m2: float = self.mass
	var r = self.position.distance_to(asteroid.position)
	
	var gravity_scalar = (G * m1 * m2) / (r*r)
	if r < asteroid_field:
		r = asteroid_field
		gravity_scalar = (G * m1 * m2) / (r*r)
	
	#var gravity_scalar = (G * m1 * m2) / (r * r)
	var unit_vector = (asteroid.position - self.position).normalized()
	return unit_vector * gravity_scalar

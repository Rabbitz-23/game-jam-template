extends RigidBody2D

enum enemyStates{
	WAITING,
	CHASING,
	ATTACKING,
	DYING
}


var state: enemyStates
var target: Node2D
var speed: float

func _change_state(newState: enemyStates):
	if newState == enemyStates.WAITING:
		state = enemyStates.WAITING
		target = null
	if newState == enemyStates.CHASING:
		speed = 2
		state = enemyStates.CHASING
		

func _search_target() -> Node2D:
	var tar: Node2D = get_node("%Player")
	if tar != null:
		_change_state(enemyStates.CHASING)
		return tar
	else:
		return null

func _process(delta: float) -> void:
	if state == enemyStates.WAITING:
		target = _search_target()
	if state == enemyStates.CHASING:
		linear_velocity = position.direction_to(target.position) * speed
		move_and_collide(linear_velocity)

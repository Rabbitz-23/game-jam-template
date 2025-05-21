extends CharacterBody2D

enum playerState {
	IDLE,
	MOVING,
	SHOOTING
}

const SPEED = 300.0
var idle: bool
var waiting: bool
var state: playerState
@export var wait_time: float
var wait_timer : float
@onready var anim : AnimatedSprite2D = get_node("AnimatedSprite2D")
var movVel: Vector2

func _ready():
	_change_state(playerState.IDLE)

func _change_state(newState: playerState):
	if newState == playerState.IDLE:
		anim.animation = "Idle"
		state = playerState.IDLE
		skew = 0
	if newState == playerState.MOVING:
		state = playerState.MOVING
	
func _physics_process(delta):
	if state == playerState.MOVING:
		move_player(movVel)

func move_player(movVel: Vector2):
	velocity.x = movVel.x * SPEED
	velocity.y = movVel.y * SPEED
	velocity.normalized()
	if velocity == Vector2.ZERO:
		_change_state(playerState.IDLE)
	move_and_slide()

func _unhandled_input(event):
	if state == playerState.IDLE:
		state = playerState.MOVING
	var directionH
	var directionV
	if Input.is_action_pressed("ui_right"):
		directionH = 1
		anim.animation = "WalkingEast"
		skew=0.15
	elif Input.is_action_pressed("ui_left"):
		directionH = -1
		anim.animation = "WalkingWest"
		skew=-0.15
	else:
		directionH = 0
	if Input.is_action_pressed("ui_up"):
		directionV = -1
		anim.animation = "WalkingNorth"
		skew=0
	elif Input.is_action_pressed("ui_down"):
		directionV = 1
		anim.animation = "WalkingSouth"
		skew=0
	else:
		directionV = 0
	movVel.x = directionH
	movVel.y = directionV

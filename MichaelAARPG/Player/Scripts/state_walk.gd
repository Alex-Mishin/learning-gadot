class_name StateWalk extends State

@export var move_speed: float = 100.0

@onready var idle: State = $"../Idle"
@onready var attack: State = $"../Attack"


# What happens when the player enters this state
func enter() -> void:
	player.update_animation("walk")


# What happens when the player exits this state
func exit() -> void:
	pass


# What happens during _process update in this State?
func process(_delta: float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	
	player.velocity = player.direction * move_speed
	if player.set_direction():
		player.update_animation("walk")
	return null


# What happens during _physics_process update in this State?
func physics(_delta: float) -> State:
	return null


# What happens with input events in this State?
func handle_input(_event: InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	return null
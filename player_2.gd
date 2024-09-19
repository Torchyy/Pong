extends Node
class_name Player2

@export var move_speed := 1750.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$PlayerSprite/Area2D.area_entered.connect(_on_body_entered)

func _on_body_entered(body:Node2D) -> void:
	#print(body)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if (Input.is_action_pressed("ui_left") && self.position.y < 235.0):
		self.position.y += delta*move_speed
	if (Input.is_action_pressed("ui_right") && self.position.y > -295.0):
		self.position.y -= delta*move_speed

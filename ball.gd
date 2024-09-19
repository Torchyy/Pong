extends Node
class_name Ball

@export var ball_speed := 300.0
@export var ball_dirx : float = 1.0
@export var ball_diry : float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (randi_range(0,1) == 1):
		flipx()
	if (randi_range(0,1) == 1):
		flipy()
	$BallSprite/Area2D.body_entered.connect(_on_body_entered)
	$BallSprite/Area2D.area_entered.connect(_on_area_entered)

func _on_body_entered(body:Node) -> void:
	#print(body)
	ball_diry *= -1.0

func _on_area_entered(body:Node) -> void:
	print(body)
	if (body == $"../Player/PlayerSprite/Area2D" or body == $"../Player2/PlayerSprite/Area2D"):
		flipx()
	else:
		self.queue_free()

func flipx() -> void:
	ball_speed *= 1.05
	ball_dirx *= -1.0

func flipy() -> void:
	ball_speed *= 1.05
	ball_diry *= -1.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	self.position.x -= delta*ball_speed*ball_dirx
	self.position.y += delta*ball_speed*ball_diry

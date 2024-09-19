extends Node2D
class_name Goal2

@export var score := 0
@export var ball_scene : PackedScene
@export var target_node : Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Area2D.area_entered.connect(_on_body_entered)

func _on_body_entered(body:Node2D) -> void:
	print("GOALLLLLLLLLLLLLL!")
	score += 1
	$"../CanvasLayer/HUD/Score".text = str(score)
	var new_ball := ball_scene.instantiate()
	target_node.add_child(new_ball)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

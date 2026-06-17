extends Node2D

@onready var play_zone: ColorRect = $PlayZone
@onready var player: StaticBody2D = $Player
@onready var catch_zone: Area2D = $CatchZone
@onready var catch_zone_rect: ColorRect = $CatchZone/CatchZoneRect
@onready var player_rect: ColorRect = $Player/PlayerRect


var speed : int = 200
var player_direction = 1
var catch_zone_size = 50
var player_size = 50

func _ready() -> void:
	var playerRect = player.get_node("PlayerRect").size
	
func _process(delta: float) -> void:
	var player_speed := speed * delta
	if(player.position.x + player.size.x > play_zone.position.x + play_zone.size.x 
		|| player.position.x < play_zone.position.x ):
		player_direction *= -1
	player.position.x += player_speed * player_direction


func _on_catch_zone_area_body_entered(body: Node2D) -> void:
	print("Something Entered ", body)


func _on_catch_zone_area_area_entered(area: Area2D) -> void:
	print("Something Entered ", area)


func _on_catch_zone_area_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	print("Something Entered 3", body)

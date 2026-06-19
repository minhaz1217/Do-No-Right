extends Node2D

@onready var play_zone: ColorRect = $PlayZone
@onready var player: StaticBody2D = $Player
@onready var catch_zone: Area2D = $CatchZone
@onready var player_rect: ColorRect = $Player/PlayerRect


var speed : int = 200
var player_direction = 1
var catch_zone_size = 50
var player_size = 50

func _ready() -> void:
	player_size = player.get_node("PlayerRect").size
	catch_zone_size = catch_zone.get_node("CatchZoneRect").size
	
	print(player_size)
	
func _process(delta: float) -> void:
	var player_speed := speed * delta
	if(player.position.x + player_size.x > play_zone.position.x + play_zone.size.x
		|| player.position.x < play_zone.position.x ):
		player_direction *= -1
	player.position.x += player_speed * player_direction
	
	
	#if(player.global_position.x + player_size.x > play_zone.global_position.x + play_zone.size.x
		#|| player.global_position.x < play_zone.global_position.x ):
		#player_direction *= -1
	#player.global_position.x += player_speed * player_direction
	
	if(Input.is_key_pressed(KEY_SPACE)):
		if( player.position.x >= catch_zone.position.x && player.position.x <= catch_zone.position.x + catch_zone_size.x):
			print("In Range")

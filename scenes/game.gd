extends Node2D

@export var play_zone: NinePatchRect
@export var catch_zone: Sprite2D
@export var player: Sprite2D  
@export var player_rect: Sprite2D
@export var player_spawn_point : ColorRect
@export var player_image = preload("uid://61nv8tui4ft2")


var speed : int = 200
var player_direction = 1
var catch_zone_size = 50
var player_size = 50

func _ready() -> void:
	#player_size = player.get_node("PlayerRect").size
	#catch_zone_size = catch_zone.get_node("CatchZoneRect").size
	print(play_zone.size.x)
	spawn_player()
	
func _process(delta: float) -> void:
	var player_speed := speed * delta
	
	var player_size_x = (Vector2(32 , 32) * player.scale.x).x
	var player_position_x = player.position.x - (player_size_x /2)
	var play_zone_x = play_zone.position.x
	var play_zone_size_x = play_zone.size.x * play_zone.scale.x
	var play_zone_padding = 6
	
	if(player_position_x + player_size_x + play_zone_padding > play_zone_x  + play_zone_size_x
		|| player_position_x - play_zone_padding < play_zone_x):
		#player_direction *= -1
		spawn_player()
	player.position.x += player_speed * player_direction
	
	
	#if(player.global_position.x + player_size.x > play_zone.global_position.x + play_zone.size.x
		#|| player.global_position.x < play_zone.global_position.x ):
		#player_direction *= -1
	#player.global_position.x += player_speed * player_direction
	handle_input()
		#if( player.position.x >= catch_zone.position.x && player.position.x <= catch_zone.position.x + catch_zone_size.x):
			#print("In Range")

func handle_input():
	if(Input.is_action_just_pressed("primary_action")):
		is_in_zone()
	
	if(Input.is_action_just_pressed("test_action")):
		spawn_player()

func spawn_player():
	var temp_player: Sprite2D = Sprite2D.new()
	temp_player.texture = player_image
	temp_player.position = player_spawn_point.position
	temp_player.scale = Vector2(1.375, 1.375)
	temp_player.rotation_degrees = (90 * randi_range(1,4))
	remove_child(player)
	player = temp_player
	player_direction = -1
	add_child(temp_player)

func is_in_zone():
	pass

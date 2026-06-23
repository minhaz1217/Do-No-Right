extends Area2D


func _on_area_entered(area: Area2D) -> void:
	print("Area Entered", area)
	pass # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	print("_on_body_entered Entered", body)
	pass # Replace with function body.

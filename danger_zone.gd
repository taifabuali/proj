extends Area2D




func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("players"):
		#get_tree().reload_current_scene()
		body.helth = -1
		print(body.helth)
		body.reset()

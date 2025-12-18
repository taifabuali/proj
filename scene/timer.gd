extends Node

@onready var timer: Timer = $"."
@onready var label: Label = $"../CanvasLayer/Label"



func _ready():
	timer.start()

func timer_chaged():
	var time_left = timer.time_left
	var min = float(time_left/60)
	var sec = int(time_left) % 60
	return [min,sec]
	
func _process(delta):
	label.text ="%02d:%02d" % timer_chaged()


func _on_timeout() -> void:
	get_tree().reload_current_scene()

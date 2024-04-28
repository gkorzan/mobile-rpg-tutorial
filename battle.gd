extends Node

@onready
var hpLable = $Enemy/HPLable

func _on_sword_button_pressed():
	hpLable.text = '15HP'

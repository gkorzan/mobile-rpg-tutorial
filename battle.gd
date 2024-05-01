extends Node

@onready
var enemy = $Enemy
@onready
var actionButtons = $UI/ActionButtons

func _on_sword_button_pressed():
	if (enemy != null):
		enemy.hp -= 4


func _on_enemy_dead():
	actionButtons.hide()
	enemy = null

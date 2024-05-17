extends "res://ActionButton.gd"

func _on_pressed():
	var battle = get_tree().current_scene
	var enemy = battle.find_child('Enemy')
	var playerStats = battle.find_child('PlayerStats')
	if enemy and playerStats:
		playerStats.ap -= 1
		playerStats.mp += 2
		enemy.take_damage(4)

extends "res://ActionButton.gd"

func _on_pressed():
	var battle = get_tree().current_scene
	var playerStats = battle.find_child('PlayerStats')
	if playerStats:
		if playerStats.mp >= 8:
			playerStats.ap -= 1
			playerStats.hp += 5
			playerStats.mp -= 8

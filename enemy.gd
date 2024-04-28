extends Node2D

var hp = 25:
	set = set_hp

@onready
var hpLabel = $HPLable

func set_hp(new_hp):
	hp = new_hp
	hpLabel.text = str(hp) + 'hp'

extends Node

const BattleUnits = preload("res://BattleUnits.tres")

const MAX_HP = 25
var hp = MAX_HP: set = set_hp
const MAX_AP = 3
var ap = MAX_AP: set = set_ap
const MAX_MP = 10
var mp = MAX_MP: set = set_mp

signal hp_changed(value)
signal ap_changed(value)
signal mp_changed(value)
signal end_turn

func set_hp(value):
	hp = clamp(MAX_HP, 0, value)
	emit_signal("hp_changed", hp)
	
func set_ap(value):
	ap = clamp(MAX_AP, 0, value)
	emit_signal("ap_changed", ap)
	if ap == 0:
		emit_signal("end_turn")
	
func set_mp(value):
	mp = clamp(MAX_MP, 0, value)
	emit_signal("mp_changed", mp)
	
func _ready():
	BattleUnits.PlayerStats = self
	
func _exit_tree():
	BattleUnits.PlayerStats = null

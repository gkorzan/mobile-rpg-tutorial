extends Node

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
	hp = min(MAX_HP, value)
	emit_signal("hp_changed", hp)
	
func set_ap(value):
	ap = min(MAX_AP, value)
	emit_signal("ap_changed", ap)
	
func set_mp(value):
	mp = min(MAX_MP, value)
	emit_signal("mp_changed", mp)

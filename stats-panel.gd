extends Panel

@onready var hpLable = $StatsHContainer/HP
@onready var apLable = $StatsHContainer/AP
@onready var mpLable = $StatsHContainer/MP


func _on_player_stats_hp_changed(value):
	hpLable.text = "HP\n"+str(value)


func _on_player_stats_ap_changed(value):
	apLable.text = "AP\n"+str(value)


func _on_player_stats_mp_changed(value):
	mpLable.text = "MP\n"+str(value)

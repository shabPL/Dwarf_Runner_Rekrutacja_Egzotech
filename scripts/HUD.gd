extends Control

onready var wynik=$Wynik

func _ready():
	Global.connect("martwy", self, "_on_martwy")
	wynik.text="Wynik:0"
func _on_martwy():
	wynik.text="Wynik:"+str(Global.punkty)


extends Node2D
export var przeciwnicy=[]
onready var przeciwnicy_tu=$przeciwnicy_tu
onready var parallaxbackground = $background 
onready var koncowy= $GUI/Control
onready var czas= $Resp
var scroll_speed=-10.0
var wynik = 0

func _ready():
	Global.pauzatla=false
	Global.punkty=0
	Global.connect("smierc", self, "_on_smierc")
	Global.connect("martwy", self, "_on_martwy")
func _process(delta):
	if Global.pauzatla == false:
		scroll_backround(delta)
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
func scroll_backround(ile):
	parallaxbackground.scroll_offset.x += ile * scroll_speed
	if parallaxbackground.scroll_offset.x >= 960:
		parallaxbackground.scroll_offset.x = 0

func _on_martwy():
	scroll_speed-=0.5
	if scroll_speed<-25:
		scroll_speed=-25
	if czas.wait_time > 0.5:
		czas.wait_time -= 0.05
	elif czas.wait_time < 0.5:
		czas.wait_time = 0.5
func _on_Resp_timeout():
	przeciwnicy.shuffle()
	var e = przeciwnicy[0]
	var e_instance = e.instance() 
	e_instance.set_global_position(Vector2(994, 380)) 
	przeciwnicy_tu.add_child(e_instance) 

func _on_smierc():
	if Global.punkty>Global.topw:
		koncowy.zapistop()
	koncowy.show()
	Global.pauzatla=true
	koncowy.ustaw()
	$GUI/HUD.hide()


func _on_AudioStreamPlayer2D_finished():
	$AudioStreamPlayer2D.play()

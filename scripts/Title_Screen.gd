extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var plik= File.new()
	plik.open("user://save.data", File.READ)
	if plik!=null:
		Global.topw=plik.get_32()
	else :
		Global.topw=0
	plik.close()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_pressed():
	get_tree().change_scene("res://scenes/background.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.play()

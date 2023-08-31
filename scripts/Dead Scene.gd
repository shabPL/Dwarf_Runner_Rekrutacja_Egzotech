extends Control

func ustaw():
	$Panel/Wynik.text = "Wynik : " + str(Global.punkty)
	$Panel/Najlepszu.text = "Najlepszy wynik : " + str(Global.topw)
func zapistop():
	Global.topw=Global.punkty
	var plik= File.new()
	plik.open("user://save.data", File.WRITE)
	plik.store_32(Global.topw)
	plik.close()

func _on_Restart_pressed():
	get_tree().reload_current_scene()


func _on_Menu_pressed():
	get_tree().change_scene("res://scenes/Title_Screen.tscn")

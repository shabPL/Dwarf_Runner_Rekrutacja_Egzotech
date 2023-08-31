extends Area2D

var zywy = true
export var szybkosc : int
export var punkty : int
onready var anim=$AnimatedSprite
func _ready():
	anim.play("MOVE")

func _physics_process(delta):
	if zywy==false:
		global_position=global_position
	else:
		global_position.x -= szybkosc * delta
func zabity():
	if Global.input==true:
		Global.punkty=Global.punkty+punkty
	Global.emiter()
	queue_free()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func umieranie():
	anim.play("DEAD")
	zywy=false

func _on_eye_body_entered(body):
	if (body.get_name()=="Gracz"):
		if Global.czyatak==true:
			umieranie()	
		else :
			umieranie()
			body.umieranie()



func _on_AnimatedSprite_animation_finished():
	if(anim.animation=="DEAD"):
		zabity()
		Global.pauzatla=false


func _on_VisibilityNotifier2D_screen_exited():
		queue_free()



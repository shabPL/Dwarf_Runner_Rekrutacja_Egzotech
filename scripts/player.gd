extends KinematicBody2D

export var predkoscpocz=Vector2.ZERO
onready var anim=$AnimatedSprite
onready var ataks=$Efekty/atak
onready var smiercs=$Efekty/smierc
signal martwy
func ready():
	anim.play("IDLE")
func _physics_process(delta):
	if Input.is_action_just_pressed("atak") and Global.input==true :
		Global.czyatak=true
		anim.play("ATTACK")
		ataks.play()

func run():
	anim.play("RUN")
func _on_AnimatedSprite_animation_finished():
	if(anim.animation=="ATTACK"):
		run()
		Global.czyatak = false
	elif(anim.animation=="DEAD"):
		zabity()

func zabity():
	Global.dedowa()
	queue_free()
	Global.input=true
func umieranie():
	Global.input=false
	$CollisionShape2D.set_deferred("disabled", true)
	$dystans_ataku.set_deferred("disabled", true)
	anim.play("DEAD")
	smiercs.play()
	




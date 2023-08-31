extends Node


var czyatak = false
var pauzatla = false
var punkty :int 
var topw : int
signal martwy
signal smierc
var input = true

func emiter():
	emit_signal("martwy")
func dedowa():
	emit_signal("smierc")

extends Node2D

func _ready():
	$Panel.visible = false
	

func _on_CloseHintBTN_pressed():
	$Panel.visible = false
	
func _on_HintBTN_pressed():
	$Panel.visible = true


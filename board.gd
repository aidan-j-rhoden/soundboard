extends CanvasLayer

@onready var effects: HFlowContainer = $VBoxContainer/MarginContainer/Effects


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("escape"):
		get_tree().quit()


func _on_button_pressed() -> void:
	get_tree().quit()


func _on_volume_value_changed(value: float) -> void:
	for child in effects.get_children():
		child.set_volume(value)

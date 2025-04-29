extends Button

@export var title: String
@export var clip: AudioStream
@export var volume_level: float = 0.0

func _ready() -> void:
	text = " " + title + " "
	$AudioStreamPlayer.volume_db = volume_level
	$AudioStreamPlayer.stream = clip


func _on_pressed() -> void:
	if title == "Vine Boom":
		var new_stream = $AudioStreamPlayer.duplicate(8)
		add_child(new_stream)
		new_stream.finished.connect(Callable(new_stream, "queue_free"))
		new_stream.play()
	elif not $AudioStreamPlayer.playing:
		$AudioStreamPlayer.play()


func set_volume(value):
	$AudioStreamPlayer.volume_db = linear_to_db(db_to_linear(volume_level) * value)

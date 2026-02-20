extends Label

var time: float = 30.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time = time - delta
	self.text = str(ceil(time))
	if time <= 0:
		self.queue_free()
	

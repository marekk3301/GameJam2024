extends Label

@onready var scoreNode = get_node("/root/Score")

func _process(delta):
	self.text = str(scoreNode.points)

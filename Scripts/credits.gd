extends Button

@onready var Credits_panel: Panel = get_node("../CreditsPanel")

func _on_pressed():
	Credits_panel.show()
	get_node("MouseClick").play()

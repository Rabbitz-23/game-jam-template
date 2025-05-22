extends Node

@export var localizedSprites: Array[Texture2D]

func _ready():
	EventBus.change_locale.connect(_change_locale)
	_change_locale(SettingsController.locale)
	
func _change_locale(locale: SettingsController.locales):
	var spr: Sprite2D = get_parent()
	if locale == SettingsController.locales.esES:
		spr.texture = localizedSprites[0]
	elif locale == SettingsController.locales.enEN:
		spr.texture = localizedSprites[1]
	elif locale == SettingsController.locales.caCA:
		spr.texture = localizedSprites[2]
	else:
		spr.texture = localizedSprites[0]

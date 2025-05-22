extends Node

@export var localizedLabels: Array[String]

func _ready():
	EventBus.change_locale.connect(_change_locale)
	_change_locale(SettingsController.locale)

func _change_locale(locale: SettingsController.locales):
	var spr: Node = get_parent()
	if locale == SettingsController.locales.esES:
		spr.text = localizedLabels[0]
	elif locale == SettingsController.locales.enEN:
		spr.text = localizedLabels[1]
	elif locale == SettingsController.locales.caCA:
		spr.text = localizedLabels[2]
	else:
		spr.text = localizedLabels[0]

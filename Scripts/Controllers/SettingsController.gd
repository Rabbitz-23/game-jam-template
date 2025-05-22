extends Node

enum locales {
	esES,
	enEN,
	caCA
}

var locale: locales

var masterVolumeSetting: float
var musicVolumeSetting: float
var sfxVolumeSetting: float

func _ready():
	if locale == null:
		set_locale(locales.esES)

func set_volumes(master: float, music: float, sfx: float):
	masterVolumeSetting = master
	musicVolumeSetting = music
	sfxVolumeSetting = sfx

func set_locale(newLocale:locales):
	locale = newLocale
	EventBus.change_locale.emit(locale)

func change_audio_volume(bus_index: int, value: float):
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))

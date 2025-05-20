extends Panel

func _on_close_button_pressed():
	self.hide()
	get_node("MouseClick").play()


func _on_option_button_item_selected(index):
	if index == 0:
		EventBus.change_locale.emit(SettingsController.locales.esES)
	elif index == 1:
		EventBus.change_locale.emit(SettingsController.locales.enEN)
	elif index == 2:
		EventBus.change_locale.emit(SettingsController.locales.caCA)

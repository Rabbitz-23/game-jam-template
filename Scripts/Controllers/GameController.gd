extends Node

enum gameStates {
	MENU,
	LEAVING_MENU,
	STARTING_ROOM,
	EXPLORING,
	FIGHTING,
	SELECTING_REWARDS,
	PAUSE,
}

func save_to_file(content):
	var file = FileAccess.open("user://save_game.dat", FileAccess.WRITE)
	file.store_string(content)
	
func load_from_file():
	var file = FileAccess.open("user://save_game.dat", FileAccess.READ)
	var content = file.get_as_text()
	return content

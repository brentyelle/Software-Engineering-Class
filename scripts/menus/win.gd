extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

func _process(_delta):
	$Win/TimerText.text = "Time: " + str(SceneManager.time_taken) + " sec"
	$Win/TotalGems.text = "Total Gems: " + str(SceneManager.total_gems)

func _on_main_button_pressed():
	SceneManager.load_scene("res://scenes/menus/menu.tscn")
	hide()

func show_win_screen():
	$WinSound.play()
	show()

func _on_next_button_pressed():
	if SceneManager.current_scene.name == "WorldTutorial":
		SceneManager.load_scene("res://scenes/levels/Level 1/Level1_1.tscn")
	elif SceneManager.current_scene.name == "World1_1":
		SceneManager.load_scene("res://scenes/levels/Level 1/Level1_2.tscn")
	elif SceneManager.current_scene.name == "World1_2":
		SceneManager.load_scene("res://scenes/levels/Level 1/Level1_3.tscn")
		$Win/HBoxContainer/NextButton.text = "Credits"
	elif SceneManager.current_scene.name == "World1_3":
		SceneManager.load_scene("res://scenes/menus/credits.tscn")
		$Win/HBoxContainer/NextButton.text = "Next Level"
		
	get_tree().paused = false
	hide()

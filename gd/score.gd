extends Control

@onready var labelBlue = $BlueLabel/BlueScore
@onready var labelRed = $RedLabel/RedScore
@onready var youWin = $YouWin
@onready var colorRect = $ColorRect

var blueScore = 8
var redScore = 8
var pauseGame = false

signal sPauseGame
signal sDeleteBall



# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	labelBlue.text = str(blueScore)
	labelRed.text = str(redScore)
	
	if blueScore == 0 && pauseGame==false:
		#sPauseGame.emit()
		get_tree().paused = true
		pauseGame = true
		youWin.text = "RED WIN"
		youWin.visible = true
		colorRect.visible = true
		#sDeleteBall.emit()
		#print("di sini")
	elif redScore == 0 && pauseGame==false:
		#sPauseGame.emit()
		#sDeleteBall.emit()
		get_tree().paused = true
		#get_tree().paused = false
		pauseGame = true
		#paused = true
		youWin.text = "BLUE WIN"
		youWin.visible = true
		colorRect.visible = true
		#print("di sini2")
	
	#if redScore != 0 and Input.is_action_pressed("ui_cancel"):
		#get_tree().paused = false
		#pauseGame = false
	
	#print(redScore)
	#print(pauseGame)
	#print(get_tree().paused)
func _on_Mob_squashed():
	#print("waklu berjaya")
	#score += 1
	blueScore += 1
	redScore = 16 - blueScore
	#text = "Score: %s" % score
	#labelBlue.text = str("waklu")
	#labelBlue.text = str(blueScore)
	#labelRed.text = str(redScore)
	#print(blueScore)
	
func _on_Mob_squashed2():
	#score += 1
	redScore += 1
	blueScore = 16 - redScore
	#text = "Score: %s" % score
	#labelBlue.text = str("waklu")
	#labelBlue.text = str(blueScore)
	#labelRed.text = str(redScore)

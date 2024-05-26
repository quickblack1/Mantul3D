extends Control

@onready var labelBlue = $CountryName1/BlueScore
@onready var labelRed = $CountryName2/RedScore
@onready var youWin = $YouWin
@onready var colorRect = $ColorRect
@onready var leftFlag = $CountryName1/TextureRect
@onready var rightFlag = $CountryName2/TextureRect
@onready var countryName1 = $CountryName1
@onready var countryName2 = $CountryName2

var blueScore = 21
var redScore = 21
var pauseGame = false
var leftCountry
var rightCountry
var countryCode = ["ad", "ae", "af", "ag", "ai", "bn", "am", "az", "bh", "bd", "bt", "kh"]
var countryName = ["Andorra", "United Arab Emirates", "Afghanistan", "Antigua and Barbuda", "Anguilla", "Brunei", "Armenia", "Azerbaijan", "Bahrain", "Bangladesh", "Bhutan", "Cambodia"]
var totalCountry = len(countryCode)

signal sPauseGame
signal sDeleteBall

var rng = RandomNumberGenerator.new()
var first_num = rng.randi_range(0, totalCountry-1)
	#var first_num = 53
var second_num = rng.randi_range(0, totalCountry-1)
	#var second_num = 148



# Called when the node enters the scene tree for the first time.
func _ready():
	while first_num == second_num:
		second_num = rng.randi_range(0, totalCountry-1)
		if first_num != second_num:
			break
	
	
	
	print("1: " , first_num)
	print("2: " , second_num)
	countryName1.text = countryName[first_num]
	countryName2.text = countryName[second_num]
	leftFlag.texture = load("res://svg/"+countryCode[first_num]+ ".svg")
	rightFlag.texture = load("res://svg/"+countryCode[second_num]+ ".svg")
	#for x in range(1, 271):
		#if x == 1:
			
	
	#if first_num == 0 or second_num == 0:
		#leftCountry = "ad"
		#if first_num == 0:
			#countryName1.text = countryName[first_num]
			#leftFlag.texture = load("res://svg/"+countryCode[first_num]+ ".svg")
		#if second_num == 0:
			#countryName2.text = countryName[second_num]
			#rightFlag.texture = load("res://svg/"+countryCode[second_num]+ ".svg")
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	labelBlue.text = str(blueScore)
	labelRed.text = str(redScore)
	
	if blueScore == 0 && pauseGame==false:
		#sPauseGame.emit()
		get_tree().paused = true
		pauseGame = true
		youWin.text = countryName[second_num]+" WIN"
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
		
		youWin.text = countryName[first_num]+" WIN"
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
	redScore = 42 - blueScore
	#text = "Score: %s" % score
	#labelBlue.text = str("waklu")
	#labelBlue.text = str(blueScore)
	#labelRed.text = str(redScore)
	#print(blueScore)
	
func _on_Mob_squashed2():
	#score += 1
	redScore += 1
	blueScore = 42 - redScore
	#text = "Score: %s" % score
	#labelBlue.text = str("waklu")
	#labelBlue.text = str(blueScore)
	#labelRed.text = str(redScore)

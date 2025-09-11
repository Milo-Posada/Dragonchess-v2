@icon("res://images/Dragonchess_gameboard.png")
extends Node3D

# Order of pieces is board number, file letter, rank number

# FEN order starts with last rank (from left-most file to the right) and highest level (1) to the bottom
const base_fen: String = "2g3r3g1/s1s1s1s1s1s1/12/12/12/12/S1S1S1S1S1S1/2G3R3G1/\
ouhtcmkpthuo/wwwwwwwwwwww/12/12/12/12/WWWWWWWWWWWW/OUHTCMKPTHUO/\
2b3e3b1/1d1d1d1d1d1d/12/12/12/12/1D1D1D1D1D1D/2B3E3B1"

const sylph = preload("res://pieces/piece_scenes/sylph.tscn")
#const griffin = preload("res://pieces/piece_scenes/griffin.tscn")
#const dragon = preload("res://pieces/piece_scenes/dragon.tscn")
#const warrior = preload("res://pieces/piece_scenes/warrior.tscn")
#const oliphant = preload("res://pieces/piece_scenes/oliphant.tscn")
#const unicorn = preload("res://pieces/piece_scenes/unicorn.tscn")
#const hero = preload("res://pieces/piece_scenes/hero.tscn")
#const thief = preload("res://pieces/piece_scenes/thief.tscn")
#const cleric = preload("res://pieces/piece_scenes/cleric.tscn")
#const mage = preload("res://pieces/piece_scenes/mage.tscn")
#const king = preload("res://pieces/piece_scenes/king.tscn")
#const paladin = preload("res://pieces/piece_scenes/paladin.tscn")
#const dwarf = preload("res://pieces/piece_scenes/dwarf.tscn")
#const basilisk = preload("res://pieces/piece_scenes/basilisk.tscn")
#const elemental = preload("res://pieces/piece_scenes/elemental.tscn")

# Creates empty 3D array to fill with pieces
func _ready():
	var board_array = []
	var levels: int = 3
	var files: int = 12
	var ranks: int = 8
	board_array.resize(levels)    # X-dimension
	for x in levels:
		board_array[x] = []
		board_array[x].resize(files)    # Y-dimension
		for y in files:
			board_array[x][y] = []
			board_array[x][y].resize(ranks)    # Z-dimension
			for z in ranks:
				board_array[x][y][z] = []
				#board_array[x][y][z] = [str(str(x+1) + String.chr(y+97) + str(8-z))]
				
	fill_board(base_fen, board_array)
	
# Fills board from bottom left on the top level (according to FEN)
func fill_board(fen, array):
	# Variable defaults
	var slashes: int = 0 #counts levels
	var level: int = 0 #top board
	var file: int = 97 #file a
	var rank: int = 0 #rank 8
	
	var fen_length = fen.length()
	for i in range(0, fen_length):
		var c = fen[i]
		#Account for numbers (empty spaces)
		if int(c):
			if i+1 < fen_length and int(fen[i+1]): #account for 10,11,12
				var number = int(str(int(fen[i])) + str(int(fen[i+1])))
				if number < 13:
					file += number
					i += 1
				else:
					print("Invalid FEN: Number ", number, " too large.")
					break
			else:
				file += int(c)
			i += 1
			continue
			
		#Correcting board positions
		if c == '/':
			slashes += 1
			if slashes == 8:
				slashes = 0
				level += 1
				file = 97
				rank = 0
				continue
		if file > 108:
			file = 97
			rank += 1
			continue
			
		else:
			array[level][file-97][rank] = c
			if c == 's':
				add_child(sylph.instantiate())
		file += 1
		
	#print_board(array)

# Provides no functionality, simply here for a visual on the console
func print_board(array):
	for i in range(3):
		for k in range(8):
			var row = ""
			for j in range(12):
				row += str(array[i][j][k]) + " "
			print(row)
		print()
	
func _process(_delta):
	#on.click
	pass

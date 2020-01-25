extends Node

export (PackedScene) var Mob

var score

func _ready():
	randomize()

#func _process(delta):
#	pass


func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()


func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()


func _on_ScoreTimer_timeout():
	score += 1


func _on_StartTimer_timeout():
	$ScoreTimer.start()
	$MobTimer.start()


func _on_MobTimer_timeout():
	$MobPath/MobSpawnLocation.offset = randi()
	
	var mob = Mob.Instance()
	add_child(mob)
	
	mob.position = $MobPath/MobSpawnLocation.position
	
	var direction = $MobPath/MobSpawnLocation.rotation + PI/2
	direction += rand_range(-PI/4, PI/4)
	mob.rotation = direction
	
	var velocity = Vector2(rand_range(mob.min_speed, mob.max_speed), 0)
	mob.linear_velocity = velocity.rotated(direction)
	
	
	
	
	

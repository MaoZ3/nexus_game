extends CharacterBody2D

#export de variables para poder usarlas aparte 
@export var speed = 300
@export var gravity = 100
@export var jump_force = 550	

@onready var MenuPausa = $pause_menu


#funcion para setear movimiento del personaje
func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta	
		
	#si velocidad en vertical es mayor a 1000, seteo velocidad en vertical
	#if velocity.y > 1000:
	#	velocity.y = 1000
			
	#seteo variable de salto
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
		
		
	#seteo variable de Input para mover el personaje en R y L
	var h_direction = Input.get_axis("move_left", "move_right")
	
	#aplico velocidad a X e Y para que pueda moverse
	velocity.x = speed * h_direction
	
	
	move_and_slide()
	
	#test para ver valores de velocidad
	print (velocity)

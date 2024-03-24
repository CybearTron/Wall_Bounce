extends StaticBody2D

var khata = 100;

var potion_price = 25;

var player = null;

func _buy_potion(n):
	if khata-(n*potion_price)<0:
		n-=1;
		_buy_potion(n);
	else:
		khata = khata-(n*potion_price);
		Inventory.potions-=n;
		Inventory.money += n*potion_price;

func _physics_process(delta):
	if player!= null:
		if Input.is_action_just_pressed("ui_accept"):
			_buy_potion(Inventory.potions);
	
	if Inventory.upgrades.has("potion_quality"):
		potion_price = 50;
	else:
		potion_price = 25;

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		player = body;


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		player = null;


func _on_khata_update_timeout():
	if Inventory.upgrades.has("shop_account"):
		khata += 225;
	else:
		khata +=100;
	

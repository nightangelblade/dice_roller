def search_rolls_name(database, character_name)
	p database.execute("SELECT * FROM rolls WHERE name=?", [character_name])
end

def search_rolls_id(database, roll_id)
	p database.execute("SELECT * FROM rolls WHERE id=?", [roll_id])
end
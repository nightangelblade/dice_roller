require_relative 'dice'
require_relative 'search'

roller_database = SQLite3::Database.new("dice_roller.db")

create_table_cmd = <<-SQL
	CREATE TABLE IF NOT EXISTS rolls(
		id INTEGER PRIMARY KEY,
		battle INTEGER,
		craft INTEGER,
		loot INTEGER,
		enemy INTEGER,
		name VARCHAR(255),
		link VARCHAR(255),
		post_time DATETIME NULL
	)
SQL

roller_database.execute(create_table_cmd)

if ARGV.any?
	if ARGV[0] == "new"
		character_name = ARGV[1]
		post_link = ARGV[2]
		new_roll = Roller.new
		new_roll.new_roll(roller_database, character_name, post_link)
	elsif ARGV[0] == "search"
		if ARGV[1] == "character"
			character_name = ARGV[2]
			search_rolls_name(roller_database, character_name)
		elsif ARGV[1] == "id"
			roll_id = ARGV[2].to_i
			search_rolls_id(roller_database, roll_id)
		end
	end
else
	p "Enter command to execute."
end
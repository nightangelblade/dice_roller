require 'sqlite3'

class Roller
	attr_reader :battle, :craft, :loot, :enemy, :name, :url

	def new_roll(database, character_name, post_link)
		@battle = rand(1..20)
		@craft = rand(1..12)
		@loot = rand(1..20)
		@enemy = rand(1..20)
		@name = character_name
		@url = post_link
		@timestamp = Time.now.strftime('%Y-%m-%d %H:%M:%S')
		database.execute("INSERT INTO rolls (battle, craft, loot, enemy, name, link, post_time) VALUES (?, ?, ?, ?, ?, ?, ?)", [@battle, @craft, @loot, @enemy, @name, @url, @timestamp])
	end

end
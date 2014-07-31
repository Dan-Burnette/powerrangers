#Power Rangers MKS Exercise // DANIEL BURNETTE 
class Person

	attr_reader :name
	attr_accessor :caffeine_level

	def initialize(name, caffeine_level=20000)
		@name = name
		@caffeine_level = caffeine_level
	end

	def run
		puts "#{@name} runs like the wind"
	end

	def scream
		puts "#{@name} cries out in pain" 
	end

	#95mg caffeine per cup of coffee
	def drink_coffee(cups)
		@caffeine_level += 95*cups
		puts "#{@name} drinks #{cups} cups of coffee, gaining #{cups*95} energy"
	end
end

module Fight_moves

		def punch(person)
		puts "#{person.name} was punched!"
		person.scream
		
		#sumersaulted
		if @strength > 5
			puts "#{person.name} sumersaults through the air!"
			person.caffeine_level -= 2*@strength
			@caffeine_level -= 5
		end

		person.run
	end

end
#QUESTION! Is it possible to use a module to mixin initialize methods (if multiple classes were going to have the same initialize parameters)?
class PowerRanger < Person

	include Fight_moves

	#QUESTION! Tutorial says you can use Class.class_method, is there a reason to self or that over the other?
	def self.use_megazord(person)
		puts "Megazord is about to put #{person.name} in a world of hurt!"
		person.scream
		person.run
		person.caffeine_level -= 2*5000
		if person.caffeine_level > 0
			puts "#{person.name} was hit by megazord for 10,000 energy! He has #{person.caffeine_level} left!"
		else
			puts "#{person.name} incapacitated by megazord!"
		end

	end

	def initialize(name, caffeine_level, strength, color)
		super(name, caffeine_level)
		@strength = strength
		@color = color
	end

	def rest()
		@caffeine_level += 200
		"#{@name} rests up and gains 200 energy!"
	end

end

class EvilNinja < Person

	include Fight_moves

	def initialize(name, caffeine_level, strength, evilness)
		super(name, caffeine_level)
		@strength = strength
		@evilness = evilness
	end

	def cause_mayhem(person)
		person.caffeine_level = 0
		puts "#{@name} used mayhem on #{person.name}, draining all their energy! KO!"
	end

end


def fight_scene()
	pr_1 = PowerRanger.new("Ranger1", 20000, 3, "blue")
	pr_2 = PowerRanger.new("Ranger2", 20000, 6, "red")

	en_1 = EvilNinja.new("EvilNinja1", 20000, 6, "Extremely evil")
	en_2 = EvilNinja.new("EvilNinja2", 20000, 3, "Rather evil")

	p_1 = Person.new("Dan" , 30000)
	p_2 = Person.new("Nate", 20000)

	pr_1.punch(en_1)
	pr_2.punch(en_2)

	en_1.cause_mayhem(pr_1)
	pr_2.rest

	PowerRanger.use_megazord(en_1)

	p_1.drink_coffee(10)

end

fight_scene()


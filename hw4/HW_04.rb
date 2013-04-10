###############################################################################
#
# Introduction to Ruby on Rails
#
# Lab 04
#
# Purpose:
#
# Read the steps below and complete the exercises in this file. This Lab
# will help you to review the basics of Object-Oriented Programming that
# we learned in Lesson 04.
#
###############################################################################
#
# 1. Review your solution to Lab 03. Copy and Paste your solution to
#    this file.
#
# 2. Create a new method called `increment_guess_count` that takes
#    an integer parameter and increments it by 1.
#
# 3. Create a new method called `guesses_left` that calculates how many guesses 
#	 out of 3 the Player has left. The method should take one parameter that is the 
#	 number of guesses the player has guessed so far. Use this new method in your 
#	 code to tell the user how many guesses they have remaining. 
#
# 4. Make sure to remove your local variable `guesses_left` and use the
#    new method instead.
#
# 5. Make sure to comment your code so that you have appropriate
#    documentation for you and for the TAs grading your homework. :-)


# creating a method of incrementing the guess count (instead of count + 1)
# also make a method of decrementing the guesses_left count
#
###############################################################################
#
# Student's Solution
#
###############################################################################


puts prompt = "What's your first name?"
first_name = gets.chomp

puts prompt = "What's your last name?"
last_name = gets.chomp

player_name = first_name + " " + last_name

puts "Welcome" + " " + player_name + "!" + "You have 3 guesses to guess the Secret Number between 1 and 10."

# guesses_left = 3

set_of_numbers = (1..10).to_a
secret_number = set_of_numbers.sample  #this will give a random #

many_guesses = 0
def increment_guess_count (many_guesses)
	many_guesses += 1
end

def guesses_left (guess)
	3 - guess
end

messages = Hash.new
messages[:win] = "You Won!"
messages[:lose] = "You lost."
messages[:too_low] = "Your guess is too low"
messages[:too_high] = "Your guess is too high"

3.times do |count|
	puts "Please make your guess:"
	players_guess = $stdin.gets.chomp.to_i
	
	if secret_number == players_guess
		puts messages[:win]
		puts "you guessed in #{count + 1} turns!"
		exit
	elsif  secret_number < players_guess
		puts messages[:too_high]
	elsif secret_number > players_guess
		puts messages[:too_low]
	end
	many_guesses = increment_guess_count(many_guesses)
	total_guesses = guesses_left(many_guesses)
	puts "You have " + total_guesses.to_s + " guesses left"
end

puts messages[:lose]
	puts "The secret number is #{secret_number}"




# def show_months(months, *months_numbers)
# 	months_names = ""
# 	months_numbers.each do |number|
# 		months_names += months[number-1] + " "
# 	end



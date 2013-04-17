class Game
#	Make sure that all the instance variables in this class may only be READ and not WRITTEN to. 
attr_reader :guesses_allowed, :current_guess_count, :current_guess

@@messages = { win: "You won!",
 lose:  "You lost! :-(",
   too_low: "Your guess was too low!",
   too_high: "Your guess was too high!" }


	# Initializes The number of guesses (or tries) a player is allowed before the game ends.
	# You should default number of guesses to 3 if the parameter is null.
	# Sets a guess counter to zero.
	# Creates a new instance of the Player class. 
	# Creates a new instance of the SecretNumber class and assigns it to the secret_number. Don't forget to pass along the
	# necessary parameters.
  	# initializes the current guess to nil
    def initialize(guesses_allowed, set_of_numbers)
      @guesses_allowed = guesses_allowed || 3
      @current_guess_count = 0

      @player = Player.new()
      @secret_number = SecretNumber.new(set_of_numbers).game_secret_number
      puts @secret_number

    #additional notes
    # puts "What is your first name?"
    # @first_name = gets.strip

    # puts "What is your last name"
    # @last_name = gets.strip

    # player = Player.new(@first_name, @last_name)

    # secret_number = Secret.Number.new((1..10).to_a)
    @current_guess = nil

  end
  

  # Print who made this wonderful program :-)
def print_created_by
  print "Made by Kristen Rumfola"

end


	# Calls `print_created_by` so that your players knows you created the game.
	# Asks the player to enter his/her name. Save it to @player.name.
	# Print out the number of guesses the players gets and the range of numbers they can choose from.
	# Asks the player for his/her guess. Use the `guess_correct?` method to verify the guess.
	# Continue to ask the user to guess the number so long as they have not maximized the number of guesses allowed 
	# and they did not guess correctly. 
  # Each time tell the player how many guesses left they have.
	# If at the end of the loop they still did not guess correctly, tell the player that they have lost using the
	# `@@messages` class variable and tell them the secret number.
  def start_game
    puts "n\Welcome to the secret game"
    puts print_created_by

    puts "What is your name"
    @player.name = $stdin.gets.chomp



    puts "Hi #{@player.name}, you have #{@guesses_allowed} to guess the secret number between 1-10. What is your guess?"
    @player_guess = $stdin.gets.chomp
    
    # increment_guess_count = @current_guess_count
    # guesses_left = @guesses_allowed
    # @current_guess_count = increment_guess_count
    # @guesses_allowed = guesses_left

    while @current_guess_count < @guesses_allowed

      if guess_correct?(@player_guess)
        puts "You win!"
        exit
      else 
        puts "You have #{guesses_left} guesses left." 
        @current_guess_count = increment_guess_count
        # @guesses_allowed = guesses_left
        # @current_guess_count = increment_guess_count
        # guesses_left = @guesses_allowed
        puts "What is your next guess?"
        @player_guess = $stdin.gets.chomp
      end
    end
    puts @@messages[:lose]
    puts "The secret number was #{@secret_number}"
  end


  def guess_correct?(guess)
    @guess_outcome = false
    guess = guess.to_i
    if @secret_number == guess
      puts @@messages[:win]
      puts "You guessed in #{increment_guess_count} tunrs!"
      @guess_outcome = true
    elsif @secret_number > guess
      puts @@messages[:too_low]
      # puts "You have #{guesses_left} guess left"
    elsif @secret_number < guess
      # puts "You have #{guesses_left} guess left"
      puts @@messages[:too_high] 
    end
    return @guess_outcome
  end


  # This method should increment every time the player guesses incorrectly.
  def increment_guess_count
    @current_guess_count = @current_guess_count + 1
    
  end
  

  # Calculates the guesses the player has left.
  def guesses_left
    @guesses_allowed - @current_guess_count
  
  end
end


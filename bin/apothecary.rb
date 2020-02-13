require_relative '../config/environment'



# puts "############# #######################  ##################"
# color_fix
# cli.say("<%= color('HAHAHAHAHAHA', :menu_line)%>!")
# cli.say("<%= color('HAHAHAHAHAHA', :menu_choice)%>!")
# cli.say("<%= color('HAHAHAHAHAHA', :horizontal_line)%>!")
# cli.say("<%= color('HAHAHAHAHAHA', :headline)%>!")
# cli.say("<%= color('WARNING   WARNING', :warning)%>!")
# cli.say("<%= color('HAHAHAHAHAHA', :menu_line)%>!")
# puts "############# #######################  ##################"
# String.colors                       # return array of all possible colors names
# String.modes                        # return array of all possible modes
# String.color_samples                # displays color samples in all combinations
#String.disable_colorization         # check if colorization is disabled
#String.disable_colorization = false # enable colorization
#String.disable_colorization false   # enable colorization
#String.disable_colorization = true  # disable colorization
#String.disable_colorization true    # disable colorization

# puts "This is blue".colorize(:blue)
# puts "This is light blue".colorize(:light_blue)
# puts "This is also blue".colorize(:color => :blue)
# puts "This is light blue with red background".colorize(:color => :light_blue, :background => :red)
# puts "This is light blue with red background".colorize(:light_blue ).colorize( :background => :red)
# puts "This is blue text on red".blue.on_red
# puts "This is red on blue".colorize(:red).on_blue
# puts "This is red on blue and underline".colorize(:red).on_blue.underline
# puts "This is blue text on red".blue.on_red.blink
#puts "This is uncolorized".blue.on_red.

## Using colored indices on Menus
# puts "############# Using colored indices on Menus ##################"
# HighLine::Menu.index_color   = :rgb_77bbff # set default index color

# cli.choose do |menu|
#   menu.index_color  = :green      # override default color of index
#                                        # you can also use constants like :blue
#   menu.prompt = "Please choose your favorite programming language?  "
#   menu.choice(:ruby) { cli.say("Good choice!") }
#   menu.choices(:python, :perl) { cli.say("Not from around here, are you?") }
# end

########################################################
#puts "############# Using TTY ##################"
#prompt = TTY::Prompt.new
# puts "hello world"
# puts "hello world"
# system("sleep 2")
# system("clear")
# system("sleep 2")
# p Faker::Name.first_name
# p Faker::Name.last_name
# p Faker::Alphanumeric.alpha(number: 6)
# p Faker::Number.number(digits: 4)


# p rand(1..11)

# puts "############# Basic usage  ##################"

# cli = HighLine.new
# answer = cli.ask "What do you think?"
# puts "You have answered: #{answer}"


# # Default answer
# puts "############# Default answer  ##################"
# cli.ask("Company?  ") { |q| q.default = "none" }


# # Validation
# puts "############# Validation  ##################"
# cli.ask("Age?  ", Integer) { |q| q.in = 0..105 }
# cli.ask("Name?  (last, first)  ") { |q| q.validate = /\A\w+, ?\w+\Z/ }


# # Type conversion for answers:
# puts "############# Type conversion for answers:  ##################"
# cli.ask("Birthday?  ", Date)
# cli.ask("Interests?  (comma sep list)  ", lambda { |str| str.split(/,\s*/) })


# # Reading passwords:
# puts "############# Reading passwords:  ##################"
# cli.ask("Enter your password:  ") { |q| q.echo = false }
# cli.ask("Enter your password:  ") { |q| q.echo = "x" }


# # ERb based output (with HighLine's ANSI color tools):
# puts "############# ERb based output (with HighLine's ANSI color tools):  ##################"
# cli.say("This should be <%= color('BYE BYE BABY', BOLD) %>!")


# # Menus:
# puts "############# Menus: ##################"
# cli.choose do |menu|
#   menu.prompt = "Please choose your favorite programming language?  "
#   menu.choice(:ruby) { cli.say("Good choice!") }
#   menu.choices(:python, :perl) { cli.say("Not from around here, are you?") }
#   menu.default = :ruby
# end

# ## Using colored indices on Menus
# puts "############# Using colored indices on Menus ##################"
# HighLine::Menu.index_color   = :rgb_77bbff # set default index color

# cli.choose do |menu|
#   menu.index_color  = :green      # override default color of index
#                                        # you can also use constants like :blue
#   menu.prompt = "Please choose your favorite programming language?  "
#   menu.choice(:ruby) { cli.say("Good choice!") }
#   menu.choices(:python, :perl) { cli.say("Not from around here, are you?") }
# end


# p Faker::Name.first_name
# p Faker::Name.last_name
# p Faker::Alphanumeric.alpha(number: 6)
# p Faker::Number.number(digits: 4)

########################################################
#puts "############# Using HighLine ##################"

# answer = cli.ask "What do you think?"
# puts "You have answered: #{answer}"

# # Default answer
# puts "############# Default answer  ##################"
# cli.ask("Company?  ") { |q| q.default = "none" }

# # Validation
# puts "############# Validation  ##################"
# cli.ask("Age?  ", Integer) { |q| q.in = 0..105 }
# cli.ask("Name?  (last, first)  ") { |q| q.validate = /\A\w+, ?\w+\Z/ }

# # Type conversion for answers:
# puts "############# Type conversion for answers:  ##################"
# cli.ask("Birthday?  ", Date)
# cli.ask("Interests?  (comma sep list)  ", lambda { |str| str.split(/,\s*/) })

# # Reading passwords:
# puts "############# Reading passwords:  ##################"
# cli.ask("Enter your password:  ") { |q| q.echo = false }
# cli.ask("Enter your password:  ") { |q| q.echo = "x" }

# # Menus:
# puts "############# Menus: ##################"
# cli.choose do |menu|
#   menu.prompt = "Please choose your favorite programming language?  "
#   menu.choice(:ruby) { cli.say("Good choice!") }
#   menu.choices(:python, :perl) { cli.say("Not from around here, are you?") }
#   menu.default = :ruby
# end
# def flash_warning
#     msg = "WARNING! YOU ARE ABOUT TO DELETE YOUR ADDITION"
#     puts ""
#     system "say #{msg}"
#     3.times do
#       print "\r#{ ' ' * msg.size }"
#       sleep 0.5
#       print "\r#{ msg.colorize(:red) }"
#       sleep 0.5
#     end
#     puts ""
# end
# flash_warning
#system("open", "http://stackoverflow.com/")

# prompt = "> "

# while buf = Readline.readline(prompt, true)
#   puts "Your input was: '#{buf}'"
# end
# Readline::HISTORY.to_a  --  Readline will keep a history of everything you type, and it will allow you to search your history using ctrl+r, or Readline::HISTORY.to_a inside your code.

# require "rubygems"
# require "highline/import"

# @C = 299792458

# def accel_calc
#   mass = ask("Mass? ", Float)
#   speed = ask("Speed? ", Float)
#   puts
#   puts("mass * speed = #{mass*speed}")
#   puts
# end

# def energy_calc
#   mass = ask("Mass? ", Float)
#   puts
#   puts("E=MC^2 gives #{mass*@C**2}")
#   puts
# end

# begin
#   puts
#   loop do
#     choose do |menu|
#       menu.prompt = "Please select calculation "
#       menu.choice(:Acceleration) { accel_calc() }
#       menu.choice(:Energy) { energy_calc() }
#       menu.choice(:Quit, "Exit program.") { exit }
#     end
#   end
# end










require_relative '../config/environment'


cli = HighLine.new
prompt = TTY::Prompt.new

#  -----------    user create
# u1id = User.create(first_name: "John", last_name: "Beet", user_name: "beermo", password: 1234, exp: 0).id
# u2id = User.create(first_name: "Mary", last_name: "Poppins", user_name: "maryja", password: 1234, exp: 0).id
# User.create(first_name: "Jake", last_name: "Best", user_name: "bester", password: 1234, exp: 0)
# User.create(first_name: "Pit", last_name: "Jones", user_name: "pitbul", password: 1234, exp: 0)
# #  -----------    pharmacy create
# Pharmacy.create(name: "Bridge - Pharmacy", location: "Bay Ridge", open_from: 7, open_till: 7, work_week: 6, rank: 0)
# Pharmacy.create(name: "Brothers - Pharmacy", location: "Bensonhurst", open_from: 8, open_till: 9, work_week: 6, rank: 0)
# Pharmacy.create(name: "Crazy - Pharmacy", location: "Sunset Park", open_from: 9, open_till: 7, work_week: 7, rank: 0)
# Pharmacy.create(name: "Batman - Pharmacy", location: "Flushing", open_from: 9, open_till: 9, work_week: 6, rank: 0)


binding.pry

# system("open", "http://stackoverflow.com/")
# system("sleep 2")
# system("clear")
# system("sleep 2")
# menu_choice
# warning_msg
# system("sleep 2")
# system("clear")
# main_title
# main_menu
# menu_choice

########   GOOD LUCK  #########

flashing_app
system("sleep 1")
display_main_menu("GUEST")









#puts "############# #######################  ##################"
#puts "############# #######################  ##################"
#puts "############# #######################  ##################"
#puts "############# #######################  ##################"
#puts "############# #######################  ##################"

# If you wish to collect more than one answer use collect:

# result = prompt.collect do
#   key(:name).ask('Name?')

#   key(:age).ask('Age?', convert: :int)

#   key(:address) do
#     key(:street).ask('Street?', required: true)
#     key(:city).ask('City?')
#     key(:zip).ask('Zip?', validate: /\A\d{3}\Z/)
#   end
# end
# =>
# {:name => "Piotr", :age => 30, :address => {:street => "Street", :city => "City", :zip => "123"}}





#t = prompt.yes?('Is this the ?')
# => Do you like Ruby? (Y/n)

#prompt.select("Choose your Avatar!  Just Kidding, This not an RPG. Please select what apllies", %w(First  Kano Jax))
# =>
# Choose your destiny? (Use ↑/↓ arrow keys, press Enter to select)
# ‣ Scorpion
#   Kano
#   Jax
# Also, asking multiple choice questions is a breeze with multi_select:

# choices = %w(vodka beer wine whisky bourbon)
# prompt.multi_select("Select drinks?", choices)
# =>
#
# Select drinks? (Use ↑/↓ arrow keys, press Space to select and Enter to finish)"
# ‣ ⬡ vodka
#   ⬡ beer
#   ⬡ wine
#   ⬡ whisky
#   ⬡ bourbon







require_relative '../config/environment'


cli = HighLine.new
prompt = TTY::Prompt.new



#    ------     MAIN MENU CHOICES --------##################
#    ------     MAIN MENU CHOICES --------#################
#    ------     MAIN MENU CHOICES --------$###############
def upd_exp(user)
   e = User.find_by(user_name: user).services.length
   u = User.find_by(user_name: user)
   if e.between?(1, 4)
      u.update(exp: 1)
   elsif e.between?(4, 7)
         u.update(exp: 2)
   elsif e.between?(7, 11)
         u.update(exp: 3)
   elsif e.between?(11, 14)
         u.update(exp: 4)
   elsif e > 14
         u.update(exp: 5)
   end
end
def display_main_menu_choice
   prompt = TTY::Prompt.new
   menu_choices = [
                    'First Time User, Want To Register',
                    'Already A Registered User, Want To Login',
                    'Do Not Wish To Register, Just Browsing',
                    'Looking For Info About The App',
                    'Nothing Really, Spare Me Your @?%#&?|%!'
                   ]
   choice_msg = 'What Will It Be, We Offer A Great Many Choices!'
#   system "say #{choice_msg}"
   main_menu_choice = prompt.select('What Will It Be, We Offer A Great Many Choices!'.colorize(:color => :light_blue), menu_choices)
end

#    ------     USER MENU CHOICES --------
#    ------     USER MENU CHOICES --------##################
#    ------     USER MENU CHOICES --------#################
#    ------     USER MENU CHOICES --------$###############

def display_user_menu_choice
   prompt = TTY::Prompt.new
   menu_choices = [
                    'Find A Pharmacy Near Me',
                    'Check My Contributions',
                    'I Wish To Add A Pharmacy Or Contibution',
                    'I Wish To Edit One Of My Contributions',
                    'I Wish To Delete One Of My Contributions',
                    'Go Back To Main Menu'
                   ]
   choice_msg = 'What Will It Be, We Offer A Great Many Choices!'
#   system "say #{choice_msg}"
   main_menu_choice = prompt.select('What Will It Be, We Offer A Great Many Choices!'.colorize(:color => :light_blue), menu_choices)
end

#    ------     GUEST MENU CHOICES --------
#    ------     GUEST MENU CHOICES --------##################
#    ------     GUEST MENU CHOICES --------#################
#    ------     GUEST MENU CHOICES --------$###############

def display_guest_menu_choice
   prompt = TTY::Prompt.new
   menu_choices = [
               'Find A Pharmacy Near Me',
      #  { name: 'Check My Contributions', disabled: '(You Are A Guest)' },
      #  { name: 'I Wish To Add A Pharmacy Or Contibution', disabled: '(You Are A Guest)' }
      #  { name: 'I Wish To Edit One Of My Contributions', disabled: '(You Are A Guest)' }
      #  { name: 'I Wish To Delete One Of My Contributions', disabled: '(You Are A Guest)' }
               'Go Back To Main Menu'
                   ]
   choice_msg = 'What Will It Be, We Offer A Great Many Choices!'
#   system "say #{choice_msg}"
   main_menu_choice = prompt.select('What Will It Be, We Offer A Great Many Choices!'.colorize(:color => :light_blue), menu_choices)
end

#    ------     REGISTER MENU CHOICES --------
#    ------     REGISTER MENU CHOICES --------##################
#    ------     REGISTER MENU CHOICES --------#################
#    ------     REGISTER MENU CHOICES --------$###############

def check_username(input)
    User.all.pluck(:user_name).include?(input)
end

def display_register_menu_choice
   prompt = TTY::Prompt.new
   result = prompt.collect do
         key(:f_name).ask('What Is Your First Name?'.colorize(:color => :light_blue), required: true)
         key(:l_name).ask('What Is Your Last Name?'.colorize(:color => :light_blue), required: true)
         key(:u_name).ask('What Is Your Prefered LowerCase Character UserName?'.colorize(:color => :light_blue), required: true)         
         key(:pass).ask('What Is Your Prefered 4 Number Password?'.colorize(:color => :light_blue), required: true, echo: false, in: (0000...9999))    
   end
   if check_username(result[:u_name])
   ## warning_msg
      choice_msg = "The UserName You Chose Already Exists, Let's Try Again!"
      puts choice_msg
#      system "say #{choice_msg}"
      display_register_menu_choice
   end
   fi_name = result[:f_name].strip.downcase.capitalize
   la_name = result[:l_name].strip.downcase.capitalize
   us_name = result[:u_name].strip.downcase
   passw = result[:pass].strip
   User.create(first_name: fi_name, last_name: la_name, user_name: us_name, password: passw, exp: 0)
   display_login_menu
end

#    ------     LOGIN MENU CHOICES --------
#    ------     LOGIN MENU CHOICES --------##################
#    ------     LOGIN MENU CHOICES --------#################
#    ------     LOGIN MENU CHOICES --------$###############

def display_login_menu_choice
   prompt = TTY::Prompt.new
   def ask_for_password(user)
      prompt = TTY::Prompt.new
      ppaass = prompt.ask('What Is Your Password?'.colorize(:color => :light_blue), required: true, echo: false).strip
      if user.password == ppaass.to_i
         display_user_menu(user.user_name)
      #     CALL  THE   USER MENU  (USER_INSTANCE)
      else
         puts "The Password You Provided, Is Wrong! Please Try Again!"
         ask_for_password(user)
      end
  end
  def ask_for_username
      prompt = TTY::Prompt.new
      n = prompt.ask("What Is Your UserName?".colorize(:color => :light_blue), required: true).strip.downcase
      if User.pluck(:user_name).include?(n)
         user_instance = User.find_by(user_name: n)
         ask_for_password(user_instance)
      else
         puts "The UserName You Provided, Does Not Exist, Please Try Again!"
         ask_for_username
      end
  end
  ask_for_username
end

###########     ADD MENU CHOICES --------##################
# #########     ADD MENU CHOICES --------#################
###########     ADD MENU CHOICES --------$###############

def display_add_menu_choice(user)
   prompt = TTY::Prompt.new
   menu_choices = [
                    'Add A New Pharmacy You Discoverd',
                    'Add A New Contribution',
                    'Go Back To Previous Menu'
                   ]
   choice_msg = 'What Will It Be, We Offer A Great Many Choices!'
#   system "say #{choice_msg}"
   main_menu_choice = prompt.select('What Will It Be, We Offer A Great Many Choices!'.colorize(:color => :light_blue), menu_choices)
   if main_menu_choice == "Add A New Pharmacy You Discoverd"
      display_add_pharmacy_menu_choice(user)
   end
   if main_menu_choice == "Add A New Contribution"
      display_add_contribution_menu_choice(user)
   end
   if main_menu_choice == "Go Back To Previous Menu"
      display_user_menu(user)
   end
end


###########     ADD PHARMACY MENU CHOICES --------##################
# #########     ADD PHARMACY MENU CHOICES --------#################
###########     ADD PHARMACY MENU CHOICES --------$###############

def display_add_pharmacy_menu_choice(user)
   prompt = TTY::Prompt.new
   result = prompt.collect do
      key(:f_name).ask('What Is The Name?'.colorize(:color => :light_blue), required: true)
      key(:loct).ask('What Is The Location?'.colorize(:color => :light_blue), required: true)
      key(:open).ask('What Time (24h) Does It Open?'.colorize(:color => :light_blue), required: true, in: (1...24))        
      key(:close).ask('What Time (24h) Does It Close?'.colorize(:color => :light_blue), required: true, in: (1...24))        
      key(:week).ask('How Many Days During The Week Does It Stay Open?'.colorize(:color => :light_blue), required: true, in: (1...8))    
    end
#    if check_username(result[:u_name])
## warning_msg
      #  choice_msg = "The UserName You Chose Already Exists"
      #  puts choice_msg
      #  system "say #{choice_msg}"
      #  display_register_menu
#    end
    fi_name = result[:f_name].strip.downcase.capitalize
    local = result[:loct].strip.downcase.capitalize
    o = result[:open].strip
    c = result[:close].strip
    w = result[:week].strip
    Pharmacy.create(name: fi_name, location: local, open_from: o, open_till: c, work_week: w, rank: 0)
    display_add_menu_choice(user)
end


###########     ADD CONTRIBUTION MENU CHOICES --------##################
# #########     ADD CONTRIBUTION MENU CHOICES --------#################
###########     ADD CONTRIBUTION MENU CHOICES --------$###############


def display_add_contribution_menu_choice(user)
   prompt = TTY::Prompt.new
   choices = Pharmacy.all.map do |p|
             { name: p.name, value: p.id }
            end
   pharma_id = prompt.select("Choose The Pharmacy You Want To Add A Service For", choices)
   s_name = prompt.ask('What Do You Want To Name The Service?'.colorize(:color => :light_blue), required: true)
   u_id = User.find_by(user_name: user).id
   Service.create(name: s_name, user_id: u_id, pharmacy_id: pharma_id)
   upd_exp(user)
   display_add_menu_choice(user)
end
###########     VIEW CONTRIBUTIONS MENU CHOICES --------##################
# #########     VIEW CONTRIBUTIONS MENU CHOICES --------#################
###########     VIEW CONTRIBUTIONS MENU CHOICES --------$###############

def display_view_contributions_menu_choice(user)
    prompt = TTY::Prompt.new
    u = User.find_by(user_name: user)
    choices = u.services.map do |p|
             { 
               name: p.name, 
               value: p.id 
            }
            end
    s_id = prompt.select("These Are The Services You Have Contributed", choices)
    serv = Service.find_by(id: s_id)
    pharm = Pharmacy.find_by(id: serv.pharmacy_id)
    puts " Service Name : #{serv.name}".colorize(:light_blue).underline
    puts " Pharmacy Name : #{pharm.name}".colorize(:color => :light_blue, :background => :white)
    puts " Pharmacy Location : #{pharm.location}".colorize(:color => :light_blue, :background => :white)
    puts " Open from : #{pharm.open_from}".colorize(:color => :light_blue, :background => :white)
    puts " Open Till : #{pharm.open_till}".colorize(:color => :light_blue, :background => :white)
    puts " Open #{pharm.work_week} Days A Week".colorize(:color => :light_blue, :background => :white)
    system("sleep 3")
    t = prompt.yes?('Do You Want To View Another One?')
    if t
       display_view_contributions_menu_choice(user) 
    else
       display_user_menu(user)
    end
end

###########     EDIT CONTRIBUTIONS MENU CHOICES --------##################
# #########     EDIT CONTRIBUTIONS MENU CHOICES --------#################
###########     EDIT CONTRIBUTIONS MENU CHOICES --------$###############


def display_edit_contributions_menu_choice(user)
   prompt = TTY::Prompt.new
   u = User.find_by(user_name: user)
   choices = u.services.map do |p|
     { name: p.name, value: p.id }
    end
   s_id = prompt.select("These Are The Services You Have Contributed", choices)
   serv = Service.find_by(id: s_id)
   pharm = Pharmacy.find_by(id: serv.pharmacy_id)
   puts " Service Name : #{serv.name}".colorize(:light_blue).underline
   puts " Pharmacy Name : #{pharm.name}".colorize(:color => :light_blue, :background => :white)
   puts " Pharmacy Location : #{pharm.location}".colorize(:color => :light_blue, :background => :white)
   puts " Open from : #{pharm.open_from}".colorize(:color => :light_blue, :background => :white)
   puts " Open Till : #{pharm.open_till}".colorize(:color => :light_blue, :background => :white)
   puts " Open #{pharm.work_week} Days A Week".colorize(:color => :light_blue, :background => :white)
   result = prompt.collect do
      key(:s_name).ask('Give Me A New Name For The Service Or Type The Same'.colorize(:color => :light_blue), required: true)
      key(:p_name).ask('Give Me A New Name For The Pharmacy Or Type The Same'.colorize(:color => :light_blue), required: true)
      key(:loct).ask('Give Me A New Location For The Pharmacy Or Type The Same'.colorize(:color => :light_blue), required: true)
      key(:open).ask('Give Me A New Time For The Time It Opens Or Type The Same'.colorize(:color => :light_blue), required: true, in: (1...24))
      key(:close).ask('Give Me A New Time For The Time It Closes Or Type The Same'.colorize(:color => :light_blue), required: true, in: (1...24))            
      key(:week).ask('Give Me A New Amount Of Days For The Amount Of Days During The Week It Stays Open Or Type The Same'.colorize(:color => :light_blue), required: true, in: (1...8))    
    end
   #  serv = Service.find_by(:id s_id)
   #  pharm = Pharmacy.find_by(:id serv.pharmacy_id)
    se_name = result[:s_name].strip.downcase.capitalize
    ph_name = result[:p_name].strip.downcase.capitalize
    local = result[:loct].strip.downcase.capitalize
    o = result[:open].strip
    c = result[:close].strip
    w = result[:week].strip
    serv.update(name: se_name)
    pharm.update(name: ph_name)
    pharm.update(location: local)
    pharm.update(open_from: o)
    pharm.update(open_till: c)
    pharm.update(work_week: w)
    upd_exp(user)
    t = prompt.yes?('Do You Want To Edit Another One?')
    if t
       display_edit_contributions_menu_choice(user) 
    else
       display_user_menu(user)
    end
 

end


###########     DELETE CONTRIBUTIONS MENU CHOICES --------##################
# #########     DELETE CONTRIBUTIONS MENU CHOICES --------#################
###########     DELETE CONTRIBUTIONS MENU CHOICES --------$###############

def display_delete_contributions_menu_choice(user)
   prompt = TTY::Prompt.new
   u = User.find_by(user_name: user)
   choices = u.services.map do |p|
     { name: p.name, value: p.id }
    end
   s_id = prompt.select("These Are The Services You Have Contributed", choices)
   serv = Service.find_by(id: s_id)
   pharm = Pharmacy.find_by(id: serv.pharmacy_id)
   puts " Service Name : #{serv.name}".colorize(:light_blue).underline
   puts " Pharmacy Name : #{pharm.name}".colorize(:color => :light_blue, :background => :white)
   puts " Pharmacy Location : #{pharm.location}".colorize(:color => :light_blue, :background => :white)
   puts " Open from : #{pharm.open_from}".colorize(:color => :light_blue, :background => :white)
   puts " Open Till : #{pharm.open_till}".colorize(:color => :light_blue, :background => :white)
   puts " Open #{pharm.work_week} Days A Week".colorize(:color => :light_blue, :background => :white)
   t = prompt.yes?('Do You Want To Delete This One?')
   if t
      serv.destroy
      upd_exp(user)
      z = prompt.yes?('Do You Want To Delete Another One?')
      if z
         display_delete_contributions_menu_choice(user)
      else
         display_user_menu(user)
      end
   else
      upd_exp(user)
      display_delete_contributions_menu_choice(user)
   end
end


###########     FIND Pharmacy MENU CHOICES --------##################
# #########     FIND Pharmacy MENU CHOICES --------#################
###########     FIND Pharmacy MENU CHOICES --------$###############

def display_find_pharmacy_menu_choice(user)
   prompt = TTY::Prompt.new 
   choices = Pharmacy.all.map do |p|
     { name: p.location, value: p.id }
    end
   p_id = prompt.select("These Are The Locations We Have Pharmacies", choices)
   pharm = Pharmacy.find_by(id: p_id)
   serv = pharm.services.pluck(:name)
   puts " Pharmacy Name : #{pharm.name}".colorize(:light_blue)
   puts " Pharmacy Location : #{pharm.location}".colorize(:light_blue)
   puts " Open from : #{pharm.open_from}".colorize(:light_blue)
   puts " Open Till : #{pharm.open_till}".colorize(:light_blue)
   puts " Open #{pharm.work_week} Days A Week".colorize(:light_blue)
   puts " Services It Offers ".colorize(:light_blue).underline
   puts serv
   l = prompt.yes?('Do You Need Help Getting There? - This Will Take You On Another App, You Be Back Now!')
   if l
      array1 = ['https://www.google.com/maps/place/81+Prospect+St,+Brooklyn,+NY+11201/', 'https://www.google.com/maps/search/NY+Mets+Citi+Field+Stadium', 'https://www.google.com/maps/place/Yankee+Stadium', 'https://www.google.com/maps/place/MetLife+Stadium', 'https://www.google.com/maps/place/Barclays+Center', 'https://www.google.com/maps/place/Madison+Square+Garden']
      system("open #{array1.sample}")
      t = prompt.yes?('Do You Want To View Another One?')
      if t
         display_find_pharmacy_menu_choice(user)
      else
         if user == "GUEST" || user == "Guest"
            display_guest_menu
         else
            display_user_menu(user)
         end
      end
   else
      t = prompt.yes?('Do You Want To View Another One?')
      if t
         display_find_pharmacy_menu_choice(user)
      else
         if user == "GUEST" || user == "Guest"
            display_guest_menu
         else
            display_user_menu(user)
         end
      end
   end
end
   #          if user == "GUEST"
   #             display_guest_menu
   #          else
   #             display_user_menu(user)
   #          end
   #       else
   #            display_find_pharmacy_menu_choice(user)
   #       end
   #  end
#    t = prompt.yes?('Do You Want To View Another One?')
#       # => Do you like Ruby? (Y/n)
# #      if t == "y" || t == "Y"    
#       if t 
#          display_find_pharmacy_menu_choice(user)
#       else

#       end


###########     VIEW CONTRIBUTIONS MENU CHOICES --------##################
# #########     VIEW CONTRIBUTIONS MENU CHOICES --------#################
###########     VIEW CONTRIBUTIONS MENU CHOICES --------$###############
#    ------     MAIN MENU CHECKS --------
#    ------     MAIN MENU CHECKS --------##################
#    ------     MAIN MENU CHECKS --------#################
#    ------     MAIN MENU CHECKS --------$###############

def check_main_menu_choice(given_choice)
   if given_choice == "First Time User, Want To Register"
      choice = 1
   end
   if given_choice == "Already A Registered User, Want To Login"
      choice = 2
   end
   if given_choice == "Do Not Wish To Register, Just Browsing"
      choice = 3
   end
   if given_choice == "Looking For Info About The App"
      choice = 4
   end
   if given_choice == "Nothing Really, Spare Me Your @?%#&?|%!"
      choice = 5
   end
   choice
end

#    ------     USER MENU CHECKS --------
#    ------     USER MENU CHECKS --------##################
#    ------     USER MENU CHECKS --------#################
#    ------     USER MENU CHECKS --------$###############

def check_user_menu_choice(given_choice)
   if given_choice == "Find A Pharmacy Near Me"
      choice = 1
   end
   if given_choice == "Check My Contributions"
      choice = 2
   end
   if given_choice == "I Wish To Add A Pharmacy Or Contibution"
      choice = 3
   end
   if given_choice == "I Wish To Edit One Of My Contributions"
      choice = 4
   end
   if given_choice == "I Wish To Delete One Of My Contributions"
      choice = 5
   end
   if given_choice == "Go Back To Main Menu"
      choice = 6
   end
   choice
end

#    ------     GUEST MENU CHECKS --------
#    ------     GUEST MENU CHECKS --------##################
#    ------     GUEST MENU CHECKS --------#################
#    ------     GUEST MENU CHECKS --------$###############

def check_guest_menu_choice(given_choice)
   if given_choice == "Find A Pharmacy Near Me"
      choice = 1
   end
#   if given_choice == "Check My Contributions"
#      choice = 2
#   end
#   if given_choice == "I Wish To Add A Contibution"
#      choice = 3
#   end
#   if given_choice == "I Wish To Edit One Of My Contributions"
#      choice = 4
#   end
#   if given_choice == "I Wish To Delete One Of My Contributions"
#      choice = 5
#   end
   if given_choice == "Go Back To Main Menu"
      choice = 6
   end
   choice
end



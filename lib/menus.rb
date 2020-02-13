require_relative '../config/environment'


cli = HighLine.new
prompt = TTY::Prompt.new



#    ------     MAIN MENU CHOICES --------##################
#    ------     MAIN MENU CHOICES --------#################
#    ------     MAIN MENU CHOICES --------$###############

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
                    { name: 'Check My Contributions', disabled: '(You Are A Guest)' },
                    { name: 'I Wish To Add A Pharmacy Or Contibution', disabled: '(You Are A Guest)' },
                    { name: 'I Wish To Edit One Of My Contributions', disabled: '(You Are A Guest)' },
                    { name: 'I Wish To Delete One Of My Contributions' disabled: '(You Are A Guest)' },
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
    User.all.pluck(:user_name)include?(input)
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
      choice_msg = "The UserName You Chose Already Exists"
      puts choice_msg
      system "say #{choice_msg}"
      display_register_menu
   end
   fi_name = result[:f_name].strip.downcase.capitalize
   la_name = result[:l_name].strip.downcase.capitalize
   us_name = result[:u_name].strip.downcase
   passw = result[:pass].strip
   User.create(first_name: fi_name, last_name: la_name, user_name: us_name, password: passw, exp: 0)
   display_login_menu_choice
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
      display_user_menu_choice
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
      key(:week).ask('How many days During The Week Does It Stay Open?'.colorize(:color => :light_blue), required: true, in: (1...7))    
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
             {
                name: p.name
                value: p.id
             }
            end
   pharma_id = prompt.select("Choose The Pharmacy You Want To Add A Service For", choices)
   s_name = prompt.ask('What Do You Want To Name The Service?'.colorize(:color => :light_blue), required: true)
   u_id = User.find_by(:user_name).id
   Service.create(name: s_name, user_id: u_id, pharmacy_id: pharma_id)
   display_add_menu_choice(user)
end

###########     VIEW CONTRIBUTIONS MENU CHOICES --------##################
# #########     VIEW CONTRIBUTIONS MENU CHOICES --------#################
###########     VIEW CONTRIBUTIONS MENU CHOICES --------$###############

def display_view_contributions_menu_choice(user)
    prompt = TTY::Prompt.new
    u = User.find_by(:user_name user)
    choices = u.services.map do |p|
      {
         name: p.name
         value: p.id
      }
     end
    s_id = prompt.select("These Are The Services You Have Cntributed", choices)
    serv = Service.find_by(:id s_id)
    pharm = Pharmacy.find_by(:id serv.pharmacy_id)
    puts " Service Name : #{serv.name}"
    puts " Pharmacy Name : #{pharm.name}"
    puts " Pharmacy Location : #{pharm.location}"
    puts " Open from : #{pharm.open_from}"
    puts " Open Till : #{pharm.open_till}"
    puts " Open #{pharm.work_week} Days A Week"
    system("sleep 180")
    display_user_menu(user)

end

###########     EDIT CONTRIBUTIONS MENU CHOICES --------##################
# #########     EDIT CONTRIBUTIONS MENU CHOICES --------#################
###########     EDIT CONTRIBUTIONS MENU CHOICES --------$###############


def display_edit_contributions_menu_choice
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


###########     DELETE CONTRIBUTIONS MENU CHOICES --------##################
# #########     DELETE CONTRIBUTIONS MENU CHOICES --------#################
###########     DELETE CONTRIBUTIONS MENU CHOICES --------$###############

def display_delete_contributions_menu_choice
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


###########     FIND CONTRIBUTIONS MENU CHOICES --------##################
# #########     FIND CONTRIBUTIONS MENU CHOICES --------#################
###########     FIND CONTRIBUTIONS MENU CHOICES --------$###############

def display_fi_menu_choice
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
   if given_choice == "I Wish To Add A Contibution"
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


#    ------     REGISTER MENU CHECKS --------
# def check_register_menu_choice(given_choice)
#    if given_choice == "First Time User, Want To Register"
#       choice = 1
#    end
#    if given_choice == "Already A Registered User, Want To Login"
#       choice = 2
#    end
#    if given_choice == "Do Not Wish To Register, Just Browsing"
#       choice = 3
#    end
#    if given_choice == "Looking For Info About The App"
#       choice = 4
#    end
#    if given_choice == "Nothing Really, Spare Me Your @?%#&?|%!"
#       choice = 5
#    end
#    choice
# end
#    ------     LOGIN MENU CHECKS --------
# def check_login_menu_choice(given_choice)
#    if given_choice == "First Time User, Want To Register"
#       choice = 1
#    end
#    if given_choice == "Already A Registered User, Want To Login"
#       choice = 2
#    end
#    if given_choice == "Do Not Wish To Register, Just Browsing"
#       choice = 3
#    end
#    if given_choice == "Looking For Info About The App"
#       choice = 4
#    end
#    if given_choice == "Nothing Really, Spare Me Your @?%#&?|%!"
#       choice = 5
#    end
#    choice
# end


#    ------    PROCEDURES                 --------
def active_user
end
#    ------     LOGIN  PROCEDURE   --------
def login_procedure
    system("clear")
    main_title
    main_menu
    login_menu_header
   #  display_user_menu_choice
   #  user_choice = check_user_menu_choice()
   #  if user_choice == 1
   #  #   register_procedure
   #  end
   #  if user_choice == 2
   #   #  login_procedure
   #  end
   #  if user_choice == 3
   #  #   guest_procedure
   #  end
    
    
    display_registered_user_menu

    id_active_user = active_user(login_procedure)

    logged_user = true
end
#    ------     REGISTER  PROCEDURE   --------
def register_procedure
    system("clear")
    main_title
    main_menu
    register_menu_header
   #  display_to_register_user_menu_choice
   #  to_register_user_choice = check_to_register_user_menu_choice
   #  if to_register_user_choice == 1
   #  #   register_procedure
   #  end
   #  if to_register_user_choice == 2
   #  #   login_procedure
   #  end
   #  if to_register_user_choice == 3
   #  #   guest_procedure
   #  end


   #  display_main_menu
end
#    ------     GUEST  PROCEDURE   --------
def guest_procedure
    system("clear")
    main_title
    main_menu
    guest_menu_header
   #  c = display_guest_user_menu
   #  guest_user_choice = check_guest_user_menu_choice(c)
   #  if guest_user_choice == 1
   #  #   register_procedure
   #  end
   #  if guest_user_choice == 2
   #  #   login_procedure
   #  end
   #  if guest_user_choice == 3
   #   #  guest_procedure
   #  end
end



#   ---   color fix set for highline  ---
# def color_fix
#    cli = HighLine.new
#    ft = HighLine::ColorScheme.new do |cs|
#        cs[:headline]        = [ :bold, :yellow, :on_black ]
#        cs[:horizontal_line] = [ :bold, :yellow ]
#        cs[:headline_1]        = [ :bold, :black, :on_yellow ]
#        cs[:horizontal_line_1] = [ :yellow ]
#        cs[:warning]         = [ :bold, :red, :on_white ]
#        cs[:menu_choice]     = [ :bold, :light_blue, :on_red]
#        cs[:menu_line]       = [ :bold, :light_blue]
#    end
#    HighLine.color_scheme = ft
# end
#    warning msg   -------------
# def warning_msg
#    msg_warning = "  WARNING  --  WARNING  --  WARNING  "
#    color_fix
#    cli = HighLine.new
#    puts ""
#    puts "#{ '=' * msg_warning.size }".colorize(:color => :black, :background => :yellow)
#    cli.say("<%= color('  WARNING  --  WARNING  --  WARNING  ', :warning)%>")
#    puts ""
#    puts "#{ '=' * msg_warning.size }".colorize(:color => :black, :background => :yellow)
#    # puts "===#{ '=' * msg_warning.size }===".colorize(:color => :black, :background => :yellow)
#    # cli.say("<%= color('  WARNING  --  WARNING  --  WARNING  ', :warning)%>")
#    # puts "===#{ '=' * msg_warning.size }===".colorize(:color => :black, :background => :yellow)
#    puts ""
# end
# #    App title   -------------
# def main_title
#    msg = "APOTHICARY  --  AN AWESOME APP FOR ALL TO ENJOY"
#    color_fix
#    cli = HighLine.new
# #    puts ""
# #    cli.say("<%= color('HEADLINE', :headline) %>")
# #    puts ""
# #    cli.say("<%= color('-'*8, :horizontal_line) %>")
# #    puts ""
# #    puts ""
# #    cli.say("<%= color('APOTHICARY! An App by Panayotis Daginis', :headline_1) %>")
# #    puts ""
# #    cli.say("<%= color('='*32, :horizontal_line_1) %>")
#    puts ""
#    puts "== #{msg} ==".colorize(:color => :black, :background => :yellow)
# #   puts ""
#    puts "===#{ '=' * msg.size }===".colorize(:yellow)
#    puts ""
# end
# #    #main_menu   -------------
# def main_menu
#     menu = "--  APOTHICARY  --  MAIN MENU  --"
#     color_fix
#     cli = HighLine.new
# #    puts ""
#     cli.say("<%= color('--  APOTHICARY  --  MAIN MENU  --', :headline_1) %>")
# #    puts ""
# #     cli.say("<%= color('='*28, :horizontal_line) %>")
#     puts ""
#     cli.say("<%= color('-'*33, :horizontal_line) %>")
# #     puts ""
# #     cli.say("<%= color('='*28, :horizontal_line_1) %>")
# #     puts ""
# #    cli.say("<%= color('-'*33, :horizontal_line_1) %>")
#     puts ""
# #     puts "-- #{menu} --".colorize(:color => :light_blue, :background => :red)
# #     puts "---#{ '-' * menu.size }---".colorize(:light_blue)
# #    puts ""
# end
# #    --------      USER  menu     HEADER
# def user_menu_header(usrn)
#    ####   GET  USERNAME  #####
#    screen_name = usrn
#    color_fix
#    cli = HighLine.new
# #   puts ""
#    cli.say("<%= color('  --  USER MENU  --  ', :menu_choice) %>")
# #    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#    puts "  --  Welcome   #{screen_name} ".colorize(:color => :light_blue, :background => :white)
#    cli.say("<%= color('-'*21, :menu_line) %>")
#    puts ""
# #    puts "-- #{menu1} --".colorize(:color => :light_blue, :background => :red)
# #    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
# #    puts ""
# end
# #    --------      USER       HEADER
# def user_header(usrn)
#    ####   GET  USERNAME  #####
#    screen_name = usrn
#    color_fix
#    cli = HighLine.new
# #   puts ""
# #   cli.say("<%= color('  --  USER MENU  --  ', :menu_choice) %>")
# #    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#    puts "  --  Welcome   #{screen_name} ".colorize(:color => :light_blue, :background => :white)
#    cli.say("<%= color('-'*21, :menu_line) %>")
#    puts ""
# #    puts "-- #{menu1} --".colorize(:color => :light_blue, :background => :red)
# #    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
# #    puts ""
# end
# #    --------      GUEST  menu     HEADER
# def guest_menu_header
#    screen_name = "Guest"
#    color_fix
#    cli = HighLine.new
# #  puts ""
#    cli.say("<%= color('  --  USER MENU  --  ', :menu_choice) %>")
# #    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#    puts "  --  Welcome   #{screen_name} ".colorize(:color => :light_blue, :background => :white)
#    cli.say("<%= color('-'*21, :menu_line) %>")
#    puts ""
# #    puts "-- #{menu1} --".colorize(:color => :light_blue, :background => :red)
# #    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
# #    puts ""
# end
# #    --------     LOGIN  menu     HEADER
# def login_menu_header
#    screen_name = "Registered User"
#    color_fix
#    cli = HighLine.new
# #  puts ""
#    cli.say("<%= color('  --  LOGIN MENU  --  ', :menu_choice) %>")
# #    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#    puts "  --  Welcome #{screen_name} ".colorize(:color => :light_blue, :background => :white)
#    cli.say("<%= color('-'*30, :menu_line) %>")
#    puts ""
# #    puts "-- #{menu1} --".colorize(:color => :light_blue, :background => :red)
# #    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
# #    puts ""
# end
# #    --------      INFO  menu     HEADER
# def info_menu_header
#    color_fix
#    cli = HighLine.new
# #  puts ""
#    cli.say("<%= color('  --  INFO PAGE  --  ', :menu_choice) %>")
# #    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
# #   puts "  --  Welcome   #{screen_name} ".colorize(:color => :light_blue, :background => :white)
#    cli.say("<%= color('-'*21, :menu_line) %>")
#    puts ""
# #    puts "-- #{menu1} --".colorize(:color => :light_blue, :background => :red)
# #    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
# #    puts ""
# end
# #    --------      REGISTER  menu     HEADER
# def register_menu_header
#    screen_name = "New User"
#    color_fix
#    cli = HighLine.new
# #  puts ""
#    cli.say("<%= color('  --  REGISTER MENU  --  ', :menu_choice) %>")
# #    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#    puts "  --  Welcome   #{screen_name} ".colorize(:color => :light_blue, :background => :white)
#    cli.say("<%= color('-'*25, :menu_line) %>")
#    puts ""
# #    puts "-- #{menu1} --".colorize(:color => :light_blue, :background => :red)
# #    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
# #    puts ""
# end

#    ------    NOT USED --------
# def get_titles
#    msg = "APOTHICARY  --  AN AWESOME APP FOR ALL TO ENJOY"
#    menu = "APOTHICARY -- MAIN MENU"
#    menu1 = "Register New User"
#    menu2 = "Registered User Menu"
#    menu3 = "Guest User Menu"
#    menu4 = "Your Contributions"
#    menu5 = "Your Contributions"
#    menu6 = "Your Contributions"
#    menu7 = "Your Contributions"
#    menu8 = "Your Contributions"
#    menu9 = "Your Contributions"
#    menu10 = "Your Contributions"
#    msg_warning = "WARNING  --  WARNING  --  WARNING"
# end
#    ------     START APP MESSAGE   --------
# def flashing_app
#    msg = "THIS IS THE APOTHICARY APP BY PANAYOTIS DAGINIS"
#    puts ""
#    system "say #{msg}"
#    3.times do
#      print "\r#{ ' ' * msg.size }"
#      sleep 1
#      print "\r#{ msg.colorize(:color => :light_blue, :background => :red) }"
#      sleep 1
#    end
#    puts ""
# end

##     -----    DISPLAY  SCREEN MESSAGES  ------
##     -----    DISPLAY  SCREEN MESSAGES  ------
##     -----    DISPLAY  SCREEN MESSAGES  ------
##     -----    DISPLAY  INFO MESSAGE  ------
# def display_info_about_app
#     info_msg = "Look Dude or Dudette ! All You Need To Know Is That This Is A Great App And You Should Be Very Happy It Fell Into Your Lap. It Will Help You Navigate The World Of Pharmacies, Especially If You Are An Orc Or A Kobolt Or One Of Those UnderWorld Creatures! And If You Happen To Be A DarkElf, Know That Drizzt D'Urden Is A Good Friend Of This ... WhatEver This Is!"
#     puts "" 
#     puts "  --  #{ info_msg }  --  ".colorize(:color => :light_blue, :background => :white)
#     puts ""    
# end
# ##     -----    DISPLAY GOODBYE MESSAGE  ------
# def display_goodbye
#     goodbye_msg = "It Was Very Nice Getting To Know You, Good Luck With All Your Future Endeavors And If We Cross Paths Again, We Will Be Very Pleased To Hear About Your Exploits, Great Adventurer!"
#     puts ""   
#     puts "  --  #{ goodbye_msg }  --  ".colorize(:color => :blue, :background => :white)
#     puts ""    
# end
# ##     -----    DISPLAY USER GOODBYE MESSAGE  ------
# def display_user_goodbye
#     display_name = User[id_active_user].full_name
#     goodbye_msg = "It Was Very Nice Getting To Know You, Good Luck With All Your Future Endeavors And If We Cross Paths Again, We Will Be Very Pleased To Hear About Your Exploits, #{display_name}!"
#     puts ""   
#     puts "  --  #{ goodbye_msg }  --  ".colorize(:color => :blue, :background => :white)
#     puts ""    
# end
# ##     -----    TERMINATE APP  ------
# def terminate_app
#     exit
# end



###########     MAIN   MENU  HANDLER   ############
# def display_main_menu(usrn = nil)
#     system("clear")
#     main_title
#     main_menu
#     if usrn
#        user_header(usrn)
#     end
       
#     c = display_main_menu_choice
#     main_choice = check_main_menu_choice(c)
#     if main_choice == 1
#        #register_procedure
#     end
#     if main_choice == 2
#       # login_procedure
#     end
#     if main_choice == 3
#       # guest_procedure
#     end
#     if main_choice == 4
#        display_info_about_app
#        system("sleep 240")
#        display_main_menu
#     end
#     if main_choice == 5
#         if logged_user
#            display_user_goodbye
#         else
#            display_goodbye
#         end     
#         system("sleep 180")   
#         terminate_app
#     end
# end
# ###########     GUEST   MENU  HANDLER   ############
# def display_guest_menu
#     system("clear")
#     main_title
#     main_menu
#     guest_menu_header
#     c = display_guest_menu_choice
#     guest_choice = check_guest_menu_choice(c)
#     if guest_choice == 1

# #####      VIEW   PHARMACIES   #######


#     end
#     if guest_choice == 6
# ###########    BACK TO MAIN MENU     ############
#        system("sleep 2")   
#        display_main_menu("Guest")
#     end
# end
# ###########     USER   MENU  HANDLER   ############
# def display_user_menu
#     system("clear")
#     main_title
#     main_menu
#     user_menu_header
#     c = display_user_menu_choice
#     user_choice = check_user_menu_choice(c)
#     if user_choice == 1

#    #####      VIEW   PHARMACIES   ####### 


#     end
#     if user_choice == 2

#    #####      VIEW   CONTRIBUTIONS   #######
      
      
#     end
#     if user_choice == 3

#    #####     ADD CONTRIBUTION   #######
            
            
#     end
#     if user_choice == 4

#   #####      EDIT CONTRIBUTION   #######
                  
                  
#     end
#     if user_choice == 5

#    #####      DELETE  CONTRIBUTION   #######
                        
                        
#     end
#     if user_choice == 6
# ###########    BACK TO MAIN MENU     ############
#        system("sleep 2")   
#        display_main_menu("user_name")
#     end
#     return 
# ###########    return value for the user instance     ############

# end
# ###########     MENU  HANDLER   ############
# def display_main_menu
#     system("clear")
#     main_title
#     main_menu
#     c = display_main_menu_choice
#     main_choice = check_main_menu_choice(c)
#     if main_choice == 1
#        register_procedure
#     end
#     if main_choice == 2
#        login_procedure
#     end
#     if main_choice == 3
#        guest_procedure
#     end
#     if main_choice == 4
#        display_info_about_app
#        system("sleep 180")   
#        display_main_menu
#     end
#     if main_choice == 5
#         if logged_user
#            display_user_goodbye
#         else
#            display_goodbye
#         end     
#         system("sleep 180")   
#         terminate_app
#     end
# end
# ###########     MENU  HANDLER   ############
# def display_main_menu
#     system("clear")
#     main_title
#     main_menu
#     c = display_main_menu_choice
#     main_choice = check_main_menu_choice(c)
#     if main_choice == 1
#        register_procedure
#     end
#     if main_choice == 2
#        login_procedure
#     end
#     if main_choice == 3
#        guest_procedure
#     end
#     if main_choice == 4
#        display_info_about_app
#        system("sleep 180")   
#        display_main_menu
#     end
#     if main_choice == 5
#         if logged_user
#            display_user_goodbye
#         else
#            display_goodbye
#         end     
#         system("sleep 180")   
#         terminate_app
#     end
# end




















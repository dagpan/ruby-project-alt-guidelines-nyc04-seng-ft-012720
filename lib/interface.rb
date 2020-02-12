require_relative '../config/environment'


cli = HighLine.new
prompt = TTY::Prompt.new



#   ---   color fix set for highline  ---
def color_fix
   cli = HighLine.new
   ft = HighLine::ColorScheme.new do |cs|
       cs[:headline]        = [ :bold, :yellow, :on_black ]
       cs[:horizontal_line] = [ :bold, :yellow ]
       cs[:headline_1]        = [ :bold, :black, :on_yellow ]
       cs[:horizontal_line_1] = [ :yellow ]
       cs[:warning]         = [ :bold, :red, :on_white ]
       cs[:menu_choice]     = [ :bold, :light_blue, :on_red]
       cs[:menu_line]       = [ :bold, :light_blue]
   end
   HighLine.color_scheme = ft
end
#    warning msg   -------------
def warning_msg
   msg_warning = "  WARNING  --  WARNING  --  WARNING  "
   color_fix
   cli = HighLine.new
   puts ""
   puts "#{ '=' * msg_warning.size }".colorize(:color => :black, :background => :yellow)
   cli.say("<%= color('  WARNING  --  WARNING  --  WARNING  ', :warning)%>")
   puts ""
   puts "#{ '=' * msg_warning.size }".colorize(:color => :black, :background => :yellow)
   # puts "===#{ '=' * msg_warning.size }===".colorize(:color => :black, :background => :yellow)
   # cli.say("<%= color('  WARNING  --  WARNING  --  WARNING  ', :warning)%>")
   # puts "===#{ '=' * msg_warning.size }===".colorize(:color => :black, :background => :yellow)
   puts ""
end
#    App title   -------------
def main_title
   msg = "APOTHICARY  --  AN AWESOME APP FOR ALL TO ENJOY"
   color_fix
   cli = HighLine.new
#    puts ""
#    cli.say("<%= color('HEADLINE', :headline) %>")
#    puts ""
#    cli.say("<%= color('-'*8, :horizontal_line) %>")
#    puts ""
#    puts ""
#    cli.say("<%= color('APOTHICARY! An App by Panayotis Daginis', :headline_1) %>")
#    puts ""
#    cli.say("<%= color('='*32, :horizontal_line_1) %>")
   puts ""
   puts "== #{msg} ==".colorize(:color => :black, :background => :yellow)
#   puts ""
   puts "===#{ '=' * msg.size }===".colorize(:yellow)
   puts ""
end
#    #main_menu   -------------
def main_menu
    menu = "--  APOTHICARY  --  MAIN MENU  --"
    color_fix
    cli = HighLine.new
#    puts ""
    cli.say("<%= color('--  APOTHICARY  --  MAIN MENU  --', :headline_1) %>")
#    puts ""
#     cli.say("<%= color('='*28, :horizontal_line) %>")
#     puts ""
    cli.say("<%= color('-'*33, :horizontal_line) %>")
#     puts ""
#     cli.say("<%= color('='*28, :horizontal_line_1) %>")
#     puts ""
#    cli.say("<%= color('-'*33, :horizontal_line_1) %>")
    puts ""
#     puts "-- #{menu} --".colorize(:color => :light_blue, :background => :red)
#     puts "---#{ '-' * menu.size }---".colorize(:light_blue)
#    puts ""
end

#    --------      SUB  menu     
def sub_menu
   get_titles
   menu1 = "Your Contributions"
   color_fix
   cli = HighLine.new
   puts ""
   cli.say("<%= color('  --  Your Contributions  --  ', :menu_choice) %>")
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
   puts ""
   cli.say("<%= color('-'*30, :menu_line) %>")
   puts ""
#    puts "-- #{menu1} --".colorize(:color => :light_blue, :background => :red)
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#    puts ""
end

#    --------      menu     




#    ------     MAIN MENU CHOICES --------
def display_main_menu_choice
   #The disabled choice will be displayed with a cross ✘ character next to it and followed by an explanation:
   menu_choices = [
                    'First Time User, Want To Register',
                    'Already A Registered User, Want To Login',
                 #  { name: 'Goro', disabled: '(injury)' },
                    'Do Not Wish To Register, Just Browsing',
                    'Looking For Info About The App',
                    'Nothing Really, Spare Me Your @?%#&?|%!'
                   ]
   choice_msg = 'What Will It Be, We Offer A Great Many Choices!'
   #   system "say #{choice_msg}"
   main_menu_choice = prompt.select('What Will It Be, We Offer A Great Many Choices!'.colorize(:color => :light_blue), menu_choices)
end
#    ------     USER MENU CHOICES --------
def display_user_menu_choice
   menu_choices = [
                    'Find A Pharmacy Near Me',
                    'Check My Contributions',
                 #  { name: 'Goro', disabled: '(injury)' },
                    'I Wish To Add A Contibution',
                    'I Wish To Edit One Of My Contributions',
                    'I Wish To Delete One Of My Contributions',
                    'Go Back To Main Menu'
                   ]
   choice_msg = 'What Will It Be, We Offer A Great Many Choices!'
   #   system "say #{choice_msg}"
   main_menu_choice = prompt.select('What Will It Be, We Offer A Great Many Choices!'.colorize(:color => :light_blue), menu_choices)
end
#    ------     GUEST MENU CHOICES --------
def display_guest_menu_choice
   menu_choices = [
                    'Find A Pharmacy Near Me',
                    { name: 'Check My Contributions', disabled: '(You Are A Guest)' },
                    { name: 'I Wish To Add A Contibution', disabled: '(You Are A Guest)' },
                    { name: 'I Wish To Edit One Of My Contributions', disabled: '(You Are A Guest)' },
                    { name: 'I Wish To Delete One Of My Contributions' disabled: '(You Are A Guest)' },
                    'Go Back To Main Menu'
                   ]
   choice_msg = 'What Will It Be, We Offer A Great Many Choices!'
   #   system "say #{choice_msg}"
   main_menu_choice = prompt.select('What Will It Be, We Offer A Great Many Choices!'.colorize(:color => :light_blue), menu_choices)
end
#    ------     REGISTER MENU CHOICES --------
def display_register_menu_choice
   #The disabled choice will be displayed with a cross ✘ character next to it and followed by an explanation:
   menu_choices = [
                    'First Time User, Want To Register',
                    'Already A Registered User, Want To Login',
                 #  { name: 'Goro', disabled: '(injury)' },
                    'Do Not Wish To Register, Just Browsing',
                    'Looking For Info About The App',
                    'Nothing Really, Spare Me Your @?%#&?|%!'
                   ]
   menu_choice_msg = 'What Will It Be, We Offer A Great Many Choices!'
   #system "say #{first_choice_msg}"
   main_menu_choice = prompt.select('What Will It Be, We Offer A Great Many Choices!'.colorize(:color => :light_blue), menu_choices)
end
#    ------     LOGIN MENU CHOICES --------
def display_login_menu_choice
   #The disabled choice will be displayed with a cross ✘ character next to it and followed by an explanation:
   menu_choices = [
                    'First Time User, Want To Register',
                    'Already A Registered User, Want To Login',
                 #  { name: 'Goro', disabled: '(injury)' },
                    'Do Not Wish To Register, Just Browsing',
                    'Looking For Info About The App',
                    'Nothing Really, Spare Me Your @?%#&?|%!'
                   ]
   menu_choice_msg = 'What Will It Be, We Offer A Great Many Choices!'
   #system "say #{first_choice_msg}"
   main_menu_choice = prompt.select('What Will It Be, We Offer A Great Many Choices!'.colorize(:color => :light_blue), menu_choices)
end
#    ------     MAIN MENU CHOICES --------



#    ------     MAIN MENU CHECKS --------
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
def check_to_register_user_menu_choice(given_choice)
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
#    ------    NOT USED --------
def get_titles
   msg = "APOTHICARY  --  AN AWESOME APP FOR ALL TO ENJOY"
   menu = "APOTHICARY -- MAIN MENU"
   menu1 = "Register New User"
   menu2 = "Registered User Menu"
   menu3 = "Guest User Menu"
   menu4 = "Your Contributions"
   menu5 = "Your Contributions"
   menu6 = "Your Contributions"
   menu7 = "Your Contributions"
   menu8 = "Your Contributions"
   menu9 = "Your Contributions"
   menu10 = "Your Contributions"
   msg_warning = "WARNING  --  WARNING  --  WARNING"
end
#    ------     START APP MESSAGE   --------
def flashing_app
   msg = "THIS IS THE APOTHICARY APP BY PANAYOTIS DAGINIS"
   puts ""
   system "say #{msg}"
   3.times do
     print "\r#{ ' ' * msg.size }"
     sleep 1
     print "\r#{ msg.colorize(:color => :light_blue, :background => :red) }"
     sleep 1
   end
   puts ""
end
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
##     -----    DISPLAY  SCREEN MESSAGES  ------
##     -----    DISPLAY  SCREEN MESSAGES  ------
##     -----    DISPLAY  SCREEN MESSAGES  ------
##     -----    DISPLAY  INFO MESSAGE  ------
def display_info_about_app
    info_msg = "Look Dude or Dudette ! All You Need To Know Is That This Is A Great App And You Should Be Very Happy It Fell Into Your Lap. It Will Help You Navigate The World Of Pharmacies, Especially If You Are An Orc Or A Kobolt Or One Of Those UnderWorld Creatures! And If You Happen To Be A DarkElf, Know That Drizzt D'Urden Is A Good Friend Of This ... WhatEver This Is!"
    puts "" 
    puts "  --  #{ info_msg }  --  ".colorize(:color => :light_blue, :background => :white)
    puts ""    
end
##     -----    DISPLAY GOODBYE MESSAGE  ------
def display_goodbye
    goodbye_msg = "It Was Very Nice Getting To Know You, Good Luck With All Your Future Endeavors And If We Cross Paths Again, We Will Be Very Pleased To Hear About Your Exploits, Great Adventurer!"
    puts ""   
    puts "  --  #{ goodbye_msg }  --  ".colorize(:color => :blue, :background => :white)
    puts ""    
end
##     -----    DISPLAY USER GOODBYE MESSAGE  ------
def display_user_goodbye
    display_name = User[id_active_user].full_name
    goodbye_msg = "It Was Very Nice Getting To Know You, Good Luck With All Your Future Endeavors And If We Cross Paths Again, We Will Be Very Pleased To Hear About Your Exploits, #{display_name}!"
    puts ""   
    puts "  --  #{ goodbye_msg }  --  ".colorize(:color => :blue, :background => :white)
    puts ""    
end
##     -----    TERMINATE APP  ------
def terminate_app
    exit
end




def display_main_menu
    system("clear")
    main_title
    main_menu
    c = display_main_menu_choice
    main_choice = check_main_menu_choice(c)
    if main_choice == 1
       register_procedure
    end
    if main_choice == 2
       login_procedure
    end
    if main_choice == 3
       guest_procedure
    end
    if main_choice == 4
       display_info_about_app
       system("sleep 240")
       display_main_menu
    end
    if main_choice == 5
        if logged_user
           display_user_goodbye
        else
           display_goodbye
        end     
        system("sleep 180")   
        terminate_app
    end
end
def display_guest_menu
    system("clear")
    main_title
    main_menu
    guest_menu_header
    c = display_guest_menu_choice
    guest_choice = check_guest_menu_choice(c)
    if guest_choice == 1

#####      VIEW   PHARMACIES   #######


    end
    if guest_choice == 6
###########    BACK TO MAIN MENU     ############
       system("sleep 2")   
       display_main_menu
    end
end
def display_user_menu
    system("clear")
    main_title
    main_menu
    user_menu_header
    c = display_user_menu_choice
    user_choice = check_user_menu_choice(c)
    if user_choice == 1

#####      VIEW   PHARMACIES   #######


    end
    if user_choice == 1

      #####      VIEW   PHARMACIES   #######
      
      
    end
    if user_choice == 2

            #####      VIEW   PHARMACIES   #######
            
            
    end
    if user_choice == 3

                  #####      VIEW   PHARMACIES   #######
                  
                  
                      end
                      if user_choice == 4

                        #####      VIEW   PHARMACIES   #######
                        
                        
                            end
    if user_choice == 6
###########    BACK TO MAIN MENU     ############
       system("sleep 2")   
       display_main_menu
    end


    c = display_main_menu_choice
    main_choice = check_main_menu_choice(c)
    if main_choice == 1
       register_procedure
    end
    if main_choice == 2
       login_procedure
    end
    if main_choice == 3
       guest_procedure
    end
    if main_choice == 4
       display_info_about_app
       system("sleep 180")   
       display_main_menu
    end
    if main_choice == 5
        if logged_user
           display_user_goodbye
        else
           display_goodbye
        end     
        system("sleep 180")   
        terminate_app
    end
end
def display_main_menu
    system("clear")
    main_title
    main_menu
    c = display_main_menu_choice
    main_choice = check_main_menu_choice(c)
    if main_choice == 1
       register_procedure
    end
    if main_choice == 2
       login_procedure
    end
    if main_choice == 3
       guest_procedure
    end
    if main_choice == 4
       display_info_about_app
       system("sleep 180")   
       display_main_menu
    end
    if main_choice == 5
        if logged_user
           display_user_goodbye
        else
           display_goodbye
        end     
        system("sleep 180")   
        terminate_app
    end
end
def display_main_menu
    system("clear")
    main_title
    main_menu
    c = display_main_menu_choice
    main_choice = check_main_menu_choice(c)
    if main_choice == 1
       register_procedure
    end
    if main_choice == 2
       login_procedure
    end
    if main_choice == 3
       guest_procedure
    end
    if main_choice == 4
       display_info_about_app
       system("sleep 180")   
       display_main_menu
    end
    if main_choice == 5
        if logged_user
           display_user_goodbye
        else
           display_goodbye
        end     
        system("sleep 180")   
        terminate_app
    end
end




















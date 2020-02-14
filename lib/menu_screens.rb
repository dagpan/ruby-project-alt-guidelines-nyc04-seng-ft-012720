require_relative '../config/environment'


cli = HighLine.new
prompt = TTY::Prompt.new



def flashing_app
   msg = "THIS IS THE APOTHECARY APP BY PANAYOTIS DAGINIS"
   puts ""
   system "say #{msg}"
   2.times do
     print "\r#{ ' ' * msg.size }"
     sleep 1
     print "\r#{ msg.colorize(:color => :light_blue, :background => :red) }"
     sleep 1
   end
   puts ""
end

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
def get_exp(user)
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
   u.exp
   
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
   msg = "APOTHECARY  --  AN AWESOME APP FOR ALL TO ENJOY"
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
    menu = "--  APOTHECARY  --  MAIN MENU  --"
    color_fix
    cli = HighLine.new
#    puts ""
    cli.say("<%= color('--  APOTHECARY  --  MAIN MENU  --', :headline_1) %>")
#    puts ""
#     cli.say("<%= color('='*28, :horizontal_line) %>")
    puts ""
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
#    --------      USER  menu     HEADER
def user_menu_header(usrn)
   ####   GET  USERNAME  #####
   ####   GET  USER EXP  #####
   expe = get_exp(usrn)
   screen_name = usrn
   color_fix
   cli = HighLine.new
#   puts ""
   cli.say("<%= color('  --  USER MENU  --  ', :menu_choice) %>")
   puts ""
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
   puts "  --  Welcome   #{screen_name} ".colorize(:color => :light_blue, :background => :white)
   puts "  --  Your Experience is : #{expe}".colorize(:color => :light_blue, :background => :white)
   cli.say("<%= color('-'*40, :menu_line) %>")
   puts ""
#    puts "-- #{menu1} --".colorize(:color => :light_blue, :background => :red)
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#    puts ""
end
#    --------      USER       HEADER

def user_header(usrn)
   ####   GET  USERNAME  #####
   ####   GET  USER EXP  #####
   expe = get_exp(user)
   screen_name = usrn
   color_fix
   cli = HighLine.new
#   puts ""
#   cli.say("<%= color('  --  USER MENU  --  ', :menu_choice) %>")
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
   puts "  --  Welcome   #{screen_name}".colorize(:color => :light_blue, :background => :white)
   puts "  --  Your Experience is : #{expe}".colorize(:color => :light_blue, :background => :white)
   cli.say("<%= color('-'*40, :menu_line) %>")
   puts ""
#    puts "-- #{menu1} --".colorize(:color => :light_blue, :background => :red)
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#    puts ""
end
#    --------      GUEST  menu     HEADER
def guest_menu_header
   screen_name = "GUEST"
   color_fix
   cli = HighLine.new
#  puts ""
#   cli.say("<%= color('  --  USER MENU  --  ', :menu_choice) %>")
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
   puts "  Welcome   #{screen_name} ".colorize(:color => :light_blue, :background => :white)
   cli.say("<%= color('-'*18, :menu_line) %>")
   puts ""
#    puts "-- #{menu1} --".colorize(:color => :light_blue, :background => :red)
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#    puts ""
end
#    --------     LOGIN  menu     HEADER
def login_menu_header
   screen_name = "Registered User"
   color_fix
   cli = HighLine.new
#  puts ""
   cli.say("<%= color('  --  LOGIN MENU  --  ', :menu_choice) %>")
   puts ""
   cli.say("<%= color('-'*40, :menu_line) %>")
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
   puts "  --  Welcome #{screen_name} ".colorize(:color => :light_blue, :background => :white)
   puts ""
#    puts "-- #{menu1} --".colorize(:color => :light_blue, :background => :red)
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#    puts ""
end
#    --------      INFO  menu     HEADER
def info_menu_header
   color_fix
   cli = HighLine.new
#  puts ""
   cli.say("<%= color('  --  INFO PAGE  --  ', :menu_choice) %>")
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#   puts "  --  Welcome   #{screen_name} ".colorize(:color => :light_blue, :background => :white)
   puts ""   
   cli.say("<%= color('-'*21, :menu_line) %>")
   puts ""
#    puts "-- #{menu1} --".colorize(:color => :light_blue, :background => :red)
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#    puts ""
end
#    --------      INFO  menu     HEADER
def goodbye_header
   color_fix
   cli = HighLine.new
#  puts ""
   cli.say("<%= color('  --  GOODBYE  --  ', :menu_choice) %>")
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
puts ""
#   puts "  --  Welcome   #{screen_name} ".colorize(:color => :light_blue, :background => :white)
   cli.say("<%= color('-'*19, :menu_line) %>")
   puts ""
#    puts "-- #{menu1} --".colorize(:color => :light_blue, :background => :red)
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#    puts ""
end
#    --------      REGISTER  menu     HEADER
def register_menu_header
   screen_name = "New User"
   color_fix
   cli = HighLine.new
#  puts ""
   cli.say("<%= color('  --  REGISTER MENU  --  ', :menu_choice) %>")
   puts ""
   cli.say("<%= color('-'*25, :menu_line) %>")
   puts ""
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
   puts "  --  Welcome   #{screen_name} ".colorize(:color => :light_blue, :background => :white)
   puts ""
#    puts "-- #{menu1} --".colorize(:color => :light_blue, :background => :red)
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#    puts ""
end
#    --------      ADD  menu     HEADER
def add_menu_header
   color_fix
   cli = HighLine.new
#  puts ""
   cli.say("<%= color('  --  ADD MENU  --  ', :menu_choice) %>")
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#   puts "  --  Welcome   #{screen_name} ".colorize(:color => :light_blue, :background => :white)
   puts ""
   cli.say("<%= color('-'*20, :menu_line) %>")
   puts ""
#    puts "-- #{menu1} --".colorize(:color => :light_blue, :background => :red)
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#    puts ""
end
#    --------      ADD PHARMACY  menu     HEADER
def add_pharmacy_header
   color_fix
   cli = HighLine.new
#  puts ""
   cli.say("<%= color('  --  ADD PHARMACY  --  ', :menu_choice) %>")
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#   puts "  --  Welcome   #{screen_name} ".colorize(:color => :light_blue, :background => :white)
   puts ""
   cli.say("<%= color('-'*24, :menu_line) %>")
   puts ""
#    puts "-- #{menu1} --".colorize(:color => :light_blue, :background => :red)
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#    puts ""
end
#    --------      ADD CONTRIBUTION  menu     HEADER
def add_contribution_header
   color_fix
   cli = HighLine.new
#  puts ""
   cli.say("<%= color('  --  ADD CONTRIBUTION  --  ', :menu_choice) %>")
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#   puts "  --  Welcome   #{screen_name} ".colorize(:color => :light_blue, :background => :white)
   puts ""
   cli.say("<%= color('-'*28, :menu_line) %>")
   puts ""
#    puts "-- #{menu1} --".colorize(:color => :light_blue, :background => :red)
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#    puts ""
end
#    --------      FIND PHARMACY  menu     HEADER
def find_pharmacy_header
   color_fix
   cli = HighLine.new
#  puts ""
   cli.say("<%= color('  --  FIND PHARMACY  --  ', :menu_choice) %>")
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#   puts "  --  Welcome   #{screen_name} ".colorize(:color => :light_blue, :background => :white)
   puts ""
   cli.say("<%= color('-'*25, :menu_line) %>")
   puts ""
#    puts "-- #{menu1} --".colorize(:color => :light_blue, :background => :red)
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#    puts ""
end
#    --------      View COntributions  menu     HEADER
def view_contributions_header
   color_fix
   cli = HighLine.new
#  puts ""
   cli.say("<%= color('  --  VIEW CONTRIBUTION  --  ', :menu_choice) %>")
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#   puts "  --  Welcome   #{screen_name} ".colorize(:color => :light_blue, :background => :white)
   puts ""
   cli.say("<%= color('-'*29, :menu_line) %>")
   puts ""
#    puts "-- #{menu1} --".colorize(:color => :light_blue, :background => :red)
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#    puts ""
end
#    --------      EDIT COntributions  menu     HEADER
def edit_contributions_header
   color_fix
   cli = HighLine.new
#  puts ""
   cli.say("<%= color('  --  EDIT CONTRIBUTION  --  ', :menu_choice) %>")
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#   puts "  --  Welcome   #{screen_name} ".colorize(:color => :light_blue, :background => :white)
   puts ""
   cli.say("<%= color('-'*29, :menu_line) %>")
   puts ""
#    puts "-- #{menu1} --".colorize(:color => :light_blue, :background => :red)
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#    puts ""
end
#    --------   delete  COntributions  menu     HEADER
def delete_contributions_header
   color_fix
   cli = HighLine.new
#  puts ""
   cli.say("<%= color('  --  DELETE CONTRIBUTION  --  ', :menu_choice) %>")
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#   puts "  --  Welcome   #{screen_name} ".colorize(:color => :light_blue, :background => :white)
   puts ""
   cli.say("<%= color('-'*31, :menu_line) %>")
   puts ""
#    puts "-- #{menu1} --".colorize(:color => :light_blue, :background => :red)
#    puts "------#{ '-' * menu1.size }------".colorize(:light_blue)
#    puts ""
end
##     -----    DISPLAY  SCREEN MESSAGES  ------
##     -----    DISPLAY  SCREEN MESSAGES  ------
##     -----    DISPLAY  SCREEN MESSAGES  ------
##     -----    DISPLAY  INFO MESSAGE  ------
def display_info_about_app
   system("clear")
   main_title
   main_menu
   info_menu_header
   info_msg = "Look Dude or Dudette ! All You Need To Know Is That This Is A Great App And You Should Be Very Happy It Fell Into Your Lap. It Will Help You Navigate The World Of Pharmacies, Especially If You Are An Orc Or A Kobolt Or One Of Those UnderWorld Creatures! And If You Happen To Be A DarkElf, Know That Drizzt D'Urden Is A Good Friend Of This ... WhatEver This Is!"
   puts "" 
   puts "  --  #{ info_msg }  --  ".colorize(:color => :light_blue, :background => :white)
   puts ""    
#   system "say #{info_msg}"
end
##     -----    DISPLAY GOODBYE MESSAGE  ------
def display_goodbye
   system("clear")
   main_title
   main_menu
   goodbye_header
   goodbye_msg = "It Was Very Nice Getting To Know You, Good Luck With All Your Future Endeavors And If We Cross Paths Again, We Will Be Very Pleased To Hear About Your Exploits, Great Adventurer!"
   puts ""   
   puts "  --  #{ goodbye_msg }  --  ".colorize(:color => :blue, :background => :white)
   puts ""    
   system "say #{goodbye_msg}"
end
##     -----    DISPLAY USER GOODBYE MESSAGE  ------
def display_user_goodbye
#   display_name = User[id_active_user].full_name
    system("clear")
    main_title
    main_menu
    user_menu_header(user)
    delete_contributions_header

   goodbye_msg = "It Was Very Nice Getting To Know You, Good Luck With All Your Future Endeavors And If We Cross Paths Again, We Will Be Very Pleased To Hear About Your Exploits, #{display_name}!"
   puts ""   
   puts "  --  #{ goodbye_msg }  --  ".colorize(:color => :blue, :background => :white)
   puts ""  
   system "say #{goodbye_msg}"  
end
##     -----    TERMINATE APP  ------
def terminate_app
   exit
end





require_relative '../config/environment'


cli = HighLine.new
prompt = TTY::Prompt.new






##     -----    TERMINATE APP  ------
def terminate_app
   exit
end

###########     MAIN   MENU  HANDLER   ############
###########     MAIN   MENU  HANDLER   ############
###########     MAIN   MENU  HANDLER   ############
###########     MAIN   MENU  HANDLER   ############
###########     MAIN   MENU  HANDLER   ############
###########     MAIN   MENU  HANDLER   ############

def display_main_menu(usrn)
   system("clear")
   main_title
   main_menu
   if usrn != "GUEST"
      user_header(usrn)
   end
   c = display_main_menu_choice
   main_choice = check_main_menu_choice(c)
   if main_choice == 1
      display_register_menu
#######    CALL  LOGIN   MENU
   end
   if main_choice == 2
      display_login_menu
#######    CALL  REGISTER   MENU
   end
   if main_choice == 3
      display_guest_menu
#######    CALL  GUEST   MENU
   end
   if main_choice == 4
      display_info_about_app
#      system("sleep 5")
      display_main_menu("GUEST")
   end
   if main_choice == 5
      #  if logged_user
      #     display_user_goodbye
      #  else
      display_goodbye(usrn)
      # end     
      system("sleep 5")   
      system("clear")   
      terminate_app
   end
end

###########     GUEST   MENU  HANDLER   ############
###########     GUEST   MENU  HANDLER   ############
###########     GUEST   MENU  HANDLER   ############
###########     GUEST   MENU  HANDLER   ############
###########     GUEST   MENU  HANDLER   ############

def display_guest_menu
   system("clear")
   main_title
   main_menu
   guest_menu_header
   c = display_guest_menu_choice
   guest_choice = check_guest_menu_choice(c)
   if guest_choice == 1
      display_find_pharmacy_menu("GUEST") 
#####      VIEW   PHARMACIES   AS  AS  GUEST    #######
   end
   if guest_choice == 6
###########    BACK TO MAIN MENU     ############
      display_main_menu("GUEST")
   end
end

###########     USER   MENU  HANDLER   ############
###########     USER   MENU  HANDLER   ############
###########     USER   MENU  HANDLER   ############
###########     USER   MENU  HANDLER   ############

def display_user_menu(user)
   system("clear")
   main_title
   main_menu
   user_menu_header(user)
   c = display_user_menu_choice
   user_choice = check_user_menu_choice(c)
   u = User.find_by(user_name: user)
   if user_choice == 1
      display_find_pharmacy_menu(user)
  #####      VIEW   PHARMACIES   MENU   ####### 
   end
   if user_choice == 2
      if u.services.length > 0
         display_view_contributions_menu(user)
      else
         puts "You Have 0 Contributions"
         system("sleep 2")
         display_user_menu(user)
      end
  #####      VIEW   CONTRIBUTIONS   MENU   #######
   end
   if user_choice == 3
      display_add_menu(user)
  #####     ADD CONTRIBUTION   OR   PHARMACY   MENU   #######     
   end
   if user_choice == 4
      display_edit_contributions_menu(user)
 #####      EDIT CONTRIBUTION   MENU   ######              
   end
   if user_choice == 5
      display_delete_contributions_menu(user)
  #####      DELETE  CONTRIBUTION   MENU   #######               
   end
   if user_choice == 6
###########    BACK TO MAIN MENU     ############
#      system("sleep 2")   
      display_main_menu(user)
   end
#  return 
###########    return value for the user instance     ############
end


###########     LOGIN   MENU  HANDLER   ############
###########     LOGIN   MENU  HANDLER   ############
###########     LOGIN  MENU  HANDLER   ############
###########     LOGIN   MENU  HANDLER   ############
###########     LOGIN  MENU  HANDLER   ############
###########     LOGIN   MENU  HANDLER   ############

def display_login_menu
   system("clear")
   main_title
   main_menu
   login_menu_header
   display_login_menu_choice
   # display_user_menu(user)
 ####      DIRECT  FLOW  TO  USER MENU
 ####      WITH  THE  USER  NAME  
   # c = display_login_menu_choice
   # login_choice = check_login_menu_choice(c)
end

###########     REGISTER   MENU  HANDLER   ############
###########     REGISTER   MENU  HANDLER   ############
###########     REGISTER  MENU  HANDLER   ############
###########     REGISTER   MENU  HANDLER   ############
###########     REGISTER  MENU  HANDLER   ############
###########     REGISTER  MENU  HANDLER   ############

def display_register_menu
   system("clear")
   main_title
   main_menu
   register_menu_header
   display_register_menu_choice
end

###########     VIEW CONTRIBUTIONS   MENU  HANDLER   ############
###########     VIEW CONTRIBUTIONS   MENU  HANDLER   ############
###########     VIEW CONTRIBUTIONS  MENU  HANDLER   ############

def display_view_contributions_menu(user)
   system("clear")
   main_title
   main_menu
   user_menu_header(user)
   view_contributions_header
   display_view_contributions_menu_choice(user)
end

###########     EDIT  CONTRIBUTIONS   MENU  HANDLER   ############
###########     EDIT  CONTRIBUTIONS  MENU  HANDLER   ############
###########     EDIT  CONTRIBUTIONS  MENU  HANDLER   ############

def display_edit_contributions_menu(user)
   system("clear")
   main_title
   main_menu
   user_menu_header(user)
   edit_contributions_header
   display_edit_contributions_menu_choice(user)
end


###########     DELETE  CONTRIBUTIONS   MENU  HANDLER   ############
###########     DELETE  CONTRIBUTIONS   MENU  HANDLER   ############
###########     DELETE  CONTRIBUTIONS  MENU  HANDLER   ############

def display_delete_contributions_menu(user)
   system("clear")
   main_title
   main_menu
   user_menu_header(user)
   delete_contributions_header
   display_delete_contributions_menu_choice(user)
end

###########     FIND  PHARMACY   MENU  HANDLER   ############
###########     FIND  PHARMACY   MENU  HANDLER   ############
###########     FIND  PHARMACY  MENU  HANDLER   ############

def display_find_pharmacy_menu(user)
   system("clear")
   main_title
   main_menu
   if user != "GUEST"
      user_menu_header(user)
      find_pharmacy_header
      display_find_pharmacy_menu_choice(user)
   else
      guest_menu_header
      find_pharmacy_header
      display_find_pharmacy_menu_choice("GUEST")
   end
end



###########     ADD     MENU  HANDLER   ############
###########     ADD     MENU  HANDLER   ############
###########     ADD  MENU  HANDLER   ############

def display_add_menu(user)
   system("clear")
   main_title
   main_menu
   user_menu_header(user)
   add_menu_header
   display_add_menu_choice(user)
end

###########     ADD  CONTRIBUTIONS   MENU  HANDLER   ############
###########     ADD  CONTRIBUTIONS   MENU  HANDLER   ############
###########     ADD  CONTRIBUTIONS  MENU  HANDLER   ############

def display_add_contributions_menu(user)
   system("clear")
   main_title
   main_menu
   user_menu_header(user)
   add_contributions_header
   display_add_contributions_menu_choice(user)
end

###########     ADD  PHARMACY   MENU  HANDLER   ############
###########     ADD  PHARMACY   MENU  HANDLER   ############
###########     ADD  PHARMACY  MENU  HANDLER   ############

def display_add_pharmacy_menu(user)
   system("clear")
   main_title
   main_menu
   user_menu_header(user)
   add_pharmacy_header
   display_add_pharmacy_menu_choice(user)
end
###########     DELETE  CONTRIBUTIONS   MENU  HANDLER   ############
###########     DELETE  CONTRIBUTIONS   MENU  HANDLER   ############
###########     DELETE  CONTRIBUTIONS  MENU  HANDLER   ############
###########     DELETE  CONTRIBUTIONS   MENU  HANDLER   ############
###########     DELETE  CONTRIBUTIONS   MENU  HANDLER   ############
###########     DELETE  CONTRIBUTIONS  MENU  HANDLER   ############

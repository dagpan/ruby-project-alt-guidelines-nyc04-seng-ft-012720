
class CreateUsers < ActiveRecord::Migration[5.2]
    def change
        create_table :users do |u|
          u.string :first_name
          u.string :last_name
          u.string :user_name
          u.integer :password
          u.integer :exp
        end
    end





end

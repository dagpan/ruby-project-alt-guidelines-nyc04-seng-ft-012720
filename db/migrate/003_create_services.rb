

class CreateServices < ActiveRecord::Migration[5.2]
    def change
        create_table :services do |s|
          s.string :name
          s.integer :user_id
          s.integer :pharmacy_id
        end
      end






end

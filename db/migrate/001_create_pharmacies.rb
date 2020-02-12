
class CreatePharmacies < ActiveRecord::Migration[5.2]
    def change
      create_table :pharmacies do |p|
         p.string :name
         p.string :location
         p.integer :open_from
         p.integer :open_till
         p.integer :work_week
         p.integer :rank
      end
    end


end
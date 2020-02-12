
class Pharmacy < ActiveRecord::Base
    has_many :services
    has_many :users, through: :services

end

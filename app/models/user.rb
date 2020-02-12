
class Service < ActiveRecord::Base
    has_many :services
    has_many :pharmacies, through: :services

    def full_name
        return "#{self.first_name} #{self.last_name}"
    end
end

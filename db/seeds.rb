require_relative '../config/environment'


#  -----------    users create
# 50.times do
#    User.create(first_name: "#{Faker::Name.first_name}", last_name: "#{Faker::Name.last_name}", user_name: "#{Faker::Alphanumeric.alpha(number: 6)}", password: "#{Number.number(digits: 4)}", exp: rand(1..6))
# end
User.create(first_name: "John", last_name: "Beet", user_name: "beermo", password: 1234, exp: 0)
User.create(first_name: "Mary", last_name: "Poppins", user_name: "maryja", password: 1234, exp: 0)
User.create(first_name: "Jake", last_name: "Best", user_name: "bester", password: 1234, exp: 0)
User.create(first_name: "Pit", last_name: "Jones", user_name: "pitbul", password: 1234, exp: 0)

#  -----------    pharmacy create
# 50.times do
#     Pharmacy.create(name: "#{Faker::Name.first_name} - Pharmacy", location: "#{Faker::Name.last_name}", open_from: Faker::Number.between(from: 1, to: 24), open_till: Faker::Number.between(from: 1, to: 24), work_week: Faker::Number.between(from: 1, to: 7), rank: rand(1..11))
# end
Pharmacy.create(name: "Bridge - Pharmacy", location: "Bay Ridge", open_from: 7, open_till: 7, work_week: 6, rank: 0)
Pharmacy.create(name: "Brothers - Pharmacy", location: "Bensonhurst", open_from: 8, open_till: 9, work_week: 6, rank: 0)
Pharmacy.create(name: "Crazy - Pharmacy", location: "Sunset Park", open_from: 9, open_till: 7, work_week: 7, rank: 0)
Pharmacy.create(name: "Batman - Pharmacy", location: "Flushing", open_from: 9, open_till: 9, work_week: 6, rank: 0)

#  -----------    services create

Service.create(name: "Blood Pressure Reading", user_id: 1, pharmacy_id: 4)
Service.create(name: "Blood Sugar Reading", user_id: 2, pharmacy_id: 3)
Service.create(name: "DMV Eye Test", user_id: 3, pharmacy_id: 2)
Service.create(name: "Delivery", user_id: 4, pharmacy_id: 1)
Service.create(name: "Greek Speaking", user_id: 4, pharmacy_id: 1)
Service.create(name: "Punjab Speaking", user_id: 3, pharmacy_id: 2)
Service.create(name: "Insulin Emergency Supply", user_id: 2, pharmacy_id: 3)
Service.create(name: "Spanish Speaking", user_id: 1, pharmacy_id: 4)
Service.create(name: "Non Prescription Medication", user_id: 1, pharmacy_id: 4)
Service.create(name: "Disposal of Unwanted Or Outdated Medication", user_id: 2, pharmacy_id: 3)
Service.create(name: "Arabic Speaking", user_id: 3, pharmacy_id: 2)
Service.create(name: "Portugese Speaking", user_id: 4, pharmacy_id: 1)
Service.create(name: "French Speaking", user_id: 4, pharmacy_id: 1)
Service.create(name: "Gaelic Speaking", user_id: 3, pharmacy_id: 2)
Service.create(name: "Turkish Speaking", user_id: 2, pharmacy_id: 3)
Service.create(name: "Advice Treating Minor Health Concerns", user_id: 1, pharmacy_id: 4)
Service.create(name: "Advice Living With Metabolic Syndromes", user_id: 1, pharmacy_id: 4)
Service.create(name: "Advice On Inhaler Use", user_id: 2, pharmacy_id: 3)
Service.create(name: "Advice On Usage Of Blood Sugar Monitors ", user_id: 3, pharmacy_id: 2)
Service.create(name: "Advice On Reading Directions On Medication Labels", user_id: 4, pharmacy_id: 1)






class Contact < ApplicationRecord
 #associações   
    has_many :phones
    
    has_one :Address
end

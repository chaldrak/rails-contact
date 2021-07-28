class Contact < ApplicationRecord
    validates :name, :presence => true
    validates :email, :presence => true, :uniqueness => true
    validates :content, :length => { :in => 1..140 }
end

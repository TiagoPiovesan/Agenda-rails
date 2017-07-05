class Kind < ApplicationRecord
    validates :description, presence: true, uniqueness: true    


	has_many :contacts
end

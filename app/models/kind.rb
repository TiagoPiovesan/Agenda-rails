class Kind < ApplicationRecord
	has_one :contact

	has_many :contacts
end

class Contact < ApplicationRecord
	#validações
	validates :nome, presence: true, uniqueness: true
	validates :email, presence: true
	validates :kind, presence: true


 	belongs_to :kind, optional: true
 	has_one :address, :inverse_of => :contact 

 	#no plural
 	has_many :phones

 	#permite que o endereço possa ser adicionado pelo contato, no mesmo lugar 'formulario complexo'
 	accepts_nested_attributes_for :address
	accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
end
	
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Gerando os tipos de contatos"
Kind.create([{description: "Amigo"}, {description: "Coral"}, {description: "Comercial"}])
puts "OK!"


puts "Populando Dados -  'CONTATOS'"
100.times do |i|
	Contact.create(nome: Faker::Name.name,
	               email: Faker::Internet.email,
	               kind: Kind.all.sample,
	               rmk: LeroleroGenerator.sentence(2) )
end
puts "Feito!"


## Cria Sem repetir telefone e endereço para um mesmo contato, todos são unicos ##

puts "Populando Dados - 'ENDEREÇOS'"
Contact.all.each do |contatoAQUI|
	Address.create(stret: Faker::Address.street_name,
				   number: Faker::Address.zip_code,
				   city: Faker::Address.city,
				   contact: contatoAQUI,
				   )
end
puts "Feito!"


puts "Populando Dados - 'Telefones'"
Contact.all.each do |contatoAQUI|
	#random sorteia um numero entre 1 e 5, seria a quantidade de telefones da pessoa
	#e atribui, tantas vezes
	Random.rand(1..5).times do |i|
		Phone.create(phone: Faker::PhoneNumber.cell_phone, contact: contatoAQUI)
	end
end
puts "OK!"

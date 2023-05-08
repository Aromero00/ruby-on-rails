namespace :dev do
  desc "configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts"resetando o branco de dados ..."

    #%X(rails db:drop:_unsafe db:create db:migrate)

    puts "cadastrando os contatos"

    100.times do |i|
      Contact.create!(
        name:Faker::Name.name ,
        email:Faker::Internet.email,
        birthdate:Faker::Date.between(from: 2.days.ago, to: Date.today) 

       )
      end
      puts"contatos cadastrados"
     
  
     puts"cadastrando telefones..."
     
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        Phone.create!(number: Faker::PhoneNumber.cell_phone, contact_id: contact.id)
        
      end
    end
    puts"contatos cadastrados com sucesso!!!"

    
    puts"cadastrando endereços..."
     
    Contact.all.each do |contact|
       address = Address.create(
        street: Faker::Address.street_addres,
        city: Faker::Address.city,
        contact: contact
      )
    end
    puts"endereços cadastrados com sucesso!!!"
    
  end
end


 

 


#Appel la gem faker pour créer des faux profils
require 'faker'

#destroy all data from class
User.destroy_all
Gossip.destroy_all
Tag.destroy_all
JoinTableGossipTag.destroy_all
City.destroy_all


#Création de 10 villes
10.times do
  city = City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  );
end

#Création de 10 users liés avec City
10.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence,
    password_digest: Faker::Lorem.sentence,
    email: Faker::Internet.email,
    age: rand(10..99),
    city_id: City.all.sample.id
  );
end

#Création de 10 tags
10.times do
  tag = Tag.create!(
    title: Faker::Name.first_name
  );
end

#Création de 20 gossips liés avec User
20.times do
  gossip = Gossip.create!(
    title: Faker::Name.first_name,
    content: Faker::Lorem.paragraph,
    user_id: User.all.sample.id,
  );
end


#Création de la table de jointure avec les gossips et les tags
10.times do
  jointable = JoinTableGossipTag.create!(
    gossip_id: Gossip.all.sample.id,
    tag_id: Tag.all.sample.id
  );
end

80.times do
  comment = Comment.create!(
    content: Faker::Lorem.paragraph,
    gossip_id: Gossip.all.sample.id,
    user_id: User.all.sample.id
  );
end
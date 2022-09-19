sample_user1 = User.create!(full_name: 'Joe Doe', email: 'joe@gmail.com', password: '&#hello123')
sample_user2 = User.create!(full_name: 'James Low', email: 'james@gmail.com', password: '&#hello123')
sample_user3 = User.create!(full_name: 'Janice West', email: 'janice@gmail.com', password: '&#hello123')

Category.create!(name: "Automotive")
Category.create!(name: "Aerospace")
Category.create!(name: "Transportation")
Category.create!(name: "Shipping")
Category.create!(name: "Health & Beauty")
Category.create!(name: "Agriculture")
Category.create!(name: "Information Technology")
Category.create!(name: "Hospitality")
Category.create!(name: "Education")
Category.create!(name: "Nutrition")

# User 1
sample_user1.clients.create!(
  first_name: 'Mike', 
  last_name: 'Smith', 
  email: 'mike@gmail.com',
  category_id: Category.ids[0]
)

sample_user1.clients.create!(
  first_name: 'Maria', 
  last_name: 'Danilo', 
  email: 'maria@gmail.com',
  category_id: Category.ids[0]
)

sample_user1.clients.create!(
  first_name: 'Carlos', 
  last_name: 'Santana', 
  email: 'carlos@gmail.com',
  category_id: Category.ids[1]
)

sample_user1.clients.create!(
  first_name: 'Hanz', 
  last_name: 'Zimmer', 
  email: 'hanz@gmail.com',
  category_id: Category.ids[2]
)
# User 2
sample_user2.clients.create!(
  first_name: 'Larry', 
  last_name: 'Bean', 
  email: 'lary@gmail.com',
  category_id: Category.ids[3]
)

sample_user2.clients.create!(
  first_name: 'Tina', 
  last_name: 'Sabastian', 
  email: 'tina@gmail.com',
  category_id: Category.ids[2]
)

sample_user2.clients.create!(
  first_name: 'Fay', 
  last_name: 'Dean', 
  email: 'fay@gmail.com',
  category_id: Category.ids[0]
)

sample_user2.clients.create!(
  first_name: 'Jean', 
  last_name: 'Saint Pierre', 
  email: 'jean@gmail.com',
  category_id: Category.ids[9]
)
# User 3
sample_user3.clients.create!(
  first_name: 'Marc', 
  last_name: 'Garneau', 
  email: 'marc@gmail.com',
  category_id: Category.ids[8]
)

sample_user3.clients.create!(
  first_name: 'Farouk', 
  last_name: 'Gainile', 
  email: 'farouk@gmail.com',
  category_id: Category.ids[8]
)

sample_user3.clients.create!(
  first_name: 'Sarah', 
  last_name: 'Baptiste', 
  email: 'sarah@gmail.com',
  category_id: Category.ids[7]
)

sample_user3.clients.create!(
  first_name: 'Eleni', 
  last_name: 'Papadopoulou', 
  email: 'eleni@gmail.com',
  category_id: Category.ids[6]
)




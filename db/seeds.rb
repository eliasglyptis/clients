sample_user = User.create!(full_name: 'Joe Doe', email: 'joe@gmail.com', password: '&#hello123')


sample_user.clients.create!(first_name: 'Mike', last_name: 'Smith', email: 'mike@gmail.com')

sample_user.clients.create!(first_name: 'Maria', last_name: 'Danilo', email: 'maria@gmail.com')

sample_user.clients.create!(first_name: 'Carlos', last_name: 'Santana', email: 'carlos@gmail.com')



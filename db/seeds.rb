# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_params = {email: 'paulo.carmona@zemoga.com', password: '123456'}
User.first_or_create(user_params)
puts 'User creado Exitosamente!'
@user = User.find_by(email: user_params[:email])

profile_params = {
  user_name: 'Paulo Carmona', 
  description: 'Ruby developer', 
  twitter_account: '@pollcaz',
  image_link: 'https://pickaface.net/gallery/avatar/unr_rubydacherry_161011_2059_2mbhkwq.png',
  user_id: @user.id
}

Profile.first_or_create(profile_params)
puts 'Profile creado y asociado al usuario Exitosamente!'
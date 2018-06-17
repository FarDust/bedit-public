require('identicon')

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def define_role(user)
  if user.username == 'admin'
    user.remove_role(:normal)
    user.add_role(:admin)
  elsif user.username == 'moderator'
    user.add_role(:moderator, Category.find_by(name: 'Juegos'))
  end
end

def seed_categories
  categorias = ['Política', 'Programación', 'Juegos', 'Data Science']
  categorias.each do |name|
    Category.create(name: name)
  end
end

def seed_users
  users = ['normal', 'moderator', 'admin']
  users.each do |user|
    @usuario = User.create(
                  username: user,
                  password: '123456',
                  email: "#{user}@uc.cl",
                  avatar: Identicon.data_url_for(user),
                  id: users.find_index(user) + 1
               )
    define_role(@usuario)
  end
end

def seed_posts
  categorias = Category.all
  categorias.each do |categoria|
    5.times do
      Post.create(
        title: Faker::Lorem.sentences[0],
        content: Faker::Lorem.sentences[0],
        category_id: categoria.id
      )
    end
  end
end

def seed_commentaries
  comentarios = ['Comentario 1', 'Comentario 2']
  posts = Post.all
  posts.each do |post|
    3.times do
      Commentary.create(
        text: Faker::Lorem.sentences[0],
        post_id: post.id,
        user_id: User.all.sample.id
      )
    end
  end
end

seed_categories()
seed_users()
seed_posts()
seed_commentaries()

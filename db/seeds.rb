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
    puts "|||||||||||||||||||||||||||||||||||||||||||#{user}||||||||||||||||||||||||||||||||||||||||||"
    @user = User.create(
              username: user,
              password: '123456',
              email: "#{user}@uc.cl",
              avatar: Identicon.data_url_for(user)
            )
    define_role(@user)
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
    comentarios.each do |comentario|
      Commentary.create(
        text: comentario,
        post_id: post.id
      )
    end
  end
end

seed_categories()
seed_users()
seed_posts()
seed_commentaries()

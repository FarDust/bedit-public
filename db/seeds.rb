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
    user.add_role(:moderator, Category.find(1))
  end
end

def seed_forums
  categorias = {Política: ['Política chilena', 'Ley Bolsas Plásticas'],
                Programación: ['Ruby gems', 'Git for dummies', 'Tutoriales RoR'],
                Juegos: ['Nintento Switch', 'Trucos AoE', "New Assassin's Creed"]}
  categorias.each do |topic|
    topic.each do |forum|
    Category.create(
      name: forum
      topic: topic
      description: Faker::Lorem.sentences[0]
    )
  end
end

def seed_users
  users = ['normal', 'moderator', 'admin']
  users.each do |user|
    @usuario = User.create(
                  username: user,
                  password: '123456',
                  email: "#{user}@uc.cl",
                  avatar: Identicon.data_url_for(user)
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
        category_id: categoria.id,
        user: User.where(username: :admin)[0]
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

seed_forums()
seed_users()
seed_posts()
seed_commentaries()

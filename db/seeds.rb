require('identicon')
require('csv')

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
  categorias = {
    Política: [
      ['Política chilena', 'Publicaciones sobre la política nacional'],
      ['Ley Bolsas Plásticas', 'Discute sobre la nueva ley de plásticos']
    ],
    Programación: [
      ['Ruby gems', 'Recomendaciones y cosas varias relacionadas con gemas de Ruby.'],
      ['Git for dummies', 'Aprende a usar git de forma sencilla.'],
      ['Tutoriales RoR', 'Un espacio dedicado a enseñar desarrollo con Ruby on Rails.']
    ],
    Juegos: [
      ['Nintento Switch', 'Novedades y todo lo relacionado con la última consola de nintendo.'],
      ['Trucos AoE', 'Todos los códigos y tips para el hitórico juego Age of Empires.'],
      ["New Assassin's Creed", 'Información actualizada del desarrollo de este nuevo juego.']
    ],
    Random: [
      ['Memes', 'Espacio para compartir los mejores memes.']
    ]
  }
  categorias.keys.each do |topic|
    categorias[topic].each do |forum|
    Category.create(
      name: forum[0],
      topic: topic,
      description: forum[1]
    )
    end
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
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'posts_seeds.csv'))
  csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8')
  csv.each do |publicacion|
    Post.create(
      title: publicacion['titulo'],
      content: publicacion['contenido'],
      category_id: publicacion['id_foro'],
      user: User.all.sample
    )
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

require('identicon')
require('csv')

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_sodrigo
  user = User.create(
    username: "Sodrigo Raffie",
    password: '123456',
    email: "sodrigoraffie@gmail.com",
    avatar: "https://res.cloudinary.com/hctj9u4ot/image/upload/v1530587791/commentaries/jnwljnz8sb51rka3j0sm.jpg"
 )
end

def create_Rosa
  user = User.create(
    username: "Rosa Alarcon",
    password: '123456',
    email: "ralarcon@uc.cl",
    avatar:  Identicon.data_url_for("Rosa Alarcon")
 )
 user.remove_role(:normal)
 user.add_role(:admin)
end

def create_fernando
  user = User.create(
    username: "Fernando Florenzano",
    password: '123456',
    email: "faflorenzano@uc.cl",
    avatar:  Identicon.data_url_for("Fernando Florenzano")
 )
end

def create_fandres
  user = User.create(
    username: "Fandres Ernandez",
    password: '123456',
    email: "alfernandez@uc.cl",
    avatar:  Identicon.data_url_for("Fandres Ernandez")
  )
end

def create_presentation_users
  create_fandres()
  create_fernando()
  create_Rosa()
  create_sodrigo()
end

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
  users = ['admin']
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
      user: User.find(publicacion['id_usuario'])
    )
  end
end

def seed_favourites
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'favourites_seeds.csv'))
  csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8')
  csv.each do |favorito|
    Favourite.create(
      user_id: favorito['id_usuario'],
      post_id: favorito['id_post']
    )
  end
end

def seed_commentaries
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'commentaries_seeds.csv'))
  csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8')
  csv.each do |comentario|
    Commentary.create(
      text: comentario['contenido'],
      post_id: comentario['id_post'],
      user_id: comentario['id_usuario']
    )
  end
end

def seed_likes
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'likes_seeds.csv'))
  csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8')
  csv.each do |like|
    Commentary.find(like['id_comentario']).liked_by(User.find(like['id_usuario']))
  end
end

create_presentation_users()

seed_forums()
seed_users()
seed_posts()
seed_commentaries()
seed_favourites()
seed_likes()

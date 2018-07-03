require('identicon')

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
    avatar:  Identicon.data_url_for("Fernando Florenzano")
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
  publicaciones = {
    'Política Chilena': [
      ['Gobierno encabeza mesa de trabajo tras cierre de la empresa Maersk', 
        '¿Qué opinan de esta noticia que encontré? 
        [Link a la noticia](http://www.emol.com/noticias/Economia/2018/06/30/911723/Ministro-Monckeberg-encabeza-mesa-de-trabajo-para-acordar-acciones-tras-cierre-de-empresa-Maersk-en-San-Antonio.html)']
    ],
    'Ley Bolsas Plásticas': [
      ['No puedo comprar tranquilo',
        'Odio ir a comprar y que se me queden las bolsas recicladas... Maldita ley, no puedo ir a comprar tranquilo.'],
      ['Amo la nueva ley',
        'Me encanta ver cada vez más personas 
        caminando con sus bolsas reutilizables, se nota que Chile está avanzando como país.']
    ],
    'Ruby Gems': [
      ['Busco gema para crear foro',
        'Hola amigos, tengo que para una tarea crear un foro similar a Redit, conocen alguna gema que podría ayudarme con esto?.
        Les dejo un meme para llamar su atención:
        ![Momazo](https://i.imgflip.com/1qlyex.jpg)']
    ],
    'Git for dummies': [
      ['Libro para aprender Git',
        'Hola, me recomiendan algún libro para aprender más sobre Git por favor. Les dejo un meme para no morir en el olvido.

        ![Meme](https://cdn-images-1.medium.com/max/650/1*ODQUZPiwWu04XxKX4f2jbg.jpeg)']
    ]
  }

  publicaciones.keys.each do |foro|
    f = Category.where(name: foro)
    publicaciones[foro].each do |publicacion|
      Post.create(
        title: publicacion[0],
        content: publicacion[1],
        category_id: f.id,
        user: User.all.sample
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

create_presentation_users()

seed_forums()
seed_users()
seed_posts()
seed_commentaries()

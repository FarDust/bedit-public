# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def seed_categories
  categorias = ['Política', 'Programación', 'Juegos', 'Data Science']
  categorias.each do |name|
    Category.create(name: name)
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

seed_categories
seed_posts
seed_commentaries
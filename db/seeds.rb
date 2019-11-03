# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(name:'Dresses')
Category.create(name:'Pants')
Category.create(name:'Skirts')
Category.create(name:'Blousses')
Role.create(name:'admin')
Role.create(name:'client')
Assignment.create(user_id:'1', role_id:'1')
Assignment.create(user_id:'2', role_id:'2')
Item.create(name:'Vestido Batik', description:'Vestido batik', stock: 20, price:'30.5', images:'123', category_id:'1')
Item.create(name:'Vestido negro', description:'Vestido negro', stock: 10, price:'15.5', images:'456', category_id:'1')
Item.create(name:'Pantalon negro', description:'Pantalon negro', stock: 12, price:'22.99', images:'456', category_id:'2')
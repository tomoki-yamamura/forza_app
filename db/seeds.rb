# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.create(name: "練習メニュー")
Category.create(name: "土曜日の練習")
Category.create(name: "つぶやき")
Category.create(name: "大会情報")

User.create(name: ENV['FORZA_USER'], email: ENV["FORZA_EMAIL"], password: ENV["FORZA_PASSWORD"])


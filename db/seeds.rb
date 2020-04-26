# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Tag.create(name: 'Obeso(a)')
Tag.create(name: 'Diabético(a)')
Tag.create(name: 'Emagrecer')
Tag.create(name: 'Hipertrofia')
Patient.create(first_name: 'otavio', last_name: 'schwanck', birth_date: Time.zone.now,
               profession: 'Senior Ruby on Rails Dev', gender: 'Male', street: 'Rua X',
               number: 15, state: 'RS', country: 'Brazil', city: 'Torres', cpf: '00000000000',
               email: 'otavioschwanck@gmail.com', obs: 'moreno alto, bonito e sensual',
               phone: '51996312587', status: 'active', user_id: 1)

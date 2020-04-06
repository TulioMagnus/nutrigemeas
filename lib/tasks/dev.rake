# frozen_string_literal: true

namespace :dev do
  DEFAULT_PASSWORD = 123_456
  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

  desc 'Configura o ambiente de desenvolvimento'
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Dropping DB...') { `rails db:drop` }
      show_spinner('Creating DB...') { `rails db:create` }
      show_spinner('Migrating DB...') { `rails db:migrate` }
      show_spinner('Adding default user...') { `rails dev:add_default_user` }
      show_spinner('Creating fake pacients...') { `rails dev:add_fake_pacients` }
      show_spinner('Creating fake appointments...') { `rails dev:add_fake_appointments` }
    else
      puts 'Você não está em ambiente de desenvolvimento!'
    end
  end

  desc 'Add default user'
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD,
      first_name: 'Bruna',
      last_name: 'Alcarde',
      avatar: Faker::Avatar.image
    )
  end

  desc 'Add fake pacients'
  task add_fake_pacients: :environment do
    300.times do
      Pacient.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
        sex: %w[Homem Mulher].sample,
        cpf: Faker::IDNumber.brazilian_citizen_number,
        user: User.all.sample,
        email: Faker::Internet.email,
        street: Faker::Address.street_name,
        number: Faker::Address.building_number,
        city: Faker::Address.city,
        state: Faker::Address.state,
        country: Faker::Address.country,
        phone: Faker::PhoneNumber.phone_number,
        obs: Faker::Hipster.paragraph,
        profession: Faker::Job.title
      )
    end
  end

  desc 'Add fake appointments'
  task add_fake_appointments: :environment do
    500.times do
      Appointment.create!(
        appointment_date: Faker::Date.between(from: 3.years.ago, to: Date.today),
        pacient: Pacient.all.sample,
        appointment_type: %w[Consulta Retorno].sample,
        payment_status: Faker::Boolean.boolean,
        price: Faker::Number.decimal(l_digits: 3, r_digits: 2)
      )
    end
  end

  def elect_true_answer(answers_array = [])
    selected_index = rand(answers_array.size)
    answers_array[selected_index] = create_answer_params(true)
  end

  def show_spinner(msg_start, msg_end = 'Concluído!')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end

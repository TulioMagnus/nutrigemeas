# frozen_string_literal: true

# == Schema Information
#
# Table name: anamneses
#
#  id                    :bigint           not null, primary key
#  alcohol               :boolean
#  alergies              :string
#  beento_nutri          :string
#  bowel                 :string
#  can_eat               :string
#  candy                 :boolean
#  candy_frequency       :string
#  cant_eat              :string
#  chewing               :string
#  constipation          :string
#  drink_juice           :boolean
#  drink_soda            :boolean
#  drugs_and_supplements :string
#  eat_out               :string
#  exercise              :boolean
#  exercise_duration     :string
#  exercise_frequency    :string
#  exercise_tired        :integer
#  exercise_type         :string
#  first_reason          :string
#  food_intolerance      :string
#  fourth_reason         :integer
#  fried_food            :boolean
#  fried_frequency       :string
#  hair_loss             :boolean
#  health_situation      :string
#  legumes_fruits_leaves :boolean
#  make_your_food        :string
#  oats                  :boolean
#  reason                :string
#  second_reason         :string
#  sleep                 :string
#  smoker                :boolean
#  stress                :string
#  third_reason          :string
#  water_consumption     :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  appointment_id        :bigint           not null
#
# Indexes
#
#  index_anamneses_on_appointment_id  (appointment_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (appointment_id => appointments.id)
#
class Anamnesis < ApplicationRecord
  belongs_to :appointment
end

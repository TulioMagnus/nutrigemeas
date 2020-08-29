# frozen_string_literal: true

# == Schema Information
#
# Table name: anamneses
#
#  id                    :bigint           not null, primary key
#  alcohol               :boolean
#  alergies              :text
#  beento_nutri          :text
#  bowel                 :text
#  brystol               :integer
#  can_eat               :text
#  candy                 :boolean
#  candy_frequency       :text
#  cant_eat              :text
#  chewing               :text
#  constipation          :text
#  drink_juice           :boolean
#  drink_soda            :boolean
#  drugs_and_supplements :text
#  eat_out               :text
#  exercise              :boolean
#  exercise_duration     :text
#  exercise_frequency    :text
#  exercise_tired        :integer
#  exercise_type         :text
#  first_reason          :text
#  food_intolerance      :text
#  fourth_reason         :integer
#  fried_food            :boolean
#  fried_frequency       :text
#  hair_loss             :boolean
#  health_situation      :text
#  legumes_fruits_leaves :boolean
#  make_your_food        :text
#  oats                  :boolean
#  reason                :text
#  second_reason         :text
#  sleep                 :text
#  smoker                :boolean
#  stress                :text
#  third_reason          :integer
#  urine                 :integer
#  water_consumption     :text
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

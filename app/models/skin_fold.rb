# frozen_string_literal: true

# == Schema Information
#
# Table name: skin_folds
#
#  id             :bigint           not null, primary key
#  fold1          :decimal(, )      default(0.0), not null
#  fold2          :decimal(, )      default(0.0), not null
#  fold3          :decimal(, )      default(0.0), not null
#  fold4          :decimal(, )      default(0.0), not null
#  fold5          :decimal(, )      default(0.0), not null
#  fold6          :decimal(, )      default(0.0), not null
#  fold7          :decimal(, )      default(0.0), not null
#  height         :decimal(, )      default(0.0), not null
#  measure1       :decimal(, )      default(0.0), not null
#  measure2       :decimal(, )      default(0.0), not null
#  measure3       :decimal(, )      default(0.0), not null
#  measure4       :decimal(, )      default(0.0), not null
#  measure5       :decimal(, )      default(0.0), not null
#  weight         :decimal(, )      default(0.0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  appointment_id :bigint           not null
#
# Indexes
#
#  index_skin_folds_on_appointment_id  (appointment_id)
#
# Foreign Keys
#
#  fk_rails_...  (appointment_id => appointments.id)
#
class SkinFold < ApplicationRecord
  belongs_to :appointment
end

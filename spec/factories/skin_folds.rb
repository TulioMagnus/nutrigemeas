# == Schema Information
#
# Table name: skin_folds
#
#  id             :bigint           not null, primary key
#  fold1          :decimal(, )
#  fold2          :decimal(, )
#  fold3          :decimal(, )
#  fold4          :decimal(, )
#  fold5          :decimal(, )
#  fold6          :decimal(, )
#  fold7          :decimal(, )
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
FactoryBot.define do
  factory :skin_fold do
    fold1 { "9.99" }
    fold2 { "9.99" }
    fold3 { "9.99" }
    fold4 { "9.99" }
    fold5 { "9.99" }
    fold5 { "9.99" }
    fold6 { "9.99" }
    fold7 { "9.99" }
    appointment { nil }
  end
end

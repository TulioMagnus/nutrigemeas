# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  extend ImplementsMoneyNumber

  self.abstract_class = true
  include TranslateEnum

  def self.define_attributes_translation(attributes)
    hash = { model_name.i18n_key => attributes }
    I18n.backend.store_translations(:'pt-BR', activerecord: { attributes: hash })
  end
end

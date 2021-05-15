# frozen_string_literal: true

module ImplementsMoneyNumber
  include ActionView::Helpers::NumberHelper
  extend ActiveSupport::Concern

  def money_field(column, numericality: nil, allow_nil: false, check: -> { true })
    validates("formatted_#{column}", numericality: numericality, allow_nil: allow_nil, if: check) if numericality && numericality

    define_money_number_methods(column)
  end

  def normalized_money(value)
    return if value.blank?
    return value.to_d if value.is_a?(Numeric)

    value.to_s.gsub(/[^0-9,]+/, '').gsub(',', '.').to_d
  end

  def formatted_money(number)
    number_to_currency(number)
  end

  private

  def define_money_number_methods(column)
    define_attributes_translation("formatted_#{column}": human_attribute_name(column))

    define_method(:"formatted_#{column}=") { |value| send(:"#{column}=", self.class.normalized_money(value)) }
    define_method(:"formatted_#{column}") { public_send(column) }
    define_method(:"brl_#{column}") { self.class.formatted_money(public_send(column)) }
    define_method(:"brl_simple_#{column}") { self.class.formatted_money(public_send(column))&.gsub('R$ ', '') }
    define_singleton_method(:"find_by_formatted_#{column}") { |value| find_by(column => normalized_money(value)) }
  end
end

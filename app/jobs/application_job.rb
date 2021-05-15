# frozen_string_literal: true

class ApplicationJob < ActiveJob::Base
  def money_format(value)
    format('R$ %.2f', value)
  end
end

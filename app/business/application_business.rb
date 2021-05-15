# frozen_string_literal: true

class ApplicationBusiness
  def self.call(*args, &block)
    new(*args, &block).call
  end
end

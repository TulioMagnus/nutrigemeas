module Pacients 
  class CalculateAge < ApplicationService
    attr_reader :birth_date
  
    def initialize(birth_date)
      @birth_date = birth_date
    end 
  
    def call
      ((Time.zone.now - @birth_date.to_time) / 1.year.seconds).floor
    end
  
  end
end
# frozen_string_literal: true

module Process
  module Utils
    class Density < ApplicationBusiness
      def initialize(skin_fold, age)
        @data = skin_fold
        @age = age
      end

      def call
        calculate_density
      end

      def calculate_density
        1.112 - 0.00043499 * sum_folds + 0.00000055 * sum_folds**2 - 0.00028826 * @age
      end

      def sum_folds
        @data.fold1 + @data.fold2 + @data.fold3 + @data.fold4 + @data.fold5 + @data.fold6 + @data.fold7
      end
    end
  end
end

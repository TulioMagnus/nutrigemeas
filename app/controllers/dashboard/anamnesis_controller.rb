# frozen_string_literal: true

module Dashboard
  class AnamnesisController < DashboardController
    before_action :set_anamnesis, only: %i[show edit update destroy duplicate]
    before_action :set_appointment

    def index; end

    def show; end

    def new; end

    def edit; end

    private

    def set_anamnesis
      @anamnesis = Anamnesis.find(params[:id])
    end

    def set_appointment
      @appointment = Appointment.find(params[:appointment_id])
    end

    def anamnesis_params
      params.require(:anamnesis).permit(:alcohol, :alergies, :beento_nutri, :bowel, :can_eat, :candy, :candy_frequency,
                                        :cant_eat, :chewing, :constipation, :drink_juice, :drink_soda, :drugs_and_supplements,
                                        :eat_out, :exercise, :exercise_duration, :exercise_frequency, :exercise_tired, :exercise_type,
                                        :first_reason, :food_intolerance, :fourth_reason, :fried_food, :fried_frequency, :hair_loss,
                                        :health_situation, :legumes_fruits_leaves, :make_your_food, :oats, :reason, :second_reason,
                                        :sleep, :smoker, :stress, :third_reason, :water_consumption, :created_at, :updated_at, :appointment_id)
    end
  end
end

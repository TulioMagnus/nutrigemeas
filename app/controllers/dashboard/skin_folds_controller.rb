# frozen_string_literal: true

module Dashboard
  class SkinFoldsController < DashboardController
    before_action :set_appointment, :set_patient
    before_action :set_skin_fold, only: %i[show edit update]

    def index; end

    def show; end

    def edit
      respond_to do |format|
        format.js
      end
    end

    def update
      respond_to do |format|
        if @skin_fold.update(skin_fold_params)
          Process::Utils::Fat.new(@skin_fold, @skin_fold.appointment.age_on_appointment).call
          format.html { redirect_to [:dashboard, @patient, @skin_fold.appointment], notice: 'Antropometria editada com sucesso' }
        else
          format.html { render :edit }
        end
      end
    end

    private

    def set_skin_fold
      @skin_fold = @appointment.skin_fold
    end

    def set_appointment
      @appointment = Appointment.find(params[:appointment_id])
    end

    def set_patient
      @patient = @appointment.patient
    end

    def skin_fold_params
      params.require(:skin_fold).permit(:fold1, :fold2, :fold3, :fold4, :measure1, :measure2, :appointment,
                                        :measure3, :measure4, :measure5, :fold5, :fold6, :fold7, :appointment, :weight, :height)
    end
  end
end

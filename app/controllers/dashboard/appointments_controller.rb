# frozen_string_literal: true

module Dashboard
  class AppointmentsController < DashboardController
    before_action :set_patient
    before_action :set_appointment, only: %i[show edit update destroy duplicate]

    def index; end

    def show
      @skin_fold = @appointment.skin_fold
    end

    def new
      @appointment = @patient.appointments.build
      respond_to do |format|
        format.js
      end
    end

    def duplicate
      new_appointment = @appointment.amoeba_dup
      new_appointment.update!(appointment_date: Time.zone.now)
      new_appointment.save
      new_appointment.skin_fold.update!(appointment: new_appointment)
      redirect_to [:dashboard, @patient], notice: 'Consulta Duplicada com Sucesso'
    end

    def edit
      respond_to do |format|
        format.js
      end
    end

    def create
      @appointment = @patient.appointments.build(appointment_params)

      respond_to do |format|
        if @appointment.save
          format.html { redirect_to [:dashboard, @patient], notice: 'Consulta criada com sucesso!' }
        else
          format.html { render :new }
        end
      end
    end

    def update
      respond_to do |format|
        if @appointment.update(appointment_params)
          format.html { redirect_to [:dashboard, @patient], notice: 'Consulta editada com sucesso' }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @appointment.destroy
      respond_to do |format|
        format.html { redirect_to [:dashboard, @patient], notice: 'Consulta excluída com sucesso' }
      end
    end

    private

    def set_appointment
      @appointment = @patient.appointments.find(params[:id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def appointment_params
      params.require(:appointment).permit(:appointment_date, :appointment_type, :patient_id,
                                          :price, :payment_status, :formatted_price, :patient)
    end
  end
end

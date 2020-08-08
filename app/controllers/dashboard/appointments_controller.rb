# frozen_string_literal: true

module Dashboard
  class AppointmentsController < DashboardController
    before_action :set_appointment, only: %i[show edit update destroy duplicate]
    before_action :set_patient
    def index; end

    def show; end

    def new
      @appointment = @patient.appointments.build
    end

    def duplicate
      new_appointment = @appointment.amoeba_dup
      new_appointment.update!(appointment_date: Time.zone.now)
      new_appointment.save
      redirect_to [:dashboard, @patient], notice: 'Consulta Duplicada com Sucesso'
    end

    def edit; end

    def create
      @appointment = @patient.appointments.build(appointment_params)

      respond_to do |format|
        if @appointment.save
          format.html { redirect_to [:dashboard, @patient], notice: 'Appointment was successfully created.' }
          format.json { render :show, status: :created, location: @appointment }
        else
          format.html { render :new }
          format.json { render json: @appointment.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @appointment.update(appointment_params)
          format.html { redirect_to [:dashboard, @patient], notice: 'Appointment was successfully updated.' }
          format.json { render :show, status: :ok, location: @appointment }
        else
          format.html { render :edit }
          format.json { render json: @appointment.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @appointment.destroy
      respond_to do |format|
        format.html { redirect_to [:dashboard, @patient], notice: 'Appointment was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def appointment_params
      params.require(:appointment).permit(:appointment_date, :appointment_type, :patient_id,
                                          :price, :payment_status, :price_cents, :patient)
    end
  end
end

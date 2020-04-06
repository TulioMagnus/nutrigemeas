# frozen_string_literal: true

module Dashboard
  class AppointmentsController < DashboardController
    before_action :set_appointment, only: %i[show edit update destroy]
    before_action :set_pacient
    # GET /appointments
    # GET /appointments.json
    def index
      # @appointments = Appointment.order(:first_name).page params[:page]
    end

    # GET /appointments/1
    # GET /appointments/1.json
    def show; end

    # GET /appointments/new
    def new
      @appointment = @pacient.appointments.build
    end

    # GET /appointments/1/edit
    def edit; end

    # POST /appointments
    # POST /appointments.json
    def create
      @appointment = @pacient.appointments.build(appointment_params)

      respond_to do |format|
        if @appointment.save
          format.html { redirect_to [:dashboard, @pacient], notice: 'Appointment was successfully created.' }
          format.json { render :show, status: :created, location: @appointment }
        else
          format.html { render :new }
          format.json { render json: @appointment.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /appointments/1
    # PATCH/PUT /appointments/1.json
    def update
      respond_to do |format|
        if @appointment.update(appointment_params)
          format.html { redirect_to @pacient, notice: 'Appointment was successfully updated.' }
          format.json { render :show, status: :ok, location: @appointment }
        else
          format.html { render :edit }
          format.json { render json: @appointment.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /appointments/1
    # DELETE /appointments/1.json
    def destroy
      @appointment.destroy
      respond_to do |format|
        format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def set_pacient
      @pacient = Pacient.find(params[:pacient_id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:appointment_date, :appointment_type, :pacient_id,
                                          :price, :payment_status, :price_cents, :pacient)
    end
  end
end

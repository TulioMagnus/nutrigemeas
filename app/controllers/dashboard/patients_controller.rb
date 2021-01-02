# frozen_string_literal: true

module Dashboard
  class PatientsController < DashboardController
    before_action :set_patient, only: %i[show edit update destroy]

    # GET /patients
    # GET /patients.json
    def index
      @q = Patient.ransack(params[:q])
      @patients = @q.result.order(:first_name).page(params[:page])
    end

    # GET /patients/1
    # GET /patients/1.json
    def show
      @appointments = @patient.appointments.order('appointment_date DESC').page(params[:page])
    end

    # GET /patients/new
    def new
      @patient = Patient.new
      respond_to do |format|
        format.html
        format.js
      end
    end

    # GET /patients/1/edit
    def edit; end

    # POST /patients
    # POST /patients.json
    def create
      @patient = Patient.new(patient_params)

      respond_to do |format|
        if @patient.save
          format.html { redirect_to dashboard_patients_path, notice: 'Patient was successfully created.' }
          format.json { render :show, status: :created, location: @patient }
        else
          format.html { render :new }
          format.json { render json: @patient.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /patients/1
    # PATCH/PUT /patients/1.json
    def update
      respond_to do |format|
        if @patient.update(patient_params)
          format.html { redirect_to dashboard_patients_path, notice: 'Patient was successfully updated.' }
          format.json { render :show, status: :ok, location: @patient }
        else
          format.html { render :edit }
          format.json { render json: @patient.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /patients/1
    # DELETE /patients/1.json
    def destroy
      @patient.destroy
      respond_to do |format|
        format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def patient_params
      params.require(:patient).permit(:first_name, :last_name, :birth_date, :gender, :street, :number,
                                      :state, :country, :city, :cpf, :obs, :phone, :user_id, :email,
                                      :avatar, :avatar_cache, :remove_avatar, :professionm, :status,
                                      :tag_list, :tag, { tag_ids: [] }, :tag_ids)
    end
  end
end

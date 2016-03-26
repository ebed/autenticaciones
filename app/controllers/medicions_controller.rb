class MedicionsController < ApplicationController
before_action :set_params_parents, only: [:edit, :new, :show, :destroy]
before_action :set_medicion, only: [:show, :destroy]

def new
  @medicion = Medicion.new

end

def show

end


def create
    p params
    @medicion = Medicion.new(medicions_params)
    p @medicion
    respond_to do |format|
      if @medicion.save

        format.html { redirect_to patient_ficha_registro_test_instance_path(:ficha_id => params[:ficha_id], :registro_id => params[:registro_id], :id => @medicion.test_instance_id), notice: 'Test instance was successfully created.' }
        format.json { render :show, status: :created, location: @test_instance }
      else
        format.html { render :new }
        format.json { render json: @test_instance.errors, status: :unprocessable_entity }
      end
    end
  end





def destroy
    @medicion.destroy
    respond_to do |format|
      format.html { redirect_to patient_ficha_registro_test_instance_path(:ficha_id=>@ficha.id, :id=>@test_instance.id,:patient_id=>@patient.id, :registro_id=>@registro.id, :test_instance_id=>@test_instance.id), notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def set_params_parents
  @ficha = Ficha.find(params[:ficha_id])
  @patient = Patient.find(params[:patient_id])
  @registro = Registro.find(params[:registro_id])
  @test_instance = TestInstance.find(params[:test_instance_id])
  @medicionesusadas = Medicion.where(:test_instance_id => @test_instance.id)
  p "metricas cargadas"
  p @medicionesusadas
  @metricas = Metrica.where(:test_id => @test_instance.test_id).where.not(:id => @medicionesusadas.map(&:metrica_id))
  p "Metricas cargadas"
  p @metricas
end

def set_medicion
  @medicion = Medicion.find(params[:id])
end

def medicions_params
    params.require(:medicion).permit(:valor, :observacion, :test_instance_id, :metrica_id)
end


end

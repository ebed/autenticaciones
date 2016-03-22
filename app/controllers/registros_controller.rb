class RegistrosController < ApplicationController
before_action :set_registro, only: [:show, :edit, :update, :destroy]


def show

end

def new
  @ficha = Ficha.find(params[:ficha_id])
  @patient = Patient.find(params[:patient_id])
  @registro = Registro.new

  p @registro
  p @ficha
  p @patient

end

def create
  p "Parametros"
  p params

  p "Nuevo registro"
  @registro = Registro.new(registros_params)
  @registro.ficha_id = params[:ficha_id]
  p @registro
  respond_to do |format|
    if @registro.save
      p "Parametros registro"

      format.html { redirect_to  patient_ficha_registro_path(:patient_id => params[:patient_id], :ficha_id => params[:ficha_id], :id => @registro.id) , notice: 'Registro was successfully created.' }
      format.json { render :show, status: :created, location: @registro }
    else
      format.html { render :new }
      format.json { render json: @persona.errors, status: :unprocessable_entity }
    end
  end
end

   def set_registro
      @registro = Registro.find(params[:id])
    end

 def registros_params
      params.require(:registro).permit(:fecha, :resumen, :detalle, :specialist_id, :ficha_id)
  end

end

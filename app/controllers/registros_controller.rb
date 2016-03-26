class RegistrosController < ApplicationController
before_action :set_registro, only: [:show, :edit, :update, :destroy]
before_action :set_params_padres, only: [:show, :edit, :update, :new]

def show
  p "Parametros"
  p params
  @testusados = Test.joins(:test_instances).where(test_instances: {registro_id: @registro.id })
  p @testusados
  @testssinuso = Test.where.not(:id => @testusados.map(&:id))
  p @testssinuso
  @tests = TestInstance.where(:registro_id => @registro.id)

end

def edit
  @ficha = Ficha.find(params[:ficha_id])
  @patient = Patient.find(params[:patient_id])


  p @registro
  p @ficha
  p @patient
end


def new

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

  # PATCH/PUT /personas/1
  # PATCH/PUT /personas/1.json
  def update
    respond_to do |format|
      if @registro.update(registros_params)
        format.html { redirect_to patient_ficha_registro_path(:patient_id => params[:patient_id], :ficha_id => params[:ficha_id], :id => @registro.id) , notice: 'Persona was successfully updated.' }
        format.json { render :show, status: :ok, location: @persona }
      else
        format.html { render :edit }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personas/1
  # DELETE /personas/1.json
  def destroy
    @registro.destroy
    respond_to do |format|
      format.html { redirect_to patient_fichas_path(:patient_id => params[:patient_id]) ,
       notice: 'Persona was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_params_padres
    @ficha = Ficha.find(params[:ficha_id])
    @patient = Patient.find(params[:patient_id])
    @especialistas = Persona.joins(:specialist)
  end

  def set_registro
    @registro = Registro.find(params[:id])

  end

 def registros_params
      params.require(:registro).permit(:fecha, :resumen, :detalle, :specialist_id, :ficha_id)
  end

end

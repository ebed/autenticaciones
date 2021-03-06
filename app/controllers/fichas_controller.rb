class FichasController < ApplicationController
helper_method :tieneFicha?, :tieneRegistros?

def show
end

def index
  p params
  @ficha = Ficha.find_by(:patient_id => params[:patient_id])
  @paciente = Patient.find(params[:patient_id])
  p "Detalle paciente"
  p @paciente

  @persona = Persona.find_by(:patient_id => @paciente.id)
  p "Detalle persona"
  p @persona
  if tieneFicha?

    p "No se creo, ya existe ficha"
    p @ficha
  else
    @ficha = Ficha.new(fichas_params)
      p "Detalle ficha creada"
      p @ficha
      @ficha.save
  end

  @ficha.registros = Registro.where(:ficha_id => @ficha.id)
  @cant = @ficha.registros.size

end


def tieneFicha?
  if @ficha.blank?
    p "no tiene nada"
    false
  else

    true
  end
end


def tieneRegistros?
  if @ficha.registros.blank?
    p "no tiene nada"
    false
  else

    true
  end
end


def fichas_params
  params.permit(:id, :patient_id)
end


end

class MetricasController < ApplicationController
before_action :set_metrica, only: [:show, :edit, :update, :destroy]
def index
  @metricas = Metrica.all
end


def show
end

def new
  @metrica = Metrica.new
end

def create
   @metrica = Metrica.new(metrica_params)

    respond_to do |format|

      if @metrica.save
        @metrica.test_id = params[:test_id]
        @metrica.save
        format.html { redirect_to test_path(:id => params[:test_id]), notice: 'Persona was successfully created.' }
        format.json { render :show, status: :created, location: @metrica }
      else
        format.html { render :new }
        format.json { render json: @metrica.errors, status: :unprocessable_entity }
      end
    end

end

def set_metrica
  @metrica = Metrica.find(params[:id])
end

def metrica_params
  params.require(:metrica).permit(:nombre,:detalle, :test_id)
end


end

class TestsController < ApplicationController
before_action :set_test, only: [:show, :edit, :update, :destroy]
def index
  @tests = Test.all
end

def show
  @metricas = Metrica.where(:test_id => params[:id])
  p "Metricas recuperadas"
  p @metricas
  p "Parametros"
  p params
end


def edit
end

def new
  @test = Test.new
end

def create
  @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: 'Specialist was successfully created.' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
end

def destroy
  @test.destroy
  respond_to do |format|
    format.html { redirect_to tests_url, notice: 'Specialist was successfully destroyed.' }
    format.json { head :no_content }
  end

end

def update
   respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to tests_path , notice: 'Persona was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
end

def set_test
  @test = Test.find(params[:id])
end

def test_params
    params.require(:test).permit(:id, :nombre, :detalle)
end

end

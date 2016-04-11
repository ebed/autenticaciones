class TestInstancesController < ApplicationController
  before_action :set_test_instance, only: [:show, :edit, :update, :destroy]
  before_action :set_params_parents, only: [:edit, :show]
  after_action :set_params_parents, only: [:new]
  # GET /test_instances
  # GET /test_instances.json
  def index
    @test_instances = TestInstance.all
  end

  # GET /test_instances/1
  # GET /test_instances/1.json
  def show
    p params
    @mediciones = Medicion.where(test_instance_id: params[:id])
    p @metricas
    p @metricas.count
  end

  # GET /test_instances/new
  def new
    @test_instance = TestInstance.new
    p params

    @ficha = Ficha.find(params[:ficha_id])
    @patient = Patient.find(params[:patient_id])
    @registro = Registro.find(params[:registro_id])
    @testinstanciasexistentes = TestInstance.where(:registro_id => @registro.id)
    @tests = Test.where.not(:id => @testinstanciasexistentes.map(&:test_id))
    p "tests a mostrar"
    p @testinstanciasexistentes
  end

  # GET /test_instances/1/edit
  def edit
    p params

  end

  # POST /test_instances
  # POST /test_instances.json
  def create
    p params
    @test_instance = TestInstance.new(test_instance_params)
    @test_instance.registro_id = params[:registro_id]
    respond_to do |format|
      if @test_instance.save
        format.html { redirect_to patient_ficha_registro_path(:ficha_id => params[:ficha_id], :id => params[:registro_id]), notice: 'Test instance was successfully created.' }
        format.json { render :show, status: :created, location: @test_instance }
      else
        format.html { render :new }
        format.json { render json: @test_instance.errors, statustus: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_instances/1
  # PATCH/PUT /test_instances/1.json
  def update
    p "Update de test_instance"
     p params
    respond_to do |format|
      if @test_instance.update(test_instance_params)
        format.html { redirect_to patient_ficha_registro_path(:ficha_id => params[:ficha_id], :id => params[:registro_id]), notice: 'Test instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_instance }
      else
        format.html { render :edit }
        format.json { render json: @test_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_instances/1
  # DELETE /test_instances/1.json
  def destroy
    @test_instance.destroy
    respond_to do |format|
      format.html { redirect_to patient_ficha_registro_path(:id => params[:registro_id]), notice: 'Test instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_instance
      @test_instance = TestInstance.find(params[:id])
    end

    def set_params_parents
      @ficha = Ficha.find(params[:ficha_id])
      @patient = Patient.find(params[:patient_id])
      @registro = Registro.find(params[:registro_id])
      @medicionesusadas = Medicion.where(:test_instance_id => @test_instance.id)
      p "metricas cargadas"
      p @medicionesusadas
      @metricas = Metrica.where(:test_id => @test_instance.test_id).where.not(:id => @medicionesusadas.map(&:metrica_id))
      p "Metricas cargadas"
      p @metricas
      @medicions = Medicion.joins(:metricas).where(metricas: {test_id: params[:registro_id]})
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_instance_params

      params.require(:test_instance).permit(:test_id, :fecha, :ficha_id, {:medicions => [:valor,:observacion]} )
    # location_attributes: [:id, :address, :city, :country])

    end
end

class Metrica < ActiveRecord::Base
  has_many :medicions

  belongs_to :registro

  accepts_nested_attributes_for :medicions


  def to_label
    "#{nombre}"
  end

  def self.generate_graph(user_id,metrica_id)
      paciente = Patient.find_by(id: user_id)
      puts paciente.id
      metrica = Metrica.find_by(id: metrica_id)
      puts "Llamada a generacion de grafico para usuario #{paciente.persona.first_name} con grafico #{metrica.nombre}"
      mediciones = Medicion.joins(test_instance:
              {registro: :ficha}).where(:metrica_id => metrica_id).
              #where(test_instances: { :test_id => 1}).
              where(fichas: {:patient_id => user_id })

      retorno = []

      mediciones.each do |med|
        @temp = TestInstance.find(med.test_instance_id)

        dato = [@temp.fecha,med.valor]
        retorno.push dato

      end

      p "Valor al momento: #{retorno}"
      retorno

     #mediciones.to_json(:only => [:valor,:created_at] )

  end




end

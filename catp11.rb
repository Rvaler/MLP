# RAFAEL VALER - 220489
#
#!/usr/bin/ruby -w

require 'date'


class Pessoa
	
	attr_accessor :nome, :data, :sexo, :local, :idade

	#constructor (nome, data_nascimento, sexo, localizacao)
	def initialize(nome = "Indefinido", data = nil, sexo = "Indefinido", local = "0.0")

		#validations
		today = Date.today
		
		if(data!=nil)

			born = Date.parse data
			if(born <= today)
				@idade = age(born)
				@data = data.to_s
			else
				@data = Date.today.to_s	
				@idade = "Indefinido"			
			end
		else
			@data = Date.today.to_s	
			@idade = "Indefinido"
		end

		if(nome != nil and nome.length > 0 and nome.include? " " and !startWithNumber?(nome))
			@nome = nome
		else
			@nome = "Indefinido"
		end

		sexo = sexo.downcase
		if(sexo == 'masculino' or sexo == 'feminino')
			@sexo = sexo
		else
			@sexo = 'indefinido'
		end
		@local = local

	end

	def age(dob)
	  now = Time.now.utc.to_date
	  now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
	end

	def startWithNumber?(string)
		if(string[0] == '0' or string[0] == '5' or
			string[0] == '1' or string[0] == '6' or
			string[0] == '2' or string[0] == '7' or
			string[0] == '3' or string[0] == '8' or
			string[0] == '4' or string[0] == '9')
			return true
		else 
			return false
		end
	end


	def printInfo
		puts "Nome: " + @nome
		puts "Data de Nascimento: " + @data.to_s
		puts "Idade: " + @idade.to_s
		puts "Sexo: " + @sexo
		puts "Localizacao: " + @local.to_s
	end

end

class Funcionario < Pessoa

	attr_accessor :salario, :cargo

	def initialize(nome = "indef" , data = nil, sexo = "Indefinido", local = "0.0", 
				salario = 0, cargo = "Indefinido")

		super(nome, data, sexo, local)
	
		if(salario < 0 or salario > 10000)
			@salario = 0
		else
			@salario = salario
		end
	
		@cargo = validateCargo(cargo)

	end

	def validateCargo(string)
		cargo = string.downcase
		if(cargo == "programador" or cargo == "analista" or cargo == "gerente de projeto" or cargo == "gerente de equipe" or cargo == "diretor")
			@cargo = string
		else
			@cargo = "Indefinido"
		end
	end

	def printInfo
		puts "Nome: " + @nome
		puts "Data de Nascimento: " + @data.to_s
		puts "Idade: " + @idade.to_s
		puts "Sexo: " + @sexo
		puts "Localizacao: " + @local.to_s
		puts "Salario: " + @salario.to_s
		puts "Cargo: " + @cargo
	end
end


func1 = Funcionario.new("Joao Silva", "07/10/2002", "masculino", "7.5", 2500, "Programador" )
func2 = Funcionario.new("Helena Medeiros", "15/12/1978", "feminino", "12.48", 3400, "Analista" )
func3 = Funcionario.new("Jose Cadanha", "14/02/1989", "masculino", "14.78", 2800, "Gerente de Projeto" )
func4 = Funcionario.new("Joao Soares", "21/05/1988", "masculino", "15.78", 5000, "Gerente de equipe" )
func5 = Funcionario.new("Henrique Vieira", "06/06/1987", "feminino", "68.75", 6800, "Diretor" )
pessoa1 = Pessoa.new("Maria Pimentel", "15/07/2000", "feminino", "100.15")
pessoa2 = Pessoa.new("Rafael da Cunha", "04/02/1989", "masculino", "11.12")
pessoa3 = Pessoa.new("Juarez Roth", "13/11/1972", "masculino", "45.78")
pessoa4 = Pessoa.new("Luisa Rodriguez", "15/03/1999", "feminino", "78.12")
pessoa5 = Pessoa.new("Julio Seben", "17/08/1996", "masculino", "46.43")


pessoas = [ func1, func2, func3, func4, func5, pessoa1, pessoa2, pessoa3, pessoa4, pessoa5]


for i in 0..9
	pessoas[i].printInfo
	puts "====================================="
end



=begin

Ruby nao suporta heranca multipla, no entanto ela pode ser simulada atraves do uso de modulos, 
como no seguinte trecho de pseudocodigo:

module A
  def a1
  end

  def a2
  end
end

module B
  def b1
  end

  def b2
  end
end

class Sample
  include A
  include B

  def s1
  end
end

Neste exemplo o modulo A possui dois metodos e o modulo B possui igualmente dois metodos, no entanto a classe Sample
inclui os dois modulos, conseguindo assim, acessar todos os quatro metodos

=end

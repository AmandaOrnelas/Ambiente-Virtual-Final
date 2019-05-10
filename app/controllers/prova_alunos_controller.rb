class ProvaAlunosController < ApplicationController


  	def index
    	@prova_aluno = ProvaAluno.all
  	end

  	def show
    	@prova_aluno = ProvaAluno.find(params[:id])
  	end

	def new
  		@prova_aluno = ProvaAluno.new
	end

 	def edit
  		@prova_aluno = ProvaAluno.find(params[:id])
	end

	def create
  		@prova_aluno = ProvaAluno.new(prova_aluno_params)

  		if @prova_aluno.save
    		redirect_to @prova_aluno
  		else
    		render 'new'
 	 	end
	end

  def update
    prova_aluno = ProvaAluno.find(params[:id])
    prova_aluno.update!(resposta1: params[:prova_aluno][:resposta1])

		# @tempo_capitulo = TempoCapitulo.find(params[:id])

	 # 	if @tempo_capitulo.update(tempo_capitulo_params)
	 #    	redirect_to @tempo_capitulo
	 #  	else
	 #    	render 'edit'
	 #  	end
	end




 
  private
    def prova_aluno_params
      params.require(:prova_aluno).permit(:resposta1, :resposta2, :resposta3, :resposta4, :resposta5, :resposta6, :resposta7, :resposta8, :resposta9, :resposta10, :user_id)
    end


end

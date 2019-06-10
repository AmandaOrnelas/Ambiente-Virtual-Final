class ProvaAlunosController < ApplicationController


  	def index
    	@prova_aluno = ProvaAluno.all
  	end

  	def show
    	@prova_aluno = ProvaAluno.find(params[:id])
      @user = User.find(current_user.id)
  	end

	def new
      capitulo = params[:capitulo]
      @avaliacao = Avaliacao.find_by(capitulo_id: capitulo)

  		@prova_aluno = ProvaAluno.new
	end

 	def edit
  		@prova_aluno = ProvaAluno.find(params[:id])
	end

	def create
    
    @capitulo = params[:capitulo]
    @avaliacao = Avaliacao.find_by(capitulo_id: @capitulo)
    
    resultado_final = [params[:resp0], params[:resp1], params[:resp2], 
    params[:resp3], params[:resp4], params[:resp5], params[:resp6], 
    params[:resp7], params[:resp8], params[:resp9]]

    @nota_final = calcular_nota(@avaliacao, resultado_final)

    @prova_aluno = ProvaAluno.new(
      resposta1: params[:resp0],
      resposta2: params[:resp1],
      resposta3: params[:resp2],
      resposta4: params[:resp3],
      resposta5: params[:resp4],
      resposta6: params[:resp5],
      resposta7: params[:resp6],
      resposta8: params[:resp7],
      resposta9: params[:resp8],
      resposta10: params[:resp9],
      user_id: current_user.id,
      avaliacao_id: @avaliacao.id,
      nota: @nota_final
    )

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

    def calcular_nota(avaliacao_id_object, resultado_final)
      @questao = buscaquestao(avaliacao_id_object)
      @resultado = @questao.zip(resultado_final)
      puts "++++++++++++++++++++++++#{@questao}"
      puts "++++++++++++++++++++++++#{@resultado}"
      @resultado = @resultado.map { |questao, resultado| questao if questao == resultado  }
      @resultado = @resultado.compact
      @resultado.count
      
    end

    def buscaquestao(avaliacao_id_object)
      @questao = Questao.where(avaliacao_id: avaliacao_id_object)
      @questao.map(&:respostacerta)
    end

    def prova_aluno_params
      params.require(:prova_aluno).permit(:resposta1, :resposta2, :resposta3, :resposta4, :resposta5, :resposta6, :resposta7, :resposta8, :resposta9, :resposta10, :user_id, :avaliacao_id, :nota)
    end


end

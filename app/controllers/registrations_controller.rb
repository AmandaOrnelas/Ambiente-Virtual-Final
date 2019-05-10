class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name, :nivel, :email, :password, :password_confirmation)
    super
    	@prova_aluno = ProvaAluno.find 1 
    	render '@prova_aluno/new'
  end

  def account_update_params
    params.require(:user).permit(:name, :nivel, :email, :password, :password_confirmation)
  end
end
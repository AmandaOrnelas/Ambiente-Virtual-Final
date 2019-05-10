class AddProvaAlunoRefToQuestao < ActiveRecord::Migration[5.1]
  def change
    add_reference :questaos, :prova_aluno, foreign_key: true
  end
end

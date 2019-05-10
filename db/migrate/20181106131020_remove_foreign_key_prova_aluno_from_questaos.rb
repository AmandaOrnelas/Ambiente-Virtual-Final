class RemoveForeignKeyProvaAlunoFromQuestaos < ActiveRecord::Migration[5.1]
  def change
    remove_column :questaos, :prova_aluno_id, :integer
  end
end

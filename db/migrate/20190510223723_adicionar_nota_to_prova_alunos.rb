class AdicionarNotaToProvaAlunos < ActiveRecord::Migration[5.1]
  def change
  	 add_column :prova_alunos, :nota, :text
  end
end

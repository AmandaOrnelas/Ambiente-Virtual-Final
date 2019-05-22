class ProvaAluno < ApplicationRecord
  has_many :avaliacao
  belongs_to :user
end

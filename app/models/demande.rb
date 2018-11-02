class Demande < ApplicationRecord
    validates :date_debut ,:presence=>true, length: {maximum:20,minimum:8}
    validates :date_fin ,:presence=>true, length: {maximum:20,minimum:8}
    validates :raison ,:presence=>true, length: {minimum:2}

    belongs_to :user
end

class Subscrition < ApplicationRecord
    belogns_to(:user, dependent: :destroy)
    belogns_to(:category, dependent: :destroy)
end

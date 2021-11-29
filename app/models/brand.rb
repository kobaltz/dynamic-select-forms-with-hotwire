class Brand < ApplicationRecord
  has_many :generations
  has_many :processors, through: :generations
end

class Generation < ApplicationRecord
  belongs_to :brand
  has_many :processors
end

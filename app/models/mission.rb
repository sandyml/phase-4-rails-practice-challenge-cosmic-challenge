class Mission < ApplicationRecord
  belongs_to :scientist
  belongs_to :planet
 
  validates :name, :scientist, :planet, presence: true
  # a scientist cannot join the same mission twice
 
  # Mission >- Scientist
  validates :scientist, uniqueness: { scope: :name }
end

class Tool < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :name,
            :quantity,
            :price, presence: true
end

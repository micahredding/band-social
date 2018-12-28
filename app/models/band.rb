class Band < ApplicationRecord
  belongs_to :user

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :description
end

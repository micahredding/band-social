class Band < ApplicationRecord
  belongs_to :manager, class_name: "User", foreign_key: "manager"
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :description
end

class Question < ActiveRecord::Base
  belongs_to(:surveys)
  has_many(:responses, :dependent => :destroy)
  validates(:question, {presence: :true})
end

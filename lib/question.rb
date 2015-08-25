class Question < ActiveRecord::Base
  belongs_to(:surveys)
  has_many(:responses)
  validates(:question, {presence: :true})
end

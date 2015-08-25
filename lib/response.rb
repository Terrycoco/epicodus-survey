class Response < ActiveRecord::Base
  belongs_to(:questions)
  validates(:response, {:presence => true} )
end

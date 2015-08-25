class Survey < ActiveRecord::Base
  has_many(:questions)
  before_save(:title_upcase)
  
private
   define_method (:title_upcase) do
    self.title = title.upcase()
   end
end

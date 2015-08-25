class Survey < ActiveRecord::Base
  has_many(:questions)
  validates(:title, {presence: true})
  validates_uniqueness_of(:title)
  before_save(:title_upcase)


private
   define_method (:title_upcase) do
    self.title = title.upcase()
   end


end

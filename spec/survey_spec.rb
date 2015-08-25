require('spec_helper.rb')

describe(Survey) do

  describe("#title_upcase") do
    it('upcases title on input') do
      surv = Survey.new({:title => 'epicodus survey'})
      surv.save()
      expect(surv.title).to(eq('EPICODUS SURVEY'))
    end
  end


end

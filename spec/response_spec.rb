require 'spec_helper'

describe Response do

  describe '#validates' do
    it 'will return an error if there is no input' do
    test_response = Response.new({response: ''})
    expect(test_response.save()).to eq false
    end
  end
end

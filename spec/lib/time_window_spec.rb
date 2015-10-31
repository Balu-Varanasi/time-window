require 'spec_helper'
require 'hirb'
require 'pry'

describe TimeWindow do
  it 'should return data for a named element' do
    expect(TimeWindow.hi).to eq('Hello world!')
  end
end

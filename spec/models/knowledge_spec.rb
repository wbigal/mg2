require 'spec_helper'

describe Knowledge do
  it 'private new' do
    expect { Knowledge.new }.to raise_error(NoMethodError)
  end
end

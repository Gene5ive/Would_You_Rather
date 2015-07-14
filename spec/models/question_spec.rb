require 'rails_helper'

describe Question do
  it {should validate_presence_of :option_one}
  it {should validate_presence_of :option_two}
end

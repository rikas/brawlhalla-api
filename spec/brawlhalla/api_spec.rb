# frozen_string_literal: true

RSpec.describe Brawlhalla::Api do
  it 'has a version number' do
    expect(Brawlhalla::Api::VERSION).not_to be nil
  end
end

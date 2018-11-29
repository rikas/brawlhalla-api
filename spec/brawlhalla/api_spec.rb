# frozen_string_literal: true

RSpec.describe Brawlhalla::API do
  it 'has a version number' do
    expect(Brawlhalla::API::VERSION).not_to be nil
  end
end

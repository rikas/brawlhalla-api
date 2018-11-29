# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :rubocop do
  sh 'rubocop --format simple || true'
end

task default: %i[rubocop spec]

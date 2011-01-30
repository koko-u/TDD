# -*- coding: utf-8 -*-
require 'rake'
require 'rspec/core/rake_task'


desc "すべての Spec を実行"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = './*_spec.rb'
  t.rspec_opts = %w[--color]
  t.verbose = false
end

task :default => [:spec]



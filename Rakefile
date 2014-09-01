#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end
begin
  require 'rdoc/task'
rescue LoadError
  require 'rdoc/rdoc'
  require 'rake/rdoctask'
  RDoc::Task = Rake::RDocTask
end

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Goodies'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end




Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

desc 'Imports skins to proper vendor places'
task :import_skins, :directory do |t, args|
  require 'fileutils'
  directory = args[:directory]
  unless File.directory? directory
    puts 'expects a directory'
    exit
  end
  skins = 
    Dir.entries(directory).select do |entry|
      !(entry =~ /^\./) && File.directory?(File.join(directory,entry))
    end

  skins.each do |skin|
    skin_dir = "vendor/assets/stylesheets/icheck/#{skin}"
    FileUtils.mkdir_p(skin_dir) 
    replacement = 'url(/assets/icheck/'+skin+'/\1)'
    Dir.entries(File.join(directory,skin)).select{ |file| file =~ /\.css$/ }.each do |css|
      new_css = File.read(File.join(directory,skin,css)).gsub /url\((.*)\)/, replacement
      File.open("#{skin_dir}/#{css}", 'wb'){ |f| f.write(new_css) }
    end

    img_dir = "vendor/assets/images/icheck/#{skin}"
    FileUtils.mkdir_p(img_dir)
    Dir.entries(File.join(directory,skin)).select{ |file| file =~ /\.png$/ }.each do |png|
      new_png = File.read(File.join(directory,skin,png))
      File.open("#{img_dir}/#{png}", 'wb'){ |f| f.write(new_png) }
    end
  end
end

task :default => :test

puts 'SETTING UP DEFAULT USER LOGIN'
user = User.find_or_create_by_email :email => 'admin@admin.com', :password => '1please', :password_confirmation => '1please'

unless defined?(Rake)
  require "rake"
  Rake.load_rakefile('Rakefile')
end
Rake::Task['update'].invoke

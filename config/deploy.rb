# $:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require 'rvm/capistrano'
require 'capistrano/ext/multistage'
require 'bundler/capistrano'

 set :stages, %w(staging production)
 set :default_stage, "production"

default_run_options[:pty] = true
#
set :application, "Matraskin"
set :use_sudo, false



 set :keep_releases, 5
 set :rvm_ruby_string, '1.9.3-p327@matraskin'
 set :rvm_type, :system

 server '31.130.203.132', :app, :web, :db, :primary => true
 set :user, "matraskin"

 set :deploy_to, "/home/#{user}/www/#{user}"
 set :rails_env, "production"

 set :scm, :git
 set :repository, "git@bitbucket.org:faron/mattress_shop.git"
 set :branch, "master"
 set :deploy_via, :remote_cache
 set :copy_exclude, [ '.git' ]

 set :rails_root, File.expand_path('../..', __FILE__)

 ssh_options[:forward_agent] = true


 load 'config/deploy/recipes/common'
 #load 'config/deploy/recipes/assets'
 #load 'config/deploy/recipes/solr'
 load 'config/deploy/recipes/mysql'
 #load 'config/deploy/recipes/database'
 load 'config/deploy/recipes/thin'
 load 'config/deploy/recipes/nginx'
 load 'config/deploy/recipes/rvm'
 #load 'config/deploy/recipes/unicorn'
 #load 'config/deploy/recipes/mmonit'
 #load 'config/deploy/recipes/memcached'
 #load 'config/deploy/recipes/redis'
 #load 'config/deploy/recipes/private_pub'
 #load 'config/deploy/recipes/monit'
 #load 'config/deploy/recipes/neo4j'
 #load 'config/deploy/recipes/resque'
 #load 'config/deploy/recipes/snort'
 #load 'config/deploy/recipes/database_backup'
 #load 'config/deploy/recipes/files_backup'

  namespace :deploy do
    desc 'Create symlinks for robots.txt and sitemap.xml'
    task :symlink_seo do
      %w[sitemap.xml robots.txt].each do |f|
        run "touch #{shared_path}/#{f} && ln -sf #{shared_path}/#{f} #{current_path}/public/#{f}"
      end
    end
    after 'deploy:symlink', 'deploy:symlink_seo'
  end

 after "deploy:restart", "deploy:cleanup"

 before "deploy:assets:precompile", "deploy:stop"

set_default(:monit_folder) { "/var/lib/monit"}

namespace :monit do
  desc "Install Monit"
  task :install do
    run "#{sudo} yum -y install monit"
    
    make_folders_and_daemonize
  end
  after "deploy:install", "monit:install"

  desc "Setup all Monit configuration"
  task :setup do
    monit_config "monit.conf", monit_config_file
    
    # frontend tracked stuff
    nginx
    unicorn
    private_pub
    memcached
    mmonit if rails_env == "production"
    resque

    # common tracked stuff

    # backend tracked stuff
    mysql
    solr
    neo4j
    redis

    # and reload
    reload
  end
  after "deploy:setup", "monit:setup"
  
  task(:nginx, roles: :web) { monit_config "nginx" }
  task(:unicorn, roles: :web) { monit_config "unicorn" }
  task(:private_pub, roles: :web) { monit_config "private_pub" }
  task(:memcached, roles: :web) { monit_config "memcached" }
  task(:mmonit, roles: :web) { monit_config "mmonit" }
  
  task(:mysql, roles: :db) { monit_config "mysql" }
  task(:solr, roles: :db) { monit_config "solr" }
  task(:neo4j, roles: :db) { monit_config "neo4j" }
  task(:redis, roles: :redis) { monit_config "redis" }

  task :resque, roles: lambda { resque_workers() } do
    for_each_workers do |role, workers|
      set(:current_workers, workers)

      monit_config "resque", "#{monit_config_folder}resque_#{role}.conf", { :roles => role }
    end
  end

  %w[start stop restart reload].each do |command|
    desc "Run Monit #{command} script"
    task command do
      run "#{sudo} service monit #{command}"
    end
  end
end

def make_folders_and_daemonize
  run "#{sudo} mkdir -p #{monit_folder}"
  if rails_env == "production"
    run "#{sudo} chkconfig --add /etc/init.d/monit"
  end
end

def monit_config(name, destination = nil, server_options = {})
  destination ||= "#{monit_config_folder}#{name}.conf"
  template "monit/#{name}", "/tmp/monit_#{name}", server_options
  run "#{sudo} mv /tmp/monit_#{name} #{destination}", server_options
  run "#{sudo} chown root #{destination}", server_options
  run "#{sudo} chmod 600 #{destination}", server_options
end
set_default(:unicorn_user) { user }
set_default(:unicorn_pid) { "#{current_path}/tmp/pids/unicorn.pid" }
set_default(:unicorn_config) { "#{shared_path}/config/unicorn.rb" }
set_default(:unicorn_log) { "#{shared_path}/log/unicorn.log" }
set_default(:unicorn_workers, 4)

namespace :unicorn do
  desc "Setup Unicorn initializer and web configuration"
  task :setup, roles: :web do
    run "mkdir -p #{shared_path}/config"
    template "unicorn.rb", unicorn_config
    template "unicorn_init", "/tmp/unicorn_init"
    run "chmod +x /tmp/unicorn_init"
    run "#{sudo} mv /tmp/unicorn_init /etc/init.d/unicorn_#{application}"
    if rails_env == "staging"
      run "#{sudo} update-rc.d -f unicorn_#{application} defaults"
    else
      run "#{sudo} chkconfig --add /etc/init.d/unicorn_#{application}"
    end
  end
  after "deploy:setup", "unicorn:setup"

  %w[start stop restart].each do |command|
    desc "#{command} unicorn"
    task command, roles: :web do
      run "#{sudo} /etc/init.d/unicorn_#{application} #{command}"
    end
    after "deploy:#{command}", "unicorn:#{command}"
  end
end

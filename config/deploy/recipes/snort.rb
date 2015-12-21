set_default(:snort_config_file) { "/etc/snort/snort.conf"}
set_default(:pulledpork_pl) { "/opt/pulledpork-0.6.1/pulledpork.pl"}
set_default(:pulledpork_config_file) { "/opt/pulledpork-0.6.1/etc/pulledpork.conf"}

namespace :snort do
  desc "Setup all Monit configuration"
  task :setup do
    template "snort.conf", "/tmp/snort.conf"
    run "#{sudo} mv /tmp/snort.conf #{snort_config_file}"
    run "#{sudo} chown snort:snort #{snort_config_file}"

    template "pulledpork.conf", "/tmp/pulledpork.conf"
    run "#{sudo} mv /tmp/pulledpork.conf #{pulledpork_config_file}"
  end
  after "deploy:setup", "snort:setup"

  %w[start stop restart].each do |command|
    desc "Run Snort #{command} script"
    task command do
      run "#{sudo} /etc/init.d/snort #{command}"
    end
  end

  desc "Runs pulledpork script to update Snort rules to latest ones"
  task :pulledpork do
    run "#{sudo} #{pulledpork_pl} -c #{pulledpork_config_file} -vv"
  end
end

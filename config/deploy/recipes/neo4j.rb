set_default(:neo4j_pid) { "/usr/local/neo4j/data/neo4j-service.pid" }

namespace :neo4j do
  %w[start stop restart].each do |command|
    desc "#{command} neo4j-service"
    task command, roles: :db do
      run "#{sudo} /etc/init.d/neo4j-service #{command}"
    end
  end
end
app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"

environment 'production'
threads 1, 6
workers 2

bind "unix://#{shared_dir}/sockets/puma.sock"
pidfile "#{shared_dir}/pids/puma.pid"
state_path "#{shared_dir}/sockets/puma.state"

stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

preload_app!

on_worker_boot do
  require "active_record"
  ActiveRecord::Base.connection.disconnect! rescue ActiveRecord::ConnectionNotEstablished
  ActiveRecord::Base.establish_connection(YAML.load_file("#{app_dir}/config/database.yml")["production"])
end

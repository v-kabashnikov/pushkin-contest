lock '3.4.0'

set :application, 'pushkin'
set :repo_url, 'git@github.com:Saicheg/pushkin-contest.git'

set :deploy_to, '/var/www/pushkin/'

set :linked_files, %w{config/database.yml}

set :linked_dirs, %w{log tmp/pids public/assets tmp/cache tmp/sockets vendor/bundle public/system}

set :unicorn_config_path, "config/unicorn.rb"

set :ssh_options, { :forward_agent => true }

set :pty,  false

set :rvm_ruby_version, '2.2.1@pushkin-contest'

set :sidekiq_config, "#{current_path}/config/sidekiq.yml"
set :sidekiq_processes, 1
set :sidekiq_log, "#{current_path}/log/sidekiq.log"
set :sidekiq_role, :sidekiq

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'unicorn:restart'
    end
  end

  after :publishing, :restart
end

require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'
require 'mina/unicorn'
require 'dotenv/load'


ENV['DEPLOY_ENV'] ||= 'production'
ENV['DEPLOY_BRANCH'] ||= 'master'

set :domain, ENV['DEPLOY_HOST']
set :user, ENV['DEPLOY_USER']

set :sudo, 'true'
set :rvm_use_path, '/usr/local/rvm/scripts/rvm'
set :rails_env, ENV['DEPLOY_ENV']

set :deploy_to, "/var/www/#{ENV['DEPLOY_ENV']}/extranet"

set  :repository, 'https://github.com/codhab/extranet.git'
set  :branch, ENV['DEPLOY_BRANCH']

set :shared_dirs, fetch(:shared_dirs, []).push('log', 'tmp/pids', 'tmp/sockets', 'public')
set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/unicorn.rb', '.env', 'config/secrets.yml')

task :setup do
  command %[touch "#{fetch(:shared_path)}/config/database.yml"]
  command %[touch  "#{fetch(:shared_path)}/config/.env"]
end


task :deploy do
  deploy do
    invoke :'rvm:use', '2.6.0'
    invoke  :'git:clone'
    invoke  :'deploy:link_shared_paths'
    invoke  :'bundle:install'
    invoke  :'rails:assets_precompile'
    invoke  :'deploy:cleanup'
    on :launch do
      invoke :'unicorn:restart'
    end
  end
end

task :log_rails do
  command %[tail -n 1000 "#{fetch(:shared_path)}/log/production.log"]
end
  
task :log_unicorn_stdout do 
  command %[tail -n 1000 "#{fetch(:shared_path)}/log/unicorn.stdout.log"]
end

task :log_unicorn_stderr do
  command %[tail -n 1000 "#{fetch(:shared_path)}/log/unicorn.stderr.log"]
end
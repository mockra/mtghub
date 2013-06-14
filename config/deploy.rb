require "bundler/capistrano"
load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/postgresql"
load "config/recipes/nodejs"
load "config/recipes/rbenv"
load "config/recipes/check"

server "198.199.95.250", :web, :app
server "198.199.112.62", :db, primary: true, :no_release => true

set :application, "mtghub"
set :user, "root"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :rake, "#{rake} --trace"

set :scm, "git"
set :repository, "git@github.com:mockra/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "mockra.pem")]

after "deploy", "deploy:cleanup"

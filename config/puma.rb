rails_env = ENV['RAILS_ENV'] || 'development'

threads 4,4

bind  "unix:///home/root/apps/mtghub/shared/pids/mtghub-puma.sock"
pidfile "/home/root/apps/mtghub/current/tmp/puma/pid"
state_path "/home/root/apps/mtghub/current/tmp/puma/state"

activate_control_app

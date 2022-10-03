# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"

set :application, "Resume"

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/app/project/resume"

#Git
set :repo_url, "git@github.com:petrovsmile/resume.git"
set :branch, 'main'

#RVM
set :rvm_type, :user
set :rvm_ruby_version, '3.0.0'

#PUMA

set :puma_nginx, :app
#set :nginx_sites_available_path, "/home/app/nginx.conf"
#set :nginx_sites_enabled_path, "/home/app/nginx.conf/sites-enabled"
set :nginx_use_http2, true
set :nginx_server_name, "petrov-smile.ru"
set :nginx_use_ssl, true
set :nginx_ssl_certificate, "/etc/letsencrypt/live/petrov-smile.ru/fullchain.pem"
set :nginx_ssl_certificate_key, "/etc/letsencrypt/live/petrov-smile.ru/privkey.pem"
set :puma_enable_socket_service, true
set :puma_phased_restart, true
set :puma_enable_socket_service, true

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, 'config/master.key'

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 2

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure


namespace :deploy do
  namespace :check do
    before :linked_files, :set_master_key do
      on roles(:app), in: :sequence, wait: 10 do
        unless test("[ -f #{shared_path}/config/master.key ]")
          upload! 'config/master.key', "#{shared_path}/config/master.key"
        end
      end
    end
  end
end
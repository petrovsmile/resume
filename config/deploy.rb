set :repo_url, 'git@github.com:petrovsmile/resume.git'
set :branch, "main"
set :application, 'resume'
application = 'resume'
set :rvm_type, :user
set :rvm_ruby_version, '3.0.0'
set :deploy_to, "/home/app/project/resume/"


set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/assets}

set :linked_files, %w{config/secrets.yml config/database.yml config/boot.rb config/application.rb}


namespace :setup do
  desc 'Загрузка конфигурационных файлов на удаленный сервер'
  task :upload_config do
    on roles :all do
      execute :mkdir, "-p #{shared_path}"
      ['shared/config'].each do |f|
        upload!(f, shared_path, recursive: true)
      end
    end
  end
end

namespace :nginx do
  desc 'Создание симлинка в /etc/nginx/conf.d на nginx.conf приложения'
  task :append_config do
    on roles :all do
      sudo :ln, "-fs #{shared_path}/config/nginx.conf /etc/nginx/conf.d/#{fetch(:application)}.conf"
    end
  end
  desc 'Релоад nginx'
  task :reload do
    on roles :all do
      sudo :service, :nginx, :reload
    end
  end
  desc 'Рестарт nginx'
  task :restart do
    on roles :all do
      sudo :service, :nginx, :restart
    end
  end
  after :append_config, :restart
end

# namespace :application do
#   desc 'Запуск Thin'
#   task :start do
#     on roles(:app) do
#       execute "cd #{release_path} && ~/.rvm/bin/rvm default do bundle exec thin -C config/thin.yml -R config.ru -a 127.0.0.1 -p 8080 start  -s3 --socket /home/app/project/resume/shared/tmp/pids/thin.sock --pid /home/app/project/resume/shared/tmp/pids/thin.pid"
#     end
#   end
#   desc 'Завершение Thin'
#   task :stop do
#     on roles(:app) do      
#       execute "if [ -f /home/app/project/resume/shared/tmp/pids/thin.0.pid ] && [ -e /proc/$(cat /home/app/project/resume/shared/tmp/pids/thin.0.pid) ]; then kill -9 `cat /home/app/project/resume/shared/tmp/pids/thin.0.pid`; fi"
#       execute "if [ -f /home/app/project/resume/shared/tmp/pids/thin.1.pid ] && [ -e /proc/$(cat /home/app/project/resume/shared/tmp/pids/thin.1.pid) ]; then kill -9 `cat /home/app/project/resume/shared/tmp/pids/thin.1.pid`; fi"
#       execute "if [ -f /home/app/project/resume/shared/tmp/pids/thin.2.pid ] && [ -e /proc/$(cat /home/app/project/resume/shared/tmp/pids/thin.2.pid) ]; then kill -9 `cat /home/app/project/resume/shared/tmp/pids/thin.2.pid`; fi"

#       execute "cd #{release_path} && ~/.rvm/bin/rvm 2.6.3 do bundle exec rake db:migrate RAILS_ENV=production"
#     end
#   end
# end


namespace :deploy do

ask(:message, "Commit message?")


  after :finishing, 'application:stop'
  after :finishing, 'application:start'
  after :finishing, :cleanup
end

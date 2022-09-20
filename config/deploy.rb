set :repo_url, 'git@bitbucket.org:Mirkom63/resume.git'
set :application, 'resume'
application = 'resume'
set :rvm_type, :user
set :rvm_ruby_version, '2.6.3'
set :keep_releases, 2
set :deploy_to, "/home/app/project/resume/"


set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/assets public/system public/sitemaps/air_crafts public/sitemaps/pages public/sitemaps/search public/tmp }
set :linked_files, %w{config/secrets.yml config/database.yml config/boot.rb}

set :unicorn_config, "#{shared_path}/config/unicorn.rb"
set :unicorn_pid, "#{shared_path}/run/unicorn.pid"



namespace :setup do
  desc 'Загрузка конфигурационных файлов на удаленный сервер'
  task :upload_config do
    on roles :all do
      execute :mkdir, "-p #{shared_path}"
      ['shared/config', 'shared/run'].each do |f|
        upload!(f, shared_path, recursive: true)
      end
    end
  end
end




namespace :application do


  desc 'Запуск'
  task :start do
    on roles(:app) do

      execute "cd #{release_path} && ~/.rvm/bin/rvm default do bundle exec rake db:migrate RAILS_ENV=production"

      require 'mysql2'
      client = Mysql2::Client.new(:host => "185.178.46.84", :username => "root", :password => '2E&GlxKL%8R1', :database => 'resume')
      results = client.query("SELECT * FROM deploy_sites WHERE code_server='resume'")
      results.each do |info|
        if info['site_1']=='0'

          execute "if [ -f /home/app/project/resume/shared/tmp/pids/thin_1.0.pid ] && [ -e /proc/$(cat /home/app/project/resume/shared/tmp/pids/thin_1.0.pid) ]; then kill -9 `cat /home/app/project/resume/shared/tmp/pids/thin_1.0.pid`; fi"
          execute "if [ -f /home/app/project/resume/shared/tmp/pids/thin_1.1.pid ] && [ -e /proc/$(cat /home/app/project/resume/shared/tmp/pids/thin_1.1.pid) ]; then kill -9 `cat /home/app/project/resume/shared/tmp/pids/thin_1.1.pid`; fi"
          execute "if [ -f /home/app/project/resume/shared/tmp/pids/thin_1.2.pid ] && [ -e /proc/$(cat /home/app/project/resume/shared/tmp/pids/thin_1.2.pid) ]; then kill -9 `cat /home/app/project/resume/shared/tmp/pids/thin_1.2.pid`; fi"

          execute "cd #{release_path} && ~/.rvm/bin/rvm default do bundle exec thin -C config/thin.yml -R config.ru -a 127.0.0.1 -p 8080 start  -s3 --socket /home/app/project/resume/shared/tmp/pids/thin_1.sock --pid /home/app/project/resume/shared/tmp/pids/thin_1.pid"

        else

          execute "if [ -f /home/app/project/resume/shared/tmp/pids/thin_2.0.pid ] && [ -e /proc/$(cat /home/app/project/resume/shared/tmp/pids/thin_2.0.pid) ]; then kill -9 `cat /home/app/project/resume/shared/tmp/pids/thin_2.0.pid`; fi"
          execute "if [ -f /home/app/project/resume/shared/tmp/pids/thin_2.1.pid ] && [ -e /proc/$(cat /home/app/project/resume/shared/tmp/pids/thin_2.1.pid) ]; then kill -9 `cat /home/app/project/resume/shared/tmp/pids/thin_2.1.pid`; fi"
          execute "if [ -f /home/app/project/resume/shared/tmp/pids/thin_2.2.pid ] && [ -e /proc/$(cat /home/app/project/resume/shared/tmp/pids/thin_2.2.pid) ]; then kill -9 `cat /home/app/project/resume/shared/tmp/pids/thin_2.2.pid`; fi"

          execute "cd #{release_path} && ~/.rvm/bin/rvm default do bundle exec thin -C config/thin.yml -R config.ru -a 127.0.0.1 -p 8080 start  -s3 --socket /home/app/project/resume/shared/tmp/pids/thin_2.sock --pid /home/app/project/resume/shared/tmp/pids/thin_2.pid"
          
        end
      end

    end
  end
  desc 'Завершение'
  task :stop do
    on roles(:app) do

      #crontab
      execute "cd #{release_path} && ~/.rvm/bin/rvm default do bundle exec whenever --update-crontab --load-file /home/app/project/resume/current/config/schedule.rb --set 'environment=production&path=/home/app/project/resume/current'"


      sleep(30)

      require 'mysql2'
      client = Mysql2::Client.new(:host => "185.178.46.84", :username => "root", :password => '2E&GlxKL%8R1', :database => 'resume')
      results = client.query("SELECT * FROM deploy_sites WHERE code_server='resume'")
      results.each do |info|
        if info['site_1']=='0'

          execute "cd #{release_path}/config/deploy/ && ruby nginx_update_config.rb thin_1"
          execute :sudo, "service nginx reload"

          execute "if [ -f /home/app/project/resume/shared/tmp/pids/thin_2.0.pid ] && [ -e /proc/$(cat /home/app/project/resume/shared/tmp/pids/thin_2.0.pid) ]; then kill -9 `cat /home/app/project/resume/shared/tmp/pids/thin_2.0.pid`; fi"
          execute "if [ -f /home/app/project/resume/shared/tmp/pids/thin_2.1.pid ] && [ -e /proc/$(cat /home/app/project/resume/shared/tmp/pids/thin_2.1.pid) ]; then kill -9 `cat /home/app/project/resume/shared/tmp/pids/thin_2.1.pid`; fi"
          execute "if [ -f /home/app/project/resume/shared/tmp/pids/thin_2.2.pid ] && [ -e /proc/$(cat /home/app/project/resume/shared/tmp/pids/thin_2.2.pid) ]; then kill -9 `cat /home/app/project/resume/shared/tmp/pids/thin_2.2.pid`; fi"


          results = client.query("UPDATE deploy_sites SET site_1=1, site_2=0 WHERE code_server='resume'")

        else

          execute "cd #{release_path}/config/deploy/ && ruby nginx_update_config.rb thin_2"
          execute :sudo, "service nginx reload"

          execute "if [ -f /home/app/project/resume/shared/tmp/pids/thin_1.0.pid ] && [ -e /proc/$(cat /home/app/project/resume/shared/tmp/pids/thin_1.0.pid) ]; then kill -9 `cat /home/app/project/resume/shared/tmp/pids/thin_1.0.pid`; fi"
          execute "if [ -f /home/app/project/resume/shared/tmp/pids/thin_1.1.pid ] && [ -e /proc/$(cat /home/app/project/resume/shared/tmp/pids/thin_1.1.pid) ]; then kill -9 `cat /home/app/project/resume/shared/tmp/pids/thin_1.1.pid`; fi"
          execute "if [ -f /home/app/project/resume/shared/tmp/pids/thin_1.2.pid ] && [ -e /proc/$(cat /home/app/project/resume/shared/tmp/pids/thin_1.2.pid) ]; then kill -9 `cat /home/app/project/resume/shared/tmp/pids/thin_1.2.pid`; fi"


          results = client.query("UPDATE deploy_sites SET site_2=1, site_1=0 WHERE code_server='resume'")

        end
      end



    end
  end
end




namespace :deploy do
    after :finishing, 'application:start'
    after :finishing, 'application:stop'
    after :finishing, :cleanup
end

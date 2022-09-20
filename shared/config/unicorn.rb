# frozen_string_literal: true

# Рабочие директории приложения на сервере
root        = '/home/app/project/an4k/'
rails_root  = "#{root}/current"

# Файлы, хранящие идентификаторы запущенных Unicorn-процессов
pidfile     = '/home/app/project/an4k/shared/run/unicorn.pid'
pidfile_old = pidfile + '.oldbin'
pid pidfile

# Главные параметры
worker_processes 1
preload_app true
timeout 60

# Путь к сокету
listen '/home/app/project/an4k/shared/run/unicorn.sock', backlog: 1024

# Путь к лог-файлам
stderr_path '/home/app/project/an4k/current/log/unicorn_error.log'
stdout_path '/home/app/project/an4k/current/log/unicorn.log'

# Установки сборщика мусора
GC.copy_on_write_friendly = true if GC.respond_to?(:copy_on_write_friendly=)

# Блок инструкций, выполняемых до запуска сервера
before_exec do |_server|
  ENV['BUNDLE_GEMFILE'] = '/home/app/project/an4k/Gemfile'
end

# Инструкции для управления воркерами и состоянием соединения с БД

before_fork do |server, _worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!
  if File.exist?(pidfile_old) && server.pid != pidfile_old
    begin
      Process.kill('QUIT', File.read(pidfile_old).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |_server, _worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.establish_connection
end

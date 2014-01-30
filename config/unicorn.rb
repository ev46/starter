root = "home/deploy/activemenu/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.activemenu.sock"
worker_process 2
timeout 30

before_exec do |_|
	ENV["BUNDLE_GEMFILE"] = File.join(root, 'Gemfile')
end
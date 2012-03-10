worker_processes 2
working_directory "/var/www/4pcbr.com/"
listen '127.0.0.1:7171', :tcp_nopush => true
timeout 60
pid "/var/www/4pcbr.com/tmp/unicorn.pid"
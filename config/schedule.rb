set :output, "/var/www/brewbit.com/current/log/cron.log"

every 1.minutes, :roles => [:web] do
   rake "brewbit:check_device_connections"
end


cookbook_file "nginx__sites-available__brewbit.com" do
  path "/etc/nginx/sites-available/brewbit.com"
  action [ :delete, :create ]
end

link "/etc/nginx/sites-enabled/brewbit.com" do
  to "/etc/nginx/sites-available/brewbit.com"
end

cron_d "backup" do
  minute "0"
  hour "0"
  user "deploy"
  command %Q{
    cd /var/www/brewbit.com/current && env RAILS_ENV="production" backup perform --root-path ./backup --trigger db
  }
end

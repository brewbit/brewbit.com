
cookbook_file "nginx__sites-available__brewbit.com" do
  path "/etc/nginx/sites-available/brewbit.com"
  action [ :delete, :create ]
end

link "/etc/nginx/sites-enabled/brewbit.com" do
  to "/etc/nginx/sites-available/brewbit.com"
end

cookbook_file "/etc/cron.daily/backup" do
  source "etc/cron.daily/backup"
  owner "root"
  group "root"
  mode 0755
end

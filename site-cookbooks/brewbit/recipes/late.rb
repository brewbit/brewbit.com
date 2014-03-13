
cookbook_file "/etc/nginx/sites-available/brewbit.com" do
  source "etc/nginx/sites-available/brewbit.com"
  owner "root"
  group "root"
  mode 0644
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

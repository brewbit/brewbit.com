
template "/etc/nginx/sites-available/#{ node[:brewbit][:hostname] }" do
  source "etc/nginx/sites-available/app.erb"
  owner "root"
  group "root"
  mode 0644
end

link "/etc/nginx/sites-enabled/#{ node[:brewbit][:hostname] }" do
  to "/etc/nginx/sites-available/#{ node[:brewbit][:hostname] }"
end

template "/etc/cron.daily/backup" do
  source "etc/cron.daily/backup.erb"
  owner "root"
  group "root"
  mode 0755
end

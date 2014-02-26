
cookbook_file "nginx__sites-available__brewbit.com" do
  path "/etc/nginx/sites-available/brewbit.com"
  action [ :delete, :create ]
end

link "/etc/nginx/sites-enabled/brewbit.com" do
  to "/etc/nginx/sites-available/brewbit.com"
end

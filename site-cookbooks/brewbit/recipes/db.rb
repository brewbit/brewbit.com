
pg_user "brewbit" do
  privileges superuser: false, createdb: true, login: true
  password "brewbit"
end

pg_user "vagrant" do
  privileges superuser: true, createdb: true, login: true
  password "vagrant"
end

pg_database node[:brewbit][:db_name] do
  owner "brewbit"
  encoding "utf8"
  template "template0"
  locale "en_US.UTF8"
end

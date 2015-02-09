service 'mosquitto' do
  service_name 'mosquitto'
  supports :restart => true, status => true, reload => true
  action :nothing
end

template "/etc/mosquitto/mosquitto.conf" do
  source "mosquitto.conf.erb"

  mode 0640

  notifies :reload, "service[mosquitto]"
end

execute "echo 'checking if mosquitto is not running - if so start it'" do
  not_if "pgrep mosquitto"
  notifies :start, "service[mosquitto]"
end
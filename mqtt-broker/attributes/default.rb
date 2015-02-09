case node['platform']
when "debian", "ubuntu"
  default['mqtt-broker']['path'] = '/etc/mosquitto/'
when "redhat", "centos", "scientific", "fedora", "arch", "amazon"
  default['mqtt-broker']['path'] = '/etc/mosquitto/'
else
  default['mqtt-broker']['path'] = '/tmp/mosquitto'
end

default['mqtt-broker']['autosave_interval'] = '1800'
default['mqtt-broker']['allow_anonymous'] = "false"

default['mqtt-broker']['connection_messages'] = "true"

default['mqtt-broker']['persistence'] = "true"

default['mqtt-broker']['persistence_location'] = "/tmp/"

default['mqtt-broker']['persistence_file'] = "mosquitto.db"

default['mqtt-broker']['persistent_client_expiration'] = "1m"

default['mqtt-broker']['retained_persistence'] = "true"

default['mqtt-broker']['require_certificate'] = "false"

default['mqtt-broker']['bridges'] = []
default['mqtt-broker']['listeners'] = []
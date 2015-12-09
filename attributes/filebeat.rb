default['mconf-stats']['beats']['filebeat']['version']            = '1.0.0'
default['mconf-stats']['beats']['filebeat']['conf_dir']           = '/etc/filebeat'
default['mconf-stats']['beats']['filebeat']['conf_file']          = ::File.join(node['mconf-stats']['beats']['filebeat']['conf_dir'], 'filebeat.yml')
default['mconf-stats']['beats']['filebeat']['service_name']       = 'filebeat'
default['mconf-stats']['beats']['filebeat']['config_path']        = '/etc/filebeat/filebeat.yml'
default['mconf-stats']['beats']['filebeat']['prospectors']        = nil
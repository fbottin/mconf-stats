#
# This file is part of the Mconf project.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

# Notes about paths:
# * Logstash
#   path: /opt
#   log: /opt/logstash/mconf/log/logstash.log
#   init: /etc/sv/logstash_mconf/run
# * ElasticSearch
#   path: /usr/local/
#   logs: /usr/local/var/log/elasticsearch
#   init: /etc/init.d/elasticsearch

# User and group on the server the application is being deployed
default['mconf-stats']['user'] = 'mconf'
default['mconf-stats']['app_group'] = 'www-data'
default['mconf-stats']['domain'] = '192.168.0.100'
default['mconf-stats']['java_pkg'] = 'openjdk-7-jre-headless'

# General configurations passed to elkstask
default['mconf-stats']['logstash']['instance_name'] = 'mconf'
default['mconf-stats']['backups']['enabled']        = false
default['mconf-stats']['backups']['cron']           = false
default['mconf-stats']['site_name']                 = 'mconf'
default['mconf-stats']['kibana']['redirect']        = false

# Logstash
default['mconf-stats']['logstash']['debug'] = false
default['mconf-stats']['logstash']['install_type']  = 'tarball'
default['mconf-stats']['logstash']['version']       = '1.5.1'
default['mconf-stats']['logstash']['source_url']    = 'https://download.elasticsearch.org/logstash/logstash/logstash-1.5.1.tar.gz'
default['mconf-stats']['logstash']['checksum']      = 'a12f91bc87f6cd8f1b481c9e9d0370a650b2c36fdc6a656785ef883cb1002894' # sha256sum logstash-1.5.1.tar.gz
default['mconf-stats']['logstash']['xms']           = '1536M'
default['mconf-stats']['logstash']['xmx']           = '1536M'

# These are not really set on elkstack/logstash, so set them here as shortcuts for when we need them
default['mconf-stats']['logstash']['basedir']     = "#{node['logstash']['instance_default']['basedir']}/#{default['mconf-stats']['logstash']['instance_name']}"
default['mconf-stats']['logstash']['confdir']     = "#{node['mconf-stats']['logstash']['basedir']}/etc/conf.d"
default['mconf-stats']['logstash']['sv_run_file'] = "/etc/sv/logstash_#{node['mconf-stats']['logstash']['instance_name']}/run"

# # Example:
# # [
# #   {
# #     name: '0-input-main.conf',
# #     path: '/my/file/1.log',
# #     type: 'rails',
# #     codec: 'json'
# #   }
# # ]
default['mconf-stats']['logstash']['inputs'] = []

# # Example:
# # [
# #   {
# #     "name": "9-output-elasticsearch.conf",
# #     "host": "localhost",
# #     "cluster": "mconf_cluster",
# #     "embedded": false,
# #     "bind_host": null,
# #     "es_index": null
# #   }
# # ]
default['mconf-stats']['logstash']['outputs']['elasticsearch'] = []


# Elastic Search
default['mconf-stats']['elasticsearch']['version'] = "1.6.0"
default['mconf-stats']['elasticsearch']['cluster']['name'] = "mconf_cluster"
default['mconf-stats']['elasticsearch']['allocated_memory'] = "2048m"

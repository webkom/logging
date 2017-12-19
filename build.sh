#!/bin/sh

# Install prerequisites.
apt-get update

apt-get install -y -q --no-install-recommends \
  curl ca-certificates sudo make g++

# Install Fluentd.
/usr/bin/curl -sSL https://toolbelt.treasuredata.com/sh/install-ubuntu-xenial-td-agent2.sh | sh

# Install the Elasticsearch and Kubernetes Fluentd plug-in.
# http://docs.fluentd.org/articles/plugin-management
td-agent-gem install --no-document fluent-plugin-kubernetes_metadata_filter 
td-agent-gem install --no-document fluent-plugin-elasticsearch 

# Remove docs and postgres references
rm -rf /opt/td-agent/embedded/share/doc \
  /opt/td-agent/embedded/share/gtk-doc \
  /opt/td-agent/embedded/lib/postgresql \
  /opt/td-agent/embedded/bin/postgres \
  /opt/td-agent/embedded/share/postgresql

apt-get autoremove -y
apt-get clean -y

rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

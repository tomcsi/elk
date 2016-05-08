#
# Cookbook Name:: elk
# Recipe:: elasticsearch
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

elasticsearch_user 'elasticsearch'

elasticsearch_install 'elasticsearch' do
  type :package
end

elasticsearch_service 'elasticsearch' do
  service_actions [:enable, :start]
end

elasticsearch_plugin 'head' do
  url 'mobz/elasticsearch-head'
  notifies :restart, 'elasticsearch_service[elasticsearch]', :delayed
end



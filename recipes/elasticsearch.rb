#
# Cookbook Name:: elk
# Recipe:: elasticsearch
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

elasticsearch_configure 'elasticsearch' do
  allocated_memory '512m'
  configuration ({
    'network.host' => '0.0.0.0'
  })
end

elasticsearch_plugin 'hq' do
  url 'royrusso/elasticsearch-HQ'
  action :install
end

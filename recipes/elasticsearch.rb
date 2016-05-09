#
# Cookbook Name:: elk
# Recipe:: elasticsearch
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

elasticsearch_configure 'elasticsearch' do
  allocated_memory '512m'
  configuration ({
    'network.host' => '0.0.0.0',
    'discovery.type' => 'ec2',
    'discovery.ec2.groups' => 'elasticsearch',
    'cloud.aws.region' => 'eu-west-1'
  })
end

elasticsearch_plugin 'hq' do
  url 'royrusso/elasticsearch-HQ'
  action :install
end

elasticsearch_plugin 'kopf' do
  url 'lmenezes/elasticsearch-kopf'
  action :install
end

elasticsearch_service 'elasticsearch' do
  action [:enable, :start]
end

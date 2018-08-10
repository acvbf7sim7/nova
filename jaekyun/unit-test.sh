#!/bin/bash
echo "Supposing that you have wget package and can execute openstack-client CLI"
neutron net-create tmp_network
neutron subnet-create tmp_network 169.254.163.0/24 --name tmp_subnet
NET_ID=$(neutron net-list |grep tmp_network | awk '{print $2}')
echo $NET_ID
nova flavor-create m1.tmp_flavor 99 512 0 1
wget http://download.cirros-cloud.net/0.4.0/cirros-0.4.0-x86_64-disk.img
glance image-create --name "tmp_cirros" --file ./cirros-0.4.0-x86_64-disk.img --disk-format qcow2 --container-format bare --visibility public --progress
nova boot --flavor m1.tmp_flavor --image tmp_cirros --nic net-id=$NET_ID fruit-apple
nova boot --flavor m1.tmp_flavor --min-count 2 --image tmp_cirros --nic net-id=$NET_ID fruit-orange
nova boot --flavor m1.tmp_flavor --min-count 3 --image tmp_cirros --nic net-id=$NET_ID fruit-watermelon
echo "---------- Create finish, here is result--------------"
nova list |grep orange |awk '{print $4}'
echo "---------- Please check vm's display name above ------"

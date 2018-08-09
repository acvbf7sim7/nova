#!/bin/sh
CONFIG_FILE="/etc/nova/nova.conf"

function set_config(){
    sudo sed -i "s/^\($1\s*=\s*\).*\$/\1$2/" $CONFIG_FILE
}

param1="$(cat $CONFIG_FILE |grep force_multi_instance_display_name)"
param2="$(cat $CONFIG_FILE |grep multi_instance_display_name_template)"

if [ "$param1" == "" ]; then
    echo "add config param: force_multi_instance_display_name=True"
    sed -i '/DEFAULT/a force_multi_instance_display_name=True' $CONFIG_FILE
fi

if [ "$param2" == "" ]; then
    echo "add config param: multi_instance_display_name_template=jaekyun-custom-%(name)s-%(count)d-%(project-name)s"
    sed -i '/DEFAULT/a multi_instance_display_name_template=jaekyun-custom-%(name)s-%(count)d-%(project-name)s' $CONFIG_FILE
fi


force_multi_instance_display_name="True"
set_config force_multi_instance_display_name $force_multi_instance_display_name

multi_instance_display_name_template="jaekyun-custom-%(name)s-%(count)d-%(project-name)s"
set_config multi_instance_display_name_template $multi_instance_display_name_template 

systemctl restart openstack-nova-api.service

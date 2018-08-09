Modified Nova for Assignment #2 - by Jaekyun Shim (acvbf7shim7@naver.com)
==============

1. New parameter "force_multi_instance_display_name"
==============
There is additional boolean argument called "force_multi_instance_display_name" in /etc/nova/nova.conf

If you want to use "multi_instance_display_name_template" even a single instance, add it in [DEFAULT] section like below.

$ cat /etc/nova/nova.conf

    [DEFAULT]

    force_multi_instance_display_name = True

2. Additional template key "project-name"
==============
multi_instance_display_name_template have additional template key 'project-name'

So you can use templete like: jaekyun-custom-%(name)s-%(count)d-%(project-name)s

For example, you can set this template in [DEFAULT] section like below

$ cat /etc/nova/nova.conf

    [DEFAULT]

    multi_instance_display_name_template=jaekyun-custom-%(name)s-%(count)d-%(project-name)s


3. Now, count number is shared in 'project' domain.
==============
In This version, nova considers 'count' key with globally in a same project domain.

In the same project, the count key will be incremented by 1 from the last value created.

4. You can test it with following command
==============

First, Add two parameter by executing shell command in 'jaekyun' folder.

$ ./jaekyun/set-custom-parameter.sh

Second, Run following command to show display name is applied.

$ ./jaekyun/unit-test.sh

==============

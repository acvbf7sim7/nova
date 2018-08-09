Modified Nova for Assignment #2 - by Jaekyun Shim (acvbf7shim7@naver.com)
==============

1. New parameter "force_multi_instance_display_name"
==============
There is additional boolean argument called "force_multi_instance_display_name" in /etc/nova/nova.conf
If you want to use "multi_instance_display_name_template" even a single instance, add it in [DEFAULT] section like below.
$ cat /etc/nova/nova.conf
    [DEFAULT]
     ...
    force_multi_instance_display_name = True
    ...


2. Additional template key "project-name"
==============
multi_instance_display_name_template have additional template key 'project-name'
So you can use templete like: jaekyun-custom-%(name)s-%(count)d-%(project-name)s
For example, you can set this template in [DEFAULT] section like below
$ cat /etc/nova/nova.conf
    [DEFAULT]
    ...
    multi_instance_display_name_template=jaekyun-custom-%(name)s-%(count)d-%(project-name)s
    ...


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

If you have any questions, call me +82)1099154825 or send me an email


OpenStack Nova
==============

OpenStack Nova provides a cloud computing fabric controller,
supporting a wide variety of compute technologies, including:
libvirt (KVM, Xen, LXC and more), Hyper-V, VMware, XenServer
and OpenStack Ironic.

OpenStack Nova is distributed under the terms of the Apache
License, Version 2.0. The full terms and conditions of this
license are detailed in the LICENSE file.

API
---

To learn how to use Nova's API, consult the documentation
available online at:

    http://developer.openstack.org/api-guide/compute/
    http://developer.openstack.org/api-ref/compute/

For more information on OpenStack APIs, SDKs and CLIs,
please see:

    http://www.openstack.org/appdev/
    http://developer.openstack.org/

Operators
---------

To learn how to deploy and configure OpenStack Nova, consult the
documentation available online at:

    http://docs.openstack.org

For information about the different compute (hypervisor) drivers
supported by Nova, please read:

   http://docs.openstack.org/developer/nova/feature_classification.html

In the unfortunate event that bugs are discovered, they should
be reported to the appropriate bug tracker. If you obtained
the software from a 3rd party operating system vendor, it is
often wise to use their own bug tracker for reporting problems.
In all other cases use the master OpenStack bug tracker,
available at:

   http://bugs.launchpad.net/nova

Developers
----------

For information on how to contribute to Nova, please see the
contents of the CONTRIBUTING.rst.

Any new code must follow the development guidelines detailed
in the HACKING.rst file, and pass all unit tests.

Further developer focused documentation is available at:

   http://docs.openstack.org/developer/nova/

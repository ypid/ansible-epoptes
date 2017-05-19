.. _epoptes__ref_getting_started:

Getting started
===============

.. include:: includes/all.rst

.. contents::
   :local:

Preparing clients
-----------------

Epoptes is packaged in Debian which is used for installation.
Some of the Epoptes configuration needs to be changed/managed by this role.
In order for dpkg to not ask about changed files managed by this role during
package updates, the role diverts those files by default.


Direct configuration modes
--------------------------

The role can be run directly against all teacher and student computers and
setup Epoptes in classrooms this way.
This mode does not require a server other than the Ansible controller for client configuration.

linuxmuster.net postsync configuration modes
--------------------------------------------

The postsync mode was based on the `Epoptes integration in linuxmuster.net`_ but
handles the access/distribution of the private key of Epoptes differently to
mitigate exposure of this key via unauthenticated rsync access which is
possible when following the `Epoptes integration in linuxmuster.net`_
documentation (by skilled students, from which there are many :).

The directory structure on the server will look similar to this:

.. code-block:: none

   /var/linbo/linuxmuster-client/image_name
   ├── r23_student
   │   ├── etc
   │   │   ├── default
   │   │   │   └── epoptes-client
   │   │   ├── epoptes
   │   │   │   └── server.crt
   │   │   ├── init.d
   │   │   │   └── epoptes-client
   │   │   └── xdg
   │   │       └── autostart
   │   │           └── epoptes-client.desktop
   │   └── usr
   │       └── local
   │           └── bin
   │               └── epoptes-client-loop.sh
   ├── r23_teacher
   │   ├── etc
   │   │   ├── default
   │   │   │   └── epoptes
   │   │   ├── epoptes
   │   │   ├── init.d
   │   │   │   └── epoptes
   │   │   ├── sudoers.d
   │   │   │   └── ansible-teacher-epoptes-restart
   │   │   └── xdg
   │   │       └── autostart
   │   │           └── epoptes-copy-key.desktop
   │   └── usr
   │       └── local
   │           ├── bin
   │           │   └── epoptes-copy-key.sh
   │           └── share
   │               └── applications
   │                   └── epoptes.desktop

Example host inventory
----------------------

The inventory configuration will be different depending on which mode of
operation you choose for your environment.

To manage Epoptes on a given host or set of hosts, they need to
be added to the ``[ypid_service_epoptes]`` Ansible group in the inventory:

.. code:: ini

   [ypid_service_epoptes]
   hostname

Common inventory for both modes:

.. code:: ini

   [sint.example.org_clients_r23_teachers]
   r23-pc01.sint.example.org

   [teachers:children]
   sint.example.org_clients_r23_teachers

   [sint.example.org_clients_r23_students]
   r23-pc02.sint.example.org
   r23-pc03.sint.example.org

   [students:children]
   sint.example.org_clients_r23_students

   [sint.example.org_clients_r23:children]
   sint.example.org_clients_r23_teachers
   sint.example.org_clients_r23_students

   [sint.example.org_clients:children]
   sint.example.org_clients_r23

For direct configuration mode, all client hosts would be member of the
``[ypid_service_epoptes]`` Ansible group so that the role is run against all
of them directly. This could look as follows, where
``[linuxmuster_net_client_r23]`` is an Ansible group itself:

.. code:: ini

   [ypid_service_epoptes:children]
   sint.example.org_clients_r23

For linuxmuster.net postsync configuration mode, the server needs to be member
of the ``[ypid_service_epoptes]`` Ansible group.
Additionally, all clients should be part of the group as well so that they can be prepared.
Note that you would typically only run Ansible against one of those clients,
then make an image of this one client and distribute the image to all other
clients from which they will sync their root filesystem.

.. code:: ini

   [ypid_service_epoptes]
   server.sint.example.org

   [ypid_service_epoptes:children]
   sint.example.org_clients


Example Ansible inventory variables
-----------------------------------

To choose the mode in which the role runs against each remote host, the
:envvar:`epoptes__deploy_modes` variable has to be set for each host explicitly.
This should be done again using Ansible groups.

For direct configuration mode:

:file:`ansible/inventory/group_vars/teachers`:

  .. code:: yaml

     epoptes__deploy_modes:
       - 'prepare_client'
       - 'teacher'

:file:`ansible/inventory/group_vars/students`:

  .. code:: yaml

     epoptes__deploy_modes:
       - 'prepare_client'
       - 'student'

For linuxmuster.net postsync configuration mode:

:file:`ansible/inventory/group_vars/sint.example.org_clients`:

  .. code:: yaml

     epoptes__deploy_modes:
       - 'prepare_client'

:file:`ansible/inventory/host_vars/server.sint.example.org`:

  .. code:: yaml

     epoptes__deploy_modes:
       - 'postsync'

Example playbook
----------------

Here's an example playbook that uses the ``ypid.epoptes`` role:

.. literalinclude:: playbooks/epoptes.yml
   :language: yaml

This playbooks is shipped with this role under :file:`./docs/playbooks/epoptes.yml`
from which you can symlink it to your playbook directory.
In case you use multiple roles maintained by ypid_, consider
using `ypid-ansible-common`_.

Ansible tags
------------

You can use Ansible ``--tags`` or ``--skip-tags`` parameters to limit what
tasks are performed during Ansible run. This can be used after a host was first
configured to speed up playbook execution, when you are sure that most of the
configuration is already in the desired state.

Available role tags:

``role::epoptes``
  Main role tag, should be used in the playbook to execute all of the role
  tasks as well as role dependencies.

``role::epoptes:pkgs``
  Tasks related to system package management like installing or
  removing packages.

``role::epoptes:prepare_client``
  Tasks related to client preparation.

``role::epoptes:keys``
  Tasks related to key management like creating the private key and the X.509
  certificate.

Introduction
============

.. include:: includes/all.rst

The ``ypid.epoptes`` role allows you to manage and configure Epoptes_.
Epoptes is an `Free and open-source software`_ computer lab management and monitoring tool.

Note that the role has not been tested as well after the v0.2.0 rewrite yet.
Some debugging might be needed.

The role has originally been written to deploy Epoptes in a linuxmuster.net_ environment
using the `Postsync feature <https://www.linuxmuster.net/wiki/anwenderwiki:linbo:postsync_scripte:start>`_
of LINBO_.

In the process of writing and testing this role, direct deployment against clients has also being implemented.

Installation
~~~~~~~~~~~~

This role requires at least Ansible ``v2.1.5``. To install it, run:

.. code-block:: console

   ansible-galaxy install ypid.epoptes

..
 Local Variables:
 mode: rst
 ispell-local-dictionary: "american"
 End:

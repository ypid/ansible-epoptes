.. _epoptes__ref_changelog:

Changelog
=========

.. include:: includes/all.rst

**ypid.epoptes**

This project adheres to `Semantic Versioning <http://semver.org/spec/v2.0.0.html>`__
and `human-readable changelog <http://keepachangelog.com/en/0.3.0/>`__.

The current role maintainer_ is ypid_.


`ypid.epoptes master`_ - unreleased
--------------------------------------

.. _ypid.epoptes master: https://github.com/ypid/ansible-epoptes/compare/v0.2.0...master


`ypid.epoptes v0.2.0`_ - 2017-05-23
-----------------------------------

.. _ypid.epoptes v0.2.0: https://github.com/ypid/ansible-epoptes/compare/v0.1.0...v0.2.0

Added
~~~~~

- Role documentation based on the DebOps documentation standard for Ansible roles. [ypid_]

Changed
~~~~~~~

- Rename from ``ypid.linuxmuster_net-server-epoptes_via_postsync`` to
  ``ypid.epoptes``. [ypid_]

- Merge ``ypid.linuxmuster_net-client-epoptes_via_postsync`` into
  ``ypid.epoptes`` to have everything in one role.
  The role has been fully reworked and all inventory variables have been renamed.
  Refer to the role documentation and
  :ref:`epoptes__ref_upgrade_nodes_v0.2.0`. [ypid_]


ypid.epoptes v0.1.0 - 2015-11-13
--------------------------------

Added
~~~~~

- Initial coding and design. [ypid_]

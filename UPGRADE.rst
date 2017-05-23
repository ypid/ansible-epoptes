.. _epoptes__ref_upgrade_nodes:

Upgrade notes
=============

The upgrade notes only describe necessary changes that you might need to make
to your setup in order to use a new role release. Refer to the
:ref:`epoptes__ref_changelog` for more details about what has changed.


.. _epoptes__ref_upgrade_nodes_v0.2.0:

Upgrade from v0.1.X to v0.2.X
-----------------------------

All inventory variables have been renamed so you might need to update your
inventory.
This script can come in handy to update a subset of variable names:

.. literalinclude:: scripts/upgrade-from-v0.1.X-to-v0.2.X
   :language: shell

The script is bundled with this role under
:file:`./docs/scripts/upgrade-from-v0.1.X-to-v0.2.X` and can be invoked from
there.

Note that you will need to update your inventory manually according to the documentation.
The :envvar:`epoptes__rooms` variable has been changed from a list to a dictionary
which you might need to update manually in your inventory.

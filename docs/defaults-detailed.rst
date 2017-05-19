Default variable details
========================

.. include:: includes/all.rst

Some of ``ypid.epoptes`` default variables have more extensive
configuration than simple strings or lists, here you can find documentation and
examples for them.

.. contents::
   :local:
   :depth: 1


.. _epoptes__ref_rooms:

epoptes__rooms
--------------

The :envvar:`epoptes__rooms` dictionary allow you to configure the rooms for Epoptes.
The key of a given room is the room name (for example ``r23`` or ``r42``).

Each item is a dictionary itself with the following documented keys:

``room_prefix``
  Optional, string.
  Defaults to :envvar:`epoptes__room_prefix`.

``room_suffix``
  Optional, string.
  Defaults to :envvar:`epoptes__room_suffix`.

``teachers``
  Required, list of strings.
  List of teacher hosts.

``teacher_hosts``
  Optional, list of strings.
  The teacher hostnames to which clients will connect.

``students``
  Required, list of strings.
  List of student hosts.

Examples
~~~~~~~~

Configure Epoptes in room ``r23`` with ``r23-pc01`` being the teacher host and
``r23-pc02`` and ``r23-pc03`` being student hosts:

.. literalinclude:: examples/epoptes__rooms.yml
   :language: yaml

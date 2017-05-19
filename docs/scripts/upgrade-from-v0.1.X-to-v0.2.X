#!/bin/bash
## Upgrade inventory variables for migration from ypid.epoptes v0.1.X to v0.2.X.
## The script is idempotent.

git ls-files -z "$(git rev-parse --show-toplevel)" | xargs --null -I '{}' find '{}' -type f -print0 \
 | xargs --null sed --in-place --regexp-extended '
     s/linuxmuster_net_server_epoptes_/epoptes__/g;
     s/epoptes__room_definition/epoptes__rooms/g;
     s/linuxmuster_net_display_manager/epoptes__enforce_dm/g;
     s/epoptes__via_postsync_image_name/epoptes__postsync_image_name/g;
   '

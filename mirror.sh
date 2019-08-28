#!/usr/bin/env bash

lftp ftps://${box_user}:${box_password}@ftp.box.com:21 << here_doc
  set ftp:ssl-force
  set ssl:check-hostname false
  set ftp:ssl-protect-data true
  mirror --loop -v --reverse --parallel=$concurrent_uploads --no-perms "${local_base_dir}" "${box_base_dir}/"
  exit
here_doc

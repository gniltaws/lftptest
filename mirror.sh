#!/usr/bin/env bash

lftp ftps://${box_user}:${box_password}@ftp.box.com:21 << here_doc
  mirror --loop -v --reverse --parallel=$concurrent_uploads --no-perms "${local_base_dir}" "${box_base_dir}/"
  exit
here_doc

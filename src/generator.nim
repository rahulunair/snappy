## generate a docker file from the **config** object

import strutils
import model
from parser import config

var stage1 = config.get_stage("base")
var stage2 = config.get_stage("deploy")
var s1_pkgs = stage1.get_comp("os_pkgs")
var s1_os_name = stage1.get_comp("os_name")
var s1_os_upd = stage1.get_comp("os_update")

var s1_update = if s1_os_name == "fedora" and s1_os_upd == "yes": "dnf update -y" else: "swupd update -y"
var s1_pkg_install = if s1_os_name == "fedora": "dnf install -y $1" % s1_pkgs else: "swupd bundle_add -y $1" % stage1.get_comp("os_pkgs")

var dockerfile = """
FROM $1:$2 as base
RUN $3 && $4
COPY components/$5
FROM $6:$7 as deploy
RUN $8 && $9
COPY --from=base /install_root/ /usr/local/
CMD bash
""" % [stage1.get_comp("os_name"),
        stage1.get_comp("os_ver"),
        s1_update, s1_pkg_install,
        stage1.get_comp("slices"),
        stage2.get_comp("os_name"),
        stage2.get_comp("os_ver"),
        s1_update, s1_pkg_install
        ]

echo dockerfile

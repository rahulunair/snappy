## Parse ini file
# refactor with auto section and component identifier(lazy for now)
import os
import parsecfg
import streams

import model


var
    config_file_name = "../templates/config.ini"
    parsed = load_config(config_file_name)

var
    s1_name = parsed.getSectionValue("stage1", "name")
    s1_os_name = parsed.getSectionValue("stage1", "os_name")
    s1_os_ver = parsed.getSectionValue("stage1", "os_ver")
    s1_os_update = parsed.getSectionValue("stage1", "os_update")
    s1_os_pkgs = parsed.getSectionValue("stage1", "os_pkgs")
    s1_pip_pkgs = parsed.getSectionValue("stage1", "pip_pkgs")
    s1_slices = parsed.getSectionValue("stage1", "slices")
    s1_env = parsed.getSectionValue("stage1", "env")

var
    s2_name = parsed.getSectionValue("stage2", "name")
    s2_os_name = parsed.getSectionValue("stage2", "os_name")
    s2_os_ver = parsed.getSectionValue("stage2", "os_ver")
    s2_os_update = parsed.getSectionValue("stage2", "os_update")
    s2_os_pkgs = parsed.getSectionValue("stage2", "os_pkgs")
    s2_pip_pkgs = parsed.getSectionValue("stage2", "pip_pkgs")
    s2_slices = parsed.getSectionValue("stage2", "slices")
    s2_env = parsed.getSectionValue("stage2", "env")

var 
    config* = Templ()
    stage_1 = Stage()
    stage_2 = Stage()


stage_1.set_comp("name", s1_name)
stage_1.set_comp("os_name", s1_os_name)
stage_1.set_comp("os_ver", s1_os_ver)
stage_1.set_comp("os_update", s1_os_update)
stage_1.set_comp("os_pkgs", s1_os_pkgs)
stage_1.set_comp("pip_pkgs", s1_pip_pkgs)
stage_1.set_comp("slices", s1_slices)
stage_1.set_comp("env", s1_env)

stage_2.set_comp("name", s2_name)
stage_2.set_comp("os_name", s2_os_name)
stage_2.set_comp("os_ver", s2_os_ver)
stage_2.set_comp("os_update", s2_os_update)
stage_2.set_comp("os_pkgs", s2_os_pkgs)
stage_2.set_comp("pip_pkgs", s2_pip_pkgs)
stage_2.set_comp("slices", s2_slices)
stage_2.set_comp("env", s2_env)

config.set_stage(s1_name, stage1)
config.set_stage(s2_name, stage2)

#!/usr/bin/env fish

### https://github.com/garabik/grc/blob/master/grc.fish

### make had obscure issue with nvim so we're going to opt-in programs only
#   grc_plugin_execs cat cvs df diff dig gcc g++ ls ifconfig
#   make mount mtr netstat ping ps tail traceroute
#   wdiff blkid du dnf docker docker-compose docker-machine env id ip iostat journalctl kubectl
#   last lsattr lsblk lspci lsmod lsof getfacl getsebool ulimit uptime nmap
#   fdisk findmnt free semanage sar ss sysctl systemctl stat showmount
#   tcpdump tune2fs vmstat w who sockstat
if exists grc
    set -U grc_plugin_execs df ping ps env \
        mount id ip iostat ifconfig uptime journalctl \
        last lsblk lspci lsmod lsof fdisk free stat w who

    for executable in $grc_plugin_execs
        if type -q $executable
            if isatty 1
                abbr $executable "grc $executable"
                vanilla_alias "$executable"
            end
        end
    end
end

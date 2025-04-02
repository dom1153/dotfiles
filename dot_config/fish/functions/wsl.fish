if type "wslvar" &> /dev/null
  # https://github.com/wslutilities/wslu
  # https://pureinfotech.com/list-environment-variables-windows-10/

  ### todo: needs testing
  function cdwin
    set -l pth (wslpath $argv[1])
    cd $pth
  end

  function pwdwin
    wslpath -w "`pwd`"
  end

  # $winhome was exported at bash_profile
  # function gouserprofile() { prof=`wslvar USERPROFILE`; handlego `wslpath $prof`; }
end


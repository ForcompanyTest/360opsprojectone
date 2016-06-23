#########################################################################
# File Name: ./bashhashmap.sh
# Author: ZyolfQitler
# mail: 15125040@bjtu.edu.cn
# Created Time: 2016年06月23日 星期四 11时39分08秒
#########################################################################
#!/bin/bash
# for bashhashmap{
# echo md5 code for S1
md5()
{
	if [ X"$1" == X"" ];then
		echo ""
	else
		echo "${1}" |md5sum - |cut -c 1-32
	fi
}
#Usage
# > bashmap "key" "value" set map[key] = value
# > bashmap "key"         print map[key]
bashmap()
{
	BASHMAP="BASHMAP_"
	export BASHMAP
	md5key=$(eval "md5 '$1'")
	case "$#" in
		1)
			eval "echo \$$BASHMAP$md5key"
			;;
		2)
			eval "export $BASHMAP$md5key='$2'"
			;;
		*)
			echo "Usage:"
			echo "bashmap key value"
			echo "bashmap key"
			;;
	esac
}
#Usage
bashmap_clear()
{
	BASHMAP="BASHMAP_"
	export BASHMAP
	case "$#" in
		0)
			for env in $(set |grep "^$BASHMAP" | cut -d'=' -f1)
			do
				unset $env
			done
			;;
		1)
			md5key=$(eval "md5 '$1'")
			unset $BASHMAP$md5key
			;;
	esac
}
# for bashmap }

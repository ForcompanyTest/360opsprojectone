#########################################################################
# File Name: ./bashtree.sh
# Author: ZyolfQitler
# mail: 15125040@bjtu.edu.cn
# Created Time: 2016年06月24日 星期五 14时59分55秒
# locate threadpool |sed -n 's/^.*\///gp'
#########################################################################
#!/bin/bash

add()
{
	if [ "$1" == "" ];then
		echo "no parents to add"
		exit 0
	fi
	wayadd=`find /home/yggdrasil -name $1 |grep $1 |head -1`
	if [ "$wayadd" == "" ];then
		echo "parents do no exit"
		exit 0
	fi
	mkdir $wayadd/$2
	echo "add successful"
}

get()
{
	if [ "$1" == "" ];then
		echo "no parents to get"
		exit 0
	fi
	wayget=`find $1|grep $1|head -1`
	echo "$1 wayget $wayget">/home/sarutobi_hiruzen/360opstest/my.log
	if [ "$wayget" == "" ];then
		echo "parents do no exit"
		exit 0
	fi
	result=`find /home/yggdrasil/$wayget -empty |sed -n 's/^.*\///gp'`
	echo "$result"
}

nidhogg()
{
	rm -vfr /home/yggdrashil/*
	echo "nidhogg"
}

sys=`uname -a |grep Ubuntu`
if [ "$sys" == "" ];then
	echo "(⊙ o⊙ )…this scripte run in Ubuntu "
	exit 0
fi
echo "the tree root is /home/yggdrasil"
if [ ! -d "/home/yggdrasil" ];then
	echo "there is no yggdrasil"
	mkdir /home/yggdrasil
else
	echo "the greate yggdrasil"
	cd /home/yggdrasil
	pwd
fi
if [ "$1" == "add" ];then
	echo "arg is add"
	str=$(add $2 $3)
	echo "$str"
fi
if [ "$1" == "get" ];then
	echo "arg is get"
	result=$(get $2)
	echo "$result"
fi
if [ "$1" == "nidhogg" ];then
	echo "nidhogg"
fi
if [ "$1" == "" ];then
	echo "you need action add or get or nidhogg"
	exit 0
fi
#if [ ! -d "/myfolder" ]; then
#	  mkdir /myfolder
#fi

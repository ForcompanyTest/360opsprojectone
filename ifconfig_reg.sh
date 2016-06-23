#########################################################################
# File Name: ./ifconfig_reg.sh
# Author: ZyolfQitler
# mail: 15125040@bjtu.edu.cn
# Created Time: 2016年06月23日 星期四 11时11分22秒
#########################################################################
#!/bin/bash
adapter=`ifconfig -a |grep "Link encap"|awk '{print $1}'`
for i in $adapter
do
	ip_addr=`ifconfig ${i} |grep "inet "|awk '{print $2}'|awk -F: '{print $2}'`
	echo "$i  $ip_addr"
	let i++
done


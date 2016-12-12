#获取当天日期
date_info=`date`;
today=0;
gettoday()
{
	today=$3;
}
gettoday $date_info;
echo today is $today;
val=`expr $today % 2`;
case $val in 
0) #双号
	sed -i '9s/n2n.lucktu.com/106.186.30.16/g' /etc/config/n2n_v2;#修改超级节点  备份节点是日本的那个
	sed -i '12s/86/8964/g' /etc/config/n2n_v2;#修改端口号
	/etc/init.d/n2n_v2 restart;#重启n2n服务
	;;
*) #单号
	sed -i '9s/106.186.30.16/n2n.lucktu.com/g' /etc/config/n2n_v2;#修改超级节点  备份节点是日本的那个
	sed -i '12s/8964/86/g' /etc/config/n2n_v2;#修改端口号
	/etc/init.d/n2n_v2 restart;#重启n2n服务
	;;
esac 
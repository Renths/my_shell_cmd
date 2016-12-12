if [ $PPID -ne 1 ]
then 
	(/root/usb_print/usb_print.sh &)
	kill -9 $$ >> /dev/null;	
fi
lp0file="/dev/usb/lp0";
echo `date`服务开始 >> /root/usb_print/usb_print.log;
cd 
while [ 1 -eq 1 ] #循环服务
do
	sleep 1s;
	if [ -c "$lp0file" ] 
	then 
		 echo $lp0file `date`检测到打印机 >> /root/usb_print/usb_print.log
		 /etc/init.d/usb_printer restart;
		 #如果打印机存在就睡觉
		 while [ -c "$lp0file" ] 
		 do
			sleep 1s;
		 done 
		 #不存在后就重新检测
		 echo `date`检测到打印机关闭！>> /root/usb_print/usb_print.log		
#	else echo $lp0file 没检测到打印机
	fi
done 
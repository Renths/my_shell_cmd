if [ $PPID -ne 1 ]
then 
	(/root/usb_print/usb_print.sh &)
	kill -9 $$ >> /dev/null;	
fi
lp0file="/dev/usb/lp0";
echo `date`����ʼ >> /root/usb_print/usb_print.log;
cd 
while [ 1 -eq 1 ] #ѭ������
do
	sleep 1s;
	if [ -c "$lp0file" ] 
	then 
		 echo $lp0file `date`��⵽��ӡ�� >> /root/usb_print/usb_print.log
		 /etc/init.d/usb_printer restart;
		 #�����ӡ�����ھ�˯��
		 while [ -c "$lp0file" ] 
		 do
			sleep 1s;
		 done 
		 #�����ں�����¼��
		 echo `date`��⵽��ӡ���رգ�>> /root/usb_print/usb_print.log		
#	else echo $lp0file û��⵽��ӡ��
	fi
done 
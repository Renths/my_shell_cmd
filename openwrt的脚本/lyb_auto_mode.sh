if [ $PPID -ne 1 ]
then 
	(/root/youku/lyb_auto_mode.sh &)
	kill -9 $$ >> /dev/null;	
fi
echo kill -9 $$ >> /root/youku/kill_lyb_auto_mode.sh;
echo "echo ִ�����,��ʹ��ps����鿴�Ƿ��л���lyb_auto_mode.sh�Ľ��̣��������ֶ������" >> /root/youku/kill_lyb_auto_mode.sh;
echo rm /root/youku/kill_lyb_auto_mode.sh >> /root/youku/kill_lyb_auto_mode.sh;
chmod +x /root/youku/kill_lyb_auto_mode.sh;

#ʱ�䶨��
 time_start=22:30; # ��ʽΪ24Сʱ С��10��  ǰ��Ҫ��0 ����Ч
 time_stop=08:30;
 time_reboot=03:30;


#�ʺ���
echo   
echo ------����ʱ��:`date`---------
echo ------����ʱ��:`date`--------- >> /root/youku/lyb_auto_mode_log.txt;
echo ��ʼʱ�䣺$time_start  ����ʱ�䣺$time_stop ����ʱ��:$time_reboot;
echo �ɹ��� �������ں�̨����...
echo ִ�� `pwd`�µ� kill_lyb_auto_mode.sh ������������̡�
echo ��־�ļ� ��`pwd`�µ�lyb_auto_mode_log.txt;
sleep 2s;

#�����������壺
time_now=0;
date_info=`date`;

#��ȡ��ǰʱ�亯�� �ַ���
gettime()
{
	time_now=$4;
}

#��������
while [ 1 -eq 1 ] #��ѭ��
do
	sleep 50s;
	#׼����������ȡ��ǰʱ��
	date_info=`date`;
	gettime $date_info;

	# ƽ��ģʽ �� ����ģʽ��
	if [ "${time_now:0:5}" == "${time_start:0:5}" ]
	then
		echo `date`	��ִ�� ����ģʽ >> /root/youku/lyb_auto_mode_log.txt;
		sed -i '4s/2/1/g' /etc/config/youku; #2��ƽ��ģʽ 1�Ǽ���ģʽ����2�ĳ�1	
		/etc/init.d/youku restart;
		echo `date`:ִ�� ����·�ɱ� >> /root/youku/lyb_auto_mode_log.txt;
		sleep 60s;
	fi
	
	#����ģʽ �� ƽ��ģʽ
	if [ "${time_now:0:5}" == "${time_stop:0:5}" ]
	then
		echo `date`	��ִ�� ƽ��ģʽ >> /root/youku/lyb_auto_mode_log.txt;
		sed -i '4s/1/2/g' /etc/config/youku; #2��ƽ��ģʽ 1�Ǽ���ģʽ����1�ĳ�2	
		/etc/init.d/youku restart;
		echo `date` :ִ�� ����·�ɱ� >> /root/youku/lyb_auto_mode_log.txt;		
		sleep 60s;
	fi	
	#����ʱ��
	if [ "${time_now:0:5}" == "${time_reboot:0:5}" ]
	then
		echo `date` : ִ�� reboot���� >> /root/youku/lyb_auto_mode_log.txt;
		reboot;
	fi
		
done 
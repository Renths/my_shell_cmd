if [ $PPID -ne 1 ]
then 
	(./lyb_auto_mode.sh &)
	kill -9 $$ >> /dev/null;	
fi
echo kill -9 $$ >> kill_lyb_auto_mode.sh;
echo "echo ִ�����,��ʹ��ps����鿴�Ƿ��л�������������ֶ������" >> kill_lyb_auto_mode.sh;
echo rm ./kill_lyb_auto_mode.sh >> kill_lyb_auto_mode.sh;
chmod +x kill_lyb_auto_mode.sh;

#ʱ�䶨��
time_start=12:57; # ��ʽΪ24Сʱ С��10��  ǰ��Ҫ��0 ����Ч
time_stop=13:00;

#�ʺ���
echo ��ʼʱ�䣺$time_start  ����ʱ�䣺$time_stop ;
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
	sleep 59;
	#׼����������ȡ��ǰʱ��
	date_info=`date`;
	gettime $date_info;

	# ƽ��ģʽ �� ����ģʽ��
	if [ "${time_now:0:5}" == "${time_start:0:5}" ]
	then
		sleep 59s;
		echo $time_now	��ִ�� ����ģʽ >> ./lyb_auto_mode_log.txt;
		sed -i '18s/2/1/g' /etc/config/youku; #2��ƽ��ģʽ 1�Ǽ���ģʽ����2�ĳ�1	
		/etc/init.d/youku restart;
		echo $time_now :ִ�� ����·�ɱ� >> ./lyb_auto_mode_log.txt;
	fi
	
	#����ģʽ �� ƽ��ģʽ
	if [ "${time_now:0:5}" == "${time_stop:0:5}" ]
	then
		echo $time_now	��ִ�� ƽ��ģʽ >> ./lyb_auto_mode_log.txt;
		sed -i '18s/1/2/g' /etc/config/youku; #2��ƽ��ģʽ 1�Ǽ���ģʽ����1�ĳ�2	
		/etc/init.d/youku restart;
		echo $time_now :ִ�� ����·�ɱ� >> ./lyb_auto_mode_log.txt;		
	fi	
		
done 
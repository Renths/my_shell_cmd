if [ $PPID -ne 1 ]
then 
	(/root/youku/lyb_auto_mode.sh &)
	kill -9 $$ >> /dev/null;	
fi
echo kill -9 $$ >> /root/youku/kill_lyb_auto_mode.sh;
echo "echo 执行完成,请使用ps命令查看是否有还有lyb_auto_mode.sh的进程，若有请手动清除！" >> /root/youku/kill_lyb_auto_mode.sh;
echo rm /root/youku/kill_lyb_auto_mode.sh >> /root/youku/kill_lyb_auto_mode.sh;
chmod +x /root/youku/kill_lyb_auto_mode.sh;

#时间定义
 time_start=22:30; # 格式为24小时 小于10的  前面要加0 秒无效
 time_stop=08:30;
 time_reboot=03:30;


#问候语
echo   
echo ------启动时间:`date`---------
echo ------启动时间:`date`--------- >> /root/youku/lyb_auto_mode_log.txt;
echo 起始时间：$time_start  结束时间：$time_stop 重启时间:$time_reboot;
echo 成功！ 进程已在后台运行...
echo 执行 `pwd`下的 kill_lyb_auto_mode.sh 命令结束本进程。
echo 日志文件 ：`pwd`下的lyb_auto_mode_log.txt;
sleep 2s;

#其他变量定义：
time_now=0;
date_info=`date`;

#获取当前时间函数 字符串
gettime()
{
	time_now=$4;
}

#服务函数：
while [ 1 -eq 1 ] #死循环
do
	sleep 50s;
	#准备工作：获取当前时间
	date_info=`date`;
	gettime $date_info;

	# 平衡模式 》 激进模式：
	if [ "${time_now:0:5}" == "${time_start:0:5}" ]
	then
		echo `date`	：执行 激进模式 >> /root/youku/lyb_auto_mode_log.txt;
		sed -i '4s/2/1/g' /etc/config/youku; #2是平衡模式 1是激进模式，把2改成1	
		/etc/init.d/youku restart;
		echo `date`:执行 重启路由宝 >> /root/youku/lyb_auto_mode_log.txt;
		sleep 60s;
	fi
	
	#激进模式 》 平衡模式
	if [ "${time_now:0:5}" == "${time_stop:0:5}" ]
	then
		echo `date`	：执行 平衡模式 >> /root/youku/lyb_auto_mode_log.txt;
		sed -i '4s/1/2/g' /etc/config/youku; #2是平衡模式 1是激进模式，把1改成2	
		/etc/init.d/youku restart;
		echo `date` :执行 重启路由宝 >> /root/youku/lyb_auto_mode_log.txt;		
		sleep 60s;
	fi	
	#重启时间
	if [ "${time_now:0:5}" == "${time_reboot:0:5}" ]
	then
		echo `date` : 执行 reboot命令 >> /root/youku/lyb_auto_mode_log.txt;
		reboot;
	fi
		
done 
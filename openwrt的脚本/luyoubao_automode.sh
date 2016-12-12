if [ $PPID -ne 1 ]
then 
	(./lyb_auto_mode.sh &)
	kill -9 $$ >> /dev/null;	
fi
echo kill -9 $$ >> kill_lyb_auto_mode.sh;
echo "echo 执行完成,请使用ps命令查看是否有还有命令，若有请手动清除！" >> kill_lyb_auto_mode.sh;
echo rm ./kill_lyb_auto_mode.sh >> kill_lyb_auto_mode.sh;
chmod +x kill_lyb_auto_mode.sh;

#时间定义
time_start=12:57; # 格式为24小时 小于10的  前面要加0 秒无效
time_stop=13:00;

#问候语
echo 起始时间：$time_start  结束时间：$time_stop ;
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
	sleep 59;
	#准备工作：获取当前时间
	date_info=`date`;
	gettime $date_info;

	# 平衡模式 》 激进模式：
	if [ "${time_now:0:5}" == "${time_start:0:5}" ]
	then
		sleep 59s;
		echo $time_now	：执行 激进模式 >> ./lyb_auto_mode_log.txt;
		sed -i '18s/2/1/g' /etc/config/youku; #2是平衡模式 1是激进模式，把2改成1	
		/etc/init.d/youku restart;
		echo $time_now :执行 重启路由宝 >> ./lyb_auto_mode_log.txt;
	fi
	
	#激进模式 》 平衡模式
	if [ "${time_now:0:5}" == "${time_stop:0:5}" ]
	then
		echo $time_now	：执行 平衡模式 >> ./lyb_auto_mode_log.txt;
		sed -i '18s/1/2/g' /etc/config/youku; #2是平衡模式 1是激进模式，把1改成2	
		/etc/init.d/youku restart;
		echo $time_now :执行 重启路由宝 >> ./lyb_auto_mode_log.txt;		
	fi	
		
done 
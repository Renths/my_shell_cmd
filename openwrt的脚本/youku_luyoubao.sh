today_date=`date` #  获取当前日期信息
echo ------------------------------- >> youku_disk_log.txt;
date >> youku_disk_log.txt; # 重定向一下 
today=0;
nowtime=0;
echo $today_date;

#自定义函数  获取当前日期
getday(){
	today=$3;  #要的第三个参数就是日期
	nowtime=$4;
	# return today;
}

getday $today_date;


#条件删除：
val=`expr $today % 4`;
case $val in
3)
	rm -r /mnt/mmcblk0p3/* youku_disk_log.txt 2>&1;
	echo mmcblk0p3 remove success >> youku_disk_log.txt;
	;;
2)
	rm -r /mnt/mmcblk0p5/* youku_disk_log.txt 2>&1;
	echo mmcblk0p5 remove success >> youku_disk_log.txt;
	;;
1)
	rm -r /mnt/mmcblk0p6/* >> youku_disk_log.txt 2>&1;
	echo mmcblk0p6 remove success >> youku_disk_log.txt;
	;;
0)
	rm -r /mnt/mmcblk0p7/*  >> youku_disk_log.txt 2>&1;
	echo mmcblk0p7 remove success >> youku_disk_log.txt;
	;;
esac

# 条件删除 日志文件：
#if [ today -eq 1 ] #每月1号删除文件
#then 
#	rm youku_disk_log.txt;
#fi



echo over


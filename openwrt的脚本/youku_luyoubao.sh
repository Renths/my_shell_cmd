today_date=`date` #  ��ȡ��ǰ������Ϣ
echo ------------------------------- >> youku_disk_log.txt;
date >> youku_disk_log.txt; # �ض���һ�� 
today=0;
nowtime=0;
echo $today_date;

#�Զ��庯��  ��ȡ��ǰ����
getday(){
	today=$3;  #Ҫ�ĵ�����������������
	nowtime=$4;
	# return today;
}

getday $today_date;


#����ɾ����
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

# ����ɾ�� ��־�ļ���
#if [ today -eq 1 ] #ÿ��1��ɾ���ļ�
#then 
#	rm youku_disk_log.txt;
#fi



echo over


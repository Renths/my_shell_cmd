#��ȡ��������
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
0) #˫��
	sed -i '9s/n2n.lucktu.com/106.186.30.16/g' /etc/config/n2n_v2;#�޸ĳ����ڵ�  ���ݽڵ����ձ����Ǹ�
	sed -i '12s/86/8964/g' /etc/config/n2n_v2;#�޸Ķ˿ں�
	/etc/init.d/n2n_v2 restart;#����n2n����
	;;
*) #����
	sed -i '9s/106.186.30.16/n2n.lucktu.com/g' /etc/config/n2n_v2;#�޸ĳ����ڵ�  ���ݽڵ����ձ����Ǹ�
	sed -i '12s/8964/86/g' /etc/config/n2n_v2;#�޸Ķ˿ں�
	/etc/init.d/n2n_v2 restart;#����n2n����
	;;
esac 
obj=*.ko
obj_dir=/tftpboot/nfs/work
echo 描述：将当前文件所有的模块复制到nfs的work中，搬运模块作用
echo 复制$obs到$obj_dir ...
cp $obj $obj_dir
if [ $? -ne 0 ]
then
	echo 错误！没有$obj这样的文件！
	exit
fi
echo ok！

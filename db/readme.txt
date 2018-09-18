本地
1.创建读写权限用户：jygltemp，密码：123456
	create user 'jygltemp'@'localhost'  identified by '123456'; 
	grant all privileges on jygl.* to 'jygltemp'@'localhost'  ;
2.刷新权限 立即生效
	flush privileges;
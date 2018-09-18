CREATE DATABASE IF NOT EXISTS jygl DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
grant all privileges on jygl.* to jygl@localhost identified by 'jygl123';
grant all privileges on jygl.* to jygl@'%' identified by 'jygl123';
grant create routine on jygl.* to jygl@'%';
grant alter  routine on jygl.* to jygl@'%';
grant execute on jygl.* to jygl@'%';
@rem 15.01.2023 Установка SSH-туннеля до сервера dev1

@rem 1. Генерация SSH-ключей
mkdir C:\Users\IgorL\DataGripProjects\PoolPay\Keys\Dev1
ssh-keygen -t rsa
@rem C:/Users/IgorL/DataGripProjects/PoolPay/Keys/Dev1/id_rsa.dev1 - приватный ключ
@rem C:/Users/IgorL/DataGripProjects/PoolPay/Keys/Dev1/id_rsa.dev1.pub - публичный ключ, скопировать в /home/liv/.ssh/authorized_keys на хост dev1.lan

@rem 2. Запуск SSH-туннелей
start ssh -fNL 22:localhost:22 -v -i C:/Users/IgorL/DataGripProjects/PoolPay/Keys/Dev1/id_rsa.dev1 liv@dev1.lan
start ssh -fNL 5432:localhost:5432 -v -i C:\Users\IgorL/.ssh/id_rsa.dev1 liv@dev1.lan

@rem На хосте dev1.lan
@rem Установка PostgreSQL 15
liv@dev1:~$ sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
liv@dev1:~$ wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
liv@dev1:~$ sudo apt-get update
liv@dev1:~$ sudo apt-get -y install postgresql
liv@dev1:~$ pg_lsclusters
Ver Cluster Port Status Owner    Data directory              Log file
15  main    5432 online postgres /var/lib/postgresql/15/main /var/log/postgresql/postgresql-15-main.log

@rem Установка паролей (KPM, 99 символов)
liv@dev1:~$ passwd
Changing password for liv.
Current password:
New password:
Retype new password:
passwd: password updated successfully

liv@dev1:~$ sudo passwd
New password:
Retype new password:
passwd: password updated successfully

liv@dev1:~$ sudo passwd postgres

@rem Анализ журналов PostgreSQL
liv@dev1:~$ sudo apt-get install lnav
liv@dev1:~$ sudo lnav /var/log/postgresql/postgresql-15-main.log


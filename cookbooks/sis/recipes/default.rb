#
# Cookbook Name:: sis
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash "apt update" do
  code "apt-get update"
end

bash "install mysql-server 5.1.48" do
  user "root"
  cwd "/tmp"
  code <<-EOH
  groupadd mysql
  useradd -r -g mysql mysql
  cd /usr/local
  wget http://downloads.mysql.com/archives/mysql-5.1/mysql-5.1.48-linux-i686-icc-glibc23.tar.gz
  tar zxvf mysql-5.1.48-linux-i686-icc-glibc23.tar.gz
  rm mysql-5.1.48-linux-i686-icc-glibc23.tar.gz
  ln -s mysql-5.1.48-linux-i686-icc-glibc23 mysql
  cd mysql
  chown -R mysql .
  chgrp -R mysql .
  scripts/mysql_install_db --user=mysql
  chown -R root .
  chown -R mysql data
  cp support-files/my-medium.cnf /etc/my.cnf
  cp support-files/mysql.server /etc/init.d/mysql.server
  EOH
  not_if do
    File.exists?("/etc/my.cnf")
  end
end

bash "start mysql-server 5.1.48" do
  user "root"
  code <<-EOH
  sudo /etc/init.d/mysql.server start
  /usr/local/mysql/bin/mysql -e 'GRANT ALL ON *.* TO root;'
  EOH
end

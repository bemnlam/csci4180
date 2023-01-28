#!/bin/bash
echo '----------------------------------'
if [ "`cat /etc/shadow | grep root | cut -d: -f2`" == '!*' ];
then
password=`dd if=/dev/urandom bs=1 count=320 2>
/dev/null | tr -dc a-z2-9 | head -c8`
echo "root:$password"|chpasswd
sed -i 's/PasswordAuthentication
no/PasswordAuthentication yes/g' 
/etc/ssh/sshd_config
/etc/init.d/ssh restart > /dev/null
echo "Your root account is ready."
echo "Username: root"
echo "Password: $password"
echo ''
echo 'Please keep it well/change it, or you will risk losing your assignment work!'
echo '----------------------------------'
fi

#!/bin/bash
echo '----------------------------------'
if [ "`cat /etc/shadow | grep root | cut -d : -f 2`" == '!*' ]; then
    password=`dd if=/dev/urandom bs=1 count=320 2> /dev/null | tr -dc a-z2-9 | head -c8`
    echo "root:$password"|chpasswd
    sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
    /etc/init.d/ssh restart > /dev/null
    echo "Your root account is ready."
    echo "Username: root"
    echo "Password: $password"
    echo ''
    echo 'Please keep it well/change it, or you will risk losing your assignment work!'
    echo '----------------------------------'
fi

wget http://archive.apache.org/dist/hadoop/core/hadoop-0.20.203.0/hadoop-0.20.203.0rc1.tar.gz
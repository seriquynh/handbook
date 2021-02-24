#!/usr/bin/env bash

COMMAND=$1

if [ "$COMMAND" == 'create' ];
then
    USERNAME=$2
    if [ `sed -n "/^$USERNAME/p" /etc/passwd` ];
    then
        echo "Kiem tra account $USERNAME: Tai khoan chua ton tai."
        useradd $USERNAME
        echo "Da tao tai khoan $USERNAME"
        read -p "Dat mau khau cho $USERNAME, 1 – dong y, ngoai ra khong dong y, ban chon: " ANSWER

        if [ "$ANSWER" == "1" ];
        then
            passwd $USERNAME
        fi
    else
        echo "Kiem tra account $USERNAME: Tai khoan da ton tai."
    fi
elif [ "$COMMAND" == 'delete' ];
then
    USERNAME=$2
    CHECK=$(cat /etc/passwd | grep $USERNAME)
    if [ -z "$CHECK" ];
    then
        echo "Kiem tra account $USERNAME: Tai khoan chua ton tai nen khong the xoa. Ket thuc!"
    else
        userdel -rf $USERNAME
        echo "Kiem tra account $USERNAME: Tai khoan ton tai. DA XOA TAI KHOAN!"
    fi
else
    echo "Khong dung cu phap. Su dung mkaccount create/delete username de tao/xoa username"
fi

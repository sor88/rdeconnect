#/bin/bash
username=$(whiptail --title "Введите имя пользователя" --inputbox "Введите имя пользователя удаленного RDP сервера" 10 60 Администратор 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
echo $username > /etc/hostname
else
echo "Отмена"
exit
fi

userpass=$(whiptail --title "Введите Пароль" --passwordbox "Введите Пароль" 10 60 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then

ipserver=$(whiptail --title "Введите адрес сервера RDP" --inputbox "Введите IP" 10 60 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
##################################################################################################################################################

rdesktop -g 1200x800 -u $username -p $userpass $ipserver
else
echo "Выход"
exit
fi
fi

#!/bin/bash

echo "Please write you action 'add' to add user or 'del' to del user"
  read ACTION_STRING
  case $ACTION_STRING in
	add)
		echo "adding users"
		for i in $(cat lista_users);do sudo adduser $i;done
		echo "checking users "
		for i in $(cat lista_users);do sudo cat /etc/passwd | grep $i > /dev/null && echo OK $i criado com sucesso || echo ERROR usuario $i nao criado;done
		echo "Defining password users"
		for i in $(cat lista_users);do sudo echo redhat | sudo passwd $i --stdin; done
		echo "add users to group testdrive"
		for i in $(cat lista_users);do sudo usermod -G testdrive $i; done
		;;
	del)
		echo "Deleting users"
		for i in $(cat lista_users);do sudo userdel -r -f $i;done
		;;
	*)
		echo "Use add to add users or del to del users"
		;;
  esac

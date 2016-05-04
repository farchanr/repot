#!/bin/bash

PS3='Make your choice : '
echo
menu=("Ganti Wallpaper" "Ganti Icon" "Ganti Tema" "Buat User" "Keluar")
select opt in "${menu{0}}"

do
	case $opt in
		"${menu[0]}")
		echo "Ketik direktori File '(ex: /root/Downloads/new.jpg)' : "
		read wp
		while [ ! -f $wp ]
			do
				echo "Tidak bisa menemukan direktori file"
				read wp
			done
		gsettings set org.gnome.desktop.background-url "file://$wp"
		;;

		"${menu[1]}")
		echo "Masukkan File/Folder yang akan diganti '(ex: /root/tes) ' : "
		read wp
		while [ ! -f $wp ]
			do
				echo "Nama iconpack salah"
				read wp
			done
		gsettings set org.gnome.desktop.interface icon-theme "file://$wp"
		;;

		"${menu[2]}")
		echo "Ketik nama tema yang tersedia di direktori /usr/share/themes ' (ex: Adwaita)' : "
		read theme
		gsettings set org.gnome.desktop.interface gtk-theme "$theme"
		;;

		"${menu[3]}")
		echo "Ketik nama user yang ingin dibuat ' (ex: HAHA)' : "
		read user
		adduser "$user"
		;;

		"Quit")
		break ;;
		*) echo invalid menu ;;
	esac
done

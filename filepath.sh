#!/bin/bash
listpath() {
	read -r -p "insert full path ('a' to autofill or 'q' to Exit): " dl
		case "$dl" in
			q)
				echo "Exiting Program"
				exit 0
				;;
			Q)
				echo "Exiting program"
				exit 0
				;;
			a)
				dl=$path
				;;
			A)
				dl=$path
				;;
			*)
				continue
				;;
		esac
                #if [ $dl = 'q' ]; then
                        #echo "Exiting program"
                        #exit 0
                #else
                read -p "confirm path $d1 (Y/N): " answer
                case "$answer" in
                	y)
                        	echo "Full path is $dl"
				exit 0
				;;
                	Y)
                        	echo "Full path is $dl"
				exit 0
				;;
                        yes)
                        	echo "Full path is $dl"
				exit 0
				;;
                        YES)
                        	echo "Full path is $dl"
				exit 0
				;;
                        n)
                                douknow ;;
                        N)
                       		douknow ;;
                        no)
                                douknow ;;
                        NO)
                          	douknow ;;
                        *)
                                echo "Invalid Entry"
                                exit 1
                                ;;
		esac

}
fpath() {
	read -p "Insert file to find: " pfind
	path=$(sudo find / -name "$pfind")
	echo "Your path is: $path"
	listpath
}
douknow() {
	read -p "Do you know the full absolute path? (Y/N): " tan
		case "$tan" in
			y)
				listpath ;;
			Y)
				listpath ;;
			yes)
				listpath ;;
			YES)
				listpath ;;
			n)
				fpath ;;
			N)
				fpath ;;
			no)
				fpath ;;
                	NO)
				fpath ;;
			*)
				echo "Invalid Entry"
				exit 1
			;;
		esac
}
escalation() {
	if [[ "$EUID" = 0 ]]; then
		echo "(1) already root"
	else
		sudo -k #make sure to ask for password on next sudo
		if sudo true; then
			echo "(2) correct password"
		else
			echo "(3) wrong password"
			exit 1
		fi
	fi
}

escalation
douknow
listpath

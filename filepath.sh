#!/bin/bash
listpath() {
	read -r -p "insert full path (or 'q' to Exit): " dl
                if [ $dl = 'q' ]; then
                        echo "Exiting program"
                        exit 0
                else
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
                                        listpath ;;
                                N)
                                  	listpath ;;
                                no)
                                        listpath ;;
                                NO)
                                   	listpath ;;
                                *)
                                        echo "Invalid Entry"
                                        exit 1
                                        ;;
                        esac

                fi
}
fpath() {
	read -p "Insert file to find: " pfind
	path=$(find / -name "$pfind")
	echo "Your path is: $path"
	listpath
}
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

listpath

RED='\033[0;31m'
NC='\033[0m'

echo -e "Starshrug's trash git menu:"
echo -e "1.Check status\n2.Track specified file\n3.Track everything\n4.Add files and commit changes\n5.Push to origin\n6.Edit readme.md\n7.Exit."
read a
case "$a" in

    1) git status
    ;;
    2) echo "Enter filename"
    read filename
    git add ${filename}
    ;;
    3) git add .
    ;;
    4) git add .
    echo "Enter comment:"
    read comment
    git commit -m "${comment}"
    ;;
    5) git push origin master
    ;;
    6) nano README.md
    git add README.md
    ;;
    7) exit 
    ;;
    666) echo -e "\n${RED}YOU WILL DELETE ABSOLUTELY EVERYTHING AND WILL NEED TO REVERT, YOU STILL WANT TO DO THIS? [Y]"
    read plsdont
    if [ "$plsdont" = 'Y' ]; then
       rm -rf *
       commit -m "I accidentally deleted everything..."
    fi
    exit
    ;;
    
esac

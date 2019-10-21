RED='\033[0;31m'
NC='\033[0m'

echo -e "Starshrug's trash git menu:"
echo -e "1.Check status\n2.Track specified file\n3.Track everything\n4.Commit changes\n5.${RED}Cause eternal destruction of everything${NC}\n6.Exit."
read a
case "$a" in

    1) git status
    ;;
    2) echo "Enter filename"
    read filename
    git add ${filename}
    ;;
    3)git add .
    ;;
    4)echo "Enter comment:"
    read comment
    git commit -m "${comment}"
    ;;
    5)rm -rf *
    git commit -m "I accidentally deleted everything"
    ;;
    6) exit 
    ;;
esac

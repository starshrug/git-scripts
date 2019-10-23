RED='\033[0;31m'
NC='\033[0m'

echo -e "Starshrug's trash git menu:"
echo -e "1.Fetching\n2.Tracking\n3.Committing/Origin\n4.Branching\n5.Editing\n6.Remote\n7.Exit"
read a
case "$a" in

    1) echo -e "1.Status\n2.Log3.\n3.Log in oneline"
    read a1
    case "$a1" in
    1) git status
    ;;
    2) git log
    ;;
    3) git log --oneline
    ;;
    esac
    ;;
    2) echo -e "1.Track exact file\n2.Track everything"
    read b
    case "$b" in
    1) echo "Enter filename"
    read filename
    git add ${filename}
    ;;
    2) git add .
    ;;
    esac
    ;;
    3) echo -e "1.Commit changes\n2.Track all and commit changes\n3.Push to remote"
    read c
    case "$c" in
    1) echo "Enter comment:"
    read comment
    git commit -m "${comment}"
    ;;
    2) git add .
    echo "Enter comment:"
    read comment
    git commit -m "${comment}"
    ;;
    3) echo -e "1.Push master to remote\n2.Push branch to origin\n3.Push branch to remote"
    read originpush
    case "$originpush" in
    1) git push origin master
    ;;
    2) echo "Enter branch name:"
    read branchie
    git push origin ${branchie}
    ;;
    3) echo "Enter branch name:"
    read branchie
    echo "Enter remote name:"
    read remotey
    git push ${remotey} ${branchie}
    ;;
    esac
    ;;
    esac
    ;;
    4) echo -e "1.List branches\n2.Add branch\n3.Remove branch"
    read branch
    case "$branch" in
    1) git branch -a
    ;;
    2) echo "Enter branch name"
    read branchname
    git branch ${branchname}
    ;;
    3) echo "Enter branch name"
    read branchname
    git branch -d ${branchname}
    ;;
    esac
    ;;
    5) echo -e "1.Edit README.md\n2.Edit specified file"
    read d
    case "$d" in
    1) nano README.md
    ;;
    2) ls
    read file
    nano ${file}
    ;;
    esac
    ;;
    6) echo -e "1.Add remote\n2.Add remote with name\n3.Get remotes"
    read e 
    case "$e" in
    1) echo -e "Enter git repo link: "
    read remotelink
    git remote add origin ${remotelink}
    ;;
    2) echo -e "Enter git repo link: "
    read remotelink
    echo -e "Enter name for remote: "
    read remotename
    git remote add ${remotename} ${remotelink}
    ;;
    3) git remote -v
    ;;
    esac
    ;;
    7) exit 
    ;;
    666) echo -e "\n${RED}YOU WILL DELETE ABSOLUTELY EVERYTHING, YOU STILL WANT TO DO THIS? [Y]"
    read plsdont
    if [ "$plsdont" = 'Y' ]; then
       rm -rf *
       commit -m "I accidentally deleted everything..."
    fi
    exit
    ;;
    
esac

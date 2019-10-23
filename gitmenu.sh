RED='\033[0;31m'
    NC='\033[0m'

       echo -e "Starshrug's trash git menu:"
       echo -e "1.Fetching\n2.Tracking\n3.Cloning/Committing/Pushing\n4.Branching\n5.Editing\n6.Remote\n7.Exit"
       read a
       case "$a" in

           1) echo -e "1.Status\n2.Log\n3.Log in oneline"
    read a1
case "$a1" in
        1) echo -e "1.Default status\n2.Abridged"
        read status
        case "$status" in
        1) git status
        ;;
        2) addition=0
moddings=0
newlies=0
trackededit=$(git status | grep 'new' | sed 's/ *changes.*//')
if [[ "$trackededit" ]]; then
	echo "	New addition!"
	echo "$trackededit"
	addition=1
else
	echo -e "\tNo additions."
fi

mods=$(git status | grep "modified:" | sed 's/ *Untracked.*//')
if [[ "$mods" ]]; then
	echo -e "\n\tNew modifications!"
	echo "$mods"
	moddings=1
else
	echo -e "\tNo modifications."
fi
newfiles=$(git ls-files --others --exclude-standard)
if [[ "$newfiles" ]]; then
	echo -e "\n\tNew files!"
	echo -e "\t$newfiles"
	newlies=1
fi
step=1
echo -e "\n\tReccomended course of actions:\n"
if [ "$addition" = 1 ]; then
	echo -e "\t$step.Files are already being tracked - commit them with 'git commit'\n"
	step=$((step+1))
fi
if [ "$moddings" = 1 ]; then
	echo -e "\t$step.git add . OR git add filename from modified\n"
	step=$((step+1))
	echo -e "\t$step.git commit"
	step=$((step+1))
fi
if [ "$newlies" = 1 ]; then
	echo -e "\t$step.git add . OR git add filename from untracked\n"
	echo -e "\t$step.git commit"
	step=$((step+1))
fi
if [ "$addition" = 0 ] && [ "$moddings" = 0 ] && [ "$newlies" = 0 ]; then
	echo -e "\tNone.\n"
	exit
fi

echo -e "\nWant me to do it for you? \nTHIS WILL RECURSIVELY TRACK AND COMMIT EVERYTHING!\n[Y/n] "
read choice

if [ "$choice" = 'y' ] || [ "$choice" = 'Y' ]; then
	git add .
	echo -e "Enter commit comment: "
	read commitcomment
	git commit -m "${commitcomment}"
else 
	echo -e "\nAborted."
fi
;;
        esac
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
            3) echo -e "0.Clone\n1.Commit changes\n2.Track all and commit changes\n3.Push to remote"
            read c
        case "$c" in
                0) str="$1"
                    IFS="."
                    while true; do
                    if [ "$str" != *".git" ]; then
                	    echo Invalid link!
                	    echo Enter a valid link:
                	    read str
                	    read -ra ADDR <<< "$str"
                	if [ "${ADDR[2]}" == "git" ]; then
            		    git clone "$str"
            		    return
                	fi
                    else
                    	git clone "$str"
                	return
                    fi
                    done
                ;;
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
                    4) echo -e "1.List branches\n2.Switch branch\n3.Add branch\n4.Remove branch"
                    read branch
                case "$branch" in
                        1) git branch -a
                        ;;
                        2) echo "Enter branch name"
                        read branchname
                        git checkout ${branchname}
                        ;;
                        3) echo "Enter branch name"
                        read branchname
                        git branch ${branchname}
                        ;;
                        4) echo "Enter branch name"
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
                                if [ "$plsdont" = 'Y' ];
                                then
                                rm -rf *
                                commit -m "I accidentally deleted everything..."
                                fi
                                exit
                                ;;

                                esac

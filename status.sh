
trackededit=$(git status | grep 'new' | sed 's/ *changes.*//')
if [[ "$trackededit" ]]; then
	echo "	New addition!"
	echo "$trackededit"
	addition=1
else
	echo "No additions."
fi

mods=$(git status | grep "modified:" | sed 's/ *Untracked.*//')
if [[ "$mods" ]]; then
	echo -e "\n\tNew modifications!"
	echo "$mods"
	moddings=1
else
	echo "No modifications."
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
fi
if [ "$newlies" = 1 ]; then
	echo -e "\t$step.git add . OR git add filename from untracked\n"
fi

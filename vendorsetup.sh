echo "Applying Brightness patch"

cd frameworks/base || exit 1
if git log -150 --oneline --decorate | grep "Fix brightness slider"; then
	echo "Fix was already applied"
else
	git fetch https://github.com/ArrowOS/android_frameworks_base/ ca3ffbc964826616fe3f088e4fbab3f6ca070c19 && git cherry-pick FETCH_HEAD
fi

cd ..

cd av || exit 1

if git log -150 --oneline --decorate | grep "Expose aux cameras in third party apps"; then
	echo "Fix was already applied"
else
	git fetch https://github.com/Project-Elixir/frameworks_av/ c1da308642fc5bed9aa98bf07ca3d7a2beec717d && git cherry-pick FETCH_HEAD
fi

cd ../..

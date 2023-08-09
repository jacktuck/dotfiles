latestLibTag () {
	repo=`cat /dev/stdin | sed 's/.git//'`
	tag=$(git -c 'versionsort.suffix=-' ls-remote --tags --sort='v:refname' "git@github.com:$repo.git" | tail -n 1 | grep -o 'tags/.*' | cut -d "/" -f2)
	echo $tag 
}

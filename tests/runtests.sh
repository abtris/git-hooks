rm -rf testrepo
git init testrepo 
cp ../src/pre-commit-php-check testrepo/.git/hooks/pre-commit
cp good-php.php testrepo/
cd testrepo
git add .
git commit -m "Add good php file"
if [ ! $? -eq 0 ]
then
    echo "Error in commit good php file !"
    exit -1;
fi
cd ..
cp bad-php.php testrepo/
git add .
git commit -m "Add bad php file"
if [ $? -eq 0 ]
then
	echo "Error in precommit bad php file!"
	exit -1;
fi
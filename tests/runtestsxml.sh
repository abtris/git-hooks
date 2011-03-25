rm -rf testrepo
git init testrepo 
cp ../src/pre-commit-xml-check testrepo/.git/hooks/pre-commit
cp good-xml.xml testrepo/
cd testrepo
git add .
git commit -m "Add good xml file"
if [ ! $? -eq 0 ]
then
    echo "Error in commit good xml file !"
    exit -1;
fi
cd ..
cp bad-xml.xml testrepo/
cd testrepo
git add .
git commit -m "Add bad xml file"
if [ $? -eq 0 ]
then
	echo "Error in precommit bad xml file!"
	exit -1;
fi
cd ..
exit 0
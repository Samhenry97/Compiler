floyd=$1
build=$2
exe=${floyd::-6}
comp=$exe".s"

function print() {
	echo "***********************************************************"
}

if [ "$build" == "build" ]; then
	echo "Running Build..."
	./gradlew build install
	echo
	echo
fi

echo "Compiling..."
./build/install/floyd/bin/floyd -m $floyd
echo
echo

echo "Executing..."
print
./$exe
print

echo
echo
echo "Cleaning Up..."
rm $comp
rm $exe
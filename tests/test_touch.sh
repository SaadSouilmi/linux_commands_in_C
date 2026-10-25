BIN=./build/touch

Black='\033[0m'
Green='\033[32m'
Red='\033[31m'

rm tests/test_touch.txt tests/test_touch1.txt tests/a.txt tests/b.txt tests/c.txt 2> /dev/null

bash build.sh touch

cat <<EOF >> tests/test_touch.txt
This is a dummy file to see if touch 
applied to an already existing file 
changes nothing
EOF
cp tests/test_touch.txt tests/test_touch1.txt

$BIN tests/test_touch.txt

test1_result="$(cmp tests/test_touch.txt tests/test_touch1.txt 2>&1 > /dev/null)"
if [[ -z "$test1_result" ]]; then
	echo -e "Test1: ${Green}Passed${Black}"
else
	echo -e "Test1: ${Red}Failed${Black}"
fi

$BIN tests/a.txt tests/b.txt
touch tests/c.txt

test2_result="$((cmp tests/a.txt tests/c.txt && cmp tests/b.txt tests/c.txt) 2>&1 > /dev/null)"
if [[ -z "$test2_result" ]]; then
	echo -e "Test2: ${Green}Passed${Black}"
else
	echo -e "Test2: ${Red}Failed${Black}"
fi

rm tests/test_touch.txt tests/test_touch1.txt tests/a.txt tests/b.txt tests/c.txt

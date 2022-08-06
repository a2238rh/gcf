#!/bin/bash


# gcf.sh のテストです。


ERROR_EXIT() {
    echo $1 >&2
    rm -f /tmp/$$-*
    exit 1
}


### 異常系 ###
# CASE_101 引数が0個のとき
./gcf.sh 2> /tmp/$$-res
echo "引数の数を確認してください。" > /tmp/$$-ans
echo "USAGE: gcf.sh NATURAL_NUM_1 NATURAL_NUM_2" >> /tmp/$$-ans
diff /tmp/$$-res /tmp/$$-ans || ERROR_EXIT "CASE_101 test failed"
rm -f /tmp/$$-*

# CASE_102 引数が1個のとき
./gcf.sh 2 2> /tmp/$$-res
echo "引数の数を確認してください。" > /tmp/$$-ans
echo "USAGE: gcf.sh NATURAL_NUM_1 NATURAL_NUM_2" >> /tmp/$$-ans
diff /tmp/$$-res /tmp/$$-ans || ERROR_EXIT "CASE_102 test failed"
rm -f /tmp/$$-*

# CASE_103 引数が3個のとき
./gcf.sh 2 5 7 2> /tmp/$$-res
echo "引数の数を確認してください。" > /tmp/$$-ans
echo "USAGE: gcf.sh NATURAL_NUM_1 NATURAL_NUM_2" >> /tmp/$$-ans
diff /tmp/$$-res /tmp/$$-ans || ERROR_EXIT "CASE_103 test failed"
rm -f /tmp/$$-*

# CASE_104 引数に文字が指定されたとき
./gcf.sh a 2 2> /tmp/$$-res
echo "引数には自然数を与えてください。ただし引数の値域は「1 ~ (2^63)-1」です。" > /tmp/$$-ans
echo "USAGE: gcf.sh NATURAL_NUM_1 NATURAL_NUM_2" >> /tmp/$$-ans
diff /tmp/$$-res /tmp/$$-ans || ERROR_EXIT "CASE_104 test failed"
rm -f /tmp/$$-*

# CASE_105 引数に0が指定されたとき
./gcf.sh 2 0 2> /tmp/$$-res
echo "引数には自然数を与えてください。ただし引数の値域は「1 ~ (2^63)-1」です。" > /tmp/$$-ans
echo "USAGE: gcf.sh NATURAL_NUM_1 NATURAL_NUM_2" >> /tmp/$$-ans
diff /tmp/$$-res /tmp/$$-ans || ERROR_EXIT "CASE_105 test failed"
rm -f /tmp/$$-*

# CASE_106 引数に負の数が指定されたとき
./gcf.sh 2 -2 2> /tmp/$$-res
echo "引数には自然数を与えてください。ただし引数の値域は「1 ~ (2^63)-1」です。" > /tmp/$$-ans
echo "USAGE: gcf.sh NATURAL_NUM_1 NATURAL_NUM_2" >> /tmp/$$-ans
diff /tmp/$$-res /tmp/$$-ans || ERROR_EXIT "CASE_106 test failed"
rm -f /tmp/$$-*

# CASE_107 引数に小数が指定されたとき
./gcf.sh 2 1.2 2> /tmp/$$-res
echo "引数には自然数を与えてください。ただし引数の値域は「1 ~ (2^63)-1」です。" > /tmp/$$-ans
echo "USAGE: gcf.sh NATURAL_NUM_1 NATURAL_NUM_2" >> /tmp/$$-ans
diff /tmp/$$-res /tmp/$$-ans || ERROR_EXIT "CASE_107 test failed"
rm -f /tmp/$$-*

# CASE_108 引数に値域外の値が指定されたとき
./gcf.sh 2 9223372036854775808 2> /tmp/$$-res
echo "引数には自然数を与えてください。ただし引数の値域は「1 ~ (2^63)-1」です。" > /tmp/$$-ans
echo "USAGE: gcf.sh NATURAL_NUM_1 NATURAL_NUM_2" >> /tmp/$$-ans
diff /tmp/$$-res /tmp/$$-ans || ERROR_EXIT "CASE_108 test failed"
rm -f /tmp/$$-*


### 正常系 ###
# CASE_001 2つの引数の値が同じとき
res=$(./gcf.sh 6 6)
if [ ! $res == 6 ]; then
    echo "CASE_001 test failed" >&2
    exit 1
fi

# CASE_002 片方が1のとき
res=$(./gcf.sh 1 6)
if [ ! $res == 1 ]; then
    echo "CASE_002 test failed" >&2
    exit 1
fi

# CASE_003 2つの引数が互いに素のとき
res=$(./gcf.sh 3 5)
if [ ! $res == 1 ]; then
    echo "CASE_003 test failed" >&2
    exit 1
fi

# CASE_004 引数の一方が他方の倍数のとき
res=$(./gcf.sh 12 6)
if [ ! $res == 6 ]; then
    echo "CASE_004 test failed" >&2
    exit 1
fi

# CASE_005 引数の一方が他方の倍数でないとき
res=$(./gcf.sh 12 15)
if [ ! $res == 3 ]; then
    echo "CASE_005 test failed" >&2
    exit 1
fi

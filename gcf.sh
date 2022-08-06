#!/bin/bash


USAGE="USAGE: gcf.sh NATURAL_NUM_1 NATURAL_NUM_2"


# 与えられた２つの自然数の最大公約数を「ユークリッドの互除法」を用いて求めます。
gcf() {
    r=$(( $1 % $2 ))

    if [ $r -eq 0 ]; then
        echo $2
        return 0
    else
        gcf $2 $r  # 余りが0になるまで再帰処理します。
    fi
}


# 与えられた引数が自然数かどうか判断します。
is_natural_num() {
    # OK -> 1,  2,  99, 9223372036854775807
    # NG -> 0, -1, 2.5, 9223372036854775808
    test $1 -gt 0 > /dev/null 2>&1 && expr $1 + 0 > /dev/null 2>&1
}


# 引数が２つ与えられていることを確認します。
if [ $# != 2 ]; then
    echo "引数の数を確認してください。" 1>&2
    echo $USAGE 1>&2
    exit 1
fi

# 引数がいずれも自然数であることを確認します。
for arg in $@; do
    if ! is_natural_num $arg; then
        echo "引数には自然数を与えてください。ただし引数の値域は「1 ~ (2^63)-1」です。" 1>&2
        echo $USAGE 1>&2
        exit 1
    fi
done

# 最大公約数を求めます。
gcf $1 $2

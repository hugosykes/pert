#!/usr/bin/env bash

pert_calculator() {
    read -p "Optimistic estimate:  " optimistic
	check_for_quit $optimistic
    read -p "Typical/realistic estimate:  " realistic
	check_for_quit $realistic
    read -p "Pessimistic estimate:  " pessimistic
	check_for_quit $pessimistic
    echo "And the result is: $(calculate $optimistic $realistic $pessimistic)"
}

calculate() {
    sum=$(((100*$1 + (400 * $2) + 100*$3) / 6))
    len=${#sum}
    echo ${sum:0:($len-2)}.${sum: -2}
}

check_for_quit() {
	[ "$1" == "q" ] && exit 1
}

pert_calculator
